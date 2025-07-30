-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: ses_project_db
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add 案件',7,'add_project'),(26,'Can change 案件',7,'change_project'),(27,'Can delete 案件',7,'delete_project'),(28,'Can view 案件',7,'view_project'),(29,'Can add 顧客',8,'add_customer'),(30,'Can change 顧客',8,'change_customer'),(31,'Can delete 顧客',8,'delete_customer'),(32,'Can view 顧客',8,'view_customer'),(33,'Can add 社員',9,'add_employee'),(34,'Can change 社員',9,'change_employee'),(35,'Can delete 社員',9,'delete_employee'),(36,'Can view 社員',9,'view_employee'),(37,'Can add gmail token',10,'add_gmailtoken'),(38,'Can change gmail token',10,'change_gmailtoken'),(39,'Can delete gmail token',10,'delete_gmailtoken'),(40,'Can view gmail token',10,'view_gmailtoken'),(41,'Can add imported mail',11,'add_importedmail'),(42,'Can change imported mail',11,'change_importedmail'),(43,'Can delete imported mail',11,'delete_importedmail'),(44,'Can view imported mail',11,'view_importedmail');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$En65XUyQ1eXSEdkAL4lm9o$46CU3ySfhGbf1+9z0mN+hHwU1svpaLXEIZJNmWgqqFU=','2025-07-25 02:28:17.473112',1,'linhui','','','lin.hui@wisdom-technology.co.jp',1,1,'2025-07-24 01:29:09.623070'),(2,'pbkdf2_sha256$1000000$eymugVOtQUxf0giMfHwvgk$fI7JH5dzHDKMzN93Il3wfFvGscNvsng/Q+wYOwxxam0=',NULL,1,'zhang.qianming','','','zhang.qianming@wisdom-technology.co.jp',1,1,'2025-07-24 01:57:00.000000'),(3,'pbkdf2_sha256$1000000$mSnobgwJryGHxTaSnnTQAf$FUUH2+4qZnNihNF5oMsNvpxy8rELoEQRkVmHTPaaZ1E=',NULL,1,'shuku','','','shuku@wisdom-technology.co.jp',1,1,'2025-07-24 01:57:32.000000'),(4,'pbkdf2_sha256$1000000$HfqlVOoHlt7u078mRISRy6$hPtNKQcvvGzoLC3jAjDvBT7bBmJZfQ9yQ8JlLoMT+i4=',NULL,1,'zheng.li','','','zheng.li@wisdom-technology.co.jp',1,1,'2025-07-24 09:26:49.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-07-24 01:32:43.023222','1','NSD',1,'[{\"added\": {}}]',8,1),(2,'2025-07-24 01:33:00.792838','1','NSD | ■案件概要\r\n【対象顧客】\r\n 食品系（物流倉庫）システムベンダー\r\n【案件名】\r\n 基幹...',1,'[{\"added\": {}}]',7,1),(3,'2025-07-24 01:33:23.389867','2','NSD | ■ 業務内容\r\nオフショア開発を前提としたプロジェクトにおける、以下対応：\r\n　・要件検討...',1,'[{\"added\": {}}]',7,1),(4,'2025-07-24 01:33:37.713953','3','NSD | ■案件：物流業界のシステム運用\r\n▼概要\r\n物流関連の複数システムにおけるWeb画面および...',1,'[{\"added\": {}}]',7,1),(5,'2025-07-24 01:33:57.606331','4','NSD | 概要　：④ドラッグストア販売管理基幹システム保守・開発\r\n　工程　：保守および改修開発\r\n...',1,'[{\"added\": {}}]',7,1),(6,'2025-07-24 01:34:17.821120','5','NSD | 案件 ：2.エネルギー関連　脱ホスト対応（共通化設計）\r\n概要 ：富士通HOSTの保守切れ...',1,'[{\"added\": {}}]',7,1),(7,'2025-07-24 01:34:40.467888','6','NSD | 某金融系OAシステムのリプレース案件（本番環境設計構築対応）\r\n【作業概要】\r\n　VMwa...',1,'[{\"added\": {}}]',7,1),(8,'2025-07-24 01:34:55.668825','7','NSD | 案件　：経理関連のWEBシステム既存改修案件のPMO募集\r\n 概要　：現在進行中の改修案件...',1,'[{\"added\": {}}]',7,1),(9,'2025-07-24 01:35:11.333545','8','NSD | 案件　：案件管理システムに対する保守開発\r\n概要　：既存案件管理システム(Web)に対する...',1,'[{\"added\": {}}]',7,1),(10,'2025-07-24 01:35:24.613231','9','NSD | 案件　：システム環境移行に伴うI/F機能開発\r\n 概要　：某自動車メーカー様の「SWall...',1,'[{\"added\": {}}]',7,1),(11,'2025-07-24 01:35:35.327185','10','NSD | 案件　：生産管理システムの開発\r\n 概要　：顧客がSAPを導入するにあたり、現状の生産管理...',1,'[{\"added\": {}}]',7,1),(12,'2025-07-24 01:36:57.909688','1','万 寧',1,'[{\"added\": {}}]',9,1),(13,'2025-07-24 01:37:37.741513','2','関 祥龍',1,'[{\"added\": {}}]',9,1),(14,'2025-07-24 01:38:17.550173','3','李 楽',1,'[{\"added\": {}}]',9,1),(15,'2025-07-24 01:39:08.044646','4','周',1,'[{\"added\": {}}]',9,1),(16,'2025-07-24 01:39:36.093639','5','王 洪恩',1,'[{\"added\": {}}]',9,1),(17,'2025-07-24 01:39:58.662784','6','孫 宇亮',1,'[{\"added\": {}}]',9,1),(18,'2025-07-24 01:40:21.855012','7','宋 伯韜',1,'[{\"added\": {}}]',9,1),(19,'2025-07-24 01:40:41.549644','4','周 天浩',2,'[{\"changed\": {\"fields\": [\"\\u6c0f\\u540d\"]}}]',9,1),(20,'2025-07-24 01:57:01.747280','2','zhang.qianming',1,'[{\"added\": {}}]',4,1),(21,'2025-07-24 01:57:11.160280','2','zhang.qianming',2,'[{\"changed\": {\"fields\": [\"Email address\", \"Staff status\", \"Superuser status\"]}}]',4,1),(22,'2025-07-24 01:57:33.669557','3','shuku',1,'[{\"added\": {}}]',4,1),(23,'2025-07-24 01:57:42.341356','3','shuku',2,'[{\"changed\": {\"fields\": [\"Email address\", \"Staff status\", \"Superuser status\"]}}]',4,1),(24,'2025-07-24 08:09:06.599613','5','王 洪恩',2,'[{\"changed\": {\"fields\": [\"\\u5e74\\u9f62\\u521d\\u671f\\u5024\"]}}]',9,1),(25,'2025-07-24 08:36:59.400999','2','WT',1,'[{\"added\": {}}]',8,1),(26,'2025-07-24 09:09:27.741095','3','DTS',1,'[{\"added\": {}}]',8,1),(27,'2025-07-24 09:09:36.066662','4','NHS',1,'[{\"added\": {}}]',8,1),(28,'2025-07-24 09:17:17.125960','12','WT | 板谷様\n\nいつも大変お世話になっております。\n株式会社Wisdom Technologyの...',3,'',7,1),(29,'2025-07-24 09:26:49.858559','4','zheng.li',1,'[{\"added\": {}}]',4,1),(30,'2025-07-24 09:26:57.809967','4','zheng.li',2,'[{\"changed\": {\"fields\": [\"Email address\", \"Staff status\", \"Superuser status\"]}}]',4,1),(31,'2025-07-24 09:47:52.003376','5','Q\'sfix',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'employees','employee'),(10,'gmail_reader','gmailtoken'),(11,'gmail_reader','importedmail'),(8,'projects','customer'),(7,'projects','project'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-07-23 09:55:21.738074'),(2,'auth','0001_initial','2025-07-23 09:55:22.839884'),(3,'admin','0001_initial','2025-07-23 09:55:23.102760'),(4,'admin','0002_logentry_remove_auto_add','2025-07-23 09:55:23.116160'),(5,'admin','0003_logentry_add_action_flag_choices','2025-07-23 09:55:23.130003'),(6,'contenttypes','0002_remove_content_type_name','2025-07-23 09:55:23.314386'),(7,'auth','0002_alter_permission_name_max_length','2025-07-23 09:55:23.426052'),(8,'auth','0003_alter_user_email_max_length','2025-07-23 09:55:23.461704'),(9,'auth','0004_alter_user_username_opts','2025-07-23 09:55:23.477967'),(10,'auth','0005_alter_user_last_login_null','2025-07-23 09:55:23.577863'),(11,'auth','0006_require_contenttypes_0002','2025-07-23 09:55:23.583716'),(12,'auth','0007_alter_validators_add_error_messages','2025-07-23 09:55:23.599997'),(13,'auth','0008_alter_user_username_max_length','2025-07-23 09:55:23.723827'),(14,'auth','0009_alter_user_last_name_max_length','2025-07-23 09:55:23.845123'),(15,'auth','0010_alter_group_name_max_length','2025-07-23 09:55:23.878294'),(16,'auth','0011_update_proxy_permissions','2025-07-23 09:55:23.891461'),(17,'auth','0012_alter_user_first_name_max_length','2025-07-23 09:55:24.008174'),(18,'employees','0001_initial','2025-07-23 09:55:24.052906'),(19,'employees','0002_remove_employee_bio_remove_employee_experience_years_and_more','2025-07-23 09:55:24.335371'),(20,'employees','0003_alter_employee_join_date','2025-07-23 09:55:24.342115'),(21,'employees','0004_rename_join_date_employee_recorded_at_and_more','2025-07-23 09:55:24.472760'),(22,'employees','0005_alter_employee_base_experience_and_more','2025-07-23 09:55:24.484597'),(23,'employees','0006_alter_employee_base_experience_and_more','2025-07-23 09:55:24.495670'),(24,'employees','0007_alter_employee_base_experience_and_more','2025-07-23 09:55:24.505901'),(25,'employees','0008_alter_employee_options','2025-07-23 09:55:24.513681'),(26,'employees','0009_alter_employee_options','2025-07-23 09:55:24.521680'),(27,'employees','0010_remove_employee_base_experience_employee_base_age_and_more','2025-07-23 09:55:24.793145'),(28,'employees','0011_remove_employee_base_industry_year_and_more','2025-07-23 09:55:24.973522'),(29,'gmail_reader','0001_initial','2025-07-23 09:55:25.128106'),(30,'projects','0001_initial','2025-07-23 09:55:25.170809'),(31,'projects','0002_alter_project_options','2025-07-23 09:55:25.178683'),(32,'projects','0003_alter_project_options','2025-07-23 09:55:25.186220'),(33,'projects','0004_alter_project_options','2025-07-23 09:55:25.193713'),(34,'projects','0005_customer_remove_project_customer_name_and_more','2025-07-23 09:55:25.484144'),(35,'projects','0006_alter_customer_options','2025-07-23 09:55:25.492604'),(36,'projects','0007_alter_project_options','2025-07-23 09:55:25.500246'),(37,'projects','0008_alter_project_options','2025-07-23 09:55:25.507450'),(38,'projects','0009_alter_project_options','2025-07-23 09:55:25.515719'),(39,'sessions','0001_initial','2025-07-23 09:55:25.587246'),(40,'gmail_reader','0002_alter_gmailtoken_refresh_token_importedmail','2025-07-24 06:39:27.547815'),(41,'gmail_reader','0003_importedmail_is_processed','2025-07-24 06:39:27.655483');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3ag6toxp3eha2sf9528qgon7ikq2qar7','.eJxVjDsOwjAQBe_iGlle_2JT0nOGaL1r4wBypDipEHeHSCmgfTPzXmLEba3j1vMyTizOAsTpd0tIj9x2wHdst1nS3NZlSnJX5EG7vM6cn5fD_Tuo2Ou3zuxUScgDJHAqDtrYoNkaY330YBwMQSMZ5EAUFDiyoJWLpWD0RZMX7w_FkTcK:1ueumg:-Dno-Ro7zVnNkUnh_r_RjpFnzQv8UcaHKY6ZWW6637E','2025-08-07 12:10:50.147275'),('h650ydaxolgms437aoh4v4vrr7r0926f','.eJxVjE0OgjAYBe_StSH9BepSViYajRcgH22BIhalbYwY7y4kLHT7Zt68UQkxtGX0ZiytRltE0OZ3q0BdjVuA7sA1Q6IGF0ZbJYuSrNQnx0Gbfre6f4EWfDu_jRa4rkBnpCICy4wynlPNGeOpTAkTJMspKAY6VyrHRChOKBayrkGmNVXpHPUBgplTxamL4jY2U3d5OnKHeLBwfuzdq58Ki9HnC7ciRWA:1uerBR:IHb_z0DKJFcke4WmxGupBMlnPsid8O-kW6HTpY614Bc','2025-08-07 08:20:09.604632'),('pxqaoe3ni7puxu4iqwgd0f5ndrgdimud','.eJxVjDsOwjAQBe_iGlle_2JT0nOGaL1r4wBypDipEHeHSCmgfTPzXmLEba3j1vMyTizOAsTpd0tIj9x2wHdst1nS3NZlSnJX5EG7vM6cn5fD_Tuo2Ou3zuxUScgDJHAqDtrYoNkaY330YBwMQSMZ5EAUFDiyoJWLpWD0RZMX7w_FkTcK:1uf7xB:ohosYxNwoclLhPes_TpHAoXDHaHDsQZge_mNCDimQn8','2025-08-08 02:14:33.994786'),('re97jb43bjzesk8rffrfytoibq72mrui','.eJxVjDsOwjAQBe_iGlle_2JT0nOGaL1r4wBypDipEHeHSCmgfTPzXmLEba3j1vMyTizOAsTpd0tIj9x2wHdst1nS3NZlSnJX5EG7vM6cn5fD_Tuo2Ou3zuxUScgDJHAqDtrYoNkaY330YBwMQSMZ5EAUFDiyoJWLpWD0RZMX7w_FkTcK:1uf83J:WgFw8o1nvJunMNLDxLBVtanJkztO-swS1Q4zfs3GHMA','2025-08-08 02:20:53.935733'),('xxfzau08fpysxlg5720grtjl2a0btfdm','.eJxVjDsOwjAQBe_iGlle_2JT0nOGaL1r4wBypDipEHeHSCmgfTPzXmLEba3j1vMyTizOAsTpd0tIj9x2wHdst1nS3NZlSnJX5EG7vM6cn5fD_Tuo2Ou3zuxUScgDJHAqDtrYoNkaY330YBwMQSMZ5EAUFDiyoJWLpWD0RZMX7w_FkTcK:1ueumh:Usn0je9oGdU7rA-Kb7D-ALdv1CvttMnd25D6mNwi-mA','2025-08-07 12:10:51.039942'),('yekp9b5r4h8stgrryo0xt5whfwqwxcxr','.eJxVjDsOwjAQBe_iGlle_2JT0nOGaL1r4wBypDipEHeHSCmgfTPzXmLEba3j1vMyTizOAsTpd0tIj9x2wHdst1nS3NZlSnJX5EG7vM6cn5fD_Tuo2Ou3zuxUScgDJHAqDtrYoNkaY330YBwMQSMZ5EAUFDiyoJWLpWD0RZMX7w_FkTcK:1uf7y3:XeZ09X2qE0OnzaXrXXbj1pIybch73NzXm2Sa-MDayQk','2025-08-08 02:15:27.418628'),('z1piiubpbdiqsqn3aa5rdpof1bobduto','.eJxVjDsOwjAQBe_iGlle_2JT0nOGaL1r4wBypDipEHeHSCmgfTPzXmLEba3j1vMyTizOAsTpd0tIj9x2wHdst1nS3NZlSnJX5EG7vM6cn5fD_Tuo2Ou3zuxUScgDJHAqDtrYoNkaY330YBwMQSMZ5EAUFDiyoJWLpWD0RZMX7w_FkTcK:1uf8AT:ecOghEV91nWS3g4UGs6fbRJfmipAIXd2p3t8ynqh2gc','2025-08-08 02:28:17.480353');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_employee`
--

DROP TABLE IF EXISTS `employees_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `introduction` longtext NOT NULL,
  `recorded_at` date NOT NULL,
  `base_age` int unsigned NOT NULL,
  `base_experience` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `employees_employee_chk_1` CHECK ((`base_age` >= 0)),
  CONSTRAINT `employees_employee_chk_2` CHECK ((`base_experience` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employee`
--

LOCK TABLES `employees_employee` WRITE;
/*!40000 ALTER TABLE `employees_employee` DISABLE KEYS */;
INSERT INTO `employees_employee` VALUES (1,'万 寧','【氏名】 万N（43歳／中国籍／男性）\r\n【稼働可能日】 2025年9月～\r\n【最寄駅】 南流山駅\r\n【日本語】 流暢（日本10年以上滞在）\r\n【経験年数】約21年\r\n【スキル】 Java（Spring Boot, Struts, JSP, Thymeleaf, MyBatis）、Oracle、SQL Server、C、PHP、ASP.NET、Jenkins、PowerCenter 他\r\n【人物像】 責任感が強く、チーム全体を見ながら的確に判断できるマネジメントタイプ。日本での経験が長く、現場への順応性・安定感に定評があります。\r\n\r\n【提案ポイント】\r\n万はこれまで、Javaによる業務バッチ処理や共通機能設計に多数従事しており、本件の「共通化設計」フェーズにおいて即戦力として貢献可能です。\r\nまた、富士通様経由のプロジェクト経験が豊富で、ドキュメント品質や開発標準への理解も深く、貴社案件でもスムーズな立ち上がりが期待できます。\r\nSQLチューニングやJVM分析といった性能改善領域にも精通しており、設計力と技術力を兼ね備えた人材です。','2025-07-24',43,21),(2,'関 祥龍','名　前　：関XY/36歳/男性/中国籍\r\n最寄駅　：青砥駅\r\n日本語　：N１、非常に流暢\r\n稼　動　：4月〜\r\n経　験　：14年(日本12年)\r\n工　程　：要件定義～運用保守\r\n言　語　：Java、SpringBoot、Oracle、Mybatis、JP1、HULFT、Remain、SharePoint等\r\n並　行　：なし\r\n備　考　：\r\n関は弊社の中でも、トップレベルの技術力を持つ要員です。\r\nこれまでに数多くのプロジェクトでその実力を発揮しており、特にリーダーとしての経験が豊富で、複雑な案件でも円滑にチームをまとめ上げることができます。','2025-07-24',37,15),(3,'李 楽','【氏　名】：李楽/35歳/男性/中国籍　\r\n【日本語】：N１\r\n【最寄駅】：竹ノ塚\r\n【所　属】：WTプロパー\r\n【稼　働】： 3月～\r\n【単　価】：72万(相談可)\r\n【スキル】：JAVA、C#、ASP、VB、VBA、ABAP、POWERSHELL、VBSCRIPT、PLSQL、STORED PROCEDURE、JAVASCRIPT\r\n【工　程】：調査分析、基本設計～総合試験\r\n【経　験】：12年\r\n【並　行】：提案のみ','2025-07-24',35,13),(4,'周 天浩','周 TH（34歳・男性）\r\n最寄り駅：亀戸\r\nIT経験：10年\r\nスキル：Java、JavaScript、Spring、VBA、SQL など\r\n対応工程：基本設計～運用保守\r\n日本語：N1取得済み、非常に流暢\r\n特長：リーダー経験あり（NXCL様案件にて1年間リーダーを担当）','2025-07-24',36,10),(5,'王 洪恩','■氏 名  ： 王HE/33歳/男性/蕨駅\r\n■スキル： Java、C#、JavaScript、SQL、Html、Sqlserver、Oracle、MySQLなど\r\n■日本語：N1流暢\r\n■IT経験 ：6年（日本現地）\r\n■稼働可能：6月\r\n■備　考：\r\n・日本電子専門学校出身\r\n・５名体制のPL経験が2件\r\n・経験は主に詳細設計段階以降にありますが、上流工程にも熱心に関わりたい意欲があります。','2025-07-24',36,9),(6,'孫 宇亮','■氏名：孫 YL（33歳／男性・中国籍）\r\n■最寄駅：新小岩駅\r\n■日本語：JLPT N1（ビジネス会話流暢）\r\n■稼働開始：2025年8月～\r\n■インフラ経験：11年（AWS中心にAzure・GCPも対応）\r\n■資格：\r\n・AWS Certified Solutions Architect – Associate（SAA）\r\n・AWS Certified Cloud Practitioner\r\n■主なスキル：AWS（EC2, S3, RDS 他）、CloudFormation、Terraform、Linux／Windows','2025-07-24',33,11),(7,'宋 伯韜','■氏名：宋（ソウ）32歳／男性／中国籍\r\n■稼働可能日：2025年8月〜OR　9月~\r\n■日本語レベル：日本語：業務会話流暢\r\n■経験年数：11年\r\n■スキル概要：\r\n開発言語：Java、JavaScript、PHP、Vue、C++、SpringBoot\r\nDB：MySQL、MongoDB、Oracle、Redis、RabbitMQ\r\nその他：Electron、Kafka、OpenFeign、QT、JIRA\r\nOS：Windows／Linux\r\n得意工程：設計～開発・テスト・運用保守','2025-07-24',32,11);
/*!40000 ALTER TABLE `employees_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gmail_reader_gmailtoken`
--

DROP TABLE IF EXISTS `gmail_reader_gmailtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gmail_reader_gmailtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `access_token` longtext NOT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `token_uri` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `scopes` longtext NOT NULL,
  `expiry` datetime(6) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `gmail_reader_gmailtoken_user_id_d8dc6f27_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gmail_reader_gmailtoken`
--

LOCK TABLES `gmail_reader_gmailtoken` WRITE;
/*!40000 ALTER TABLE `gmail_reader_gmailtoken` DISABLE KEYS */;
INSERT INTO `gmail_reader_gmailtoken` VALUES (1,'ya29.a0AS3H6Nwf7j7uPemNEISM_PmtZquUIURM2xpee5PWUj_cqXlbx2E_oYF7D3qRPNAOEdX9bIsaXGDlBABeO6TFXicD2jPrvn8JixEJ5f4f8uhnik6g58f2JkqUY-sz5B8djj6pRkRLKg46lID4MDl7UwyGGaSDTl-fZXRYPJdT-gaCgYKAbYSARISFQHGX2MiNCKmakNUztwhaCK1LMkhDg0177','1//0eaa7TQ0rrzmgCgYIARAAGA4SNwF-L9IrxrjUy8Z04wJC1OK5DVVy1qfuuriLEZffj0ta0CnCjdY3Oruqb5By6ePdHdFuj9_Lo7A','https://oauth2.googleapis.com/token','620569192263-su4mjnc4hdbie5mdh55dtjfca6kpb7ge.apps.googleusercontent.com','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','https://www.googleapis.com/auth/gmail.readonly','2025-07-24 18:30:01.521659',1);
/*!40000 ALTER TABLE `gmail_reader_gmailtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gmail_reader_importedmail`
--

DROP TABLE IF EXISTS `gmail_reader_importedmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gmail_reader_importedmail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message_id` varchar(128) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `sender` varchar(254) NOT NULL,
  `received_at` datetime(6) NOT NULL,
  `snippet` longtext,
  `body` longtext,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `is_processed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_id` (`message_id`),
  KEY `gmail_reader_importedmail_user_id_57214c31_fk_auth_user_id` (`user_id`),
  CONSTRAINT `gmail_reader_importedmail_user_id_57214c31_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gmail_reader_importedmail`
--

LOCK TABLES `gmail_reader_importedmail` WRITE;
/*!40000 ALTER TABLE `gmail_reader_importedmail` DISABLE KEYS */;
INSERT INTO `gmail_reader_importedmail` VALUES (1,'1983a957424f2f3d','[sales] =?UTF-8?B?77yIRURJ77yJ44CQ5om/6KqN5a6M5LqG6YCa55+l44CR?=\r\n =?UTF-8?B?IDIwMjXlubQwOOaciOWIhiDms6jmlofmm7jjg7vms6jmlofoq4vmm7gg5om/?=\r\n =?UTF-8?B?6KqN5a6M5LqG44Gu44GK55+l44KJ44Gb?=','no-reply@wisdom-technology.co.jp','2025-07-24 03:58:50.000000',NULL,'サービスミーム株式会社 様より、\n2025年08月分の注文書および注文請書が承認されました。\n注文番号：ODR25080014\n\n\n詳細は以下のリンクよりご確認いただけます。\nhttps://sales.wisdom-technology.co.jp/partner/companies/8/members/1010/orders/6396/',1,'2025-07-24 08:22:43.216420',1,0),(2,'1983a62d33c87a56','Re: [sales2-1] =?UTF-8?B?44GU56K66KqN?=','shuku@wisdom-technology.co.jp','2025-07-24 03:03:32.000000',NULL,'日本情報システム株式会社\n倉島様\n\nいつもお世話になっております。\n株式会社Wisdom Technologyの祝です。\n\n木村の勤務表につきましては、\nお客様にてご承認いただき次第、弊社より貴社へご共有させていただく流れとなっております。\n\nどうぞよろしくお願いいたします。\n\n祝\n\n倉島 修 <kurashima@nisweb.co.jp> 于2025年7月24日周四 10:03写道：\n\n\n\n-- \n__________________________________________\n株式会社Wisdom Technology\n営業 祝 雁楠（シュク エンナン）\n〒110-0006  東京都台東区秋葉原5−8−4F\nTEL ：03-5829-5767 FAX ：03-5809-1069\nMOB：080 4690 3037\nE-mail：shuku@wisdom-technology.co.jp\nHomepage： http://www.wisdom-technology.co.jp/link.php',1,'2025-07-24 08:22:48.201452',1,0),(3,'1983b87b8eb11de1','=?UTF-8?B?5qGI5Lu25YiG5p6Q44OG44K544OI?=','lin.hui@wisdom-technology.co.jp','2025-07-24 08:23:26.000000',NULL,'【案件名】グローバルに展開するWebプロダクトで、予約システム等の開発\n【主な業務】\n・デザイナーと協議しながらのUI/UX設計\n・フロントエンドの設計・開発・テスト・運用保守\n・フロントエンドエンジニアやデザイナーと協調してのフロントエンド開発\n・API開発（GraphQL）\n・CI/CD環境の構築、整備\n・テスト\n\n【技術環境】\nTypeScript(Svelte),HTML,CSS,Kotlin,GoogleCloud,pnpm,Vite,\nVitest,CloudRun,Sentry.io,GitHub\nActions\n\n【必須スキル】\n・Typescript開発経験3年\n・リードエンジニアとして技術選定をした経験\n・スクラム開発経験（各イベントについてどんなものか知っている方）\n\n【尚可スキル】\n・ユニットテストの経験\n\n【条件】\n・外国歴：不可\n・年齢：44歳以下\n・金額：70～75万\n・面談：2回（応募時に案件説明のMTG15分→本面談1時間）\n事前面談は選考の場ではなく、案件詳細の分かるピッチ資料読み合わせと\nご経験ヒアリングをさせていただきます。\n・稼働：週４もしくは週５(週4稼働の場合単価調整お願いいたします。)\n・時間：フレックス(コアタイムあり)\n・その他：PC貸与あり(MackBook Pro 14inc)\n海外勤務経験者など多様なバックボーンを持つ少数精鋭のチームです！\n・時間：フレックス(コアタイムあり)\n・その他：\n・PC貸与あり(MackBook Pro 14inc)\n・海外勤務経験者など多様なバックボーンを持つ少数精鋭のチームです！\n・フルリモートですが、年２回程度出張もしくは出社を求められる可能性があります。場所や日数はその時により、\nその時のご本人時の状況を考慮してご相談となります。\n（合宿で仕様を詰めたり、会議、フライトでのテスト等）\n・開始：即日\n・商流：エンド→元請→上位→弊社\"\n\n**************************************************************\n株式会社Wisdom Technology\n林 慧（リン フイ）\n110-0006\n東京都台東区秋葉原5-8 MARK  SQUARE  AKIHABARA  4F\nTEL:03-5829-5767\nFAX:03-5809-1069\nMOB:070-1242-0026\nE-mail:lin.hui@wisdom-technology.co.jp\n<E-mail%3Alin.hui@wisdom-technology.co.jp>\nLINE:https://line.me/ti/p/sQLPhBFVl2\nURL:http://www.wisdom-technology.co.jp\n労働者派遣:派13-314863\nISO270001:IA200059',1,'2025-07-24 08:23:55.663031',1,0),(4,'1983b8f54bcc82ad','=?UTF-8?B?44OG44K544OI?=','lin.hui@wisdom-technology.co.jp','2025-07-24 08:31:45.000000',NULL,'株式会社Wisdom Technology\n\n営業ご担当者様\n\n\nお世話になっております。\n株式会社D-Standingの廣茂でございます。\n\n\n下記、案件にて人材を募集しております。\n見合う人材がいらっしゃいましたら、ご提案をお待ちしております。\n\n\n◆ 案件：大手不動産情報プラットフォーム運営企業におけるサーバーサイドエンジニア\n\n\n◆必須スキル\n・PHPを用いた開発経験2年以上\n・Laravelの利用経験\n\n・Gitを用いた開発経験\n\n\n◆尚可スキル\n\n・RDBMSのクエリチューニング経験\n・AWSの利用経験\n\n\n◆ 年齢 ： 50歳まで\n◆ 外国籍 ： 不可\n◆ 勤務形態 ： 基本リモート ※【勤務形態】をご確認ください\n\n◆ 勤務場所 ： 人形町駅\n◆ 就業開始期時期 ： 即日/8月～/9月～\n◆ 就業時間 ：9：00～18：00（休憩60分）\n◆ 金額 ： ～50万円\n◆ 支払 ： 30日\n◆ 契約 ： 業務委託（準委任）\n◆ 商流 ： 貴社まで（プロパー及びフリーランス可）\n◆ 清算 ： 140~180h\n◆ 面談 ： 2回（弊社＋企業様）\n\n◆ PC貸与：有\n\n\n◆主な開発環境・ツール\n\n・開発言語\n\n バックエンド（サーバーサイド）プログラミング言語：PHP, Node.js, Golang, python\n バックエンド（サーバーサイド）フレームワーク：Laravel, Nest.js\n\n・開発環境：\n\n GitHub, Docker, JetBrains\n CI/CD： GitHub Actions, AWS CodePipeline, Jenkins\n インフラ：AWS\n IaC：Ansible, AWS CloudFormation\n モニタリング：ZABBIX, Mackerel, Sentry\n BI：Metabase\n コミュニケーション：LINE WORKS, Slack\n DB：MySQL, PostgreSQL, Redis, Amazon DynamoDB\n CMS: WordPress\n\n\n◆補足\n**************************************************************\n株式会社Wisdom Technology\n林 慧（リン フイ）\n110-0006\n東京都台東区秋葉原5-8 MARK  SQUARE  AKIHABARA  4F\nTEL:03-5829-5767\nFAX:03-5809-1069\nMOB:070-1242-0026\nE-mail:lin.hui@wisdom-technology.co.jp\n<E-mail%3Alin.hui@wisdom-technology.co.jp>\nLINE:https://line.me/ti/p/sQLPhBFVl2\nURL:http://www.wisdom-technology.co.jp\n労働者派遣:派13-314863\nISO270001:IA200059',1,'2025-07-24 08:32:15.697811',1,0),(5,'1983b9914f201046','=?UTF-8?B?44OG44K544OI?=','lin.hui@wisdom-technology.co.jp','2025-07-24 08:42:24.000000',NULL,'【案件名】：大手企業向けグループウェア開発\n【期間】：2025年9月（単月）※10月以降延長の可能性あり\n【作業場所】：赤坂見附 or 自宅（ハイブリッド／現状ほぼフルテレワーク）\n【作業内容】：\n・既存NotesアプリをPowerApps＋PowerAutomateへ移植\n・移植に際し、既存機能の改善も含めた開発対応\n\n【必須スキル】：\n・PowerAppsの使用または開発経験（複数年）\n・設計書・マニュアル等のドキュメント作成スキル\n\n【単金】：Max65万円（スキル見合いにより応相談）\n【面談】：1回予定\n【外国籍】：不可\n【商流制限】：貴社まで\n\n**************************************************************\n株式会社Wisdom Technology\n林 慧（リン フイ）\n110-0006\n東京都台東区秋葉原5-8 MARK  SQUARE  AKIHABARA  4F\nTEL:03-5829-5767\nFAX:03-5809-1069\nMOB:070-1242-0026\nE-mail:lin.hui@wisdom-technology.co.jp\n<E-mail%3Alin.hui@wisdom-technology.co.jp>\nLINE:https://line.me/ti/p/sQLPhBFVl2\nURL:http://www.wisdom-technology.co.jp\n労働者派遣:派13-314863\nISO270001:IA200059',1,'2025-07-24 08:42:28.261570',1,0),(6,'1983b9bb129bc4d7','Re: [sales2-1] =?UTF-8?B?6Z2i6KuH5pel56iL44Gu44GU55u46KuH44CQV1Q=?=\r\n =?UTF-8?B?56Wd44CR?=','shuku@wisdom-technology.co.jp','2025-07-24 08:45:16.000000',NULL,'板谷様\n\nいつも大変お世話になっております。\n株式会社Wisdom Technologyの祝でございます。\n\n稲葉につきましては、先日面談した他案件を引き続き検討しているため、\n誠に恐縮ではございますが、今回の案件への参画は難しい状況である可能性が高いです。\nご期待に添えず、大変申し訳ございません。\n\n代わりに、弊社プロパーの林をご提案させていただきます。\n弊社の高より伺ったところ、現在JSおよびTypeScriptを使用する案件が多いとのことですが、\n林はTypeScriptを得意としており、Pythonの経験もございます。\nそのため、今回の案件においても十分にご活躍できると考えております。\n\n▼ご提案人材情報\n氏名：林 SF（34歳・男性・中国籍）\n最寄駅：和光市駅\n日本語：日本語能力試験 N1\n稼動開始：8月〜\n経験年数：4年\n担当工程：基本設計～結合試験\nスキル：Java、TypeScript、Python、MySQL、Oracle 等\n\n何卒ご検討のほど、よろしくお願い申し上げます。\n\n祝\n\n祝雁楠 <shuku@wisdom-technology.co.jp> 于2025年7月23日周三 12:01写道：\n\n\n-- \n__________________________________________\n株式会社Wisdom Technology\n営業 祝 雁楠（シュク エンナン）\n〒110-0006  東京都台東区秋葉原5−8−4F\nTEL ：03-5829-5767 FAX ：03-5809-1069\nMOB：080 4690 3037\nE-mail：shuku@wisdom-technology.co.jp\nHomepage： http://www.wisdom-technology.co.jp/link.php',1,'2025-07-24 08:53:29.252161',1,0),(7,'1983ba2651545e2c','Re: [sales2-1] =?UTF-8?B?5omT44Gh5ZCI44KP44Gb44GU5L6d6aC844CQV1Q=?=\r\n =?UTF-8?B?56Wd44CR?=','shuku@wisdom-technology.co.jp','2025-07-24 08:52:35.000000',NULL,'山方様\n\nいつもお世話になっております。WTの祝です。\n\n日程のご調整・ご返信、誠にありがとうございます。\n7月29日（火）10:30～にて承知いたしました。\n\n差し支えなければ、下記のZoomリンクをご利用いただけますと幸いです。\n\nZoom会議情報\nURL：\nhttps://us06web.zoom.us/j/88657326669?pwd=rQp79s8lbgvbG52besSQmuA8T3OwU6.1\nミーティングID：886 5732 6669\nパスコード：167221\n\nなお、当日は弊社事業部の万も同席させていただく予定です。\n\n引き続きよろしくお願いいたします。\n\n祝\n\n山方 猛嗣（NSD） <yamagata@nsd.co.jp> 于2025年7月24日周四 13:06写道：\n\n\n-- \n__________________________________________\n株式会社Wisdom Technology\n営業 祝 雁楠（シュク エンナン）\n〒110-0006  東京都台東区秋葉原5−8−4F\nTEL ：03-5829-5767 FAX ：03-5809-1069\nMOB：080 4690 3037\nE-mail：shuku@wisdom-technology.co.jp\nHomepage： http://www.wisdom-technology.co.jp/link.php',1,'2025-07-24 09:00:03.884236',1,0),(8,'1983bd0750492bab','Re: [sales2-1] =?UTF-8?B?44CQTlNE44CR55Sj5qWtMS0y6YOoIOimgeWToQ==?=\r\n =?UTF-8?B?5o+Q5qGI5L6d6aC8MjAyNTA3MDE=?=','shuku@wisdom-technology.co.jp','2025-07-24 09:42:54.000000',NULL,'朝倉様\n\nいつも大変お世話になっております。\n株式会社Wisdom Technologyの祝でございます。\n\nエネルギー関連案件につきまして、\n現在も引き続き募集されているかどうか、\n状況をお伺いしたくご連絡差し上げました。\n\nもしまだお力になれるようでしたら、\nぜひ改めてご提案の機会をいただければ幸いです。\n\nお忙しいところ恐れ入りますが、\nご確認のほど、どうぞよろしくお願いいたします。\n\n祝\n\n祝雁楠 <shuku@wisdom-technology.co.jp> 于2025年7月17日周四 17:22写道：\n\n\n-- \n__________________________________________\n株式会社Wisdom Technology\n営業 祝 雁楠（シュク エンナン）\n〒110-0006  東京都台東区秋葉原5−8−4F\nTEL ：03-5829-5767 FAX ：03-5809-1069\nMOB：080 4690 3037\nE-mail：shuku@wisdom-technology.co.jp\nHomepage： http://www.wisdom-technology.co.jp/link.php',1,'2025-07-24 10:00:03.341281',1,0),(9,'1983bc549beb9ac7','Re: [sales2-1] =?UTF-8?B?6Z2i6KuH5pel56iL44Gu44GU55u46KuH44CQV1Q=?=\r\n =?UTF-8?B?56Wd44CR?=','shuku@wisdom-technology.co.jp','2025-07-24 09:30:42.000000',NULL,'野田様\nCC：板谷様\n\nお世話になっております。WTの祝です。\n\n板谷様、ご連絡いただきありがとうございます。\n面談の機会をいただき、誠に感謝申し上げます。\n\n面談の候補日につきまして、下記のとおりご報告いたします。\n・7月25日（金）終日（13時～14時以外）\n\n・7月28日（月）終日（13時～14時以外）\n\n上記以外の日時にも対応可能ですので、\nご都合の良い日時をご提案いただければ幸いです。\n\nどうぞよろしくお願いいたします。\n\n祝\n\nKaori Itatani <k_itatani@nsd-dxtec.co.jp> 于2025年7月24日周四 17:56写道：\n\n\n\n-- \n__________________________________________\n株式会社Wisdom Technology\n営業 祝 雁楠（シュク エンナン）\n〒110-0006  東京都台東区秋葉原5−8−4F\nTEL ：03-5829-5767 FAX ：03-5809-1069\nMOB：080 4690 3037\nE-mail：shuku@wisdom-technology.co.jp\nHomepage： http://www.wisdom-technology.co.jp/link.php',1,'2025-07-24 10:00:03.643472',1,0),(10,'1983be83f0c3db14','[sales2-1] =?UTF-8?B?OeaciOimgeWToeOBlOaPkOahiOOAkFdU56Wd44CR?=','shuku@wisdom-technology.co.jp','2025-07-24 10:08:53.000000',NULL,'菊地様\n\nいつも大変お世話になっております。\n株式会社Wisdom Technologyの祝でございます。\n\n本田案件におきましては、菊地様には長年にわたり格別のご配慮とご支援を賜り、心より御礼申し上げます。\n現場での温かいご対応のおかげで、弊社メンバーも安心して業務に取り組むことができました。誠にありがとうございます。\n\nこのたび、メンバーの最新スキルシートを添付させていただきます。\n今後、ご参画可能な案件などございましたら、ご検討いただけますと幸いです。\n\n引き続き、何卒よろしくお願い申し上げます。\n\n祝\n\n-- \n__________________________________________\n株式会社Wisdom Technology\n営業 祝 雁楠（シュク エンナン）\n〒110-0006  東京都台東区秋葉原5−8−4F\nTEL ：03-5829-5767 FAX ：03-5809-1069\nMOB：080 4690 3037\nE-mail：shuku@wisdom-technology.co.jp\nHomepage： http://www.wisdom-technology.co.jp/link.php',1,'2025-07-24 10:30:03.265659',1,0),(11,'1983c0dadff58571','Re: [sales2-1] =?UTF-8?B?44CQTlNE44CR55Sj5qWtMS0y6YOoIOimgeWToQ==?=\r\n =?UTF-8?B?5o+Q5qGI5L6d6aC8MjAyNTA3MDE=?=','asakura-takeshi@nsd.co.jp','2025-07-24 10:49:46.000000',NULL,'祝様\n\nいつもお世話になっております。NSD 朝倉です。\n\n申しわけございません、面談日時を誤っておりました。\n\n 　7/25（金）17:00～\n 　7/29（火）18:00～\n\nでお願いできればと思います。\n\nよろしくお願いいたします。\n\n----- Original Message -----\n\n',1,'2025-07-24 11:00:03.546264',1,0),(12,'1983c0657ff1f31e','Re: [sales2-1] =?UTF-8?B?44CQTlNE44CR55Sj5qWtMS0y6YOoIOimgeWToQ==?=\r\n =?UTF-8?B?5o+Q5qGI5L6d6aC8MjAyNTA3MDE=?=','asakura-takeshi@nsd.co.jp','2025-07-24 10:41:45.000000',NULL,'祝様\n\nいつもお世話になっております。NSD 朝倉です。\n\nご連絡できておらず申しわけございません。\n\nエネルギー関連案件の案件2については引き続き要員を\n探しております。H.Oについても面談させていただけれ\nばと思います。\n\n面談の日時ですが、\n　7/25（金）17:00～\n　7/28（月）18:00～\nでいかがでしょうか（他社様とも面談の調整を実施して\nいる最中ですので、予定が重複した場合は再調整させて\nいただければと思います）。\n\nよろしくお願いいたします。\n\n----- Original Message -----\n\n',1,'2025-07-24 11:00:03.803843',1,0),(13,'1983c29216771c47','Re: [sales2-1] =?UTF-8?B?OeaciOimgeWToeOBlOaPkOahiOOAkFdU56Wd44CR?=','t-kikuchi@nsd.co.jp','2025-07-24 11:19:45.000000',NULL,'\n祝様\nいつもお世話になっております。NSD菊地です。\nこちらこそ長年ご支援いただいた中、案件縮小となってしまい申し訳ありません。\n万さん達のご提案いただきありがとうございます。検討させていただきます。\n本案件について営業担当が変わる可能性があり、CCに前田(寳達部課長)、吉川(寳達部Grm)を追加させていただきます。\n両名とも連携して検討させていただきます。よろしくお願いいたします。\n\n----- Original Message -----\n\nFrom: 祝雁楠 <shuku@wisdom-technology.co.jp>\nTo: 菊地 壮 <t-kikuchi@nsd.co.jp>\nCc: 张倩铭 <zhang.qianming@wisdom-technology.co.jp>,oomoto.chikashi@wisdom-technology.co.jp,sales2-1 <sales2-1@list.wisdom-technology.co.jp>\n\"wan.ning@wisdom-technology.co.jp:\" <wan.ning@wisdom-technology.co.jp>\nDate: 2025-07-24 19:08:53\nSubject: 9月要員ご提案【WT祝】\n\n菊地様\n\nいつも大変お世話になっております。\n\n株式会社Wisdom Technologyの祝でございます。\n\n本田案件におきましては、菊地様には長年にわたり格別のご配慮とご支援を賜り、心より御礼申し上げます。\n\n現場での温かいご対応のおかげで、弊社メンバーも安心して業務に取り組むことができました。誠にありがとうございます。\n\nこのたび、メンバーの最新スキルシートを添付させていただきます。\n\n今後、ご参画可能な案件などございましたら、ご検討いただけますと幸いです。\n\n引き続き、何卒よろしくお願い申し上げます。\n\n祝\n\n-- \n__________________________________________株式会社Wisdom Technology\n営業　　祝　雁楠（シュク　エンナン）〒110-0006  東京都台東区秋葉原5−8−4F 　\nTEL ：03-5829-5767　FAX　：03-5809-1069MOB：080 4690 3037E-mail：shuku@wisdom-technology.co.jpHomepage： http://www.wisdom-technology.co.jp/link.php [wisdom-technology.co.jp]\n\n\n',1,'2025-07-24 11:30:03.619743',1,0),(14,'1983e32263de4c83','[sales] =?UTF-8?B?77yIRURJ77yJ44CQ5om/6KqN5a6M5LqG6YCa55+l44CR?=\r\n =?UTF-8?B?IDIwMjXlubQwOOaciOWIhiDms6jmlofmm7jjg7vms6jmlofoq4vmm7gg5om/?=\r\n =?UTF-8?B?6KqN5a6M5LqG44Gu44GK55+l44KJ44Gb?=','no-reply@wisdom-technology.co.jp','2025-07-24 20:48:51.000000',NULL,'株式会社GoodWorld 様より、\n2025年08月分の注文書および注文請書が承認されました。\n注文番号：ODR25080058\n\n\n詳細は以下のリンクよりご確認いただけます。\nhttps://sales.wisdom-technology.co.jp/partner/companies/171/members/908/orders/6440/',1,'2025-07-24 21:00:02.808693',1,0),(15,'1983f3d6d8f08a16','[sales] =?UTF-8?B?77yIRURJ77yJ44CQ5om/6KqN5a6M5LqG6YCa55+l44CR?=\r\n =?UTF-8?B?IDIwMjXlubQwOOaciOWIhiDms6jmlofmm7jjg7vms6jmlofoq4vmm7gg5om/?=\r\n =?UTF-8?B?6KqN5a6M5LqG44Gu44GK55+l44KJ44Gb?=','no-reply@wisdom-technology.co.jp','2025-07-25 01:40:47.000000',NULL,'株式会社Oneplus-Tech 様より、\n2025年08月分の注文書および注文請書が承認されました。\n注文番号：ODR25080043\n\n\n詳細は以下のリンクよりご確認いただけます。\nhttps://sales.wisdom-technology.co.jp/partner/companies/122/members/811/orders/6425/',1,'2025-07-25 02:00:03.280216',1,0),(16,'1983f3c3cd876cbe','[sales] =?UTF-8?B?77yIRURJ77yJ44CQV1TjgJHjgJDph43opoHjgJEgMjAy?=\r\n =?UTF-8?B?NeW5tDA45pyIMTXml6Xnt6DliIcgMjAyNeW5tDA45pyI5YiG5rOo5paH5pu4?=\r\n =?UTF-8?B?44O75rOo5paH6KuL5pu444GU6YWN5L+h44Gu5Lu2?=','no-reply@wisdom-technology.co.jp','2025-07-25 01:39:29.000000',NULL,'レバテック株式会社 御中\n\n平素よりお世話になっております。\n株式会社Wisdom Technologyでございます。\n\n2025年08月分の注文書が\nEDIサイトへ公開されておりますのでご確認ください。\nhttps://edi.wisdom-technology.co.jp/order/orders/6419/preview\n\nご不明な点やご質問がございましたら、お気軽にお問い合わせください。\nどうぞよろしくお願い申し上げます。\n\n敬具',1,'2025-07-25 02:00:03.500198',1,0),(17,'1983f3788a41279e','Re: [sales2-1] =?UTF-8?B?6Z2i6KuH5pel56iL44Gu44GU55u46KuH44CQV1Q=?=\r\n =?UTF-8?B?56Wd44CR?=','shuku@wisdom-technology.co.jp','2025-07-25 01:34:21.000000',NULL,'板谷様\n野田様\n\nいつも大変お世話になっております。Wisdom Technologyの祝です。\n\nこのたびは日程のご調整、誠にありがとうございます。\n7月25日（金）15時よりのご面談、承知いたしました。\n\n差し支えなければ、以下のZoomリンクをご利用いただけますと幸いです。\n\nZoom会議情報\nhttps://us06web.zoom.us/j/85674925020?pwd=55CsR5w7Z2QVqxWvaEOUDNSKZ7pcgg.1\nミーティングID：856 7492 5020\nパスコード：123\n\n何卒よろしくお願いいたします。\n\n祝\n\nKaori Itatani <k_itatani@nsd-dxtec.co.jp> 于2025年7月25日周五 09:24写道：\n\n\n-- \n__________________________________________\n株式会社Wisdom Technology\n営業 祝 雁楠（シュク エンナン）\n〒110-0006  東京都台東区秋葉原5−8−4F\nTEL ：03-5829-5767 FAX ：03-5809-1069\nMOB：080 4690 3037\nE-mail：shuku@wisdom-technology.co.jp\nHomepage： http://www.wisdom-technology.co.jp/link.php',1,'2025-07-25 02:00:04.255424',1,0),(18,'1983f4e3885a1fea','[sales] =?UTF-8?B?77yIRURJ77yJ44CQ5om/6KqN5a6M5LqG6YCa55+l44CR?=\r\n =?UTF-8?B?IDIwMjXlubQwOOaciOWIhiDms6jmlofmm7jjg7vms6jmlofoq4vmm7gg5om/?=\r\n =?UTF-8?B?6KqN5a6M5LqG44Gu44GK55+l44KJ44Gb?=','no-reply@wisdom-technology.co.jp','2025-07-25 01:59:08.000000',NULL,'株式会社Tentech 様より、\n2025年08月分の注文書および注文請書が承認されました。\n注文番号：ODR25080061\n\n\n詳細は以下のリンクよりご確認いただけます。\nhttps://sales.wisdom-technology.co.jp/partner/companies/188/members/1090/orders/6443/',1,'2025-07-25 02:30:06.594793',1,0),(19,'1983f4a46a4c0876','[sales] =?UTF-8?B?77yIRURJ77yJ44CQ5om/6KqN5a6M5LqG6YCa55+l44CR?=\r\n =?UTF-8?B?IDIwMjXlubQwOOaciOWIhiDms6jmlofmm7jjg7vms6jmlofoq4vmm7gg5om/?=\r\n =?UTF-8?B?6KqN5a6M5LqG44Gu44GK55+l44KJ44Gb?=','no-reply@wisdom-technology.co.jp','2025-07-25 01:54:49.000000',NULL,'株式会社GSD 様より、\n2025年08月分の注文書および注文請書が承認されました。\n注文番号：ODR25080049\n\n\n詳細は以下のリンクよりご確認いただけます。\nhttps://sales.wisdom-technology.co.jp/partner/companies/143/members/900/orders/6431/',1,'2025-07-25 02:30:06.830323',1,0);
/*!40000 ALTER TABLE `gmail_reader_importedmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_customer`
--

DROP TABLE IF EXISTS `projects_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_customer`
--

LOCK TABLES `projects_customer` WRITE;
/*!40000 ALTER TABLE `projects_customer` DISABLE KEYS */;
INSERT INTO `projects_customer` VALUES (3,'DTS'),(4,'NHS'),(1,'NSD'),(5,'Q\'sfix'),(2,'WT');
/*!40000 ALTER TABLE `projects_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_project`
--

DROP TABLE IF EXISTS `projects_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `detail` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `customer_person` varchar(100) DEFAULT NULL,
  `customer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_project_customer_id_731c79d1_fk_projects_customer_id` (`customer_id`),
  CONSTRAINT `projects_project_customer_id_731c79d1_fk_projects_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `projects_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_project`
--

LOCK TABLES `projects_project` WRITE;
/*!40000 ALTER TABLE `projects_project` DISABLE KEYS */;
INSERT INTO `projects_project` VALUES (1,'■案件概要\r\n【対象顧客】\r\n 食品系（物流倉庫）システムベンダー\r\n【案件名】\r\n 基幹（WMS）システム保守\r\n【案件概要】\r\n 基幹（WMS）システムの保守作業\r\n【作業内容】\r\n EDI業務の機能追加、修正など\r\n Webアプリケーションの画面開発など\r\n 問合せ対応など\r\n【作業期間】\r\n 2025/9～ 長期\r\n【開発言語】\r\n EDI：Pro*C\r\n 画面：Java、JSP、JavaScript\r\n バッチ：SHELL、/PL/SQL\r\n DB：Oracle\r\n【必須要件】\r\n ・Pro*CもしくはC言語、C++言語の開発経験が3年以上ある方\r\n ・コミュニケーション能力があり、報連相ができる方\r\n ・独力（自走）で開発できる方\r\n ・適応力、調査力がある方（手順書、規約、現行プログラムなどを見て現行の仕組みを理解できる方）\r\n ・複雑なSQLを組んだ経験がある方\r\n ・長期参画可能な方\r\n【任意要件】\r\n ・物流業務の知識がある方\r\n ・バッチジョブの開発経験がある方\r\n ・PL/SQLの開発経験がある方\r\n ・Java及びJSPのWebアプリ開発経験がある方\r\n【契約形態】\r\n 派遣or準委任\r\n【作業場所】\r\n 築地（最初は原則出社、作業状況によりテレワークあり）\r\n【募集人数】\r\n 1名','open','本山様',1),(2,'■ 業務内容\r\nオフショア開発を前提としたプロジェクトにおける、以下対応：\r\n　・要件検討\r\n　・設計レビュー\r\n　・受入テスト\r\n　・導入支援\r\n※詳細は業務説明会にてご説明いたします。\r\n■ 必須スキル\r\n要件検討～設計・製造・テストまで、一人称で対応できる方\r\n自発的に動けるコミュニケーション力・業務理解力\r\n■ 環境・技術スタック\r\nメイン：Spring（Java）、PostgreSQL、Linux\r\n保守対応あり：VB.net、Java（楽々Framework）、Oracle（ストアドプロシージャ）\r\n■ 勤務期間\r\n2025年8月／9月～ 長期予定\r\n■ 募集人数\r\n1名\r\n■ 作業場所\r\n名古屋駅周辺＋テレワーク（目安：出社50％／在宅50％）','open','白川様',1),(3,'■案件：物流業界のシステム運用\r\n▼概要\r\n物流関連の複数システムにおけるWeb画面およびバッチ処理の運用業務\r\n▼作業内容\r\n設計書をもとにシステム構成・仕様の把握\r\n運用作業（ユーザ問い合わせ対応、データパッチ対応、障害対応、原因調査）\r\n▼工程\r\n運用（初期フェーズは設計書確認・システム理解）\r\n▼勤務地\r\n晴海トリトンスクエア（一部テレワーク併用）\r\n▼必須スキル\r\nJavaによる開発・運用経験8年以上\r\n▼尚可スキル\r\nReact経験\r\nAWSの知見・経験\r\n▼条件等\r\n募集時期：8月～\r\n期間：長期予定\r\n募集人数：1名\r\n国籍要件：日本国籍限定','closed','竹岡様',1),(4,'概要　：④ドラッグストア販売管理基幹システム保守・開発\r\n　工程　：保守および改修開発\r\n　期間　：2025/8/1～\r\n　場所　：大宮\r\n　人数　：１名\r\n　スキル：Cashe(マイナーな言語なので、着任時に課題実施で習得)\r\n bat、java、VBA、HTML、curl、PostgreSQL等\r\n コミュニケーション能力\r\n ⇒業務の方と話す機会が多い\r\n (進捗報告、業務からの問い合わせに対する会話)\r\n あれば小売りに関する知識\r\n　その他：お客様の許可を得るまではオンサイト対応\r\n お客様許可後も最低週２回は大宮オンサイト対応となります。','open','竹内様',1),(5,'案件 ：2.エネルギー関連　脱ホスト対応（共通化設計）\r\n概要 ：富士通HOSTの保守切れに伴い、以下基幹システムをJavaで再構築する。\r\n 店舗からの集信データを取り込み、売上・請求データを作成し、\r\n 取引先に配信する。\r\n工程 ：基本設計（共通化設計）\r\n勤務地　：神谷町（出社とリモート併用）\r\nスキル　：基本設計工程および共通処理の設計、バッチ処理、SQLの経験\r\n Java\r\n ※Cobol、JP1、HULFT、AWSの知識があればなお良いです\r\n募集 ：2025年8月～2025年10月 2名\r\n ※現状は基本設計工程のみですが、詳細設計以降の見積によっては\r\n 詳細設計以降も継続の可能性があります。\r\n備考 ：・上記案件に参画している他社パートナー会社（業務共通チーム）\r\n の方と一緒に作業していただくことになります。\r\n担当 ：長谷川　智洋（hasegawa-t@nsd.co.jp）','closed','朝倉様',1),(6,'某金融系OAシステムのリプレース案件（本番環境設計構築対応）\r\n【作業概要】\r\n　VMwareで仮想化しているオンプレ環境のOAシステムをAzure上に新たに構築を行う。\r\n　サーバ台数は試験環境約50台、本番環境約70台。\r\n　下記のOS、各プロダクトの要件定義、設計、構築、試験、移行を行う。\r\n　詳細設計、構築、単体/結合試験は基本的に別チームにて対応するため、\r\n　そこに至る要件定義、基本設計、情報連携、調整、管理、検討などを行い、\r\n　その後、総合試験、移行対応を行う。\r\n　○サーバ系\r\n ・OS（Win2022/Win11/REL9.5）\r\n ・JP1監視、Azure監視\r\n ・Backup（Azure）＋端末Backup\r\n ・運用端末（HW)\r\n ・ログ管理（Logstorage＋Logana＋syslog）\r\n ・CACHATTO、MetaDiffender\r\n【必要スキル】\r\n　・OS（Win2022/REL9.5）の詳細設計以降のご経験\r\n　・Azureの構築経験や操作可能\r\n　・職場ルールを守れる方\r\n　・勤怠が良好な方\r\n　・コミュニケーションが良好な方\r\n　・基本設計書の作成/修正の経験\r\n　・長期(1、2年)での対応が可能な方\r\n　・新しい製品でも積極的に携われる方\r\n　○サーバ系\r\n ・Windows Server(2016以降)、Red Hat Enterprise(8.X以降)の基本的な知識、\r\n 詳細設計、構築経験\r\n Azureの基本的なサービスを使用した設計、構築\r\n      　サーバ系：（Winodows VM、Linux VM、Managed Disks\r\n DDoS Protection、Key Vault、Load Balancer\r\n Net Work Security Group、Route Server、ExpressRoute\r\n Private Link、Virtual Network、NAT Gateway\r\n VPN Gateway、NetApp Files、Backup\r\n Functions、Blob Starge、Microsoft Defender for Cloud\r\n パブリック IP アドレス、ルートテーブル、、Application Gateway）\r\n 監視系：（Log Analytics、Event Hubs、Service Bus\r\n Network Watcher、Moniter、Application Insight\r\n Microsoft Sentinel）','open','田尻様',1),(7,'案件　：経理関連のWEBシステム既存改修案件のPMO募集\r\n 概要　：現在進行中の改修案件について顧客側のPL補佐として開発を推進する\r\n 人数　：1名\r\n 期間　：2025年7月～2026年2月頃（7月途中なる早の参画希望）\r\n 工程　：製造～総合テスト\r\n スキル：WEB系業務システムの開発経験\r\n 　　　　50人月超のPMO経験　※品質管理経験があると尚良し\r\n 要員像：顧客及び各チーム間の調整を行い品質報告などの書類作成ができる方\r\n 場所　：勝どき（晴海）※基本テレワーク\r\n その他：・2次先要員の場合は現行PJ内に正社員の在籍が必須\r\n 　　　　・日本国籍であること\r\n 　　　　・顧客との直接やりとりが発生します\r\n 　　　　・並行募集中\r\n 面談　：弊社面談のみ','closed','前田様',1),(8,'案件　：案件管理システムに対する保守開発\r\n概要　：既存案件管理システム(Web)に対する保守開発対応を行う\r\n人数　：1名\r\n期間　：2025年8月～ 長期契約可能\r\n工程　：小～中規模の機能改善開発(要望ヒアリング/設計/製造/テスト)/障害対応/調査\r\nスキル：1人称で能動的に作業できる方\r\n        C# / .netでのWebシステム開発経験者\r\n要員像：年次8年以上の開発経験者\r\n場所　：基本テレワーク(出社時は神谷町)　※現在週１で出社\r\n面談　：顧客面談あり\r\nその他：外国籍不可\r\n        保守業務の上での開発になるので調査作業なども多く発生します\r\n \r\n \r\n－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－\r\n[案件②]案件管理システム/決済管理システムの運用保守対応\r\n－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－\r\n案件　：案件管理システム/決済管理システムに対する運用保守\r\n概要　：既存案件管理システム/決済管理システムに対する運用保守対応を行う\r\n人数　：1名\r\n期間　：2025年8月～　長期契約可能\r\n工程　：問い合わせ対応・不具合調査・定常定型作業・データパッチ・リリース作業など\r\nスキル：能動的に作業できる方(周囲の人に聞きまわったり、資料から解を導き出せる方)\r\n SQL経験者(不具合調査やデータパッチでSQLを使用)\r\n        システムの運用保守経験者(インフラ系の保守ではなくシステム保守)\r\n        WEBシステム開発経験者(不具合調査の一次解析時に開発経験があった方がよい為)\r\n場所　：基本御茶ノ水出社(週一で顧客先(神谷町)出社)\r\n面談　：顧客面談あり\r\nその他：外国籍不可','open','馬場様',1),(9,'案件　：システム環境移行に伴うI/F機能開発\r\n 概要　：某自動車メーカー様の「SWallowシステム」において、\r\n  現行からの環境移行作業と他システムとのI/F機能開発を\r\n  行う。\r\n 人数　：１～３名\r\n 期間　：９月～１２月　※終了後、保守体制に合流あり\r\n 工程　：外部設計（UI）～システムテスト（ST）\r\n スキル：PHP（フレームワーク利用無し）\r\n 要員像：顧客有識者指示のもと作業を推進・実施が可能な方\r\n 場所　：御茶ノ水作業（端末受取時に顧客先(宇都宮)に出社）※\r\n その他：こちらの案件は弊社社員がリーダーとして1.0人月参画\r\n 面談　：弊社および顧客様面談あり\r\n 担当者：菊地　080-6851-1762　<t-kikuchi@nsd.co.jp>\r\n\r\n ※期間（8月開始⇒9月開始）、作業場所に変更がございます。\r\n 再度確認いただきご連絡いただけますと幸いです。','open','菊地様',1),(10,'案件　：生産管理システムの開発\r\n 概要　：顧客がSAPを導入するにあたり、現状の生産管理システムをベースに\r\n  製造業務に特化した新システムをSAPの周辺システムとして構築します。\r\n  （流用新規で構築します）\r\n  主な機能：受注・検収・製造計画・製造/配膳指示\r\n 人数　：１～３名\r\n 期間　：８月～：１名\r\n  ９月～：２～３名\r\n  ※9月以降に3～4名の体制となるため、体制での提案希望\r\n 工程　：詳細設計～受入・ユーザテスト\r\n 使用言語：Java、PL/SQL、VBA\r\n 使用フレームワーク、ミドルウェア：\r\n  楽々FrameworkⅡ\r\n  Oracle\r\n  JP1\r\n  SVF\r\n 要員像：８月：先行参画者として9月以降に参画するメンバーへの指導ができる。\r\n 主体的に積極的な姿勢がある方。\r\n  ９月：8月参画者の指導のもと、詳細設計以降の工程ができる方。\r\n 場所　：御茶ノ水作業\r\n  ※8月参画者は1週間ほどの弊社大阪拠点への出張をお願いする可能性がご\r\nざいます。\r\n 出張にかかる費用は弊社持ち。\r\n 大阪拠点との共同案件になっており、有識者のいる大阪での勉強期間を\r\n設ける予定です。\r\n その他：こちらの案件は弊社社員がリーダーとして1.0人月参画\r\n 面談　：弊社面談あり\r\n 担当者：菊地　080-6851-1762　<t-kikuchi@nsd.co.jp>','open','菊地様',1),(11,'【案件名】：大手企業向けグループウェア開発\n【期間】：2025年9月（単月）※10月以降延長の可能性あり\n【作業場所】：赤坂見附 or 自宅（ハイブリッド／現状ほぼフルテレワーク）\n【作業内容】：\n・既存NotesアプリをPowerApps＋PowerAutomateへ移植\n・移植に際し、既存機能の改善も含めた開発対応\n\n【必須スキル】：\n・PowerAppsの使用または開発経験（複数年）\n・設計書・マニュアル等のドキュメント作成スキル\n\n【単金】：Max65万円（スキル見合いにより応相談）\n【面談】：1回予定\n【外国籍】：不可\n【商流制限】：貴社まで','open',NULL,2);
/*!40000 ALTER TABLE `projects_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-25  3:00:02
