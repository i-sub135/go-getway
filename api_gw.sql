CREATE DATABASE  IF NOT EXISTS `api_gw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `api_gw`;
-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: api_gw
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu0.19.10.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_admin`
--

DROP TABLE IF EXISTS `api_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1. superadmin 2. admin 3. developer',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 active',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_admin`
--

LOCK TABLES `api_admin` WRITE;
/*!40000 ALTER TABLE `api_admin` DISABLE KEYS */;
INSERT INTO `api_admin` VALUES (1,'Ibnu Maksum','$2y$10$hXkSbly/Tp9046gAQM0XjezMswGgBpWhx7sBfx42MzDPe78z8keDO','me@ibnux.net',1,1,'2020-03-05 15:30:43');
/*!40000 ALTER TABLE `api_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_auth`
--

DROP TABLE IF EXISTS `api_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jwt_secret` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expired` int NOT NULL DEFAULT '24' COMMENT 'hours',
  `header` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'x-auth',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_auth`
--

LOCK TABLES `api_auth` WRITE;
/*!40000 ALTER TABLE `api_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_db`
--

DROP TABLE IF EXISTS `api_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_db` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `db_type` enum('mysql','mssql','oracle','pgsql') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `db_host` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `db_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `db_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `db_pass` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `environment` enum('development','staging','production') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_db`
--

LOCK TABLES `api_db` WRITE;
/*!40000 ALTER TABLE `api_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_groups`
--

DROP TABLE IF EXISTS `api_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_groups`
--

LOCK TABLES `api_groups` WRITE;
/*!40000 ALTER TABLE `api_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_logs`
--

DROP TABLE IF EXISTS `api_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(25) DEFAULT NULL,
  `id_api` int NOT NULL,
  `elapse` float DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_logs`
--

LOCK TABLES `api_logs` WRITE;
/*!40000 ALTER TABLE `api_logs` DISABLE KEYS */;
INSERT INTO `api_logs` VALUES (1,'[::1]:38162',1,471,NULL,'2020-03-16 18:33:43'),(2,'[::1]:38162',1,51,NULL,'2020-03-16 18:33:57'),(3,'[::1]:38612',1,71,NULL,'2020-03-16 18:34:35'),(4,'[::1]:38612',1,62,NULL,'2020-03-16 18:34:44'),(5,'[::1]:38612',1,60,NULL,'2020-03-16 18:35:11'),(6,'[::1]:39302',1,86.3956,NULL,'2020-03-16 18:35:59'),(7,'[::1]:40460',1,101.621,NULL,'2020-03-16 18:38:19'),(8,'[::1]:40460',1,52.1036,NULL,'2020-03-16 18:38:21'),(9,'[::1]:40460',1,55.0788,NULL,'2020-03-16 18:38:22'),(10,'[::1]:40460',1,51.2165,NULL,'2020-03-16 18:38:23'),(11,'[::1]:40460',1,52.0615,NULL,'2020-03-16 18:39:20'),(12,'[::1]:40460',1,59.2016,NULL,'2020-03-16 18:39:30'),(13,'[::1]:41474',1,155.151,NULL,'2020-03-16 18:40:21'),(14,'[::1]:45522',1,281.861,NULL,'2020-03-16 18:48:14'),(15,'[::1]:45522',1,49.5579,NULL,'2020-03-16 18:48:15'),(16,'[::1]:45522',1,51.8369,NULL,'2020-03-16 18:48:16'),(17,'[::1]:45522',1,58.197,NULL,'2020-03-16 18:48:17'),(18,'[::1]:45522',1,56.5703,NULL,'2020-03-16 18:48:18'),(19,'[::1]:45522',1,55.4776,NULL,'2020-03-16 18:48:19'),(20,'[::1]:45522',1,62.5859,NULL,'2020-03-16 18:48:20'),(21,'[::1]:45522',1,54.6519,NULL,'2020-03-16 18:48:21'),(22,'[::1]:45522',1,43.3405,NULL,'2020-03-16 18:48:22'),(23,'[::1]:45522',1,51.7669,NULL,'2020-03-16 18:48:23'),(24,'[::1]:45522',1,80.7073,NULL,'2020-03-16 18:50:06'),(25,'[::1]:47754',1,85.3483,NULL,'2020-03-16 18:52:45'),(26,'[::1]:47754',1,40.8786,NULL,'2020-03-16 18:52:47'),(27,'[::1]:47754',1,43.7875,NULL,'2020-03-16 18:53:37'),(28,'[::1]:47754',1,48.0845,NULL,'2020-03-16 18:53:49'),(29,'[::1]:49256',2,1112,NULL,'2020-03-17 09:37:46'),(30,'[::1]:47898',2,120091,NULL,'2020-03-17 09:39:09'),(31,'[::1]:51092',2,222.851,NULL,'2020-03-17 09:41:19'),(32,'[::1]:51092',2,719.212,NULL,'2020-03-17 09:42:15'),(33,'[::1]:51882',2,231.547,NULL,'2020-03-17 09:42:55'),(34,'[::1]:52094',2,132.268,NULL,'2020-03-17 09:43:20'),(35,'[::1]:52342',2,251.109,NULL,'2020-03-17 09:43:49'),(36,'[::1]:52342',2,1237.96,NULL,'2020-03-17 09:44:19'),(37,'[::1]:53634',2,559.408,NULL,'2020-03-17 09:46:18'),(38,'[::1]:53634',1,150.272,NULL,'2020-03-17 09:46:36'),(39,'[::1]:53634',2,532.627,NULL,'2020-03-17 09:46:54'),(40,'[::1]:55374',2,1710.01,NULL,'2020-03-17 09:49:52'),(41,'[::1]:56870',2,489.005,'201 CREATED','2020-03-17 09:52:53'),(42,'[::1]:56870',1,148.164,'200 OK','2020-03-17 09:53:57'),(43,'[::1]:56870',2,120116,'401 UNAUTHORIZED','2020-03-17 09:56:26'),(44,'[::1]:57930',2,120263,'401 UNAUTHORIZED','2020-03-17 09:57:03'),(45,'[::1]:33192',2,120377,'401 UNAUTHORIZED','2020-03-17 10:04:14'),(46,'[::1]:37226',2,1276.19,'201 CREATED','2020-03-17 10:10:34'),(47,'[::1]:37226',2,97.6002,'401 UNAUTHORIZED','2020-03-17 10:10:42'),(48,'[::1]:37226',2,542.172,'201 CREATED','2020-03-17 10:10:53'),(49,'[::1]:36962',2,120179,'401 UNAUTHORIZED','2020-03-17 10:12:01'),(50,'[::1]:37226',2,234.261,'401 UNAUTHORIZED','2020-03-17 10:12:52'),(51,'[::1]:37226',2,241.972,'401 UNAUTHORIZED','2020-03-17 10:20:28'),(52,'[::1]:37226',2,1005.89,'201 CREATED','2020-03-17 10:20:36'),(53,'[::1]:33812',2,968.125,'201 CREATED','2020-03-17 11:01:15');
/*!40000 ALTER TABLE `api_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_routes`
--

DROP TABLE IF EXISTS `api_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_routes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL DEFAULT '1',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `environment` enum('development','staging','production') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `version` tinyint NOT NULL,
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'uncategory' COMMENT 'send',
  `function` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sms',
  `methods` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'GET,POST,PUT,DELETE,PATCH' COMMENT 'GET,POST,PUT,DELETE,PATCH',
  `route_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '''http'',''sql'',''php'',''plain'',''echo''',
  `content_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'application/json' COMMENT 'application/json',
  `db_id` int NOT NULL DEFAULT '0',
  `auth_id` int NOT NULL DEFAULT '0',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `retry` int NOT NULL DEFAULT '3',
  `retry_delay` int NOT NULL DEFAULT '30',
  `timeout` int NOT NULL DEFAULT '30',
  `enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 enabled',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `path` (`function`),
  KEY `category` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_routes`
--

LOCK TABLES `api_routes` WRITE;
/*!40000 ALTER TABLE `api_routes` DISABLE KEYS */;
INSERT INTO `api_routes` VALUES (1,1,'mockbin','<br>','development',1,'user','','GET','http','application/json',0,0,'http://ved.carsworld.id:7010',3,3,5,1,'2020-03-13 15:05:40','2020-03-13 15:05:40'),(2,1,'mockbin','<br>','development',1,'pesan','','POST','http','application/json',0,0,'http://ved.carsworld.id:2030',3,3,5,1,'2020-03-13 15:05:40','2020-03-13 15:05:40');
/*!40000 ALTER TABLE `api_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_stats`
--

DROP TABLE IF EXISTS `api_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_stats` (
  `date` date NOT NULL,
  `route_id` int NOT NULL,
  `0` int NOT NULL DEFAULT '0',
  `1` int NOT NULL DEFAULT '0',
  `2` int NOT NULL DEFAULT '0',
  `3` int NOT NULL DEFAULT '0',
  `4` int NOT NULL DEFAULT '0',
  `5` int NOT NULL DEFAULT '0',
  `6` int NOT NULL DEFAULT '0',
  `7` int NOT NULL DEFAULT '0',
  `8` int NOT NULL DEFAULT '0',
  `9` int NOT NULL DEFAULT '0',
  `10` int NOT NULL DEFAULT '0',
  `11` int NOT NULL DEFAULT '0',
  `12` int NOT NULL DEFAULT '0',
  `13` int NOT NULL DEFAULT '0',
  `14` int NOT NULL DEFAULT '0',
  `15` int NOT NULL DEFAULT '0',
  `16` int NOT NULL DEFAULT '0',
  `17` int NOT NULL DEFAULT '0',
  `18` int NOT NULL DEFAULT '0',
  `19` int NOT NULL DEFAULT '0',
  `20` int NOT NULL DEFAULT '0',
  `21` int NOT NULL DEFAULT '0',
  `22` int NOT NULL DEFAULT '0',
  `23` int NOT NULL DEFAULT '0',
  `sum` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`,`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_stats`
--

LOCK TABLES `api_stats` WRITE;
/*!40000 ALTER TABLE `api_stats` DISABLE KEYS */;
INSERT INTO `api_stats` VALUES ('2020-03-13',1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `api_stats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-17 11:15:04
