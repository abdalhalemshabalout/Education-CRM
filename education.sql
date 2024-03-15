-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: db_education
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `tb_announcements`
--

DROP TABLE IF EXISTS `tb_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_announcements`
--

LOCK TABLES `tb_announcements` WRITE;
/*!40000 ALTER TABLE `tb_announcements` DISABLE KEYS */;
INSERT INTO `tb_announcements` VALUES (10,'Consequuntur dolor e','Nihil veniam quisqu','2024-03-10 01:58:49'),(15,'Minus neque enim qui','Qui iure nihil volup','2024-03-10 17:45:08');
/*!40000 ALTER TABLE `tb_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_books`
--

DROP TABLE IF EXISTS `tb_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_books` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `available` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_books`
--

LOCK TABLES `tb_books` WRITE;
/*!40000 ALTER TABLE `tb_books` DISABLE KEYS */;
INSERT INTO `tb_books` VALUES (6,'A nihil sed cupidata','Laborum quia molesti','2020-08-14','Quam ducimus veniam','Nisi maiores assumen',10,0),(7,'Ullamco ex ut culpa','Consequatur sed blan','1984-03-01','Ea neque sed archite','Voluptatem Excepteu',19,1),(8,'At aut qui nulla vol','Iusto deleniti error','2003-10-15','Labore officia excep','Aliquam anim qui et ',68,0),(9,'In fugiat illo sit ','Cupiditate culpa off','1980-06-17','Autem qui quod ut od','Consequatur Dolorib',14,1),(10,'Reiciendis culpa cum','Perferendis eaque ea','1999-03-06','Autem quos accusamus','In lorem sed deserun',73,0),(12,'Perferendis porro pr','Et occaecat vel poss','1981-01-21','Pariatur Consequatu','Omnis aliquid eum es',39,1);
/*!40000 ALTER TABLE `tb_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_courses`
--

DROP TABLE IF EXISTS `tb_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` longtext,
  `department` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_courses`
--

LOCK TABLES `tb_courses` WRITE;
/*!40000 ALTER TABLE `tb_courses` DISABLE KEYS */;
INSERT INTO `tb_courses` VALUES (14,'Hakeem Michael','2008-10-19','1975-01-21','In minim voluptate n','Labore voluptatum et'),(15,'Karleigh Lyons','1971-04-29','2014-06-26','Sed tempora reiciend','Ut dignissimos qui v'),(17,'Amery Holmes','2004-11-11','2009-10-28','Ad inventore esse m','Quia omnis omnis vol'),(18,'Velma James','1983-07-27','1983-04-29','Ullamco aliquid haru','Saepe anim modi cupi'),(19,'Patrick Anderson','1991-11-07','1997-02-09','Occaecat atque tenet','Molestiae consectetu'),(20,'Leilani Baker','1994-03-06','1998-08-24','Quo qui doloremque s','Rerum repellendus A');
/*!40000 ALTER TABLE `tb_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employees`
--

DROP TABLE IF EXISTS `tb_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employees`
--

LOCK TABLES `tb_employees` WRITE;
/*!40000 ALTER TABLE `tb_employees` DISABLE KEYS */;
INSERT INTO `tb_employees` VALUES (9,'Madison','Kelly','zyso@mailinator.com','+1 (447) 205-2345','2020-03-02','Porro obcaecati et e',64.00),(10,'MacKensie','Frederick','kekis@mailinator.com','+1 (765) 611-8068','1994-07-06','Dolore vero et dicta',27.00),(11,'Ruth','Hansen','vetofeboga@mailinator.com','+1 (322) 107-4547','1978-08-11','Non ut temporibus de',52.00),(13,'Jenette','Sparks','vunyxa@mailinator.com','+1 (487) 161-6322','2022-01-02','Nisi dolor et non ve',11.00),(14,'Cassady','Watts','datoxit@mailinator.com','+1 (258) 407-9579','2007-01-27','Distinctio Dolores ',36.00),(15,'Xander','Charles','hygewy@mailinator.com','+1 (729) 393-7063','1996-11-21','Numquam eu quia aute',24.00),(16,'Rafael','Clarke','nenew@mailinator.com','+1 (162) 722-5414','2020-07-21','Tempor pariatur Ear',97.00);
/*!40000 ALTER TABLE `tb_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_lessons`
--

DROP TABLE IF EXISTS `tb_lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_lessons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lesson_name` varchar(45) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `classroom` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_lessons`
--

LOCK TABLES `tb_lessons` WRITE;
/*!40000 ALTER TABLE `tb_lessons` DISABLE KEYS */;
INSERT INTO `tb_lessons` VALUES (4,'Winifred Christian','2013-02-21 02:38:00','1983-11-06 06:21:00','Odio autem odio exce','Quo recusandae Temp'),(6,'Latifah Dominguez','1986-04-02 13:14:00','1995-06-06 22:14:00','Maiores deserunt ea ','Ipsum soluta rerum '),(7,'Garrison Pugh','2009-10-14 21:12:00','1986-05-06 23:53:00','Et voluptatem quasi ','Voluptas culpa quia ');
/*!40000 ALTER TABLE `tb_lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_students`
--

DROP TABLE IF EXISTS `tb_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_students`
--

LOCK TABLES `tb_students` WRITE;
/*!40000 ALTER TABLE `tb_students` DISABLE KEYS */;
INSERT INTO `tb_students` VALUES (6,'Phoebe','Santana','qomuralyju@mailinator.com','+1 (346) 492-2568','1994-08-19','Iusto assumenda quia'),(10,'Priscilla','Lawrence','cyfal@mailinator.com','+1 (686) 881-5305','2024-01-08','Tenetur nisi quia la'),(12,'Trevor','Wooten','viruxy@mailinator.com','+1 (379) 137-9605','2006-03-12','Aut tempore ut prae'),(13,'Helen','Dunlap','vuvajyz@mailinator.com','+1 (247) 593-9141','1998-08-05','Molestiae eum pariat');
/*!40000 ALTER TABLE `tb_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_teachers`
--

DROP TABLE IF EXISTS `tb_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `salary` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_teachers`
--

LOCK TABLES `tb_teachers` WRITE;
/*!40000 ALTER TABLE `tb_teachers` DISABLE KEYS */;
INSERT INTO `tb_teachers` VALUES (5,'Tana','Howell','cupab@mailinator.com','+1 (156) 452-4147','1974-06-08','Neque quis rerum vit','5000'),(9,'Nash','Mcknight','rahewat@mailinator.com','+1 (886) 999-3664','2009-07-16','Officia ea sed magna','10000'),(10,'Violet','Carpenter','mykiqaz@mailinator.com','+1 (189) 185-6794','1982-10-15','Sapiente eveniet at','500'),(12,'Vaughan','Barry','pafefuxyj@mailinator.com','+1 (879) 444-9399','1976-02-22','Impedit saepe dolor','18'),(14,'Kimberley','Reese','cuhokacyp@mailinator.com','+1 (909) 733-4882','2024-04-03','Aliqua Molestiae ip','400');
/*!40000 ALTER TABLE `tb_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_users`
--

LOCK TABLES `tb_users` WRITE;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` VALUES (2,'radu','cicic','radu@gmail.com','123'),(3,'zakaria','aldaif','zakaria@gmail.com','123');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-11  0:48:18