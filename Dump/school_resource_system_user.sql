-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: school_resource_system
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Prerna','Dutta','megha92.dutta@gmail.com','prernadutta','a6eb3e50690a761ac2aebeaf46d5a6f3',1,'2018-06-07'),(2,'Abhisek','Dutta','abhi97.dutta@gmail.com','admin','75f462303051983aed92822f0a62f66f',1,'2018-06-07'),(6,'kirti','ambre','kirti@cse.com','kirtist','9341fa1e1fd3ea1d24187b7f573b4379',1,'2018-06-08'),(8,'Prashant','Dutta','pc28@gmail.com','contributor','67d382a7c207a056ecaec9f35e5d2989',1,'2018-06-12'),(9,'drunken','Master','drunken@gmail.com','DrunkenMaster123','a6b45e0f80a10c844da70fe7bed139d2',1,'2018-06-15'),(10,'Sourabh','Singh','sourabh@gmail.com','Sourabh123','4a3aa415a7d4aa47f841aef326a45f3d',1,'2018-06-15'),(11,'Tripti','Dutta','tripti25@gmail.com','Triptidutta123','134ae427b4011b2d5dc067f9b00bf77c',1,'2018-06-17'),(12,'Sourabh','Singh','mastersabhinav@gmail.com','abcd12345','0cc0d68c05ebc3debe024c533caaacf3',1,'2018-07-04');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-05 18:57:08
