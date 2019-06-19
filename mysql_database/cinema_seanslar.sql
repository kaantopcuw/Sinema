CREATE DATABASE  IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `seanslar`
--

DROP TABLE IF EXISTS `seanslar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seanslar` (
  `seans_id` int(11) NOT NULL AUTO_INCREMENT,
  `salon_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `tarih` text NOT NULL,
  `saat` text NOT NULL,
  `kalan_kapasite` int(11) NOT NULL,
  `seans_aktif_mi` tinyint(4) NOT NULL DEFAULT '1',
  `aciklama` text,
  PRIMARY KEY (`seans_id`),
  KEY `fk_salon` (`salon_id`),
  KEY `fk_film` (`film_id`),
  CONSTRAINT `seanslar_ibfk_1` FOREIGN KEY (`salon_id`) REFERENCES `salonlar` (`salon_id`),
  CONSTRAINT `seanslar_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `filmler` (`film_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seanslar`
--

LOCK TABLES `seanslar` WRITE;
/*!40000 ALTER TABLE `seanslar` DISABLE KEYS */;
INSERT INTO `seanslar` VALUES (1,1,1,'24.05.19','20:00',23,1,NULL),(2,3,1,'25.05.19','20:00',11,1,NULL),(3,3,4,'24.05.19','15:00',20,1,NULL),(4,3,3,'03.05.19','16:00',20,0,NULL),(5,1,2,'24.05.19','12:00',40,1,NULL);
/*!40000 ALTER TABLE `seanslar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-23 16:14:08
