-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: test_laravel_mysql    Database: db
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2017-11-25 17:10:14','2017-11-25 17:10:14'),(2,NULL,1,'Category 2','category-2','2017-11-25 17:10:14','2017-11-25 17:10:14');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` int(10) unsigned NOT NULL,
  `plan_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_student_id_foreign` (`student_id`),
  KEY `comments_plan_id_foreign` (`plan_id`),
  CONSTRAINT `comments_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'Завтра буду:)',2,7,'2018-04-14 15:13:45','2018-04-14 15:13:45');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'',1),(2,1,'author_id','text','Author',1,0,1,1,0,1,'',2),(3,1,'category_id','text','Category',1,0,1,1,1,0,'',3),(4,1,'title','text','Title',1,1,1,1,1,1,'',4),(5,1,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',5),(6,1,'body','rich_text_box','Body',1,0,1,1,1,1,'',6),(7,1,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(8,1,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}',8),(9,1,'meta_description','text_area','meta_description',1,0,1,1,1,1,'',9),(10,1,'meta_keywords','text_area','meta_keywords',1,0,1,1,1,1,'',10),(11,1,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(12,1,'created_at','timestamp','created_at',0,1,1,0,0,0,'',12),(13,1,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',13),(14,2,'id','number','id',1,0,0,0,0,0,'',1),(15,2,'author_id','text','author_id',1,0,0,0,0,0,'',2),(16,2,'title','text','title',1,1,1,1,1,1,'',3),(17,2,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',4),(18,2,'body','rich_text_box','body',1,0,1,1,1,1,'',5),(19,2,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"}}',6),(20,2,'meta_description','text','meta_description',1,0,1,1,1,1,'',7),(21,2,'meta_keywords','text','meta_keywords',1,0,1,1,1,1,'',8),(22,2,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(23,2,'created_at','timestamp','created_at',1,1,1,0,0,0,'',10),(24,2,'updated_at','timestamp','updated_at',1,0,0,0,0,0,'',11),(25,2,'image','image','image',0,1,1,1,1,1,'',12),(26,3,'id','number','id',1,0,0,0,0,0,NULL,1),(27,3,'name','text','name',1,1,1,1,1,1,NULL,2),(28,3,'email','text','email',1,1,1,1,1,1,NULL,3),(29,3,'password','password','password',1,0,0,1,1,0,NULL,4),(30,3,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}',10),(31,3,'remember_token','text','remember_token',0,0,0,0,0,0,NULL,5),(32,3,'created_at','timestamp','created_at',0,1,1,0,0,0,NULL,6),(33,3,'updated_at','timestamp','updated_at',0,0,0,0,0,0,NULL,7),(34,3,'avatar','image','avatar',0,1,1,1,1,1,NULL,8),(35,5,'id','number','id',1,0,0,0,0,0,'',1),(36,5,'name','text','name',1,1,1,1,1,1,'',2),(37,5,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(38,5,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(39,4,'id','number','id',1,0,0,0,0,0,'',1),(40,4,'parent_id','select_dropdown','parent_id',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(41,4,'order','text','order',1,1,1,1,1,1,'{\"default\":1}',3),(42,4,'name','text','name',1,1,1,1,1,1,'',4),(43,4,'slug','text','slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(44,4,'created_at','timestamp','created_at',0,0,1,0,0,0,'',6),(45,4,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(46,6,'id','number','id',1,0,0,0,0,0,'',1),(47,6,'name','text','Name',1,1,1,1,1,1,'',2),(48,6,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(49,6,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(50,6,'display_name','text','Display Name',1,1,1,1,1,1,'',5),(51,1,'seo_title','text','seo_title',0,1,1,1,1,1,'',14),(52,1,'featured','checkbox','featured',1,1,1,1,1,1,'',15),(53,3,'role_id','text','role_id',0,1,1,1,1,1,NULL,9),(54,7,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(55,7,'name','text','Name',1,1,1,1,1,1,NULL,2),(56,7,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,3),(57,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(58,8,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(59,8,'first_name','text','First Name',1,1,1,1,1,1,NULL,6),(60,8,'last_name','text','Last Name',1,1,1,1,1,1,NULL,7),(63,8,'born_date','date','Born Date',1,0,1,1,1,1,NULL,10),(64,8,'status_id','text','Status Id',0,0,1,1,1,1,NULL,2),(65,8,'high_status_id','text','High Status Id',0,0,1,1,1,1,NULL,3),(66,8,'department_id','text','Department Id',0,0,1,1,1,1,NULL,4),(69,8,'created_at','timestamp','Created At',0,0,1,1,0,1,NULL,12),(70,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,13),(71,8,'teacher_belongsto_department_relationship','relationship','departments',0,1,1,1,1,1,'{\"model\":\"App\\\\Department\",\"table\":\"departments\",\"type\":\"belongsTo\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',14),(72,8,'teacher_belongsto_high_status_relationship','relationship','high_statuses',0,1,1,1,1,1,'{\"model\":\"App\\\\HighStatus\",\"table\":\"high_statuses\",\"type\":\"belongsTo\",\"column\":\"high_status_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',15),(73,8,'teacher_belongsto_status_relationship','relationship','statuses',0,0,1,1,1,1,'{\"model\":\"App\\\\Status\",\"table\":\"statuses\",\"type\":\"belongsTo\",\"column\":\"status_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',16),(74,8,'teacher_belongsto_plan_relationship','relationship','plans',0,0,1,1,1,1,'{\"model\":\"App\\\\Plan\",\"table\":\"plans\",\"type\":\"hasMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"comment\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',17),(75,9,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(76,9,'name','text','Name',1,1,1,1,1,1,NULL,2),(77,9,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,3),(78,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(79,10,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(81,10,'comment','text_area','Comment',1,1,1,1,1,1,NULL,3),(82,10,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,4),(83,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,5),(84,11,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(85,11,'name','text','Name',1,1,1,1,1,1,NULL,2),(86,11,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,3),(87,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(88,10,'date_start','date','Date Start',1,1,1,1,1,1,NULL,3),(89,10,'date_end','date','Date End',0,1,1,1,1,1,NULL,7),(90,10,'teacher_id','hidden','Teacher Id',1,1,1,1,1,1,NULL,2),(91,10,'plan_belongsto_teacher_relationship','relationship','teachers',0,1,1,1,1,1,'{\"model\":\"App\\\\Teacher\",\"table\":\"teachers\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"last_name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',8),(92,3,'user_hasone_teacher_relationship','relationship','teachers',0,1,1,1,1,1,'{\"model\":\"App\\\\Teacher\",\"table\":\"teachers\",\"type\":\"belongsTo\",\"column\":\"teacher_id\",\"key\":\"id\",\"label\":\"last_name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',11),(93,8,'avatar','image','Avatar',0,1,1,1,1,1,NULL,10),(94,3,'teacher_id','text','Teacher Id',0,1,1,1,1,1,NULL,2),(95,12,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(96,12,'name','text','Name',1,1,1,1,1,1,NULL,2),(97,12,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,3),(98,12,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(99,13,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(100,13,'first_name','text','First Name',1,1,1,1,1,1,NULL,3),(101,13,'middle_name','text','Middle Name',1,1,1,1,1,1,NULL,4),(102,13,'last_name','text','Last Name',1,1,1,1,1,1,NULL,5),(103,13,'born_date','date','Born Date',1,1,1,1,1,1,NULL,6),(104,13,'avatar','file','Avatar',1,1,1,1,1,1,NULL,7),(105,13,'group_id','text','Group Id',0,1,1,1,1,1,NULL,2),(106,13,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,8),(107,13,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,9),(108,13,'student_belongsto_group_relationship','relationship','groups',0,1,1,1,1,1,'{\"model\":\"App\\\\Group\",\"table\":\"groups\",\"type\":\"belongsTo\",\"column\":\"group_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',10),(109,3,'user_belongsto_student_relationship','relationship','students',0,1,1,1,1,1,'{\"model\":\"App\\\\Student\",\"table\":\"students\",\"type\":\"belongsTo\",\"column\":\"student_id\",\"key\":\"id\",\"label\":\"last_name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',12),(110,8,'middle_name','text','Middle Name',1,1,1,1,1,1,NULL,6),(111,8,'is_present','checkbox','Is Present',1,1,1,1,1,1,NULL,12);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,'2017-11-25 17:10:06','2017-11-25 17:10:06'),(2,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,'2017-11-25 17:10:06','2017-11-25 17:10:06'),(3,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy',NULL,NULL,1,0,'2017-11-25 17:10:06','2017-11-26 16:06:58'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,'2017-11-25 17:10:06','2017-11-25 17:10:06'),(5,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,'2017-11-25 17:10:06','2017-11-25 17:10:06'),(6,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,'2017-11-25 17:10:07','2017-11-25 17:10:07'),(7,'departments','departments','Department','Departments','voyager-documentation','App\\Department',NULL,NULL,NULL,1,0,'2017-11-25 17:11:11','2017-11-25 17:11:11'),(8,'teachers','teachers','Teacher','Teachers',NULL,'App\\Teacher',NULL,NULL,NULL,1,0,'2017-11-25 17:13:42','2017-11-25 17:13:42'),(9,'high_statuses','high-statuses','High Status','High Statuses',NULL,'App\\HighStatus',NULL,NULL,NULL,1,0,'2017-11-25 17:21:16','2017-11-25 17:21:16'),(10,'plans','plans','Plan','Plans',NULL,'App\\Plan',NULL,NULL,NULL,1,0,'2017-11-25 17:21:38','2017-11-25 17:21:38'),(11,'statuses','statuses','Status','Statuses',NULL,'App\\Status',NULL,NULL,NULL,1,0,'2017-11-25 17:21:56','2017-11-25 17:21:56'),(12,'groups','groups','Group','Groups',NULL,'App\\Group',NULL,NULL,NULL,1,0,'2018-04-14 14:38:59','2018-04-14 14:38:59'),(13,'students','students','Student','Students',NULL,'App\\Student',NULL,NULL,NULL,1,0,'2018-04-14 14:40:22','2018-04-14 14:40:22');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (2,'КНІТ','2018-04-14 14:49:37','2018-04-14 14:49:37'),(3,'ОА','2018-04-14 14:49:51','2018-04-14 14:49:51'),(4,'ПМ','2018-04-14 14:49:59','2018-04-14 14:49:59');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'КН-14-2','2018-04-14 14:41:37','2018-04-14 14:41:37'),(2,'КН-14-1','2018-04-14 14:41:52','2018-04-14 14:41:52');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `high_statuses`
--

DROP TABLE IF EXISTS `high_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `high_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `high_statuses`
--

LOCK TABLES `high_statuses` WRITE;
/*!40000 ALTER TABLE `high_statuses` DISABLE KEYS */;
INSERT INTO `high_statuses` VALUES (1,'Доктор технічних наук','2017-11-25 17:26:05','2017-11-25 17:26:05'),(2,'Доктор економічних наук','2018-04-14 14:52:44','2018-04-14 14:52:44');
/*!40000 ALTER TABLE `high_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2017-11-25 17:10:09','2017-11-25 17:10:09','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,4,'2017-11-25 17:10:09','2017-11-25 17:22:39','voyager.media.index',NULL),(4,1,'Users','','_self','voyager-person',NULL,NULL,3,'2017-11-25 17:10:10','2017-11-25 17:10:10','voyager.users.index',NULL),(7,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2017-11-25 17:10:10','2017-11-25 17:10:10','voyager.roles.index',NULL),(8,1,'Tools','','_self','voyager-tools',NULL,NULL,5,'2017-11-25 17:10:10','2017-11-25 17:22:39',NULL,NULL),(9,1,'Menu Builder','','_self','voyager-list',NULL,8,1,'2017-11-25 17:10:10','2017-11-25 17:22:40','voyager.menus.index',NULL),(10,1,'Database','','_self','voyager-data',NULL,8,2,'2017-11-25 17:10:10','2017-11-25 17:22:40','voyager.database.index',NULL),(11,1,'Compass','/admin/compass','_self','voyager-compass',NULL,8,3,'2017-11-25 17:10:10','2017-11-25 17:22:40',NULL,NULL),(12,1,'Hooks','/admin/hooks','_self','voyager-hook',NULL,8,4,'2017-11-25 17:10:10','2017-11-25 17:23:54',NULL,NULL),(13,1,'Settings','','_self','voyager-settings',NULL,NULL,6,'2017-11-25 17:10:10','2017-11-25 17:22:40','voyager.settings.index',NULL),(14,1,'Departments','/admin/departments','_self','voyager-documentation',NULL,19,2,'2017-11-25 17:11:11','2017-11-25 17:24:13',NULL,NULL),(15,1,'Teachers','/admin/teachers','_self','voyager-person','#000000',19,1,'2017-11-25 17:13:42','2017-11-26 15:04:09',NULL,''),(16,1,'High Statuses','/admin/high-statuses','_self','voyager-check-circle','#000000',19,5,'2017-11-25 17:21:16','2017-11-26 15:06:08',NULL,''),(17,1,'Plans','/admin/plans','_self','voyager-calendar','#000000',19,3,'2017-11-25 17:21:39','2017-11-26 15:04:49',NULL,''),(18,1,'Statuses','/admin/statuses','_self','voyager-check','#ff0000',19,4,'2017-11-25 17:21:56','2017-11-26 15:05:42',NULL,''),(19,1,'Who Is Present','','_self','voyager-people','#000000',NULL,7,'2017-11-25 17:23:26','2017-11-26 15:03:47',NULL,''),(20,2,'Змінити особисті данні','/teacher/edit','_self',NULL,'#000000',NULL,8,'2017-11-26 16:19:25','2018-04-14 15:08:03',NULL,''),(21,2,'Додати подію','/plan/add','_self',NULL,'#000000',NULL,9,'2017-11-26 16:20:09','2017-11-26 16:32:43',NULL,''),(22,2,'Історія подій','/plan/history','_self',NULL,'#000000',NULL,10,'2017-11-26 16:20:54','2017-11-26 16:32:51',NULL,''),(23,1,'Groups','/admin/groups','_self',NULL,NULL,NULL,11,'2018-04-14 14:38:59','2018-04-14 14:38:59',NULL,NULL),(24,1,'Students','/admin/students','_self',NULL,NULL,NULL,12,'2018-04-14 14:40:23','2018-04-14 14:40:23',NULL,NULL),(25,2,'Чат','/chat','_self',NULL,'#000000',NULL,13,'2018-04-14 15:05:13','2018-04-14 15:05:47',NULL,'');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2017-11-25 17:10:09','2017-11-25 17:10:09'),(2,'left menu','2017-11-26 16:18:20','2017-11-26 16:18:20');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_sender_id_foreign` (`sender_id`),
  KEY `message_department_id_foreign` (`department_id`),
  CONSTRAINT `message_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `message_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,2,2,'Привіт','2018-04-14 15:06:22','2018-04-14 15:06:22'),(2,2,2,'Як справи?','2018-04-14 15:06:52','2018-04-14 15:06:52'),(3,3,2,'Привіт','2018-04-14 15:12:35','2018-04-14 15:12:35'),(4,3,2,'Все добре','2018-04-14 15:12:42','2018-04-14 15:12:42');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_11_25_145507_create_table_departments',1),(2,'2013_11_25_145936_create_table_statuses',1),(3,'2013_11_25_150320_create_table_high_statuses',1),(4,'2013_11_25_150403_create_teachers_table',1),(5,'2013_11_25_150514_create_table_plans',1),(6,'2014_10_12_100000_create_password_resets_table',1),(7,'2015_10_12_000000_create_users_table',1),(8,'2016_01_01_000000_add_voyager_user_fields',1),(9,'2016_01_01_000000_create_data_types_table',1),(10,'2016_01_01_000000_create_pages_table',1),(11,'2016_01_01_000000_create_posts_table',1),(12,'2016_02_15_204651_create_categories_table',1),(13,'2016_05_19_173453_create_menu_table',1),(14,'2016_10_21_190000_create_roles_table',1),(15,'2016_10_21_190000_create_settings_table',1),(16,'2016_11_30_135954_create_permission_table',1),(17,'2016_11_30_141208_create_permission_role_table',1),(18,'2016_12_26_201236_data_types__add__server_side',1),(19,'2017_01_13_000000_add_route_to_menu_items_table',1),(20,'2017_01_14_005015_create_translations_table',1),(21,'2017_01_15_000000_add_permission_group_id_to_permissions_table',1),(22,'2017_01_15_000000_create_permission_groups_table',1),(23,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(24,'2017_03_06_000000_add_controller_to_data_types_table',1),(25,'2017_04_11_000000_alter_post_nullable_fields_table',1),(26,'2017_04_21_000000_add_order_to_data_rows_table',1),(27,'2017_07_05_210000_add_policyname_to_data_types_table',1),(28,'2017_08_05_000000_add_group_to_settings_table',1),(29,'2017_12_03_133429_add_present_to_teachers',1),(30,'2018_03_24_115206_change_avatar_in_teacher',1),(31,'2018_03_24_131003_create_message_table',1),(32,'2018_04_14_114233_create_tables_group_students',1),(33,'2018_04_14_114235_update_users',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2017-11-25 17:10:15','2017-11-25 17:10:15');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_groups`
--

DROP TABLE IF EXISTS `permission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_groups`
--

LOCK TABLES `permission_groups` WRITE;
/*!40000 ALTER TABLE `permission_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2017-11-25 17:10:10','2017-11-25 17:10:10',NULL),(2,'browse_database',NULL,'2017-11-25 17:10:10','2017-11-25 17:10:10',NULL),(3,'browse_media',NULL,'2017-11-25 17:10:10','2017-11-25 17:10:10',NULL),(4,'browse_compass',NULL,'2017-11-25 17:10:10','2017-11-25 17:10:10',NULL),(5,'browse_menus','menus','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(6,'read_menus','menus','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(7,'edit_menus','menus','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(8,'add_menus','menus','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(9,'delete_menus','menus','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(10,'browse_pages','pages','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(11,'read_pages','pages','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(12,'edit_pages','pages','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(13,'add_pages','pages','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(14,'delete_pages','pages','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(15,'browse_roles','roles','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(16,'read_roles','roles','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(17,'edit_roles','roles','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(18,'add_roles','roles','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(19,'delete_roles','roles','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(20,'browse_users','users','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(21,'read_users','users','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(22,'edit_users','users','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(23,'add_users','users','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(24,'delete_users','users','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(25,'browse_posts','posts','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(26,'read_posts','posts','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(27,'edit_posts','posts','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(28,'add_posts','posts','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(29,'delete_posts','posts','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(30,'browse_categories','categories','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(31,'read_categories','categories','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(32,'edit_categories','categories','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(33,'add_categories','categories','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(34,'delete_categories','categories','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(35,'browse_settings','settings','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(36,'read_settings','settings','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(37,'edit_settings','settings','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(38,'add_settings','settings','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(39,'delete_settings','settings','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(40,'browse_departments','departments','2017-11-25 17:11:11','2017-11-25 17:11:11',NULL),(41,'read_departments','departments','2017-11-25 17:11:11','2017-11-25 17:11:11',NULL),(42,'edit_departments','departments','2017-11-25 17:11:11','2017-11-25 17:11:11',NULL),(43,'add_departments','departments','2017-11-25 17:11:11','2017-11-25 17:11:11',NULL),(44,'delete_departments','departments','2017-11-25 17:11:11','2017-11-25 17:11:11',NULL),(45,'browse_teachers','teachers','2017-11-25 17:13:42','2017-11-25 17:13:42',NULL),(46,'read_teachers','teachers','2017-11-25 17:13:42','2017-11-25 17:13:42',NULL),(47,'edit_teachers','teachers','2017-11-25 17:13:42','2017-11-25 17:13:42',NULL),(48,'add_teachers','teachers','2017-11-25 17:13:42','2017-11-25 17:13:42',NULL),(49,'delete_teachers','teachers','2017-11-25 17:13:42','2017-11-25 17:13:42',NULL),(50,'browse_high_statuses','high_statuses','2017-11-25 17:21:16','2017-11-25 17:21:16',NULL),(51,'read_high_statuses','high_statuses','2017-11-25 17:21:16','2017-11-25 17:21:16',NULL),(52,'edit_high_statuses','high_statuses','2017-11-25 17:21:16','2017-11-25 17:21:16',NULL),(53,'add_high_statuses','high_statuses','2017-11-25 17:21:16','2017-11-25 17:21:16',NULL),(54,'delete_high_statuses','high_statuses','2017-11-25 17:21:16','2017-11-25 17:21:16',NULL),(55,'browse_plans','plans','2017-11-25 17:21:38','2017-11-25 17:21:38',NULL),(56,'read_plans','plans','2017-11-25 17:21:38','2017-11-25 17:21:38',NULL),(57,'edit_plans','plans','2017-11-25 17:21:38','2017-11-25 17:21:38',NULL),(58,'add_plans','plans','2017-11-25 17:21:38','2017-11-25 17:21:38',NULL),(59,'delete_plans','plans','2017-11-25 17:21:38','2017-11-25 17:21:38',NULL),(60,'browse_statuses','statuses','2017-11-25 17:21:56','2017-11-25 17:21:56',NULL),(61,'read_statuses','statuses','2017-11-25 17:21:56','2017-11-25 17:21:56',NULL),(62,'edit_statuses','statuses','2017-11-25 17:21:56','2017-11-25 17:21:56',NULL),(63,'add_statuses','statuses','2017-11-25 17:21:56','2017-11-25 17:21:56',NULL),(64,'delete_statuses','statuses','2017-11-25 17:21:56','2017-11-25 17:21:56',NULL),(65,'browse_groups','groups','2018-04-14 14:38:59','2018-04-14 14:38:59',NULL),(66,'read_groups','groups','2018-04-14 14:38:59','2018-04-14 14:38:59',NULL),(67,'edit_groups','groups','2018-04-14 14:38:59','2018-04-14 14:38:59',NULL),(68,'add_groups','groups','2018-04-14 14:38:59','2018-04-14 14:38:59',NULL),(69,'delete_groups','groups','2018-04-14 14:38:59','2018-04-14 14:38:59',NULL),(70,'browse_students','students','2018-04-14 14:40:23','2018-04-14 14:40:23',NULL),(71,'read_students','students','2018-04-14 14:40:23','2018-04-14 14:40:23',NULL),(72,'edit_students','students','2018-04-14 14:40:23','2018-04-14 14:40:23',NULL),(73,'add_students','students','2018-04-14 14:40:23','2018-04-14 14:40:23',NULL),(74,'delete_students','students','2018-04-14 14:40:23','2018-04-14 14:40:23',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `teacher_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plans_teacher_id_foreign` (`teacher_id`),
  CONSTRAINT `plans_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (5,'2017-11-07','0000-00-00 00:00:00','2017-11-26 17:47:37',2017,'2017-11-15 00:00:00','0000-00-00 00:00:00'),(6,'2017-11-07','0000-00-00 00:00:00','2017-11-26 17:48:21',2017,'2017-11-15 00:00:00','0000-00-00 00:00:00'),(7,'Завтра збори','2018-04-18 14:15:00','2018-04-25 12:00:00',2,'2018-04-14 15:11:08','2018-04-14 15:11:33');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,0,NULL,'Lorem Ipsum Post',NULL,'This is the excerpt for the Lorem Ipsum Post','<p>This is the body of the lorem ipsum post</p>','posts/post1.jpg','lorem-ipsum-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2017-11-25 17:10:15','2017-11-25 17:10:15'),(2,0,NULL,'My Sample Post',NULL,'This is the excerpt for the sample Post','<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>','posts/post2.jpg','my-sample-post','Meta Description for sample post','keyword1, keyword2, keyword3','PUBLISHED',0,'2017-11-25 17:10:15','2017-11-25 17:10:15'),(3,0,NULL,'Latest Post',NULL,'This is the excerpt for the latest post','<p>This is the body for the latest post</p>','posts/post3.jpg','latest-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2017-11-25 17:10:15','2017-11-25 17:10:15'),(4,0,NULL,'Yarr Post',NULL,'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.','<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>','posts/post4.jpg','yarr-post','this be a meta descript','keyword1, keyword2, keyword3','PUBLISHED',0,'2017-11-25 17:10:15','2017-11-25 17:10:15');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2017-11-25 17:10:10','2017-11-25 17:10:10'),(2,'user','Normal User','2017-11-25 17:10:10','2017-11-25 17:10:10');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','872717458091-nq811a60lcsol3nvu4k04776ins92inp.apps.googleusercontent.com','','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','872717458091-nq811a60lcsol3nvu4k04776ins92inp.apps.googleusercontent.com','','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Професор','2017-11-25 17:25:36','2017-11-25 17:25:36'),(2,'Старший викладач','2018-04-14 14:52:10','2018-04-14 14:52:10');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `born_date` date NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'teacher_avatar.png',
  `group_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_group_id_foreign` (`group_id`),
  CONSTRAINT `students_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Богдан','Зенонович','Загурський','1997-06-20','[{\"download_link\":\"students\\/April2018\\/zwAiJ9U1JuIcRdpi9jV8.png\",\"original_name\":\"default.png\"}]',1,'2018-04-14 14:43:22','2018-04-14 14:43:22'),(2,'Михайло','Володимирович','Ставнійчук','1997-05-25','[{\"download_link\":\"students\\/April2018\\/eqjoxytinGc0XNLSojxd.png\",\"original_name\":\"default.png\"}]',1,'2018-04-14 14:44:01','2018-04-14 14:44:01');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `born_date` date NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'teacher_avatar.png',
  `status_id` int(10) unsigned DEFAULT NULL,
  `high_status_id` int(10) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_present` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `teachers_department_id_foreign` (`department_id`),
  KEY `teachers_status_id_foreign` (`status_id`),
  KEY `teachers_high_status_id_foreign` (`high_status_id`),
  CONSTRAINT `teachers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teachers_high_status_id_foreign` FOREIGN KEY (`high_status_id`) REFERENCES `high_statuses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teachers_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (2,'Олександр','Володимирович','Бармак','1975-04-17','storage/avatars/LUzE51nrQBkqIHfuiAGXnMHl94T05ZU0MhmebDYs.png',1,1,2,'2018-04-14 14:51:54','2018-04-14 15:08:24',0),(3,'Микола','Сергійович','Свірневський','1965-12-10','teachers/April2018/FStZBLBGi6D40TpFHXwT.png',2,1,2,'2018-04-14 14:53:40','2018-04-14 14:53:40',0);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `teacher_id` int(10) unsigned DEFAULT NULL,
  `student_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_teacher_id_foreign` (`teacher_id`),
  KEY `users_student_id_foreign` (`student_id`),
  CONSTRAINT `users_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,1,'MS','mishasia2515@gmail.com','users/default.png','$2y$10$k/tROYcd3Aa78x6CeDqSYuY22dVLCnTHUclN4JSDjrU18mJ.CkwwK','dAUFjieg8l3iD3LNzDFvLlUATazEjIf4dWOxxlCfXYDFnZ7Jk5Li1wPxwj6a','2018-04-14 14:46:29','2018-04-14 14:46:29',NULL,2),(3,2,'ZB','bogdan2015@gmail.com','users/default.png','$2y$10$0LmmNIPWXa8ilp5j8ndYGe.aIDVHrrKJHvTZlHfXzT93EFgoacv8u',NULL,'2018-04-14 14:46:53','2018-04-14 14:46:53',NULL,1),(4,1,'OB','barmak@ghmaio.com','users/default.png','$2y$10$Yd8PIQXcpnVuvM2uoL3Np.U9OTvzc/4Af.XHD1G3V0g57ZFfd/mgq','PeGmIVbo6VyPzA2owFD4LLYWF276RmRSPgi818jNZZT8DFnyupmdGCR68JDq','2018-04-14 14:54:15','2018-04-14 14:54:15',2,NULL),(5,2,'NS','ns@gmail.com','users/default.png','$2y$10$/2u7a4SOXxBt53XxziYQmuskwd1rszBNCG7BAdnIQ/COm8sPZb64m','kikQf7Vg3b3A8R9juC3pyBAvQtxusFKw5zrKMPbAALsjvG9FL65r21kgbQQE','2018-04-14 14:54:51','2018-04-14 14:54:51',3,NULL);
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

-- Dump completed on 2018-04-14 18:16:55
