-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sign_language_platform
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `achievement_type` varchar(255) NOT NULL,
  `required_count` int(11) NOT NULL DEFAULT 1,
  `points` int(11) NOT NULL DEFAULT 10,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (1,'Pemula','Menyelesaikan 1 materi pembelajaran','award','materials_completed',1,10,'2025-05-19 04:03:15','2025-05-19 04:03:15'),(2,'Pembelajar','Menyelesaikan 5 materi pembelajaran','book','materials_completed',5,50,'2025-05-19 04:03:15','2025-05-19 04:03:15'),(3,'Mahir','Menyelesaikan 10 materi pembelajaran','graduation-cap','materials_completed',10,100,'2025-05-19 04:03:15','2025-05-19 04:03:15'),(4,'Rajin','Login 7 hari berturut-turut','calendar','login_streak',7,30,'2025-05-19 04:03:15','2025-05-19 04:03:15'),(5,'Konsisten','Login 30 hari berturut-turut','calendar-check','login_streak',30,100,'2025-05-19 04:03:15','2025-05-19 04:03:15'),(6,'Juara Kuis','Mendapatkan nilai 100 pada 3 kuis','trophy','perfect_quizzes',3,50,'2025-05-19 04:03:15','2025-05-19 04:03:15');
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_options`
--

DROP TABLE IF EXISTS `exercise_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exercise_question_id` bigint(20) unsigned NOT NULL,
  `option_text` text NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exercise_options_exercise_question_id_order_index` (`exercise_question_id`,`order`),
  CONSTRAINT `exercise_options_exercise_question_id_foreign` FOREIGN KEY (`exercise_question_id`) REFERENCES `exercise_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_options`
--

