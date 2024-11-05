-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: game
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `imageUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gameFileUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trailerUrl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `screenshotsUrl` mediumtext COLLATE utf8mb4_unicode_ci,
  `isDeleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (18,'gtav','444',444.00,'/images/1729171799851-image.png','2024-10-17 13:30:00','/games/1729171799762-Windows11InstallationAssistant.exe','/video/1729171799862-videoplayback.mp4','[\"/images/1729171800067-favicon.png\",\"/images/1729171800069-image.png\",\"/images/1729171800076-JljgOhSy-wallha.com.jpg\",\"/images/1729171800087-943a8682-e703-42b3-9a16-71375cc9fa1b.jpg\"]',1),(19,'gta6 ','444',444.00,'/images/1729171850391-JljgOhSy-wallha.com.jpg','2024-10-17 13:30:50','/games/1729171850304-Windows11InstallationAssistant.exe','/video/1729171850403-videoplayback.mp4','[\"/images/1729171850481-favicon.png\",\"/images/1729171850482-image.png\",\"/images/1729171850486-JljgOhSy-wallha.com.jpg\",\"/images/1729171850498-943a8682-e703-42b3-9a16-71375cc9fa1b.jpg\"]',1),(20,'333','33',333.00,'/images/1729171860020-favicon.png','2024-10-17 13:31:00','/games/1729171859912-Windows11InstallationAssistant.exe','/video/1729171860023-videoplayback.mp4','[\"/images/1729171860096-favicon.png\",\"/images/1729171860097-image.png\",\"/images/1729171860103-JljgOhSy-wallha.com.jpg\",\"/images/1729171860119-943a8682-e703-42b3-9a16-71375cc9fa1b.jpg\"]',1),(21,'444','444',444.00,'/images/1729173277867-image.png','2024-10-17 13:54:38','/games/1729173277770-Windows11InstallationAssistant.exe','/video/1729173277879-videoplayback.mp4','[\"/images/1729173278016-JljgOhSy-wallha.com.jpg\"]',0),(22,'33','44',444.00,'/images/1729173363553-image.png','2024-10-17 13:56:03','/games/1729173363456-Windows11InstallationAssistant.exe','/video/1729173363556-videoplayback.mp4','[\"/images/1729173363634-favicon.png\",\"/images/1729173363635-image.png\",\"/images/1729173363639-JljgOhSy-wallha.com.jpg\"]',1),(23,'44','44',44.00,'/images/1729956595222-1.png','2024-10-26 15:29:55','/games/1729956595204-ChatGPT (Early Version for Plus, Team, Enterprise, and Edu) Installer.exe','','[\"/images/1729956595223-instagram.png\"]',0);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchased_games`
--

DROP TABLE IF EXISTS `purchased_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchased_games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `purchase_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `purchased_games_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `purchased_games_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchased_games`
--

LOCK TABLES `purchased_games` WRITE;
/*!40000 ALTER TABLE `purchased_games` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchased_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `game_id` int(11) DEFAULT NULL,
  `game_name` varchar(255) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  PRIMARY KEY (`purchase_id`),
  KEY `user_id` (`user_id`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (11,20,21,'444','2024-10-17 13:55:17'),(12,21,23,'44','2024-10-26 15:36:49');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user',
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'admin','admin@example.com','1234567890','DefaultCountry','male','$2a$10$EhfZk4Uf9R1FG/eKEXF1oeiydXsz/kZZgwpdg4Mv3Tixa2ekv1Kl2','admin',NULL),(15,'Vasyakgkg','Vasyakgkg@gmail.com','+99655454545','KG','male','$2a$10$B7mlSnxg7gGhzIziNZCUKuhul8HqoLHQu3IyrIdNvj6j77s7ZYXje','user','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsImlhdCI6MTcyODc0Nzg0MywiZXhwIjo0NzI2NzE5ODQzfQ.HUd630mVZb4WVF2jWMphn_3_VH6G8sr2iKCK4KWGo6A'),(16,'Vasya555','Vasya555@gmail.com','+9965055556','KG','male','$2a$10$SWPzczlGmuUgBwXD/iDh5eFKj2FJdEypM3nT/6YqvmU213VTgjyA.','user','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTYsImlhdCI6MTcyODc5OTk0NiwiZXhwIjo0NzI2NzcxOTQ2fQ.jjilrzg2y1P5P_F7GcWxEtLyQPrGZIlnyh9XpNgwNfc'),(17,'Vasyaru','Vasyaru@gmail.com','+9954454878','KG','male','$2a$10$8t0mtGOhIXQblPnkCY32r.T0qj3QyUybz3ZD2vYYr8kb4IOwCLr6S','user','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxNywiaWF0IjoxNzI4ODM3MDgyLCJleHAiOjE3Mjg4NDA2ODJ9.DInhWyCXzaFDx0ZBKRpJAgfvGyXn2gYPMRl3u_3KeTw'),(18,'Vasyarrrr','Vasyarrrr@gmail.com','+9665545454','KG','male','$2a$10$Def5kPlOhLXWRBdno.4Uuu1.uDSliRJBTlTHLGLv/dULq5RUrCpyW','user','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxOCwiaWF0IjoxNzI4ODMwNDg2LCJleHAiOjQ3MjY4MDI0ODZ9.kt7zEXv6TWhAfJ8isqyCUa29_2JkmNxGMoiE4erSuqM'),(19,'Vasyamuy','Vasyamuy@gmail.com','+8987545454','KG','male','$2a$10$jN8WZhcp7tnxL1b4fUEu9.q67l65b4/N5btHch82OgLG3Hs6v2k5W','user','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxOSwiaWF0IjoxNzI4ODM0ODc2LCJleHAiOjQ3MjY4MDY4NzZ9.pqPOF434OLj5hsfZvx1Ic1eZ84tOXAwSLfoP2MMr-Eg'),(20,'Vasyakuzmenkokg','Vasyakuzmenkokg@gmail.com','+996454545454','KG','male','$2a$10$f3M9spexrNs.PCCM3PZA9e.v1xSMGKRtWjgBMYqsMwf/8f2xBF1ye','user','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyMCwiaWF0IjoxNzI4ODM3OTYwLCJleHAiOjQ3MjY4MDk5NjB9.Tn0y_kLdPsiThFgRHvLp1el7NC9looYZjUN9ekLZdXk'),(21,'Andreii','Andre55@gmail.com','+99650540010934','KG','male','$2a$10$e4vfulQbhfyaKUVQug2NFur.rErRWlAnVY3PqcXQoUWKjHwDpDWoC','user','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyMSwiaWF0IjoxNzI5MDE1MTk3LCJleHAiOjQ3MjY5ODcxOTd9.2nAeR_DcMnwDE5f-tVlgYYZdv1dlSAFAbto3KTRxv2M'),(22,'Nursultan','Nursultan@gmail.com','+996505001093','KG','male','$2a$10$8ffAhbew7jxKfT81PMq0UeBTmVgo5x0rafANTmH8xz/DYyemCJ.Ku','user','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyMiwiaWF0IjoxNzMwMzc5NTA1LCJleHAiOjQ3MjgzNTE1MDV9.XIqrW0iP8pUk71t3yWZtiHYCLaaU-4WPssc8HxTwFPs');
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

-- Dump completed on 2024-10-31 13:08:45
