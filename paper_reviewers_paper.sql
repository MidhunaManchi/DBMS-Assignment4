CREATE DATABASE  IF NOT EXISTS `paper_reviewers` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `paper_reviewers`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: paper_reviewers
-- ------------------------------------------------------
-- Server version	5.7.28-log

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
-- Table structure for table `paper`
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper` (
  `PaperId` int(11) NOT NULL,
  `EmailAddr` varchar(25) NOT NULL,
  `Title` varchar(40) NOT NULL,
  `Abstract` varchar(200) NOT NULL,
  `FileName` varchar(100) NOT NULL,
  PRIMARY KEY (`PaperId`,`EmailAddr`),
  KEY `EmailAddr` (`EmailAddr`),
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`EmailAddr`) REFERENCES `author` (`EmailAddr`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (131,'abc@gmail.com','Lease Accounting','Accounting','Lease Accounting White Paper.doc'),(132,'midhu@gmail.com','Miltary','Miltary Personnel','Miltary White paper.doc'),(133,'syam@gmail.com','Transforming new age of software testing','Software testing transformation','Transformation white paper.doc'),(134,'kittu@gmail.com','Software Architecture','Architecture','Architecture White Paper.doc'),(135,'sai@gmail.com','Army Profession','Army','Army White Paper.doc'),(136,'ram@gmail.com','Ethics','Ethics of Army','Ethics White Paper.doc');
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-21 21:20:18
