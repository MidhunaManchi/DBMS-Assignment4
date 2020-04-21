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
-- Table structure for table `reviewer`
--

DROP TABLE IF EXISTS `reviewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviewer` (
  `ReviewerId` int(11) NOT NULL,
  `EmailAddr` varchar(25) NOT NULL,
  `FirstName` varchar(15) NOT NULL,
  `LastName` varchar(15) NOT NULL,
  `AuthorFeedback` varchar(200) NOT NULL,
  `CommiteeFeedback` varchar(200) NOT NULL,
  `PhoneNum` int(11) NOT NULL,
  `Affiliation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ReviewerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer`
--

LOCK TABLES `reviewer` WRITE;
/*!40000 ALTER TABLE `reviewer` DISABLE KEYS */;
INSERT INTO `reviewer` VALUES (141,'abcd@yahoo.com','Bill','William','this is time when you could be advancing your argument','tendency to spend too much time summarizing the plot',98989989,'University A'),(142,'swati@yahoo.com','swati','vaddi','I did not find your arguments to be too simplistic or elementary,nor did your language seem too abstract','lack clarity and definition at some points',98977989,'University X'),(143,'praneeth@gmail.com','praneeth','vaddi','good,but the clarity about the language should be improved','Good, clarity about the language should be improved',98922289,'University Y'),(144,'rekha@gmail.com','Rekha','vaddi','I really liked your paper as it touches really valid points','Very good',94321989,'University Z'),(145,'sagar@gmail.com','sagar','vaddi','Spending too much time talking about the introduction','Its too broad on introduction point of view',89564989,'University Stamford'),(146,'efgh@gmail.com','Hari','priya','very good paper','Really liked the effort that kept in. good',77777989,'University Hartford');
/*!40000 ALTER TABLE `reviewer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-21 12:37:31