LOCK TABLES `exercise_options` WRITE;
/*!40000 ALTER TABLE `exercise_options` DISABLE KEYS */;
INSERT INTO `exercise_options` VALUES (37,10,'Kamu bisa bahasa apa?',0,1,'2025-06-11 13:21:53','2025-06-11 13:21:53'),(38,10,'Kamu suka apa?',0,2,'2025-06-11 13:21:53','2025-06-11 13:21:53'),(39,10,'Kamu bisa bahasa isyarat tidak?',1,3,'2025-06-11 13:21:53','2025-06-11 13:21:53'),(40,10,'Kamu suka makan apa?',0,4,'2025-06-11 13:21:53','2025-06-11 13:21:53'),(41,11,'test1',0,1,'2025-06-20 12:01:02','2025-06-20 12:01:02'),(42,11,'test2',0,2,'2025-06-20 12:01:02','2025-06-20 12:01:02'),(43,11,'test3',1,3,'2025-06-20 12:01:02','2025-06-20 12:01:02'),(44,11,'test4',0,4,'2025-06-20 12:01:02','2025-06-20 12:01:02'),(45,12,'april',0,1,'2025-06-23 08:56:26','2025-06-23 08:56:26'),(46,12,'agustus',1,2,'2025-06-23 08:56:26','2025-06-23 08:56:26'),(47,12,'mei',0,3,'2025-06-23 08:56:26','2025-06-23 08:56:26'),(48,12,'juni',0,4,'2025-06-23 08:56:26','2025-06-23 08:56:26');
/*!40000 ALTER TABLE `exercise_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_questions`
--

DROP TABLE IF EXISTS `exercise_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercise_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exercise_id` bigint(20) unsigned NOT NULL,
  `material_video_id` bigint(20) unsigned NOT NULL,
  `question` text NOT NULL,
  `points` int(11) NOT NULL DEFAULT 10,
  `order` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exercise_questions_material_video_id_foreign` (`material_video_id`),
  KEY `exercise_questions_exercise_id_order_index` (`exercise_id`,`order`),
  CONSTRAINT `exercise_questions_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exercise_questions_material_video_id_foreign` FOREIGN KEY (`material_video_id`) REFERENCES `material_videos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_questions`
--

LOCK TABLES `exercise_questions` WRITE;
/*!40000 ALTER TABLE `exercise_questions` DISABLE KEYS */;
INSERT INTO `exercise_questions` VALUES (10,3,16,'Gerakan di video itu artinya apa?',10,1,'2025-06-11 13:21:53','2025-06-11 13:21:53'),(11,4,17,'test3',10,1,'2025-06-20 12:01:02','2025-06-20 12:01:02'),(12,5,18,'gerakan itu menunjukan bulan apa?',10,1,'2025-06-23 08:56:26','2025-06-23 08:56:26');
/*!40000 ALTER TABLE `exercise_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exercises` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `material_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `difficulty_level` int(11) NOT NULL DEFAULT 1,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exercises_material_id_foreign` (`material_id`),
  KEY `exercises_created_by_foreign` (`created_by`),
  CONSTRAINT `exercises_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `exercises_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
INSERT INTO `exercises` VALUES (3,'Latihan Perkenalan','Belajar Bertanya Menggunakan Bahasa Isyarat',4,17,3,1,'2025-06-11 13:18:10','2025-06-11 13:21:53'),(4,'test3','test3',5,17,4,1,'2025-06-20 12:01:02','2025-06-20 12:01:02'),(5,'testMateri','bulan',6,26,2,1,'2025-06-23 08:56:26','2025-06-23 08:56:26');
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'default','{\"uuid\":\"bb4bada9-4077-458c-9f5e-6c5d096703d7\",\"displayName\":\"App\\\\Notifications\\\\CustomVerifyEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:15;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\CustomVerifyEmail\\\":1:{s:2:\\\"id\\\";s:36:\\\"4e3bef70-3d85-4129-bd0b-7e241f59148c\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}',0,NULL,1749661242,1749661242),(2,'default','{\"uuid\":\"78c65fa3-f07a-4776-9d93-26155c762e2b\",\"displayName\":\"App\\\\Notifications\\\\CustomVerifyEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:16;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\CustomVerifyEmail\\\":1:{s:2:\\\"id\\\";s:36:\\\"7320b38e-a8d5-424b-914a-1d2728a55a7e\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}',0,NULL,1749663565,1749663565),(3,'default','{\"uuid\":\"27d1590b-e6be-45e0-9fb8-27209e3d98f9\",\"displayName\":\"App\\\\Notifications\\\\CustomVerifyEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:16;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\CustomVerifyEmail\\\":1:{s:2:\\\"id\\\";s:36:\\\"22d5f4e2-9e6e-447b-8cb1-7afb2179f257\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}',0,NULL,1749663919,1749663919),(4,'default','{\"uuid\":\"6131bad1-467d-4ca5-8806-f9bef1579ec5\",\"displayName\":\"App\\\\Notifications\\\\CustomVerifyEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:16;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:35:\\\"App\\\\Notifications\\\\CustomVerifyEmail\\\":1:{s:2:\\\"id\\\";s:36:\\\"52a15f36-1aa3-4b7b-97a3-54e198fa70c2\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"}}',0,NULL,1749663971,1749663971);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_videos`
--

DROP TABLE IF EXISTS `material_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_videos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `material_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `video_path` varchar(255) NOT NULL,
  `video_filename` varchar(255) NOT NULL,
  `video_type` varchar(255) NOT NULL DEFAULT 'mp4',
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `material_videos_material_id_foreign` (`material_id`),
  CONSTRAINT `material_videos_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_videos`
--

LOCK TABLES `material_videos` WRITE;
/*!40000 ALTER TABLE `material_videos` DISABLE KEYS */;
INSERT INTO `material_videos` VALUES (16,4,'Bertanya bisa bahasa isyarat','Belajar bertanya \"Kamu Bisa Bahasa Isyarat Tidak?\"','material_videos/4/1749672852_kamu-bisa-bahasa-isyarat-tidak.mp4','Kamu bisa bahasa isyarat, tidak.mp4','video/mp4',1,'2025-06-11 13:14:12','2025-06-11 13:14:12'),(17,5,'test1','test1','material_videos/5/1750445991_20240812-110304-1.mp4','20240812_110304_1.mp4','video/3gpp',1,'2025-06-20 11:59:51','2025-06-20 11:59:51'),(18,6,'testVideo1','testVideo1','material_videos/6/1750694106_agustus.mp4','Agustus.mp4','video/mp4',1,'2025-06-23 08:55:06','2025-06-23 08:55:06');
/*!40000 ALTER TABLE `material_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `difficulty_level` int(11) NOT NULL DEFAULT 1,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `materials_created_by_foreign` (`created_by`),
  CONSTRAINT `materials_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (4,'Belajar Perkenalan','Belajar Perkenalan Menggunakan Bahasa Isyarat','thumbnails/Rnm35By9DoaWZ1n7ejRHHMmG9iZ63K1c7sLi0qiS.jpg',17,3,1,'2025-06-11 13:11:42','2025-06-11 13:11:42'),(5,'test3','test3','thumbnails/tJWud69dEZBAGxyrMBu7WIFLAfedSCiW7WDs2KeK.png',17,4,1,'2025-06-20 11:58:59','2025-06-20 11:58:59'),(6,'testMateri','testMateri','thumbnails/ABB7iK7n1gIUDAPW39ORuxUG2IvGc7fDFny4siaj.png',26,2,1,'2025-06-23 08:54:29','2025-06-23 08:54:29');
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_05_13_145115_create_users_table',2),(5,'2025_05_13_145128_create_roles_table',2),(6,'2025_05_13_145141_create_user_roles_table',2),(7,'2025_05_13_145248_create_materials_table',2),(8,'2025_05_13_145300_create_material_videos_table',2),(9,'2025_05_13_145308_create_exercises_table',2),(10,'2025_05_13_145348_create_quizzes_table',2),(11,'2025_05_13_145357_create_quiz_questions_table',2),(12,'2025_05_13_145406_create_quiz_options_table',2),(13,'2025_05_13_145416_create_student_progress_table',2),(14,'2025_05_13_145435_create_achievements_table',2),(15,'2025_05_13_145443_create_student_achievements_table',2),(16,'2025_05_13_145450_create_notifications_table',2),(17,'2025_05_13_145459_create_settings_table',2),(18,'2025_05_19_034656_create_personal_access_tokens_table',3),(19,'2025_05_25_091338_create_exercise_questions_table',4),(20,'2025_05_25_091418_create_exercise_options_table',4),(21,'2025_05_25_091501_update_exercise_table',4),(22,'2025_05_25_103247_add_exercise_fields_to_student_progress_table',5),(23,'2025_05_25_103955_update_quiz_questions_use_material_video',6),(24,'2025_05_25_152113_add_answers_detail_to_student_progress',7),(25,'2025_06_03_070000_add_quiz_fields',8),(26,'2025_06_03_070034_add_time_tracking_to_student_progress',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,18,'Pencapaian Baru!','Selamat! Anda telah mendapatkan pencapaian: Pemula','success','/student/achievements',0,NULL,'2025-06-13 11:33:10','2025-06-13 11:33:10'),(2,24,'Pencapaian Baru!','Selamat! Anda telah mendapatkan pencapaian: Pemula','success','/student/achievements',0,NULL,'2025-06-20 10:29:12','2025-06-20 10:29:12');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
INSERT INTO `password_reset_tokens` VALUES ('rehanfebrian7@gmail.com','$2y$12$E0n2I/W8QOWWhvFZFxugjeecmM6GYSDaEpEWxVSUaWR890ET1Pu3C','2025-06-11 22:53:13');
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',2,'auth_token','4e2eb2094cb7304068491a0f63e677ffd315608c576a7f84b52f1f5d9d9b0b87','[\"*\"]',NULL,NULL,'2025-05-18 20:50:55','2025-05-18 20:50:55'),(2,'App\\Models\\User',2,'auth_token','97d55e836a328dc4cdba0006f6b1a80a02b98e576a0d41cc64319a019fe544fd','[\"*\"]',NULL,NULL,'2025-05-18 20:52:03','2025-05-18 20:52:03'),(59,'App\\Models\\User',8,'auth_token','77ef89847c7d398ccaa5600de818820efb6f8115e07089c93395fa72ec324da4','[\"*\"]',NULL,NULL,'2025-05-27 07:59:04','2025-05-27 07:59:04'),(60,'App\\Models\\User',9,'auth_token','b5dcc06ac551c5a3d27b61db4004eaa13b9eea54035ea13030a1ef36ec2bbc24','[\"*\"]',NULL,NULL,'2025-05-27 08:00:16','2025-05-27 08:00:16'),(61,'App\\Models\\User',10,'auth_token','24c10b2f88fe18795add8878a6b7a472507529f4fa18d76e099e5fb68c934952','[\"*\"]',NULL,NULL,'2025-05-27 08:06:13','2025-05-27 08:06:13'),(63,'App\\Models\\User',12,'auth_token','ed3eb53c9ace4ab6000f389a453f2b1751ba5799adcc9ebb0ab2673085e4184a','[\"*\"]',NULL,NULL,'2025-05-28 00:50:48','2025-05-28 00:50:48'),(103,'App\\Models\\User',6,'auth_token','2533d92d5fedf100918a9e4413708c8f6370086501e063726b18dfaa22306f04','[\"*\"]','2025-06-07 20:58:37',NULL,'2025-06-04 08:55:58','2025-06-07 20:58:37'),(169,'App\\Models\\User',24,'auth_token','96f6fcdf5fd445dbdeb04a0f8becfbd11773f703ddff5ed67d0188ab0521c7a6','[\"student\"]','2025-06-20 11:03:06',NULL,'2025-06-20 10:55:38','2025-06-20 11:03:06'),(207,'App\\Models\\User',17,'auth_token','6c2a5f853b4b8e9f0f7a2f95dd43e9f91080a08f2d01c5c47f77d09f19196164','[\"teacher\"]','2025-06-23 09:25:57',NULL,'2025-06-23 09:25:55','2025-06-23 09:25:57');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_options`
--

DROP TABLE IF EXISTS `quiz_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_question_id` bigint(20) unsigned NOT NULL,
  `option_text` text NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_options_quiz_question_id_foreign` (`quiz_question_id`),
  CONSTRAINT `quiz_options_quiz_question_id_foreign` FOREIGN KEY (`quiz_question_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_options`
--

LOCK TABLES `quiz_options` WRITE;
/*!40000 ALTER TABLE `quiz_options` DISABLE KEYS */;
INSERT INTO `quiz_options` VALUES (29,16,'test1',0,1,'2025-06-13 07:48:06','2025-06-13 07:48:06'),(30,16,'test2',0,2,'2025-06-13 07:48:06','2025-06-13 07:48:06'),(31,16,'test3',1,3,'2025-06-13 07:48:06','2025-06-13 07:48:06'),(32,16,'test4',0,4,'2025-06-13 07:48:06','2025-06-13 07:48:06'),(33,17,'testtttt',0,1,'2025-06-13 07:48:06','2025-06-13 07:48:06'),(34,17,'test',0,2,'2025-06-13 07:48:06','2025-06-13 07:48:06'),(35,17,'testtstttt',0,3,'2025-06-13 07:48:06','2025-06-13 07:48:06'),(36,17,'tetstststst',1,4,'2025-06-13 07:48:06','2025-06-13 07:48:06'),(41,19,'ini test1',1,1,'2025-06-16 04:25:02','2025-06-16 04:25:02'),(42,19,'ini test2',0,2,'2025-06-16 04:25:02','2025-06-16 04:25:02'),(43,19,'ini test3',0,3,'2025-06-16 04:25:02','2025-06-16 04:25:02'),(44,19,'ini test4',0,4,'2025-06-16 04:25:02','2025-06-16 04:25:02'),(45,20,'ini test',0,1,'2025-06-16 04:25:02','2025-06-16 04:25:02'),(46,20,'ini testttt',0,2,'2025-06-16 04:25:02','2025-06-16 04:25:02'),(47,20,'ini testttt',0,3,'2025-06-16 04:25:02','2025-06-16 04:25:02'),(48,20,'ini testtttttttt',1,4,'2025-06-16 04:25:02','2025-06-16 04:25:02'),(53,22,'test1',0,1,'2025-06-20 12:02:55','2025-06-20 12:02:55'),(54,22,'test2',0,2,'2025-06-20 12:02:55','2025-06-20 12:02:55'),(55,22,'test3',1,3,'2025-06-20 12:02:55','2025-06-20 12:02:55'),(56,22,'test4',0,4,'2025-06-20 12:02:55','2025-06-20 12:02:55'),(57,23,'test1',0,1,'2025-06-20 12:02:55','2025-06-20 12:02:55'),(58,23,'test2',0,2,'2025-06-20 12:02:55','2025-06-20 12:02:55'),(59,23,'test3',1,3,'2025-06-20 12:02:55','2025-06-20 12:02:55'),(60,23,'test4',0,4,'2025-06-20 12:02:55','2025-06-20 12:02:55'),(73,27,'Agustus',1,1,'2025-06-23 08:58:01','2025-06-23 08:58:01'),(74,27,'mei',0,2,'2025-06-23 08:58:01','2025-06-23 08:58:01'),(75,27,'juni',0,3,'2025-06-23 08:58:01','2025-06-23 08:58:01'),(76,27,'november',0,4,'2025-06-23 08:58:01','2025-06-23 08:58:01');
/*!40000 ALTER TABLE `quiz_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_questions`
--

DROP TABLE IF EXISTS `quiz_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) unsigned NOT NULL,
  `question` text NOT NULL,
  `question_type` varchar(255) NOT NULL DEFAULT 'multiple_choice',
  `points` int(11) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `material_video_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_questions_quiz_id_foreign` (`quiz_id`),
  KEY `quiz_questions_material_video_id_foreign` (`material_video_id`),
  CONSTRAINT `quiz_questions_material_video_id_foreign` FOREIGN KEY (`material_video_id`) REFERENCES `material_videos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_questions`
--

LOCK TABLES `quiz_questions` WRITE;
/*!40000 ALTER TABLE `quiz_questions` DISABLE KEYS */;
INSERT INTO `quiz_questions` VALUES (16,8,'test','multiple_choice',10,1,'2025-06-13 07:48:06','2025-06-13 07:48:06',16),(17,8,'test','multiple_choice',10,2,'2025-06-13 07:48:06','2025-06-13 07:48:06',16),(19,10,'test 2','multiple_choice',10,1,'2025-06-16 04:25:02','2025-06-16 04:25:02',16),(20,10,'test 3','multiple_choice',10,2,'2025-06-16 04:25:02','2025-06-16 04:25:02',16),(22,12,'test1','multiple_choice',10,1,'2025-06-20 12:02:55','2025-06-20 12:02:55',17),(23,12,'test2','multiple_choice',10,2,'2025-06-20 12:02:55','2025-06-20 12:02:55',17),(27,13,'gerakan itu menunjukan bulan apa???','multiple_choice',10,1,'2025-06-23 08:58:01','2025-06-23 08:58:01',18);
/*!40000 ALTER TABLE `quiz_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `difficulty_level` int(11) NOT NULL DEFAULT 1,
  `time_limit` int(11) DEFAULT NULL,
  `material_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `passing_score` int(11) NOT NULL DEFAULT 70,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_material_id_foreign` (`material_id`),
  KEY `quizzes_created_by_foreign` (`created_by`),
  CONSTRAINT `quizzes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (8,'test','test',3,30,4,17,60,1,'2025-06-11 23:03:58','2025-06-13 07:47:05'),(10,'Test 2','ini materi test 2',3,1,4,17,70,1,'2025-06-16 04:25:02','2025-06-16 04:25:02'),(12,'test3','test3',4,1,5,17,60,1,'2025-06-20 12:02:55','2025-06-20 12:02:55'),(13,'TestMateri','Bulan',2,1,6,26,70,1,'2025-06-23 08:57:32','2025-06-23 08:57:32');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Teacher','teacher','2025-05-19 04:03:13','2025-05-19 04:03:13'),(2,'Student','student','2025-05-19 04:03:13','2025-05-19 04:03:13');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('04VZziRtKEBwPhJwcPwnmUZFndblp9bgWYgB3rLo',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoidGhoZ1dkTGxJOUhJM2JweHlRNEI2MnFqTWtLTFQ5TlRvUTh4Rm9JTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694271),('0dP4FlHupcZx0nQPXVUXvAblDGT8rFB29eNwB1j7',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoicnNDUXhldjhKU0tQVzZQTWxkelZNNHdFRU1LWFJEVG5RT1N3RlFPdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695942),('0MfUAhtSEyRgnpvxMjB3H4oC6dbYYSdfzMjZSkl6',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmkxZXhQT1BTZnNhWHQ1TFB1S05mN3dsOEhublJvNDZoeGw5eGV3TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694271),('0nNSE6nXTlUSCIl6kwU6hLn9brlBXcjZylwM7jR8',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEdHRFRpdldNbzU2TVBFbVJKd0FtRnMxdmxRUG1GQkNIUkwwa3p6YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYvdmlkZW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695927),('0U4Yj8zLcGTpOgDL5KextvgHy2EeE3BHKP8vBVgp',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWhmdEJNUGpNR1hiczllYW5NTEJjNFBUeDBEQjBWd29wUklNVmJEbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750693976),('13gELpf0WCksI0A8WehZg7rQRbPucFKthRH1Zytt',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicHFTU2h0cGd6NlFxbHBOc3NBbkxIeHNrY1YyczduR1RVa0hIM2x1NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzUvdmlkZW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695927),('1gOKTMY6cahDe7BtJy0LBxcYLjzPWlQLiRPI1vS3',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlNSQnYzTkxVY1BHcFlqZWZjZDd1YVJHbG5wT3NmVERVeFIxRVpKdSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTc7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750692978),('1pphS07BhdRdvQnt7q2HYWDt3rYKlKV31iwQrs9s',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGdKMU9qbXBtRUM3OGRFRlN3ZGdUSTNQR1RERUhGSFVrTEY1TjVsaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694259),('1Xmrfl8rfGCuBVhTNMQL4cK1yxqEI60tdRIH7hBa',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1RWS01xZXdJWURsT0pTS1FFZDh1SmZzNUd3cWp2SzNocXpLQk5CTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694419),('2gt8yHXKNKqMngqp9TwabC5my9w2R4IGIDDpXNJJ',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXlXaHN6elNrZUppYmRPZFlTMGJmbm96azViejNmZ1lobWRIREh2ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694070),('2iZGKbKNljPbcc0Nx2hfiAKnHPe4r7mTA62Lbt8i',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicHVSUWhVM2FKWWpkV3lwTm9CeTFqMWE0dXJRUTFnNGh6ZllHYVRWZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750693028),('2r8sFTA65H0c77gnohaEJPTkg5krCsLj0T2n8SU2',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1YydGZnVFAySnZ6RzdVVEhtSzZSU3YyazIyN1VMZmhnTm9NY2ZLWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694275),('2YmcuSjpR9RrXFL3i51cOm19SRx5S2JOn4xD0ARt',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieFNadHpWMHFpYTkzbUFkaWNVVHFkYkpCYlRjMnBHS0JZcFdid25iaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695831),('3PjKUa7dtAVPUGN7g3cIlr7JWRnBsymH8xYsZ26y',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiazBTeTEyVGt3OEpTOU1GbnV0T0RvemZGZTQ3QThXOGV0STNjNzR6UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYvdmlkZW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694275),('4l9cMhZhKygkqj4Y8iTxm00NxzDN0rPAifgdSGVq',16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieGx2NmhQVkdoVWF2WHpuV2c2ZnZLcnJDeXM3eGd5ak1wdHBENnpGdyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTY7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695717),('4OhhxteJpvS050VYyZptDqI2QLPWhL2lhsS9WPzq',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGpvcFZlQWoyT0pOYzZrc2xHaktLS3N3dmtqQjU0cURxMW5rN0RDcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby82LzE3NTA2OTQxMDZfYWd1c3R1cy5tcDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694118),('4sgaIb8UfaWR1K4gREQ6TLkbQva4OqOLmy5rrYVQ',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXl0NDEySTFJekRDQWNYRUJGR2U4aUhZM2NudE8wNG03TGNLVW1uZCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjY7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693962),('4YXWaAPEY2Xs9eSkD4JxiVbLWyyi0aiVzwul0VKT',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzQ2bEVGVFA3cktmYkg0T2hNZkhRQ1dZQ2t2UlJCTjFEU0dHVUtQNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750693963),('58NwnXltqdzFG1Fc6WhCjrjHRuP7mzXlEZtFvct2',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidk9NZjRSTDIwdnV5V2drVFpoYTYyMnFLTm9ZbGVRUFRPejZlcEN1OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695842),('5cs4peci5KRB7QksbLA7X9HTVPyBX0Grws9yvLTL',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidTczUklESHg0UXdhdVkzR0tIM3Z3dGpCVHJBNUt2eTVNWlJjQzZ1VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694419),('5DJxTHrtpZO7rZS4TyjYMPK70JiTaRNEB6GD8o2F',17,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibXF3Y0Yyak9qTnRudFF4RHV1NFVFUEl0QzJiZHo1czUxTkMyd3BEYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695956),('5PJ2owkBVCIVc2O1DBiq0jPJSjVF3UX7rq5YOmFy',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGtDd0x0UTJWdndLNnBZcndSTVdQbEZiYVFuSUFOMmpJWEpBdUdzciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby82LzE3NTA2OTQxMDZfYWd1c3R1cy5tcDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694117),('60nmycuRcCc1MAVKezLjNPXyRVimVqgufXMmaWeL',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlpOQnRyNzlrRG9IU005MWY5RVZ2RlhabzJNaTlnRXJzRjBjWEdUViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694299),('6Izlxs5BAchQ1OAEXXksMIPiKmRyyUpaQQuFZt4v',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidnkzRGluamRtUVQ5VWFDcXo4SnByZ0UxeXd4N3BoZzM2VldvMkZVSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750692980),('6JEaLgjBd9wawo1pVIgtoNS0BpAws5LmiPI3p6zt',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoib0tEQWQ2UXBMVTZhem1VRmZYUmVLQlEwdE95dTY1NEhZeExQQUsyVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750693095),('72SJir9CMJFAt5RTOVT4ty2j0GCp47oZX9Mq3pK3',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidGpxV0lSM050MGltamhIMTB1RFVWczNuVXp6M0FQSWNsaWI5QzNyTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695830),('86pscvKTzbiV0MEPjAyV4RNTNZzVSvGI8dBY4rKk',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVZ2aE5yT1BwZnVMTU1FYUg5Nk5oZ2l2d3RENWxJRkJoQUV3MjhIbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694299),('8AteUPnxDbrxc1IwRvGlnm9VPBxZ9cvimMjTii2b',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3pWVUNPd1ViSExBeVk5VFJlU3JPRTl4SE9GWUMyNFg4eWdlS1NjWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750693987),('8PYqDlhy7CVZ5KVdac7kvKpwHj9EJSpFcB9oCjbL',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoidVlybXlSeVFKSHpLa2VMTzduWFR3Y3FNZHFpblREYUlZS21vdXE2SyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693697),('91xKCVj50QBPyXLJxb2PjV9M5WfiGSYlKUV4EJXi',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGJ6c29UUkhCV2Rub2syV21xTHVxSWlUbTRjd2JGMjBTbHZDdVpqTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695832),('99IwkGkAd2FDdY2eXMcADHU5qiL7SGrgXs2sl7LV',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXRjbWZweEtFOWpQd2VKOUdDdk91OTFrQWpjcmRjNldPRUdqaTlPMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc3R1ZGVudC9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695897),('9KSIp3bxBPCVDkSMHC9IOuKx7iHEjBaeI3YyrU4C',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFRwdGJYOFczcUF1eUZVVGtTZVlwMWNNTnlSWEs2Q0dBWGNRRW5JQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693027),('9PcCu3cK0dahQOXjW8etoD4uddTEUuWBOuzQpPrS',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0JhcjFCSXlueUJqeGtUWW45bFZoQVRSRThwbnIyazk0ak5EdEpVQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzP215X21hdGVyaWFscz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694420),('9ZJQKLP4ibPYFWPmnJLDUmPaMxhNv8NogDVfS5pn',16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXoyTnV1OGNZYWdHd2ZvSTVNRHNZQjFLNERpWGdGSDF1Q0xKckpEVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzUvdmlkZW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695738),('aE3gqGqKDZIkfAgsd0xfGl8KvjuI9qjvFnkMBOBp',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQU9XMG5vUXVaMjY5U3RldzZTWDlOZzA0MG8zT1AySWtsWjVSbjl0ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694418),('avEc5RtvdGfWZLOP6PSA6OwvSty8SizFc3q7TxC2',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ05WTmZ1Z21RQjJuQzl3RjB6RWZvQWZrUUlZNjNqVkZmWEhNVHBFOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdXNlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750693107),('aVqfrx704LbAttBvYN1GNpQo34SxALhbsIl0rqi7',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUZ1VXdFTzNNSFVoZnp6aDBtUGp2bzZ2WFVXdnppemdsa1V0VGx0WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693975),('axlCDBMUwRSpevpyvkf8pBqDY9eibQGetiQkHC6H',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUThweVBFOVdFdDY5S1hXMFc2YVZJekVQTTlvSFNPRXd0eUd1UExSNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzP215X21hdGVyaWFscz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693972),('azbSgCrkqMnShTyuX832qwP5ojIF2aEUPgqL8pzZ',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQm45ZXp6UW9LdDFiWFNUWkpldjBqZWhXcUZBckhUVnVLejU0SW1BUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695932),('B2GXUUNHbcSFLA1X9wMm6Lnyk7T2GDia6W6wDZHh',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiclJqbGxZQ3FESFJCanp2cE5tUGFkaXhyWXpnTkc1TVhKN1hrbW1tWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695831),('bDXr95YmcITPsynfyIX3ePh0UUISUYbGQFHY22Mi',17,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnl2S1I4aHdBQWNRM2RmNkp4ZmdobFp0TUdUTlRlM0MzZjFXT0Z0cCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTc7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695955),('bE0DIP2bGOXRyev8GblIPmdjgDMm7q56cTt8hfZp',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoia3c1bTV3N1pUTlhqMHY4bjluYUlIdUowYWNodVc3bkZSeGpCTHNVOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694256),('BFflf18Q17C0UqkQRsk6ltzoKmane6DYq3LSeDdk',16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjJlOXYzZ3Z2ejJJQ1RXd0s5dktyYkgyNlZGTVRpVDdkWTJaaTF4WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc3R1ZGVudC9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695718),('BKiPyVKjeKbsLYl2SSSmuMzlFtGtOcVNgQnxJWEW',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2ZpY3JjYmZCM3ZucElFbW1WMlhRVjRqV2FuZ1Q2SnFPbTVmTko0SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYvdmlkZW9zLzE4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694115),('bnuiY7dm4seDkD3lqV8yowFVpeJhvlfOb8r7dChk',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmF2V0U1SXJsWVVYcTlCcWxRWnZRamtSVW1uY3c3M0dDTHQ4ZjlqdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby81LzE3NTA0NDU5OTFfMjAyNDA4MTItMTEwMzA0LTEubXA0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693016),('buHgkwjNHuTODSHIR6OPSNqszBfZx6aJu3vuuLXT',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGhvM0tzUXhKNzRVaHJRc3pvMmxJQ2hCUEdXaWxBR0xFbjlIRGxkdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzP215X2V4ZXJjaXNlcz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694421),('c6ZEPaYLqUgJ0j04XF0AbZlhN7Rz5EUevOua4bOk',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidTRRdGNFTjh4NkYyU2ZZS3I4eXBkTXMxREtJVXlKbzZHb0FxZlVKdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzLzUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694187),('CiLQ34eGGrSg3DkHK89JJwzaBB1kyOVMpNFgbDxz',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiaUZ3bW1NRHVIN015NW9VeFM5STA2c3h3MklXZjVOSmJzbU9KbGMxdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695930),('CJsCdc39sM2TlKhGJLKlFhJGGvkq08u2EQbdCEzj',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiMWVLYUVmWUlodE90cnpidEZ4R016SmpDUTd5dVk0ZjBoZDd2SzVjYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695799),('cTGOSTjQjTLDlcdWZYyedHnVPfMQkUvuE91RWQP9',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1pOMHRyODJxYkltcWxMNjQ2R0lQbm9rc3g2UFpKajdJazFuWEtzUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcz9teV9xdWl6emVzPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694199),('cus3zKPTrPHzzzZq08PfNO2yQOAEgGOa1lqO1vUo',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkJsRXpydDlHMG52VUFCZjNTa2lrNDIwd3ZGMjV1QXFEaTIydW8ydiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695817),('CWHjDibYbN4msKj5oTYtD0p2oesnMg9CPUGxerCa',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXVKUGc5Sk00aW9XeFBxdlpMUE00ZVB4QXRSNVVHM2RmRGZJTFdrRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYvdmlkZW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694212),('daSfcNM0Q84zHRH7Y6IqDVzudI8Gfyly7PfQkMvj',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlZqVTlaNkRDSnVKdXBKQU9JQVFId05oVzFyRkhSVzFqOFhDTnRLQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694422),('DgSpxNkaiLGf2j9a91abQmCWm0CX7xnq00kzZI39',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHpFSzdSYnI4clpORXgxQ2Vwc2NCVzR6MlNYeFpQeTNjREZHaUREQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzP215X21hdGVyaWFscz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693985),('dHitICZaJzir5mqBILPsoDMcJcUHGvjg7Bw3MPnv',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHFQMDVjRjRjaE43R0VGSlBhTnBLZTNsdDRGODkyNVg4c0VwbDN1RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcz9teV9xdWl6emVzPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750693101),('DlQRI4rJu9llfWHR4MSWgWt0dtUbeAXBvKc1sgLY',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHFwSDR1eXpVRzh6ekhncHJsYjlkaVdrQ2VYOHdoYTB0Q29aeGZOcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzUvdmlkZW9zLzE3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693014),('dP0fjWBjU23o0zzGTD3nUCvJYePch3zFLBWwyBrj',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzVYRFJ5TEl6M1BNdUpjSFY3dTRpSnE1ZGk0aXM2MzdtT0tVeWRvTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzP215X21hdGVyaWFscz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694416),('dQCJ6jPMGvMLi5LZq2ZCMRP5tJrIWEfoFhHubZSp',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU1OSk4wWVZySVprUU9hbjl0RVpkYmpkaFg4NXhicVdsM05ON2JCdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzP215X2V4ZXJjaXNlcz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694191),('dRjo02GMeStEJQlmYqBwbDs1ia3CJNgCwPKIDmcY',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVFhQXNxanVkSWxXWVd0VXlnQnEzYjBGV2J3N2ZjWnVNRzhhNDF5UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzLzUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694193),('DUFBY52rcooEWPR3aBDlUIWfGPYOvdhYBE6esELu',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidnZTeDgxVGJvSE40b2RrYmxNWHlFR09iY3EzNE5xZnQ2TGlzV1hDNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750693012),('dyQlxDBaGVZYvNrRXb52HB8nXiBW824nEUjMeCwp',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieHljUkJQRGhrTDU2ank1M3MzUDlDamNzWWV2ekU0aFUzYXpjZ0xuYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcz9teV9xdWl6emVzPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694285),('e3e0by3DiIKdV8fPceTgTFJ0k6rhFHYkHox4vcTR',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQW5HR05LTjZYbG5NeDVjR3k4UjNqZmkyMmtCdTJmT215V21pM0NuTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693962),('E5SviAynJ7QJv6QWJ5dfM9KFlEA5A7Jx44s0sc28',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTNTVDV6RXo1ZTlRVGN6RTh3aGdhWUNnNkJkQjVuUEFkYlZhU3JwNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694417),('ePBmG5n05wEV0zx2CKGv2GdpmHCOm7la5MCju5K0',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHpucGdOaVVNa2ZPb3h6dkVLTU13dkFlWnB4YjBHNkdWMXVyVWtQeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694422),('ER2lhcDqs8NPrs0s4zrdMS5cxTRYFKgpTSnjBOT3',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNldtbFluU1EySlBmZDF2Q0R5UmJaT1dXMlpCdDhyV0w5a0JHSDRXSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695813),('Es6ejqJgRReCUW5REix2x5ZMfDTnrxMh1GRYNoXW',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibWdzV0cxWnc3TG4zektVVVF3SkFWTkJXSDM4ZUd0TUdYM1B4ZjU5QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694419),('F3Prw8lXv736vbrqsXgidmyzLQONGMYizElWG6Za',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiSjNEN3JJaGZEcHVYdWlMejJJTnZBdjdXQzUyT0VWWTc4ekkxSU8zRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694259),('F6nDqs72X9El5kmNFP62GxbNoieVPKHCQmhZy1kG',17,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2RTblZGbjdiMmdJdHMzQUFlbVo1MGR0ZXIyRXgycHk3VjJ4YlpZTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695956),('f7vo9259NWVxNKzR0cYvqSyOxIotbMKLMehtDNbb',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZW4zcDB3WDE5cGJiakl0aU9CZ00wTWd3Nmw2M2VVbXFLaUIwTlBuZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9leGVyY2lzZS12aWRlby81LzEyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695761),('fd7zsxKQj2pMHCDuo4QDlmzc8Hfa402Q0p1QWHXu',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidG1EUmpCdG5RSGJqT2c0N2dYR3VlUVVmMUZ0QksxUVk2V1doc3JLRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby82LzE3NTA2OTQxMDZfYWd1c3R1cy5tcDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694116),('FzNKmk8O00QzpQLmDF3UqBAY6zlhQssgIlKSZrc9',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibXU5a0xhb0ZPeGg2NGdRYmZOc1lUTjVFdmNWZ2lBdWpqWHJSV05NdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694124),('GCz4ngHJ7kmBLABKHym7mMG5Gc1BoxmqToSgsAP1',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoic1lnZ0JhWUF3bzVrZW5EU25xZWgzSkRXczFZaDBqQ0J0V3VEdDdyOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9leGVyY2lzZS12aWRlby81LzEyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695762),('gISdFoe31u2JTNV2x4uEMw2xrQnXV8hiAhiLrBSF',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlBwVlhtWUQ1TWdPRW82S2tTMElYZEFyekNWelJaNGhNQzBwOElYRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzP215X2V4ZXJjaXNlcz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693005),('gSb7NKpD8XVdBKw4AvcvGqhYCTHrvPC5cLHbM65y',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDAwZXFmRFluU2Y1Vmx1ZG5MeUw5a1dRZlNxVjVKQTNzTjF5QVRwViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693986),('h0q2FjUMax1tc4EL8jB71Wj1wH1HK9TC0akytVQg',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoieGhqeGd5eHFCYllnTGFVd09iTDhJMTZkcE9FODlmdkJrVGYyTUp1MyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695947),('h7HSlTbBfBEqvW4OUpKW2YTYYjAE4wKhTYf0w4YK',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiV1poUnp3RW5ZemdQNTRocFBxY1pNdmozd0o3emRXY1c2Z21rdkdBaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693946),('HAkeDKvV7KYv3GwRTOEgKO9BCHxClH2l0SK790B5',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ29NWHZZWGRUdjBzRVpoRWNiME9VVkxxbmpXelRGYnpYckM1amo5eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695833),('hbGlwgVeIELTtfT3Fv9dWvses4SS1JhdioH8rgKf',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVk0cmlnb2JLczJnVzM3VXhycXRTVWIyeVJRdUhrWVNiZG5FcnhtWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9leGVyY2lzZS12aWRlby81LzEyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695763),('hBq6McbOIkEEuiT0Grjxf8zLDDKzGAEb5jtrc1ws',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicDFGYWlQYzhEdlRUazZoRVZFWmhqd3dOUjdJdHdtdHVRNW9xamFWaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby82LzE3NTA2OTQxMDZfYWd1c3R1cy5tcDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694117),('hbr7jYX42cmhmSeNGSMITgZeBRUbwvz4qQaXT1qL',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0YzT1U0SVVHV251RnhEenhldVlqWllLaVpkS3NOMEtFU1NvWTZ1NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzP215X21hdGVyaWFscz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693002),('hHcGMZBMjlJ9H4mSL1HFWaiRSEu1HRpMjPBuAvML',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibTRtOUc1UjJmcUpYUnU2WEJ6NjZGbFl4Z1BEcDN1ZWVnUVZ0SzhXYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695835),('hTrTVRtiY1EnMT86PKyGqnlQpmy3ep28jCyOnxyS',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibFlaRHVra2tXaWdrNHJYVFZ6SHVTWHFqTUFrZDZPVXhwQkNuVjR3OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdXNlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694379),('HvRJhc0z3xx6NG8SPF7qjausgjbWMt8gl2tJsa6e',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTJkMXVaMVNvNjdGNjFiMUVWNlRNSzYxQm1rdFk3WkdNUXVrUmlJQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694411),('HvWZPfeqp5nKDGVWwq7YWny8cH77lXe7aKpPqUfE',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoid3VlZ1Z1TWVmbktZSTFHb2R3RXVBRDJqaHlQUU03bXl1TjRjTURTQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694411),('hwRIxHpLh7hjhyRPTbFGwhDmifvn6JivEYO5gTaX',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicVY3T0lRNGY5dFlBa0RrMUZyblRDMGNmeXBEQU13dDJpMTZQZk9GaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750693975),('iba6lKvQCUri9lulmqggZAOoo0KzsIsmlyzp7nW6',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEpEcXMyZ1Rmam5zZWxVTm1LZDlOazJ3QlFvQ1NqNjZDNklQMTNJUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750693028),('iLERLnU9X2OgPKnym6t1D2YWXQ62wiA132QQxgjl',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUpjbHZHY25SSzJCcWFSM0dXUU9ZUXdnMURVQTU0Vk9ZWVM1eHByVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693986),('Iw78ByvadqXSHnDEIYaLSt2idMYrk1TYLZSfS2Jf',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUNiYTdxU0dWMkcxQ3FXZzg4Y1B5Z0FhQjdIc2ZUQ2g3Q2Y4d2tsMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750692981),('iwYUGGFolefGLOzfGlvVjq7P5b5B4AofQz4k7IBi',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0ViNjd1TkZlbmNJZnBqM0pjSVBDT3FEdmsxbU8zMmczajlNZVJhMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750692981),('iZb9JmjjpdqqETLrIrWbsu1T1Ozf24lCxrnnzlla',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiejRnc2t1OEFXZ0M2VTdNSHIyeWpMdjBnOUl4dTA1WEpkYnk5OWI4MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695926),('jaVt12d7zaP4KBl570Ouyxn3iaCQvpaK0wvjaK6N',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiNGd5N0M5cU9pOENsU2NKMWxYRUlWclRFTHZxMVQ0cmZMckk3OENuTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694186),('jnUSsRaukHFxQgXLHZkPDeqPJp4rPYxdxiIrhT6s',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMU4wcHNKcndTeTJYZzhJUWhWanV2MHhWcVJQSGdveFJLT1UwanJ0ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750692980),('JQFhIrjirY2LYBaUSSRXJJ9AGvOxEnX4mhOp0GQM',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1dkQkpuZnRKcUUyUU5Ra3prdzdVZFJKRTh5RVFIc3I1cVBvb0xtYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695829),('jrnqoTlwbxlCBcr9oguaD6FoLepr9tx6gPusweKA',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDRIeUhLQXNSMEZzVFlLcUxtczF0dHFFcXBTNlBxd2s0dmJjMExjcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695828),('k6VuwWOcJKn5hQWmoHVxXXOSI5ZUpAVtEbHXh8AV',16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXUwaWl2TWp0Y0NMd2J1Y2RxSmMza2hPdko0RWNKQm1uNW9QOVM2eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYvdmlkZW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695738),('KEJa3jE3yhbTmq07E1HvKbVBL0Pc5eh5VGlRt7X7',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibGppakVYYm9WQW1mQ1RrRzBVb3RZZGxkZVJkRDB1TXRxOHVoMVdnTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695893),('kfH2rfx0RHR9B9loMOx2FouV2ABdO3EBJWoJqXOb',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicVVXdXR3SERrMTlvakdiUE9DQzFpZDFwNEVvdzFleFQ1R1FRcFVvZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694114),('kkurduHuUze6ceBT99JC5yCRi39PblueveS3HS4V',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHZ0M0xUZlRUdHNlNzJ0MGFJVUk0OENWblhpVTFCaUtFcXZVbG1lYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693975),('kNl83nyXfGw9VvMDlDKgM9ZKIWREC93YmN0rcHjG',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiREplWDhva053N3VaWDhXbmhIcnpOWmdnQTRRaVl6M1FsbnlseG11QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9leGVyY2lzZS12aWRlby81LzEyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695764),('KQndCFEocWfSqqcyiTsf2z8NNPyyDwv9EKlGd57K',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUtldUJxcjVWSGlVVElKanRxbE0xOEs3bm13c0xxRFpvUklIRWFrdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYvdmlkZW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694256),('KsWt3RWkuX5HwVaN82Jg4lzuj9mO2cGtaXVVPT2w',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiZGhEcW5KaHJ6V0p5dnRONVdWcXZZUUFQZlV4MlBEell3MjZUTXJQUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695704),('Kvi5pzY2nIWkmO9ArRbZS6xBQjM1wFZ9xjdPCMmS',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWRRRU1IRjFFWTIyOURDUTR0eTB6Tlh0YlBCa0dIS3ZNaEpaUG1pMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694422),('KX2zec1ppK7NYxS19HxxTAw8d4c279QfOxRLurdO',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibUxldHFvT01ZT3BNaFYzR21qdHh2VXFKZUtXUXFacDFYcHNVMHJ1SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694262),('lcC2B889NTboDRZwuBKP2x4a37DJWCQ6aE6S4jbT',16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiQ2tDUXJCRjdYMmhyUWpmUnI1bXZlNU94TVB0VEZmR3FHeWxaMHhlOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695747),('LcVXuF5Q0K03HOhJzC62ZerjFv9Tn3fdfahaQLyE',16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDdxV09vd2VFV3J2dTFVTDV4eUZDcngwTmxIN3JBaDM5Z3pTVlR4YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzLzUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750695771),('LDwY6FgFqZWwkvh9JV3mtAsTVW1EJZheqR3HKLzw',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUzBPZEREMWJ1MWFUaVhZUWxiVjJnRk5NZEQxeWlxYmJRejVzRzVzayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694069),('lEIYwzmFeHlevTuUTWGefifJuHKuHKfNa3BKvlaH',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3BFRmdqTWs0SHpaVWtNUXdqd2lOakZLQWV4ek9WckhGNE85VkFFTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzP215X21hdGVyaWFscz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693007),('LGPywVEl4Dvs8MC9OWT7dUZIi8UMrK3RHMuQVVIK',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEZ2MVFvVUJnQ09XaVNqYmZ5Rm1Lbnp6OXc1Nk9YRmlhd0lRV0ZwNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693027),('Lj4Ai5BlAZFm1YQzr9qbHYjtdqNOhAqFPR1VHCkr',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGxYU2hoZFNJY2xvS0FIMEFUQkpzeXNTdm1XZ21yRkY3bWxIdjZlViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695828),('lkRoN9YS67XgFgLibpGPQtpWPAXb4Tck6pnGfSqM',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1dXYkJORzZkcTlOTlJYb3Izb1dPUjNWODMzZmwxdHpIOU50ZnlHdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvc3R1ZGVudC9teS1wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695944),('lMVBUq4dsV6zPGPjaMN6DKLBN7vkFAcEyTP34ysC',17,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibkppWldjZ2ViT3oxRmdxRllRWFJWcTBuUnQ5UldsdzYwekRoNkpjZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695956),('lN1Evj6MI3jAlzkFmE4uO3UFbx6QDEqTIfbjf8uK',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUJhdWl4cTRBWW9IMEV4TDY1S2djelBJeW04dWdZMVRWVUhEc3MyUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694419),('LPzUIIHSLtCX0S6qEJP7lkkgaCRdDsMaCE3rbnUu',16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiakZtdDVjMjJ4RnZJUnp1VThwWWI5WVRoRFI4V0JkNWdYVG5WVURiQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695737),('lT54Xc19B4EOhuvZvcbxbh5zBCcTssxGmAujnMle',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoic1RjbFVCRzdRYUdaNWVMcWFLQlpOamk0TWFWZjFOQUpkMDB4YVFLSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9leGVyY2lzZS12aWRlby81LzEyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695763),('mFsLclSUIOc71teXbOEBvjm9BnLyXvTH6cUSqGNz',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiOGdiUzNPU21raTJ3RFpLbGxyNlpUMWh2ZkpDamdCczFac1IzenFadiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694252),('N8KKgJqFNauJ0Sgeerrcd6pi78aijz2BW3N47lsV',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDljeUVybXhuRFVRZ1Rkd3FxS0ROWmVxV3A4aXI4a1JOUjZZYUViYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694299),('nAKypOmmFIAsqEh5mVlA821g26PEKOn7Rj29Xja5',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaG1FemlLQW50dFg3U2pZYkJLSERmczNSSEF0WW1rS2F1cFdFY3BwRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby82LzE3NTA2OTQxMDZfYWd1c3R1cy5tcDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694115),('nJGiNyRfsc8UsRD1q1B7bBBSFEu3CKJ9Zrz7HZ2w',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDZMMUFSdmttcDVsNmlTbWdjU2haMmRJaWpwV0ZMblUxSElNZ2hXViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695827),('NwJegnxNEnqjh56JInzPqBhlooSvCmfYMhm1oLna',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXhReG9oSVlKdmlwZHVJblBWM01EZ3U2dlNNc0ppdzA0MTNlU3hFTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694106),('NWtXg4o1JTf1tcDfmuIb0lqhZZKSuGUVXEYwZFEw',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlZyRVk2WWNrV0RDcUNpOUc2RFpPNnhKNXdld3FiMzJ5aDRXdk1ZcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzP215X2V4ZXJjaXNlcz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694122),('NX3SumuGyM11YAgfVIcNPMszaGDnyZ9ZVwiyL345',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkhpY2pRRlpCb3k2ZFFRN2p2VDFJeDZrclRaZ3RuNWNPVEljcVByTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695850),('o2FfExqrQYeLgtAPOxopnB2vPzcD5OaZ0z7l6A6X',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiY25HR2liMFg0WVhNMEp3NE9iVnBYdUpOYkhMa3I3R2xhSDZjUU5xViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694253),('OeXN511HES2i1dghPN9adf9YFVzL2FHllDbkbqct',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1pmc2NWNERvdmpKdW82cXZ3dGtPcUVsMnBLQVIxVXZPZjBHdG1WZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9leGVyY2lzZS12aWRlby81LzEyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695764),('olmXbxEx5nt330SgtIDsrvYb9JGUbOMjrR5mUHiQ',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicXpaM1JuTVU2a2JwY1UzWm5ScGRzR1dZQ2drUldjNEZ3M2JNYkszVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYvdmlkZW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694139),('oLqAvpzHWbSOsMYR3xGk4E9jCkBN0GGUFQ39W4wf',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiTzQydEFNSEtocENsNTFBaXVkVVo4Y1RZQWRWdzF2ZmliYnBxNGd5UCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695876),('OT5duqYCZwH7G555dXXs7M4PdjEzvAjbJbp9rDaz',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjRrOGtZNEdPU0JERjBLeno4MHJXV0g5Q01GN0x2S1BTYUpSYjNBNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750693987),('otwoxpODqaWu6yh8DW9yLNfGOAK3y0oy4Ypw45Wl',16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzRqeVF3WUhqUGphT3BMMjIxM2lDV0VwdTJmcjE2cW42eTdTVkxLUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzQvdmlkZW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695738),('PI32ENpvPlpRGy3HDpVfyOVkPODjAZEbQT7IIamO',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicnpMNHhJeDhza3dNMTREM1NVQm5rZThoeDQ4dUNvUVBwWDl3SW9hMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750693963),('PPqGv7r2G8o3483Y3cDrrfJ1ldopuQi1HLj3C4kw',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHRTcktBMUk1QlV1TnNJbm9veEJtRm9VaDhISXNqOE43dENMQ1FFMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694411),('ppzz43SJulzTfNaykltaS6Lat7Ow5R3Rn654SjI0',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXQ1RWd6cjJyRnVQR2QyNkZPQUFZUHFVQmdzNlNJOEpsTWU4cmttSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzQvdmlkZW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695928),('pQR0sGI3UNbg1sFONWVPivgqROunSC8NDQGTCyBg',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHFlMmVBTUUxS3g5MldnTGhWQ2NzSWdBZFJCV09rMFo1SlZFTUx4byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdXNlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694418),('Q4QgO5SgkoT5fZBiXezn9DONtQEkRcTKi1FkmR6t',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjR2V0NkbVlramVVTmVBaUZLWkhkUWpOaFpuQkk4TzlabHpvTFA3UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby82LzE3NTA2OTQxMDZfYWd1c3R1cy5tcDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694117),('QE5y4AMENeZkpjmCPO7d1483ruERkKQnjygoVfVA',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiaHQxeHlNaDVFc0lEVnJEUWhTaUNnYk5XT0JKZlV6OW5OTjU5czZWRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694407),('QorbaODE9JZLv1n5BIbZCeJKgtYmyYfkK1eRQ46W',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzlEcFlBNTdWeVVPUWRsdExBZzBDQkRrNkRLSTVsNDdQSUtvbklWRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694261),('qyYO0Y1cxZBOnzHDl9BcSZJbVzJC8v1IY7Ttd31H',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEtwdENyZTBqeWhhT1RqT2s5aUJ1c2UxQ3paTU1HcXFFNXpOaVlJbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694275),('qzRkCqtAHkeDiaPO5G0vJfPWdJm3a0zD6Jxu4l8Q',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiUE1rbXhzd002eXhJRjNHQjBoQ25QTGJ3alh6WHVvaVNNSEo5Tk1ORiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695851),('rf16vDccp9HisaXXu8lbJg6lVLGkPoxjbWTsQKFA',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiclh1MFhvN1Rta3RxOVZmYnlFdW5DeGtGVmE0REE1d2RtV2lRckV1aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9leGVyY2lzZS12aWRlby81LzEyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695765),('RvOEY7BMTK22U1lP5kvDeKxYhTtEIPgALLKBVPUQ',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibE5XR3FoV01NRHBRMUtmWWdmdGI3ZWxEYjhIS3Q0bml4a1pjdmxXWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695833),('sIkyjH6V6Zk9M5qcE78hCVxPe3BSOkqSn8BihYHa',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFlCMUYxV2U3UUs3T1hDMGhtYnFmMERnem9ORGFVTGRlV2JOWUI0aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694202),('sIpANFXEpIjBhhBtwIeP8JFXRwK0LwOU3pztNF5h',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWlHOWs5cmJrQWpDcHMzN3N6Z21vY1JReENvc2t3R1RxYmFtdGtHRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694300),('sKBJXHmf5xRR3p3A9IJPEJxotLSOjxGg7lVLHZm6',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnVLUGl1TFZKRWlBd3dnd0MxcFVZR3RWck84Y3lLdGR0OFkxanpzQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695839),('SR1cBZ5B2dmKt7RnLFUnpbKce1fBmsv3EkOUOFau',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWFzeHVOV3c0TFhuVWxFcTRNeEFVcWl2MEZjbU51d2h2cHlhN3pxRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694122),('Sszd7k1j4B5bcezQ4CeDDfzP6gFnP8QptomZbqjK',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXozcVFNb1cxNUduWHJSQzhFdWM2MEYxV2NSNHFoell0ZUFmODZlRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750693010),('T2ghfSeNLINjXMTDLIwfU39UQ6Vk51Bsxhz51BpL',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaktwSnh0bG9HZ0hTN3d1TWtucGRlWVk2am5SdGVaRFZNc2gzRGxtcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694291),('t6IuY26Hb9l9UoxtdsEMCNkiJkMlYsXS0WcUfLjP',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWhZaHdQWUZFdEc2TGVUTU8zY2x0OGppRWtzN2pzYVhzTzlaQUxKTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby81LzE3NTA0NDU5OTFfMjAyNDA4MTItMTEwMzA0LTEubXA0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693016),('T9AxdRFLn9KjuI8JazpcJY0dvgykpnoPJ7Ki3JiI',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieldzWktPSlJ0R2owTXdRU3NjckVkSWpwYWtiZFlGa0hJUE9CSm1MSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzP215X2V4ZXJjaXNlcz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694199),('thNhJ2ESgzyT2mBflQuINsEtp2tNpkDKEOIEraaq',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiczdWUmFCN1pDb2VMYVdheGppd3RveTc1OTJqMGthR2Z5aE1zTDhXdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby81LzE3NTA0NDU5OTFfMjAyNDA4MTItMTEwMzA0LTEubXA0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693017),('TJ6ktIDd3hQnW8WNxuLNcjkSpv112Ia94bOM9JJF',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiSEk1dmk5MkhVZnltaFgyWVVSUTR4V2oyMDc0V0NEcGxjanBON0FNSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693924),('tP80qDfhRzqQEs7egC69agWRpMGP6tFfQOu0GI8y',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnBINElaN2p2SjdkZXZlaDlNTzR1Uk80dWI3V0J3VTRRYUlwenFMWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby82LzE3NTA2OTQxMDZfYWd1c3R1cy5tcDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694116),('tPWL9lvW1ZvhB89x0Qd5FWpFiq7QEDF52yq62Ha2',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNldRM1FSVldNRUhaakxCVDhEMmRpYVB2c0ZKR3k2QUdrQWp6azhrSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzYvdmlkZW9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694262),('U0Gk7NriI0JUgsZTDQInac45xSc2BxwN6s2xrkVl',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3E0MGxNWGN3TWlMNWtmODNHelNRSldLVzYxaWtQdkgxbDNTMmhkMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzLzUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750693024),('u28zr6pLFva6ZXV2HscBPY2KfSfsuutbA4PWvA9D',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiaVlnNDlVUUpOakdlZDBxOHNPWWVpVzRmREdCbTl2eGZiSHJ2WFR2QyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693763),('UDt9qaD6XTKS3ExE27mmaKCDdHiKKzce9WVmlwMh',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWxHT2d2QUk1TEFyZXJXcER0azJZNjMzSTZjTWFrWEppQlhCbFhseCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzP215X2V4ZXJjaXNlcz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694026),('uFJsdm8bx0s3oktylBQ3bVPPLyXIMr1IFH9Q2d24',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFVmb2NvbWNwb1VibHNqMWtWNEdoVW55UjFCNW1Sd1pqM1BoV0tKeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694418),('UungmPJPPlKuB7dCpwBvjKLVqVd2fgtf3WYOAgSD',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNW8wS0p3emE0QWZYQ2M0ZnA5ZlRlaVVLVnc5SEdhU1g1Rkc5RjZtMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693962),('v6b0tC0AItxYQgt4fxCTqjzoEXuiKzMY6N10RCqB',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiTWNoM2t0T2RSbzBxMkVERlZBNVlzc2lieHdjSnB3WXhZbDFSRFM0ciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695826),('VioTgxpnHZ4s7t23d5k8EEx8JLc3597FAuBhuyFK',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFF3NkNNdG4zalkxZzZXVkxtUkw4RlpOME5SWURGbE9PTENrcE44SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzP215X21hdGVyaWFscz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694026),('vL0eyqxgl4CE7a7QnNdUKRa7X6W8uDbhXZCy0rL8',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoicWoyQWRWUmI3STA0TlcxelJJc01FZWN6Z2gwQWYzZFVVUXI5ZUNueCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694417),('VlLeQqH2gF1bb7B6Q4cjS0nhwnrRIDglHkzv1eI2',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoielh2c3p2VDcyMks5S3g2Z2ZsZk5MUlhpOWRiZ1dNOUxGMHdybkxuSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC92aWRlby82LzE3NTA2OTQxMDZfYWd1c3R1cy5tcDQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750694116),('wNcd5BwbFQiCPylG9GSTEzL4lQ9XNhOlueA9BQWt',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWUyVTVIUVBZM2dBTWxzc2VmTUpMdGVsdHlYczI2UGdqZ0hEcmxGQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694256),('WqiUviFKLuZYrZcwdHcuLKniiFWHepxme2kPbPx2',17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibzAwY2t3ZDNuMWk0NTZKRnAxY2tzQmlTNjh3RHFpU2Z2YWN1bGQwQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvbWF0ZXJpYWxzP215X21hdGVyaWFscz0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750693094),('WWdV42KFvLxnpE1Xh7tO3QAOWfRGP9zLmHvXmx5J',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGNoR3VJaXZzWWhnblNoZkNuMzlKNTRQRXZMMENwZEZQVmFKRVlsRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9xdWl6LXZpZGVvLzEzLzI3Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695826),('XR2jIFKhgRdySipR213HXelhVDMZT77fksQ5KXY1',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoibDB4UlYxUkExbWNscENTejc5RjYyNEFzRndNY0JCaFVOWGY1a0g3YSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750695804),('XTmqlQtR4ofs53RwqBUTdAIfBkpvm3NCzJV3ONZQ',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiR2xKVVhtWWs0QVQyOFFGd1czMW51ckJQZERoU3dVTU1RUnJyVkVGQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694281),('xU0vYqSdzzGfzQcElKQJjwEL35cAjpDRzi6stvqM',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoieTNrZWpPQTVyTUVza2JVVlliYk5JMVEyajd1NW1rNzhsNzJ1dVhKdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694282),('xXsTgtZPIBVOnz4nzsDCP2Jh0nxnLCgVgJ6Ma9yT',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlI4RExYa283ZEpNQ2plWHlrcHdoaEJWaWI5VVpvOUZlRU5jZGZUOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694423),('yNMVkAdMVaeROMFZsSgHfPYuB8d1p7c953reEzK6',16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDJ5Qm8yYXIxNUdqdkdGUmZtbEptSFQ3d0VqVExJOEk1anFTeDVmdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzLzUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750695761),('YqM50Y4PnKGtOjllE02tYXsyDlx4GYi6IFvhdXWf',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkU0RE5taGgyR0F6R0N5MGNiTU1aTXZHWkVPd2dsTWNMOUloUmRTOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750694412),('yxe2JimvMqIdSO7Wkjh0O2IaofBZjyroW245p41S',16,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaExUNkNyMFl2SWhDRmlZeDFPNGowWGlwaG95QlA1b3FJOUxHTXp3eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvcXVpenplcy8xMyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695824),('ZCqRNf2UiSa3Gg82YQ7pDfc4TFF69wCKORuv1bDy',26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiTDh6SEdqczFsSzNQR0ZMcE0xQXpGbFp5WFFrV3pLYTBoZWxDUHVKdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1750694106),('ZG2V7vmepFYn9paOVgjMKvCgEEPw7MVjMxgRLRYf',17,'127.0.0.1','Mozilla/5.0 (Linux; Android 13; SM-G981B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSE1zOUVWZE5ZRVpJcG5pN0JJT2hKVk9uRERjbFM5OUZGMlFKUDZReiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvdGVhY2hlci9zdHVkZW50cy9wcm9ncmVzcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1750695957),('ZOgKcYfzK1fDMhmaGiAdRI52ApZjlrl9JlFg442X',16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm5SU0xGZlN6YVllVUVTT3FnVk94N1RpanNqUGhIS1NEWXg4UE9OWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvZXhlcmNpc2VzLzUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1750695756);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `email_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(255) NOT NULL DEFAULT 'id',
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferences`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_user_id_foreign` (`user_id`),
  CONSTRAINT `settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (13,16,1,0,'id',NULL,'2025-06-11 10:39:25','2025-06-11 10:39:25'),(14,17,1,0,'id',NULL,'2025-06-11 11:37:02','2025-06-11 11:37:02'),(15,18,1,0,'id',NULL,'2025-06-11 11:44:30','2025-06-11 11:44:30'),(21,24,1,0,'id',NULL,'2025-06-20 08:43:24','2025-06-20 08:43:24'),(23,26,1,0,'id',NULL,'2025-06-23 08:51:39','2025-06-23 08:51:39');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_achievements`
--

DROP TABLE IF EXISTS `student_achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_achievements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `achievement_id` bigint(20) unsigned NOT NULL,
  `achieved_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_achievements_user_id_foreign` (`user_id`),
  KEY `student_achievements_achievement_id_foreign` (`achievement_id`),
  CONSTRAINT `student_achievements_achievement_id_foreign` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_achievements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_achievements`
--

LOCK TABLES `student_achievements` WRITE;
/*!40000 ALTER TABLE `student_achievements` DISABLE KEYS */;
INSERT INTO `student_achievements` VALUES (1,18,1,'2025-06-13 11:33:10','2025-06-13 11:33:10','2025-06-13 11:33:10'),(2,24,1,'2025-06-20 10:29:12','2025-06-20 10:29:12','2025-06-20 10:29:12');
/*!40000 ALTER TABLE `student_achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_progress`
--

DROP TABLE IF EXISTS `student_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_progress` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `material_id` bigint(20) unsigned DEFAULT NULL,
  `material_video_id` bigint(20) unsigned DEFAULT NULL,
  `exercise_id` bigint(20) unsigned DEFAULT NULL,
  `quiz_id` bigint(20) unsigned DEFAULT NULL,
  `progress_type` varchar(255) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `max_score` int(11) DEFAULT NULL,
  `answers_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`answers_detail`)),
  `attempt_count` int(11) NOT NULL DEFAULT 0,
  `is_completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `time_taken` int(11) DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_progress_user_id_foreign` (`user_id`),
  KEY `student_progress_material_id_foreign` (`material_id`),
  KEY `student_progress_material_video_id_foreign` (`material_video_id`),
  KEY `student_progress_exercise_id_foreign` (`exercise_id`),
  KEY `student_progress_quiz_id_foreign` (`quiz_id`),
  CONSTRAINT `student_progress_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_progress_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_progress_material_video_id_foreign` FOREIGN KEY (`material_video_id`) REFERENCES `material_videos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_progress_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_progress_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_progress`
--

LOCK TABLES `student_progress` WRITE;
/*!40000 ALTER TABLE `student_progress` DISABLE KEYS */;
INSERT INTO `student_progress` VALUES (13,16,NULL,NULL,3,NULL,'exercise',10,10,'{\"10\":{\"selected_option_id\":39,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-18T08:41:29.515868Z\"}}',1,1,'2025-06-18 01:41:29',NULL,'2025-06-11 13:24:19','2025-06-11 13:23:10','2025-06-18 01:41:29'),(20,18,NULL,NULL,3,NULL,'exercise',10,10,'{\"10\":{\"selected_option_id\":39,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-13T18:34:09.359681Z\"}}',1,1,'2025-06-13 11:34:09',NULL,'2025-06-13 11:34:09','2025-06-13 11:34:09','2025-06-13 11:34:09'),(22,18,NULL,NULL,NULL,8,'quiz',10,20,'{\"16\":{\"selected_option_id\":32,\"is_correct\":false,\"points_earned\":0,\"answered_at\":\"2025-06-14T13:06:29.745722Z\"},\"17\":{\"selected_option_id\":36,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-14T13:06:29.746308Z\"}}',1,1,'2025-06-14 06:06:29',-26,'2025-06-14 06:06:04','2025-06-14 06:06:04','2025-06-14 06:06:29'),(23,18,NULL,NULL,NULL,8,'quiz',0,20,'{\"16\":{\"selected_option_id\":29,\"is_correct\":false,\"points_earned\":0,\"answered_at\":\"2025-06-14T13:07:25.179157Z\"},\"17\":{\"selected_option_id\":35,\"is_correct\":false,\"points_earned\":0,\"answered_at\":\"2025-06-14T13:07:25.179691Z\"}}',2,1,'2025-06-14 06:07:25',-21,'2025-06-14 06:07:04','2025-06-14 06:07:04','2025-06-14 06:07:25'),(24,18,NULL,NULL,NULL,8,'quiz',0,20,'{\"16\":{\"selected_option_id\":32,\"is_correct\":false,\"points_earned\":0,\"answered_at\":\"2025-06-15T07:52:42.957376Z\"},\"17\":{\"selected_option_id\":33,\"is_correct\":false,\"points_earned\":0,\"answered_at\":\"2025-06-15T07:52:42.958071Z\"}}',3,1,'2025-06-15 00:52:42',-19,'2025-06-15 00:52:24','2025-06-15 00:52:24','2025-06-15 00:52:42'),(31,18,4,NULL,NULL,NULL,'material_video',NULL,NULL,NULL,0,1,'2025-06-15 11:18:14',NULL,NULL,'2025-06-15 11:18:14','2025-06-15 11:18:14'),(32,18,4,NULL,NULL,NULL,'material',NULL,NULL,NULL,0,1,'2025-06-15 11:18:14',NULL,NULL,'2025-06-15 11:18:14','2025-06-15 11:18:14'),(33,16,NULL,NULL,NULL,10,'quiz',10,20,'{\"19\":{\"selected_option_id\":41,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-17T19:59:43.399925Z\"},\"20\":{\"selected_option_id\":47,\"is_correct\":false,\"points_earned\":0,\"answered_at\":\"2025-06-17T19:59:43.400449Z\"}}',1,1,'2025-06-17 12:59:43',-27,'2025-06-17 12:59:16','2025-06-17 12:59:16','2025-06-17 12:59:43'),(34,16,NULL,NULL,NULL,10,'quiz',20,20,'{\"19\":{\"selected_option_id\":41,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-17T20:01:39.511996Z\"},\"20\":{\"selected_option_id\":48,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-17T20:01:39.512540Z\"}}',2,1,'2025-06-17 13:01:39',-104,'2025-06-17 12:59:56','2025-06-17 12:59:56','2025-06-17 13:01:39'),(35,16,NULL,NULL,NULL,10,'quiz',0,20,'{\"19\":{\"selected_option_id\":44,\"is_correct\":false,\"points_earned\":0,\"answered_at\":\"2025-06-17T20:02:18.095591Z\"},\"20\":{\"selected_option_id\":45,\"is_correct\":false,\"points_earned\":0,\"answered_at\":\"2025-06-17T20:02:18.096289Z\"}}',3,1,'2025-06-17 13:02:18',-8,'2025-06-17 13:02:10','2025-06-17 13:02:10','2025-06-17 13:02:18'),(36,16,NULL,NULL,NULL,10,'quiz',10,20,'{\"19\":{\"selected_option_id\":41,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-17T20:10:13.268684Z\"}}',4,1,'2025-06-17 13:10:13',-102,'2025-06-17 13:08:31','2025-06-17 13:08:31','2025-06-17 13:10:13'),(37,24,NULL,NULL,3,NULL,'exercise',10,10,'{\"10\":{\"selected_option_id\":39,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-20T16:07:31.743811Z\"}}',1,1,'2025-06-20 09:07:31',NULL,'2025-06-20 09:07:31','2025-06-20 09:07:31','2025-06-20 09:07:31'),(38,24,4,NULL,NULL,NULL,'material_video',NULL,NULL,NULL,0,1,'2025-06-20 10:29:12',NULL,NULL,'2025-06-20 10:29:12','2025-06-20 10:29:12'),(39,24,4,NULL,NULL,NULL,'material',NULL,NULL,NULL,0,1,'2025-06-20 10:29:12',NULL,NULL,'2025-06-20 10:29:12','2025-06-20 10:29:12'),(40,24,NULL,NULL,NULL,10,'quiz',20,20,'{\"19\":{\"selected_option_id\":41,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-20T17:50:42.246502Z\"},\"20\":{\"selected_option_id\":48,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-20T17:50:42.247115Z\"}}',1,1,'2025-06-20 10:50:42',-53,'2025-06-20 10:49:49','2025-06-20 10:49:49','2025-06-20 10:50:42'),(41,16,NULL,NULL,NULL,10,'quiz',0,20,'{\"19\":{\"selected_option_id\":43,\"is_correct\":false,\"points_earned\":0,\"answered_at\":\"2025-06-21T13:54:24.349453Z\"},\"20\":{\"selected_option_id\":47,\"is_correct\":false,\"points_earned\":0,\"answered_at\":\"2025-06-21T13:54:24.350313Z\"}}',5,1,'2025-06-21 06:54:24',-56,'2025-06-21 06:53:28','2025-06-21 06:53:28','2025-06-21 06:54:24'),(42,16,NULL,NULL,NULL,10,'quiz',10,20,'{\"19\":{\"selected_option_id\":42,\"is_correct\":false,\"points_earned\":0,\"answered_at\":\"2025-06-21T13:54:58.736407Z\"},\"20\":{\"selected_option_id\":48,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-21T13:54:58.737062Z\"}}',6,1,'2025-06-21 06:54:58',-17,'2025-06-21 06:54:42','2025-06-21 06:54:42','2025-06-21 06:54:58'),(43,18,NULL,NULL,4,NULL,'exercise',10,10,'{\"11\":{\"selected_option_id\":43,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-21T16:38:43.372717Z\"}}',1,1,'2025-06-21 09:38:43',NULL,'2025-06-21 09:38:43','2025-06-21 09:38:43','2025-06-21 09:38:43'),(44,16,NULL,NULL,5,NULL,'exercise',10,10,'{\"12\":{\"selected_option_id\":46,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-23T16:23:19.520716Z\"}}',1,1,'2025-06-23 09:23:19',NULL,'2025-06-23 09:23:19','2025-06-23 09:23:19','2025-06-23 09:23:19'),(45,16,NULL,NULL,NULL,13,'quiz',10,10,'{\"27\":{\"selected_option_id\":73,\"is_correct\":true,\"points_earned\":10,\"answered_at\":\"2025-06-23T16:24:36.899727Z\"}}',1,1,'2025-06-23 09:24:36',-51,'2025-06-23 09:23:46','2025-06-23 09:23:46','2025-06-23 09:24:36');
/*!40000 ALTER TABLE `student_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_roles_user_id_foreign` (`user_id`),
  KEY `user_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (14,16,2,NULL,NULL),(15,17,1,NULL,NULL),(16,18,2,NULL,NULL),(22,24,2,NULL,NULL),(24,26,1,NULL,NULL);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16,'Bagus TakBul','raihanloq7@gmail.com','2025-06-11 11:24:34','$2y$12$XSU2cXlmXBvSYSW6sb5C4u30ZTDaa26nbrMyz.uLpGfqCA6m11/2m','profile_photos/Wi0xENHKPmuS71ZGDEdL06yrWXJYYMtJudvWwHPV.png','Mas bagus Suka Nyantirrrrr',NULL,'2025-06-11 10:39:25','2025-06-18 03:23:18'),(17,'Pak Raihan','raihanapple20203@gmail.com','2025-06-11 11:38:28','$2y$12$uNHgbyOqnR48Td0RtGfe9.vIHCxHIh816vsLldXiZgEtDiaLiArl.','profile_photos/oxYzTlivzqciBOzLn4HddE6NVvbdqvzHQA5e5ZNM.jpg','Semangat mengajar anak anak',NULL,'2025-06-11 11:37:02','2025-06-18 04:14:49'),(18,'Dwi','rehanfebrian7@gmail.com','2025-06-11 11:45:38','$2y$12$vMXs/7ir0se79ih26m.Puucxuyj1BkbnpOmWBqgg/YMNG71Db8cHC','profile_photos/syQpWMcUgmGnCARSLzuwqI47024c9VU2KDrH3yZ2.jpg','Dwi suka bahasa isyarat',NULL,'2025-06-11 11:44:30','2025-06-16 06:27:56'),(24,'testing_authcontext','pleeereple@gmail.com','2025-06-20 08:44:04','$2y$12$LadTYB87oJlh5gTJKPSLge0VN8Y8l7CCDkYsl3JsRSPNryS0nqzB6','profile_photos/SGS4b3hLlHg8fwAIBM2bKJbSysiKICZZ369qEyZP.jpg','testinggggg',NULL,'2025-06-20 08:43:24','2025-06-20 10:32:34'),(26,'test2','rdwi74341@gmail.com','2025-06-23 08:52:26','$2y$12$6SC2opy4QjzhCnsTel0eG.2swyh8FnWg2mKUPo2OouXj40z98PHBW','profile_photos/JKtZcah9COuCOvyPWNBVtuSaUtYp83eEqIXJcl4S.png','Bapak ganteng',NULL,'2025-06-23 08:51:39','2025-06-23 09:00:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-24  0:45:55
