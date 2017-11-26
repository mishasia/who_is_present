-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 172.17.0.2    Database: db
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'',1),(2,1,'author_id','text','Author',1,0,1,1,0,1,'',2),(3,1,'category_id','text','Category',1,0,1,1,1,0,'',3),(4,1,'title','text','Title',1,1,1,1,1,1,'',4),(5,1,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',5),(6,1,'body','rich_text_box','Body',1,0,1,1,1,1,'',6),(7,1,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(8,1,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true}}',8),(9,1,'meta_description','text_area','meta_description',1,0,1,1,1,1,'',9),(10,1,'meta_keywords','text_area','meta_keywords',1,0,1,1,1,1,'',10),(11,1,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(12,1,'created_at','timestamp','created_at',0,1,1,0,0,0,'',12),(13,1,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',13),(14,2,'id','number','id',1,0,0,0,0,0,'',1),(15,2,'author_id','text','author_id',1,0,0,0,0,0,'',2),(16,2,'title','text','title',1,1,1,1,1,1,'',3),(17,2,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',4),(18,2,'body','rich_text_box','body',1,0,1,1,1,1,'',5),(19,2,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"}}',6),(20,2,'meta_description','text','meta_description',1,0,1,1,1,1,'',7),(21,2,'meta_keywords','text','meta_keywords',1,0,1,1,1,1,'',8),(22,2,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(23,2,'created_at','timestamp','created_at',1,1,1,0,0,0,'',10),(24,2,'updated_at','timestamp','updated_at',1,0,0,0,0,0,'',11),(25,2,'image','image','image',0,1,1,1,1,1,'',12),(26,3,'id','number','id',1,0,0,0,0,0,'',1),(27,3,'name','text','name',1,1,1,1,1,1,'',2),(28,3,'email','text','email',1,1,1,1,1,1,'',3),(29,3,'password','password','password',0,0,0,1,1,0,'',4),(30,3,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}',10),(31,3,'remember_token','text','remember_token',0,0,0,0,0,0,'',5),(32,3,'created_at','timestamp','created_at',0,1,1,0,0,0,'',6),(33,3,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(34,3,'avatar','image','avatar',0,1,1,1,1,1,'',8),(35,5,'id','number','id',1,0,0,0,0,0,'',1),(36,5,'name','text','name',1,1,1,1,1,1,'',2),(37,5,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(38,5,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(39,4,'id','number','id',1,0,0,0,0,0,'',1),(40,4,'parent_id','select_dropdown','parent_id',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(41,4,'order','text','order',1,1,1,1,1,1,'{\"default\":1}',3),(42,4,'name','text','name',1,1,1,1,1,1,'',4),(43,4,'slug','text','slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(44,4,'created_at','timestamp','created_at',0,0,1,0,0,0,'',6),(45,4,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(46,6,'id','number','id',1,0,0,0,0,0,'',1),(47,6,'name','text','Name',1,1,1,1,1,1,'',2),(48,6,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(49,6,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(50,6,'display_name','text','Display Name',1,1,1,1,1,1,'',5),(51,1,'seo_title','text','seo_title',0,1,1,1,1,1,'',14),(52,1,'featured','checkbox','featured',1,1,1,1,1,1,'',15),(53,3,'role_id','text','role_id',1,1,1,1,1,1,'',9),(54,7,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(55,7,'name','text','Name',1,1,1,1,1,1,NULL,2),(56,7,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,3),(57,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(58,8,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(59,8,'first_name','text','First Name',1,1,1,1,1,1,NULL,6),(60,8,'last_name','text','Last Name',1,1,1,1,1,1,NULL,7),(61,8,'email','text','Email',1,1,1,1,1,1,NULL,8),(62,8,'password','password','Password',1,0,1,1,1,1,NULL,9),(63,8,'born_date','date','Born Date',1,0,1,1,1,1,NULL,10),(64,8,'status_id','text','Status Id',0,0,1,1,1,1,NULL,2),(65,8,'high_status_id','text','High Status Id',0,0,1,1,1,1,NULL,3),(66,8,'department_id','text','Department Id',0,0,1,1,1,1,NULL,4),(67,8,'plan_id','text','Plan Id',0,0,1,1,1,1,NULL,5),(68,8,'remember_token','hidden','Remember Token',0,0,1,1,1,1,NULL,11),(69,8,'created_at','timestamp','Created At',0,0,1,1,0,1,NULL,12),(70,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,13),(71,8,'teacher_belongsto_department_relationship','relationship','departments',0,1,1,1,1,1,'{\"model\":\"App\\\\Department\",\"table\":\"departments\",\"type\":\"belongsTo\",\"column\":\"department_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',14),(72,8,'teacher_belongsto_high_status_relationship','relationship','high_statuses',0,1,1,1,1,1,'{\"model\":\"App\\\\HighStatus\",\"table\":\"high_statuses\",\"type\":\"belongsTo\",\"column\":\"high_status_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',15),(73,8,'teacher_belongsto_status_relationship','relationship','statuses',0,0,1,1,1,1,'{\"model\":\"App\\\\Status\",\"table\":\"statuses\",\"type\":\"belongsTo\",\"column\":\"status_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',16),(74,8,'teacher_belongsto_plan_relationship','relationship','plans',0,0,1,1,1,1,'{\"model\":\"App\\\\Plan\",\"table\":\"plans\",\"type\":\"belongsTo\",\"column\":\"plan_id\",\"key\":\"id\",\"label\":\"comment\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}',17),(75,9,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(76,9,'name','text','Name',1,1,1,1,1,1,NULL,2),(77,9,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,3),(78,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(79,10,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(80,10,'date','date','Date',1,1,1,1,1,1,NULL,2),(81,10,'comment','text_area','Comment',1,1,1,1,1,1,NULL,3),(82,10,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,4),(83,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,5),(84,11,'id','hidden','Id',1,0,0,0,0,0,NULL,1),(85,11,'name','text','Name',1,1,1,1,1,1,NULL,2),(86,11,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,3),(87,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,'2017-11-25 17:10:06','2017-11-25 17:10:06'),(2,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,'2017-11-25 17:10:06','2017-11-25 17:10:06'),(3,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','','',1,0,'2017-11-25 17:10:06','2017-11-25 17:10:06'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,'2017-11-25 17:10:06','2017-11-25 17:10:06'),(5,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,'2017-11-25 17:10:06','2017-11-25 17:10:06'),(6,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,'2017-11-25 17:10:07','2017-11-25 17:10:07'),(7,'departments','departments','Department','Departments','voyager-documentation','App\\Department',NULL,NULL,NULL,1,0,'2017-11-25 17:11:11','2017-11-25 17:11:11'),(8,'teachers','teachers','Teacher','Teachers',NULL,'App\\Teacher',NULL,NULL,NULL,1,0,'2017-11-25 17:13:42','2017-11-25 17:13:42'),(9,'high_statuses','high-statuses','High Status','High Statuses',NULL,'App\\HighStatus',NULL,NULL,NULL,1,0,'2017-11-25 17:21:16','2017-11-25 17:21:16'),(10,'plans','plans','Plan','Plans',NULL,'App\\Plan',NULL,NULL,NULL,1,0,'2017-11-25 17:21:38','2017-11-25 17:21:38'),(11,'statuses','statuses','Status','Statuses',NULL,'App\\Status',NULL,NULL,NULL,1,0,'2017-11-25 17:21:56','2017-11-25 17:21:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'AAA','2017-11-25 17:24:55','2017-11-25 17:24:55');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `high_statuses`
--

LOCK TABLES `high_statuses` WRITE;
/*!40000 ALTER TABLE `high_statuses` DISABLE KEYS */;
INSERT INTO `high_statuses` VALUES (1,'Доктор технічних наук','2017-11-25 17:26:05','2017-11-25 17:26:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2017-11-25 17:10:09','2017-11-25 17:10:09','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,4,'2017-11-25 17:10:09','2017-11-25 17:22:39','voyager.media.index',NULL),(4,1,'Users','','_self','voyager-person',NULL,NULL,3,'2017-11-25 17:10:10','2017-11-25 17:10:10','voyager.users.index',NULL),(7,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2017-11-25 17:10:10','2017-11-25 17:10:10','voyager.roles.index',NULL),(8,1,'Tools','','_self','voyager-tools',NULL,NULL,5,'2017-11-25 17:10:10','2017-11-25 17:22:39',NULL,NULL),(9,1,'Menu Builder','','_self','voyager-list',NULL,8,1,'2017-11-25 17:10:10','2017-11-25 17:22:40','voyager.menus.index',NULL),(10,1,'Database','','_self','voyager-data',NULL,8,2,'2017-11-25 17:10:10','2017-11-25 17:22:40','voyager.database.index',NULL),(11,1,'Compass','/admin/compass','_self','voyager-compass',NULL,8,3,'2017-11-25 17:10:10','2017-11-25 17:22:40',NULL,NULL),(12,1,'Hooks','/admin/hooks','_self','voyager-hook',NULL,8,4,'2017-11-25 17:10:10','2017-11-25 17:23:54',NULL,NULL),(13,1,'Settings','','_self','voyager-settings',NULL,NULL,6,'2017-11-25 17:10:10','2017-11-25 17:22:40','voyager.settings.index',NULL),(14,1,'Departments','/admin/departments','_self','voyager-documentation',NULL,19,2,'2017-11-25 17:11:11','2017-11-25 17:24:13',NULL,NULL),(15,1,'Teachers','/admin/teachers','_self',NULL,NULL,19,1,'2017-11-25 17:13:42','2017-11-25 17:24:10',NULL,NULL),(16,1,'High Statuses','/admin/high-statuses','_self',NULL,NULL,19,5,'2017-11-25 17:21:16','2017-11-25 17:24:17',NULL,NULL),(17,1,'Plans','/admin/plans','_self',NULL,NULL,19,3,'2017-11-25 17:21:39','2017-11-25 17:24:15',NULL,NULL),(18,1,'Statuses','/admin/statuses','_self',NULL,NULL,19,4,'2017-11-25 17:21:56','2017-11-25 17:24:17',NULL,NULL),(19,1,'Who Is Present','','_self',NULL,'#000000',NULL,7,'2017-11-25 17:23:26','2017-11-25 17:24:10',NULL,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2017-11-25 17:10:09','2017-11-25 17:10:09');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (104,'2013_11_25_145507_create_table_departments',1),(105,'2013_11_25_145936_create_table_statuses',1),(106,'2013_11_25_150320_create_table_high_statuses',1),(107,'2013_11_25_150514_create_table_plans',1),(108,'2014_10_12_100000_create_password_resets_table',1),(109,'2015_10_12_000000_create_users_table',2),(110,'2016_01_01_000000_add_voyager_user_fields',2),(111,'2016_01_01_000000_create_data_types_table',2),(112,'2016_01_01_000000_create_pages_table',2),(113,'2016_01_01_000000_create_posts_table',2),(114,'2016_02_15_204651_create_categories_table',2),(115,'2016_05_19_173453_create_menu_table',2),(116,'2016_10_21_190000_create_roles_table',2),(117,'2016_10_21_190000_create_settings_table',2),(118,'2016_11_30_135954_create_permission_table',2),(119,'2016_11_30_141208_create_permission_role_table',2),(120,'2016_12_26_201236_data_types__add__server_side',2),(121,'2017_01_13_000000_add_route_to_menu_items_table',2),(122,'2017_01_14_005015_create_translations_table',2),(123,'2017_01_15_000000_add_permission_group_id_to_permissions_table',2),(124,'2017_01_15_000000_create_permission_groups_table',2),(125,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',2),(126,'2017_03_06_000000_add_controller_to_data_types_table',2),(127,'2017_04_11_000000_alter_post_nullable_fields_table',2),(128,'2017_04_21_000000_add_order_to_data_rows_table',2),(129,'2017_07_05_210000_add_policyname_to_data_types_table',2),(130,'2017_08_05_000000_add_group_to_settings_table',2),(131,'2017_11_25_165203_create_teachers_table',2);
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
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2017-11-25 17:10:10','2017-11-25 17:10:10',NULL),(2,'browse_database',NULL,'2017-11-25 17:10:10','2017-11-25 17:10:10',NULL),(3,'browse_media',NULL,'2017-11-25 17:10:10','2017-11-25 17:10:10',NULL),(4,'browse_compass',NULL,'2017-11-25 17:10:10','2017-11-25 17:10:10',NULL),(5,'browse_menus','menus','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(6,'read_menus','menus','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(7,'edit_menus','menus','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(8,'add_menus','menus','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(9,'delete_menus','menus','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(10,'browse_pages','pages','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(11,'read_pages','pages','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(12,'edit_pages','pages','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(13,'add_pages','pages','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(14,'delete_pages','pages','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(15,'browse_roles','roles','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(16,'read_roles','roles','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(17,'edit_roles','roles','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(18,'add_roles','roles','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(19,'delete_roles','roles','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(20,'browse_users','users','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(21,'read_users','users','2017-11-25 17:10:11','2017-11-25 17:10:11',NULL),(22,'edit_users','users','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(23,'add_users','users','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(24,'delete_users','users','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(25,'browse_posts','posts','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(26,'read_posts','posts','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(27,'edit_posts','posts','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(28,'add_posts','posts','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(29,'delete_posts','posts','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(30,'browse_categories','categories','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(31,'read_categories','categories','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(32,'edit_categories','categories','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(33,'add_categories','categories','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(34,'delete_categories','categories','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(35,'browse_settings','settings','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(36,'read_settings','settings','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(37,'edit_settings','settings','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(38,'add_settings','settings','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(39,'delete_settings','settings','2017-11-25 17:10:12','2017-11-25 17:10:12',NULL),(40,'browse_departments','departments','2017-11-25 17:11:11','2017-11-25 17:11:11',NULL),(41,'read_departments','departments','2017-11-25 17:11:11','2017-11-25 17:11:11',NULL),(42,'edit_departments','departments','2017-11-25 17:11:11','2017-11-25 17:11:11',NULL),(43,'add_departments','departments','2017-11-25 17:11:11','2017-11-25 17:11:11',NULL),(44,'delete_departments','departments','2017-11-25 17:11:11','2017-11-25 17:11:11',NULL),(45,'browse_teachers','teachers','2017-11-25 17:13:42','2017-11-25 17:13:42',NULL),(46,'read_teachers','teachers','2017-11-25 17:13:42','2017-11-25 17:13:42',NULL),(47,'edit_teachers','teachers','2017-11-25 17:13:42','2017-11-25 17:13:42',NULL),(48,'add_teachers','teachers','2017-11-25 17:13:42','2017-11-25 17:13:42',NULL),(49,'delete_teachers','teachers','2017-11-25 17:13:42','2017-11-25 17:13:42',NULL),(50,'browse_high_statuses','high_statuses','2017-11-25 17:21:16','2017-11-25 17:21:16',NULL),(51,'read_high_statuses','high_statuses','2017-11-25 17:21:16','2017-11-25 17:21:16',NULL),(52,'edit_high_statuses','high_statuses','2017-11-25 17:21:16','2017-11-25 17:21:16',NULL),(53,'add_high_statuses','high_statuses','2017-11-25 17:21:16','2017-11-25 17:21:16',NULL),(54,'delete_high_statuses','high_statuses','2017-11-25 17:21:16','2017-11-25 17:21:16',NULL),(55,'browse_plans','plans','2017-11-25 17:21:38','2017-11-25 17:21:38',NULL),(56,'read_plans','plans','2017-11-25 17:21:38','2017-11-25 17:21:38',NULL),(57,'edit_plans','plans','2017-11-25 17:21:38','2017-11-25 17:21:38',NULL),(58,'add_plans','plans','2017-11-25 17:21:38','2017-11-25 17:21:38',NULL),(59,'delete_plans','plans','2017-11-25 17:21:38','2017-11-25 17:21:38',NULL),(60,'browse_statuses','statuses','2017-11-25 17:21:56','2017-11-25 17:21:56',NULL),(61,'read_statuses','statuses','2017-11-25 17:21:56','2017-11-25 17:21:56',NULL),(62,'edit_statuses','statuses','2017-11-25 17:21:56','2017-11-25 17:21:56',NULL),(63,'add_statuses','statuses','2017-11-25 17:21:56','2017-11-25 17:21:56',NULL),(64,'delete_statuses','statuses','2017-11-25 17:21:56','2017-11-25 17:21:56',NULL);
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
  `date` date NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plans`
--

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES (1,'2017-11-24','Im absand','2017-11-25 17:25:16','2017-11-25 17:25:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Професор','2017-11-25 17:25:36','2017-11-25 17:25:36');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
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
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `born_date` datetime NOT NULL,
  `status_id` int(10) unsigned DEFAULT NULL,
  `high_status_id` int(10) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `plan_id` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teachers_email_unique` (`email`),
  KEY `teachers_department_id_foreign` (`department_id`),
  KEY `teachers_status_id_foreign` (`status_id`),
  KEY `teachers_high_status_id_foreign` (`high_status_id`),
  KEY `teachers_plan_id_foreign` (`plan_id`),
  CONSTRAINT `teachers_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teachers_high_status_id_foreign` FOREIGN KEY (`high_status_id`) REFERENCES `high_statuses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teachers_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teachers_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Руслан','Сорокатий','rs@admin.com','$2y$10$q0.CqtuIp3ImIVfVKAnjXO79Lgl8Bm6pV.wfRjg/0DzNPBS4qv1me','2017-11-25 00:00:00',1,1,1,1,NULL,'2017-11-25 17:27:00','2017-11-25 17:28:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',1,'pt','Post','2017-11-25 17:10:16','2017-11-25 17:10:16'),(2,'data_types','display_name_singular',2,'pt','Página','2017-11-25 17:10:16','2017-11-25 17:10:16'),(3,'data_types','display_name_singular',3,'pt','Utilizador','2017-11-25 17:10:16','2017-11-25 17:10:16'),(4,'data_types','display_name_singular',4,'pt','Categoria','2017-11-25 17:10:16','2017-11-25 17:10:16'),(5,'data_types','display_name_singular',5,'pt','Menu','2017-11-25 17:10:16','2017-11-25 17:10:16'),(6,'data_types','display_name_singular',6,'pt','Função','2017-11-25 17:10:16','2017-11-25 17:10:16'),(7,'data_types','display_name_plural',1,'pt','Posts','2017-11-25 17:10:16','2017-11-25 17:10:16'),(8,'data_types','display_name_plural',2,'pt','Páginas','2017-11-25 17:10:16','2017-11-25 17:10:16'),(9,'data_types','display_name_plural',3,'pt','Utilizadores','2017-11-25 17:10:16','2017-11-25 17:10:16'),(10,'data_types','display_name_plural',4,'pt','Categorias','2017-11-25 17:10:16','2017-11-25 17:10:16'),(11,'data_types','display_name_plural',5,'pt','Menus','2017-11-25 17:10:16','2017-11-25 17:10:16'),(12,'data_types','display_name_plural',6,'pt','Funções','2017-11-25 17:10:16','2017-11-25 17:10:16'),(13,'categories','slug',1,'pt','categoria-1','2017-11-25 17:10:16','2017-11-25 17:10:16'),(14,'categories','name',1,'pt','Categoria 1','2017-11-25 17:10:16','2017-11-25 17:10:16'),(15,'categories','slug',2,'pt','categoria-2','2017-11-25 17:10:16','2017-11-25 17:10:16'),(16,'categories','name',2,'pt','Categoria 2','2017-11-25 17:10:16','2017-11-25 17:10:16'),(17,'pages','title',1,'pt','Olá Mundo','2017-11-25 17:10:16','2017-11-25 17:10:16'),(18,'pages','slug',1,'pt','ola-mundo','2017-11-25 17:10:16','2017-11-25 17:10:16'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2017-11-25 17:10:16','2017-11-25 17:10:16'),(20,'menu_items','title',1,'pt','Painel de Controle','2017-11-25 17:10:16','2017-11-25 17:10:16'),(21,'menu_items','title',2,'pt','Media','2017-11-25 17:10:17','2017-11-25 17:10:17'),(22,'menu_items','title',3,'pt','Publicações','2017-11-25 17:10:17','2017-11-25 17:10:17'),(23,'menu_items','title',4,'pt','Utilizadores','2017-11-25 17:10:17','2017-11-25 17:10:17'),(24,'menu_items','title',5,'pt','Categorias','2017-11-25 17:10:17','2017-11-25 17:10:17'),(25,'menu_items','title',6,'pt','Páginas','2017-11-25 17:10:17','2017-11-25 17:10:17'),(26,'menu_items','title',7,'pt','Funções','2017-11-25 17:10:17','2017-11-25 17:10:17'),(27,'menu_items','title',8,'pt','Ferramentas','2017-11-25 17:10:17','2017-11-25 17:10:17'),(28,'menu_items','title',9,'pt','Menus','2017-11-25 17:10:17','2017-11-25 17:10:17'),(29,'menu_items','title',10,'pt','Base de dados','2017-11-25 17:10:17','2017-11-25 17:10:17'),(30,'menu_items','title',13,'pt','Configurações','2017-11-25 17:10:17','2017-11-25 17:10:17');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@admin.com','users/default.png','$2y$10$xUjLmclXIrBA76b0EtJWT.g24oVisVfLi0S/8HxZq14D28Ybo33Iq','DK1tPqLfKxC7jzjxzscK7C7xzih2eFY3LeNKWSLgLNfXfxkNyixU98oyC8AE','2017-11-25 17:10:15','2017-11-25 17:10:15');
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

-- Dump completed on 2017-11-25 20:12:36
