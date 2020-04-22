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
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `ReviewId` int(11) NOT NULL,
  `EmailAddr` varchar(25) NOT NULL,
  `ReviewerId` int(11) NOT NULL,
  `PaperId` int(11) NOT NULL,
  `Recommendation` varchar(25) NOT NULL,
  `MeritScore` int(11) NOT NULL,
  `ReadabilityScore` int(11) NOT NULL,
  `OriginalityScore` int(11) NOT NULL,
  `RelevanceScore` int(11) NOT NULL,
  PRIMARY KEY (`ReviewId`,`EmailAddr`),
  KEY `ReviewerId` (`ReviewerId`),
  KEY `EmailAddr` (`EmailAddr`),
  KEY `PaperId` (`PaperId`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`ReviewerId`) REFERENCES `reviewer` (`ReviewerId`) ON DELETE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`EmailAddr`) REFERENCES `reviewer` (`EmailAddr`) ON DELETE CASCADE,
  CONSTRAINT `review_ibfk_3` FOREIGN KEY (`PaperId`) REFERENCES `paper` (`PaperId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (161,'abcd@yahoo.com',141,131,'GOOD',1,1,1,2),(162,'swati@yahoo.com',142,132,'OKAY',1,1,1,2),(163,'praneeth@gmail.com',143,133,'VERY GOOD',1,1,1,2),(164,'rekha@gmail.com',144,134,'Highly recommended',1,1,1,2),(165,'sagar@gmail.com',145,135,'Effective Analysis',1,1,1,2),(166,'efgh@gmail.com',146,136,'Good',1,1,1,2);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
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
