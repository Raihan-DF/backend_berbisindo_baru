<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Quiz;
use App\Models\QuizQuestion;
use App\Models\QuizOption;
use App\Models\StudentProgress;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class QuizController extends Controller
{
    /**
     * Display a listing of quizzes
     */
    public function index(Request $request)
    {
        $query = Quiz::with(['creator', 'material', 'questions.materialVideo']);

        // Filter by published status for students
        if ($request->user()->isStudent()) {
            $query->where('is_published', true);
        }

        // Filter by creator for teachers
        if ($request->user()->isTeacher() && $request->has('my_quizzes')) {
            $query->where('created_by', $request->user()->id);
        }

        // Filter by material
        if ($request->has('material_id')) {
            $query->where('material_id', $request->material_id);
        }

        // Filter by difficulty level
        if ($request->has('difficulty')) {
            $query->where('difficulty_level', $request->difficulty);
        }

        // Search by title
        if ($request->has('search')) {
            $query->where('title', 'like', '%' . $request->search . '%');
        }

        $quizzes = $query->latest()->get();

        // If user is a student, add progress information
        if ($request->user()->isStudent()) {
            $quizzes->each(function ($quiz) use ($request) {
                // Get user progress
                $progress = StudentProgress::where('user_id', $request->user()->id)
                    ->where('quiz_id', $quiz->id)
                    ->where('progress_type', 'quiz')
                    ->latest()
                    ->first();

                $quiz->attempt_count = StudentProgress::where('user_id', $request->user()->id)
                    ->where('quiz_id', $quiz->id)
                    ->where('progress_type', 'quiz')
                    ->count();

                $quiz->is_completed = $progress ? $progress->is_completed : false;
                $quiz->best_score = $progress ? $progress->score : null;
                $quiz->can_attempt = true; // Allow unlimited attempts for now

                if ($progress) {
                    $quiz->last_attempt_at = $progress->completed_at;
                    $quiz->score = $progress->score;
                }

                // Check for active attempt
                $activeAttempt = StudentProgress::where('user_id', $request->user()->id)
                    ->where('quiz_id', $quiz->id)
                    ->where('progress_type', 'quiz')
                    ->where('is_completed', false)
                    ->whereNotNull('started_at')
                    ->first();

                if ($activeAttempt) {
                    $quiz->has_active_attempt = true;
                    $quiz->remaining_time = $this->getRemainingTime($activeAttempt, $quiz->time_limit);
                    $quiz->is_time_exceeded = $this->isTimeExceeded($activeAttempt, $quiz->time_limit);
                } else {
                    $quiz->has_active_attempt = false;
                    $quiz->remaining_time = $quiz->time_limit ? $quiz->time_limit * 60 : null;
                    $quiz->is_time_exceeded = false;
                }
            });
        }

        return response()->json($quizzes);
    }

    /**
     * Store a newly created quiz
     */
    public function store(Request $request)
    {
        // Check if user is a teacher
        if (!$request->user()->isTeacher()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'material_id' => 'required|exists:materials,id',
            'difficulty_level' => 'required|integer|min:1|max:5',
            'passing_score' => 'required|integer|min:0|max:100',
            'time_limit' => 'nullable|integer|min:1', // in minutes
            'is_published' => 'boolean',
            'questions' => 'required|array|min:1',
            'questions.*.material_video_id' => [
                'required',
                'integer',
                function ($attribute, $value, $fail) use ($request) {
                    // Cek apakah video exists
                    $video = \App\Models\MaterialVideo::find($value);
                    if (!$video) {
                        $fail("Video dengan ID {$value} tidak ditemukan");
                        return;
                    }

                    // Cek apakah video belongs to material
                    if ($video->material_id != $request->material_id) {
                        $fail("Video ID {$value} tidak termasuk dalam material ID {$request->material_id}");
                        return;
                    }

                    // Cek authorization
                    $material = $video->material;
                    $user = $request->user();

                    if (!$material->is_published &&
                        $user->id !== $material->created_by &&
                        !$user->isTeacher()) {
                        $fail("Anda tidak memiliki akses ke video ID {$value}");
                        return;
                    }
                },
            ],
            'questions.*.question' => 'required|string',
            'questions.*.points' => 'integer|min:1|max:100',
            'questions.*.options' => 'required|array|min:2|max:6',
            'questions.*.options.*' => 'required|string',
            'questions.*.correct_answer' => 'required|integer|min:0',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            DB::beginTransaction();

            // Create quiz
            $quiz = Quiz::create([
                'title' => $request->title,
                'description' => $request->description,
                'material_id' => $request->material_id,
                'created_by' => $request->user()->id,
                'difficulty_level' => $request->difficulty_level,
                'passing_score' => $request->passing_score,
                'time_limit' => $request->time_limit,
                'is_published' => $request->is_published ?? false,
            ]);

            // Create questions and options
            foreach ($request->questions as $index => $questionData) {
                // Validate correct_answer index
                if ($questionData['correct_answer'] >= count($questionData['options'])) {
                    throw new \Exception("Invalid correct_answer index for question " . ($index + 1));
                }

                $question = QuizQuestion::create([
                    'quiz_id' => $quiz->id,
                    'material_video_id' => $questionData['material_video_id'],
                    'question' => $questionData['question'],
                    'points' => $questionData['points'] ?? 10,
                    'order' => $index + 1,
                ]);

                // Create options
                foreach ($questionData['options'] as $optionIndex => $optionText) {
                    QuizOption::create([
                        'quiz_question_id' => $question->id,
                        'option_text' => $optionText,
                        'is_correct' => $optionIndex == $questionData['correct_answer'],
                        'order' => $optionIndex + 1,
                    ]);
                }
            }

            // Update quiz totals
            $this->updateQuizTotals($quiz);

            DB::commit();

            // Load relationships for response
            $quiz->load(['questions.options', 'questions.materialVideo', 'material', 'creator']);

            return response()->json([
                'data' => $quiz,
                'message' => 'Quiz created successfully',
                'id' => $quiz->id
            ], 201);

        } catch (\Exception $e) {
            DB::rollback();
            Log::error('Quiz creation error: ' . $e->getMessage(), [
                'file' => $e->getFile(),
                'line' => $e->getLine(),
                'trace' => $e->getTraceAsString()
            ]);
            return response()->json(['error' => 'Quiz creation failed: ' . $e->getMessage()], 500);
        }
    }

    /**
     * Display the specified quiz
     */
    public function show(Request $request, $id)
    {
        $quiz = Quiz::with([
            'creator',
            'material',
            'questions.options',
            'questions.materialVideo'
        ])->findOrFail($id);

        // Check if quiz is published or user is the creator
        if (!$quiz->is_published && $request->user()->id !== $quiz->created_by && !$request->user()->isTeacher()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        // If user is a student, add progress information and hide correct answers
        if ($request->user()->isStudent()) {
            // Get user progress
            $progress = StudentProgress::where('user_id', $request->user()->id)
                ->where('quiz_id', $id)
                ->where('progress_type', 'quiz')
                ->latest()
                ->first();

            $quiz->attempt_count = StudentProgress::where('user_id', $request->user()->id)
                ->where('quiz_id', $id)
                ->where('progress_type', 'quiz')
                ->count();

            $quiz->is_completed = $progress ? $progress->is_completed : false;
            $quiz->best_score = $progress ? $progress->score : null;
            $quiz->can_attempt = true;

            if ($progress) {
                $quiz->last_attempt_at = $progress->completed_at;
                $quiz->score = $progress->score;
            }

            // Get user's attempts history
            $quiz->attempts = StudentProgress::where('user_id', $request->user()->id)
                ->where('quiz_id', $id)
                ->where('progress_type', 'quiz')
                ->where('is_completed', true)
                ->orderBy('completed_at', 'desc')
                ->get()
                ->map(function ($attempt) {
                    return [
                        'id' => $attempt->id,
                        'score' => $attempt->score,
                        'total_points' => $attempt->max_score,
                        'percentage' => $attempt->max_score > 0 ? round(($attempt->score / $attempt->max_score) * 100, 2) : 0,
                        'completed_at' => $attempt->completed_at,
                        'time_taken' => $attempt->time_taken,
                    ];
                });

            // Check for active attempt
            $activeAttempt = StudentProgress::where('user_id', $request->user()->id)
                ->where('quiz_id', $id)
                ->where('progress_type', 'quiz')
                ->where('is_completed', false)
                ->whereNotNull('started_at')
                ->first();

            if ($activeAttempt) {
                $quiz->has_active_attempt = true;
                $quiz->remaining_time = $this->getRemainingTime($activeAttempt, $quiz->time_limit);
                $quiz->is_time_exceeded = $this->isTimeExceeded($activeAttempt, $quiz->time_limit);
                $quiz->active_attempt_started_at = $activeAttempt->started_at;
            } else {
                $quiz->has_active_attempt = false;
                $quiz->remaining_time = $quiz->time_limit ? $quiz->time_limit * 60 : null;
                $quiz->is_time_exceeded = false;
            }

            // Hide correct answers from students
            $quiz->questions->each(function ($question) {
                $question->options->each(function ($option) {
                    unset($option->is_correct);
                });
            });
        }

        return response()->json($quiz);
    }

    /**
     * Update the specified quiz
     */
    public function update(Request $request, $id)
    {
        $quiz = Quiz::findOrFail($id);

        // Check if user is the creator or a teacher
        if ($request->user()->id !== $quiz->created_by && !$request->user()->isTeacher()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'material_id' => 'required|exists:materials,id',
            'difficulty_level' => 'required|integer|min:1|max:5',
            'passing_score' => 'required|integer|min:0|max:100',
            'time_limit' => 'nullable|integer|min:1',
            'is_published' => 'boolean',
            'questions' => 'required|array|min:1',
            'questions.*.material_video_id' => 'required|exists:material_videos,id',
            'questions.*.question' => 'required|string',
            'questions.*.points' => 'integer|min:1|max:100',
            'questions.*.options' => 'required|array|min:2|max:6',
            'questions.*.options.*' => 'required|string',
            'questions.*.correct_answer' => 'required|integer|min:0',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            DB::beginTransaction();

            // Update quiz
            $quiz->update([
                'title' => $request->title,
                'description' => $request->description,
                'material_id' => $request->material_id,
                'difficulty_level' => $request->difficulty_level,
                'passing_score' => $request->passing_score,
                'time_limit' => $request->time_limit,
                'is_published' => $request->is_published ?? $quiz->is_published,
            ]);

            // Delete existing questions and options (cascade will handle options)
            $quiz->questions()->delete();

            // Create new questions and options
            foreach ($request->questions as $index => $questionData) {
                $question = QuizQuestion::create([
                    'quiz_id' => $quiz->id,
                    'material_video_id' => $questionData['material_video_id'],
                    'question' => $questionData['question'],
                    'points' => $questionData['points'] ?? 10,
                    'order' => $index + 1,
                ]);

                // Create options
                foreach ($questionData['options'] as $optionIndex => $optionText) {
                    QuizOption::create([
                        'quiz_question_id' => $question->id,
                        'option_text' => $optionText,
                        'is_correct' => $optionIndex == $questionData['correct_answer'],
                        'order' => $optionIndex + 1,
                    ]);
                }
            }

            // Update quiz totals
            $this->updateQuizTotals($quiz);

            DB::commit();

            // Load relationships for response
            $quiz->load(['questions.options', 'questions.materialVideo', 'material', 'creator']);

            return response()->json([
                'data' => $quiz,
                'message' => 'Quiz updated successfully'
            ]);

        } catch (\Exception $e) {
            DB::rollback();
            Log::error('Quiz update error: ' . $e->getMessage());
            return response()->json(['error' => 'Quiz update failed: ' . $e->getMessage()], 500);
        }
    }

    /**
     * Remove the specified quiz
     */
    public function destroy(Request $request, $id)
    {
        $quiz = Quiz::findOrFail($id);

        // Check if user is the creator or a teacher
        if ($request->user()->id !== $quiz->created_by && !$request->user()->isTeacher()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $quiz->delete(); // Cascade will handle questions and options

        return response()->json(['message' => 'Quiz deleted successfully']);
    }

    /**
     * Start a new quiz attempt (Student functionality)
     */
    public function startAttempt(Request $request, $id)
    {
        try {
            Log::info('=== QUIZ START ATTEMPT ===', [
                'quiz_id' => $id,
                'user_id' => $request->user()->id,
                'user_role' => $request->user()->getRoleSlugs()
            ]);

            // Check if user is a student
            if (!$request->user()->isStudent()) {
                return response()->json(['message' => 'Unauthorized'], 403);
            }

            $quiz = Quiz::with(['questions.options', 'questions.materialVideo'])->findOrFail($id);

            // Check if quiz is published
            if (!$quiz->is_published) {
                return response()->json([
                    'error' => 'Quiz not available',
                    'message' => 'This quiz is not published yet.'
                ], 403);
            }

            // Check if there's already an active attempt
            $activeAttempt = StudentProgress::where('user_id', $request->user()->id)
                ->where('quiz_id', $id)
                ->where('progress_type', 'quiz')
                ->where('is_completed', false)
                ->whereNotNull('started_at')
                ->first();

            if ($activeAttempt) {
                // Check if time exceeded
                if ($quiz->time_limit && $this->isTimeExceeded($activeAttempt, $quiz->time_limit)) {
                    // Auto-submit the expired attempt
                    $this->autoSubmitExpiredAttempt($activeAttempt, $quiz);

                    return response()->json([
                        'error' => 'Previous attempt expired',
                        'message' => 'Your previous attempt has expired and was automatically submitted.',
                        'can_start_new' => true
                    ], 400);
                }

                // Return existing attempt
                Log::info('Continuing existing attempt', ['attempt_id' => $activeAttempt->id]);
                return response()->json([
                    'message' => 'Continuing existing attempt',
                    'quiz' => $quiz,
                    'remaining_time' => $this->getRemainingTime($activeAttempt, $quiz->time_limit),
                    'started_at' => $activeAttempt->started_at,
                ]);
            }

            // Get current attempt count
            $currentAttemptCount = StudentProgress::where('user_id', $request->user()->id)
                ->where('quiz_id', $id)
                ->where('progress_type', 'quiz')
                ->count();

            // Create new attempt
            $progress = StudentProgress::create([
                'user_id' => $request->user()->id,
                'quiz_id' => $quiz->id,
                'progress_type' => 'quiz',
                'score' => 0,
                'max_score' => $quiz->total_points,
                'attempt_count' => $currentAttemptCount + 1,
                'started_at' => now(),
                'is_completed' => false,
            ]);

            Log::info('New quiz attempt created', [
                'progress_id' => $progress->id,
                'attempt_count' => $progress->attempt_count
            ]);

            return response()->json([
                'message' => 'Quiz attempt started successfully',
                'quiz' => $quiz,
                'remaining_time' => $quiz->time_limit ? $quiz->time_limit * 60 : null,
                'started_at' => $progress->started_at,
            ]);
        } catch (\Exception $e) {
            Log::error('Error starting quiz attempt: ' . $e->getMessage(), [
                'quiz_id' => $id,
                'user_id' => $request->user()->id,
                'trace' => $e->getTraceAsString()
            ]);
            return response()->json([
                'error' => 'Failed to start quiz attempt',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * MAIN SUBMISSION METHOD - handles both /submit and /submit-answers endpoints
     */
    public function submitAnswers(Request $request, $id)
    {
        try {
            Log::info('=== QUIZ SUBMIT ANSWERS ===', [
                'quiz_id' => $id,
                'user_id' => $request->user()->id,
                'endpoint' => $request->path(),
                'request_data' => $request->all()
            ]);

            // Check if user is a student
            if (!$request->user()->isStudent()) {
                return response()->json(['message' => 'Unauthorized'], 403);
            }

            $quiz = Quiz::with('questions.options')->findOrFail($id);

            // Check if quiz is published
            if (!$quiz->is_published) {
                return response()->json(['message' => 'Quiz not available'], 403);
            }

            // Get active attempt
            $activeAttempt = StudentProgress::where('user_id', $request->user()->id)
                ->where('quiz_id', $id)
                ->where('progress_type', 'quiz')
                ->where('is_completed', false)
                ->whereNotNull('started_at')
                ->first();

            if (!$activeAttempt) {
                Log::error('No active attempt found', [
                    'quiz_id' => $id,
                    'user_id' => $request->user()->id
                ]);
                return response()->json([
                    'error' => 'No active attempt found',
                    'message' => 'Please start the quiz first.'
                ], 400);
            }

            // Check if time exceeded (unless it's auto-submit)
            $isAutoSubmit = $request->input('auto_submit', false);
            if (!$isAutoSubmit && $quiz->time_limit && $this->isTimeExceeded($activeAttempt, $quiz->time_limit)) {
                return response()->json([
                    'error' => 'Time exceeded',
                    'message' => 'Time limit has been exceeded for this quiz.'
                ], 400);
            }

            $validator = Validator::make($request->all(), [
                'answers' => 'required|array',
                'answers.*' => 'required|integer|exists:quiz_options,id',
                'auto_submit' => 'boolean',
            ]);

            if ($validator->fails()) {
                Log::error('Validation failed', ['errors' => $validator->errors()]);
                return response()->json([
                    'error' => 'Invalid submission data',
                    'errors' => $validator->errors()
                ], 422);
            }

            DB::beginTransaction();

            $totalScore = 0;
            $maxScore = $quiz->total_points;
            $correctAnswers = 0;
            $totalQuestions = $quiz->total_questions;

            // Prepare answers detail for JSON storage
            $answersDetail = [];

            Log::info('Processing answers', [
                'answers_count' => count($request->answers),
                'quiz_questions_count' => $quiz->questions->count()
            ]);

            // Calculate score
            foreach ($request->answers as $questionId => $selectedOptionId) {
                $question = $quiz->questions->find($questionId);
                if ($question) {
                    $selectedOption = $question->options->find($selectedOptionId);
                    if ($selectedOption) {
                        $isCorrect = $selectedOption->is_correct;
                        $pointsEarned = $isCorrect ? $question->points : 0;

                        $totalScore += $pointsEarned;
                        if ($isCorrect) {
                            $correctAnswers++;
                        }

                        // Store answer detail
                        $answersDetail[$questionId] = [
                            'selected_option_id' => $selectedOptionId,
                            'is_correct' => $isCorrect,
                            'points_earned' => $pointsEarned,
                            'answered_at' => now()->toISOString(),
                        ];

                        Log::info('Answer processed', [
                            'question_id' => $questionId,
                            'selected_option_id' => $selectedOptionId,
                            'is_correct' => $isCorrect,
                            'points_earned' => $pointsEarned
                        ]);
                    } else {
                        Log::warning('Selected option not found', [
                            'question_id' => $questionId,
                            'selected_option_id' => $selectedOptionId
                        ]);
                    }
                } else {
                    Log::warning('Question not found', ['question_id' => $questionId]);
                }
            }

            $percentage = $maxScore > 0 ? ($totalScore / $maxScore) * 100 : 0;
            $passed = $percentage >= $quiz->passing_score;

            // Calculate time taken
            $timeTaken = null;
            if ($activeAttempt->started_at) {
                $timeTaken = now()->diffInSeconds($activeAttempt->started_at);
            }

            Log::info('Quiz results calculated', [
                'total_score' => $totalScore,
                'max_score' => $maxScore,
                'percentage' => $percentage,
                'passed' => $passed,
                'correct_answers' => $correctAnswers,
                'time_taken' => $timeTaken
            ]);

            // Update progress
            $activeAttempt->update([
                'score' => $totalScore,
                'max_score' => $maxScore,
                'answers_detail' => $answersDetail,
                'is_completed' => true,
                'completed_at' => now(),
                'time_taken' => $timeTaken,
            ]);

            DB::commit();

            // Determine message based on performance
            $message = $passed ? 'Selamat! Anda lulus quiz ini.' : 'Anda belum lulus quiz ini. Coba lagi!';
            if ($isAutoSubmit) {
                $message = 'Quiz telah otomatis dikirim karena waktu habis. ' . $message;
            }

            $response = [
                'message' => $message,
                'score' => $totalScore,
                'max_score' => $maxScore,
                'percentage' => round($percentage, 2),
                'passing_score' => $quiz->passing_score,
                'passed' => $passed,
                'correct_answers' => $correctAnswers,
                'total_questions' => $totalQuestions,
                'time_taken' => $timeTaken,
                'formatted_time_taken' => $this->formatTime($timeTaken),
                'auto_submitted' => $isAutoSubmit,
            ];

            Log::info('Quiz submission successful', $response);

            return response()->json($response);

        } catch (\Exception $e) {
            DB::rollback();
            Log::error('Quiz submission error: ' . $e->getMessage(), [
                'quiz_id' => $id,
                'user_id' => $request->user()->id,
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'error' => 'Failed to submit quiz answers',
                'message' => $e->getMessage()
            ], 500);
        }
    }

    /**
     * LEGACY METHOD - for backward compatibility
     * Redirects to submitAnswers method
     */
    public function submitQuiz(Request $request, $id)
    {
        Log::info('Legacy submitQuiz method called, redirecting to submitAnswers', [
            'quiz_id' => $id,
            'user_id' => $request->user()->id
        ]);

        return $this->submitAnswers($request, $id);
    }

    /**
     * Submit single question answer with immediate feedback
     */
    public function submitSingleAnswer(Request $request, $quizId, $questionId)
    {
        // Check if user is a student
        if (!$request->user()->isStudent()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $quiz = Quiz::with('questions')->findOrFail($quizId);
        $question = QuizQuestion::with(['options', 'materialVideo'])->findOrFail($questionId);

        // Validate question belongs to quiz
        if ($question->quiz_id != $quizId) {
            return response()->json(['message' => 'Question not found in this quiz'], 404);
        }

        // Check if quiz is published
        if (!$quiz->is_published) {
            return response()->json(['message' => 'Quiz not available'], 403);
        }

        $validator = Validator::make($request->all(), [
            'selected_option_id' => 'required|integer|exists:quiz_options,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        try {
            DB::beginTransaction();

            // Get or create progress
            $progress = StudentProgress::firstOrCreate(
                [
                    'user_id' => $request->user()->id,
                    'quiz_id' => $quizId,
                    'progress_type' => 'quiz',
                ],
                [
                    'score' => 0,
                    'max_score' => $quiz->total_points,
                    'attempt_count' => 1,
                    'started_at' => now(),
                    'is_completed' => false,
                ]
            );

            $selectedOption = $question->options()->findOrFail($request->selected_option_id);
            $correctOption = $question->options()->where('is_correct', true)->first();
            $isCorrect = $selectedOption->is_correct;
            $pointsEarned = $isCorrect ? $question->points : 0;

            // Add answer to progress using helper method
            $progress->addAnswer($questionId, $request->selected_option_id, $isCorrect, $pointsEarned);

            // Recalculate total score
            $answers = $progress->answers_detail ?? [];
            $totalScore = collect($answers)->sum('points_earned');
            $progress->score = $totalScore;

            // Check if all questions answered
            $totalQuestions = $quiz->questions()->count();
            $answeredQuestions = count($answers);
            $isLastQuestion = $answeredQuestions >= $totalQuestions;

            if ($isLastQuestion) {
                $progress->is_completed = true;
                $progress->completed_at = now();
            }

            $progress->save();

            DB::commit();

            // Prepare response
            $response = [
                'question_id' => $questionId,
                'selected_option' => [
                    'id' => $selectedOption->id,
                    'text' => $selectedOption->option_text,
                    'is_correct' => $selectedOption->is_correct,
                ],
                'correct_option' => [
                    'id' => $correctOption->id,
                    'text' => $correctOption->option_text,
                ],
                'is_correct' => $isCorrect,
                'points_earned' => $pointsEarned,
                'max_points' => $question->points,
                'explanation' => $this->getExplanation($question, $isCorrect),
                'is_last_question' => $isLastQuestion,
                'current_progress' => [
                    'answered_questions' => $answeredQuestions,
                    'total_questions' => $totalQuestions,
                    'current_score' => $totalScore,
                    'max_score' => $quiz->total_points,
                ]
            ];

            if ($isLastQuestion) {
                $passed = $totalScore >= $quiz->passing_score;
                $response['final_results'] = [
                    'total_score' => $totalScore,
                    'max_score' => $quiz->total_points,
                    'percentage' => round(($totalScore / $quiz->total_points) * 100, 2),
                    'passing_score' => $quiz->passing_score,
                    'passed' => $passed,
                    'correct_answers' => $progress->getCorrectAnswersCount(),
                    'total_questions' => $totalQuestions,
                    'message' => $this->getFinalMessage($totalScore, $quiz->total_points, $quiz->passing_score),
                ];
            }

            return response()->json($response);

        } catch (\Exception $e) {
            DB::rollback();
            Log::error('Quiz single answer submission error: ' . $e->getMessage());
            return response()->json(['error' => 'Failed to submit answer'], 500);
        }
    }

    /**
     * Get student's current progress in quiz
     */
    public function getProgress(Request $request, $quizId)
    {
        $quiz = Quiz::with('questions.options')->findOrFail($quizId);

        $progress = StudentProgress::where('user_id', $request->user()->id)
            ->where('quiz_id', $quizId)
            ->first();

        $answersDetail = $progress ? ($progress->answers_detail ?? []) : [];

        $progressData = [
            'quiz_id' => $quizId,
            'total_questions' => $quiz->questions()->count(),
            'answered_questions' => count($answersDetail),
            'current_score' => $progress ? $progress->score : 0,
            'max_possible_score' => $quiz->total_points,
            'passing_score' => $quiz->passing_score,
            'is_completed' => $progress ? $progress->is_completed : false,
            'passed' => $progress ? ($progress->score >= $quiz->passing_score) : false,
            'attempt_count' => $progress ? $progress->attempt_count : 0,
            'time_limit' => $quiz->time_limit,
            'questions_progress' => []
        ];

        foreach ($quiz->questions as $question) {
            $answer = $answersDetail[$question->id] ?? null;

            $progressData['questions_progress'][] = [
                'question_id' => $question->id,
                'question_order' => $question->order,
                'is_answered' => $answer ? true : false,
                'is_correct' => $answer ? $answer['is_correct'] : null,
                'points_earned' => $answer ? $answer['points_earned'] : 0,
                'max_points' => $question->points,
            ];
        }

        return response()->json($progressData);
    }

    /**
     * Reset quiz progress (allow retake)
     */
    public function resetProgress(Request $request, $id)
    {
        if (!$request->user()->isStudent()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $quiz = Quiz::findOrFail($id);

        if (!$quiz->is_published) {
            return response()->json(['message' => 'Quiz not available'], 403);
        }

        $progress = StudentProgress::where('user_id', $request->user()->id)
            ->where('quiz_id', $id)
            ->first();

        if ($progress) {
            $progress->update([
                'score' => 0,
                'answers_detail' => null,
                'is_completed' => false,
                'completed_at' => null,
                'started_at' => null,
                'time_taken' => null,
            ]);
        }

        return response()->json(['message' => 'Quiz progress reset successfully']);
    }

    /**
     * Stream video for quiz question (via MaterialVideo)
     */
    public function stream(Request $request, $quizId, $questionId)
    {
        $quiz = Quiz::findOrFail($quizId);
        $question = QuizQuestion::with('materialVideo')->findOrFail($questionId);

        // Validate question belongs to quiz
        if ($question->quiz_id != $quizId) {
            return response()->json(['message' => 'Question not found in this quiz'], 404);
        }

        // Check if quiz is published or user is the creator
        if (!$quiz->is_published && $request->user()->id !== $quiz->created_by && !$request->user()->isTeacher()) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        // Get MaterialVideo
        $materialVideo = $question->materialVideo;
        if (!$materialVideo || !$materialVideo->video_path) {
            return response()->json(['error' => 'Video not found'], 404);
        }

        if (!Storage::disk('public')->exists($materialVideo->video_path)) {
            return response()->json(['error' => 'Video file not found'], 404);
        }

        $file = Storage::disk('public')->path($materialVideo->video_path);
        $mimeType = $materialVideo->video_type ?: 'video/mp4';
        $size = Storage::disk('public')->size($materialVideo->video_path);

        $headers = [
            'Content-Type' => $mimeType,
            'Content-Length' => $size,
            'Accept-Ranges' => 'bytes',
            'Content-Disposition' => 'inline; filename="' . ($materialVideo->video_filename ?: 'video.mp4') . '"',
        ];

        // Handle range requests for video streaming
        if ($request->header('Range')) {
            return $this->handleRangeRequest($request, $file, $size, $mimeType);
        }

        return response()->file($file, $headers);
    }

    /**
     * Handle range requests for video streaming
     */
    protected function handleRangeRequest(Request $request, $file, $size, $mimeType)
    {
        $range = $request->header('Range');
        $ranges = explode('=', $range);
        $ranges = explode('-', $ranges[1]);

        $start = intval($ranges[0]);
        $end = isset($ranges[1]) && !empty($ranges[1]) ? intval($ranges[1]) : $size - 1;

        // Validate range
        if ($start >= $size || $end >= $size) {
            return response('Requested range not satisfiable', 416, [
                'Content-Range' => "bytes */$size"
            ]);
        }

        $length = $end - $start + 1;

        $headers = [
            'Content-Type' => $mimeType,
            'Content-Length' => $length,
            'Accept-Ranges' => 'bytes',
            'Content-Range' => "bytes $start-$end/$size",
        ];

        return response()->stream(function () use ($file, $start, $end) {
            $handle = fopen($file, 'rb');
            fseek($handle, $start);
            $buffer = 1024 * 8; // 8KB buffer
            $currentPosition = $start;

            while (!feof($handle) && $currentPosition <= $end) {
                $bytesToRead = min($buffer, $end - $currentPosition + 1);
                echo fread($handle, $bytesToRead);
                flush();
                $currentPosition += $bytesToRead;
            }

            fclose($handle);
        }, 206, $headers);
    }

    // ========== HELPER METHODS ==========

    /**
     * Update quiz totals
     */
    private function updateQuizTotals($quiz)
    {
        $totalQuestions = $quiz->questions()->count();
        $totalPoints = $quiz->questions()->sum('points');

        $quiz->update([
            'total_questions' => $totalQuestions,
            'total_points' => $totalPoints,
        ]);
    }

    /**
     * Auto-submit expired attempt
     */
    private function autoSubmitExpiredAttempt($attempt, $quiz)
    {
        try {
            DB::beginTransaction();

            $answers = $attempt->answers_detail ?? [];
            $totalScore = collect($answers)->sum('points_earned');
            $timeTaken = $attempt->started_at ? now()->diffInSeconds($attempt->started_at) : null;

            $attempt->update([
                'score' => $totalScore,
                'is_completed' => true,
                'completed_at' => now(),
                'time_taken' => $timeTaken,
            ]);

            DB::commit();

            Log::info('Auto-submitted expired quiz attempt', [
                'attempt_id' => $attempt->id,
                'quiz_id' => $quiz->id,
                'user_id' => $attempt->user_id,
                'score' => $totalScore,
                'time_taken' => $timeTaken
            ]);

        } catch (\Exception $e) {
            DB::rollback();
            Log::error('Error auto-submitting expired attempt: ' . $e->getMessage());
        }
    }

    /**
     * Check if time exceeded
     */
    private function isTimeExceeded($attempt, $timeLimit)
    {
        if (!$attempt->started_at || !$timeLimit) {
            return false;
        }

        $timeElapsed = now()->diffInMinutes($attempt->started_at);
        return $timeElapsed > $timeLimit;
    }

    /**
     * Get remaining time in seconds
     */
    private function getRemainingTime($attempt, $timeLimit)
    {
        if (!$attempt->started_at || !$timeLimit) {
            return null;
        }

        $timeElapsed = now()->diffInSeconds($attempt->started_at);
        $totalTimeInSeconds = $timeLimit * 60;
        $remainingTime = $totalTimeInSeconds - $timeElapsed;

        return max(0, $remainingTime);
    }

    /**
     * Format time in seconds to human readable format
     */
    private function formatTime($seconds)
    {
        if (!$seconds) return null;

        $hours = floor($seconds / 3600);
        $minutes = floor(($seconds % 3600) / 60);
        $secs = $seconds % 60;

        if ($hours > 0) {
            return sprintf('%02d:%02d:%02d', $hours, $minutes, $secs);
        } else {
            return sprintf('%02d:%02d', $minutes, $secs);
        }
    }

    /**
     * Get explanation for answer
     */
    private function getExplanation($question, $isCorrect)
    {
        if ($isCorrect) {
            return "Benar! Anda berhasil mengenali bahasa isyarat dengan tepat.";
        } else {
            $correctOption = $question->options()->where('is_correct', true)->first();
            return "Kurang tepat. Jawaban yang benar adalah: " . $correctOption->option_text . ". Coba perhatikan gerakan tangan dan posisi jari dalam video.";
        }
    }

    /**
     * Get final message based on score and passing score
     */
    private function getFinalMessage($score, $maxScore, $passingScore)
    {
        $percentage = ($score / $maxScore) * 100;
        $passed = $score >= $passingScore;

        if ($passed) {
            if ($percentage >= 90) {
                return "Excellent! Anda lulus dengan nilai sangat baik.";
            } elseif ($percentage >= 80) {
                return "Great! Anda lulus dengan nilai baik.";
            } else {
                return "Good! Anda berhasil lulus quiz ini.";
            }
        } else {
            return "Maaf, Anda belum mencapai nilai minimum untuk lulus. Silakan coba lagi!";
        }
    }
}
