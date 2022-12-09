-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: blackcat_cafe
-- ------------------------------------------------------
-- Server version	8.0.15

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

DROP DATABASE IF EXISTS blackcat_cafe;

CREATE DATABASE blackcat_cafe;
USE blackcat_cafe;

--
-- Table structure for table `cafe_store`
--

DROP TABLE IF EXISTS `cafe_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cafe_store` (
  `cafe_id` int(11) NOT NULL AUTO_INCREMENT,
  `cafe_street` varchar(45) DEFAULT NULL,
  `cafe_city` varchar(45) DEFAULT NULL,
  `cafe_zip` int(5) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cafe_id`),
  KEY `manager_id_idx` (`manager_id`),
  CONSTRAINT `manager_id` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_store`
--

LOCK TABLES `cafe_store` WRITE;
/*!40000 ALTER TABLE `cafe_store` DISABLE KEYS */;
INSERT INTO `cafe_store` VALUES (1,'123 Main Street','Coruscant',91172,14),(2,'234 Galactic Avenue','Galactic City',76341,2),(3,'345 Cloud Lane','Mos Eisley',45335,8),(4,'454 Rainbow Ave','Cloud City',86121,14),(5,'567 Jedi Way','Matmata',12278,18),(7,'789 Mecury Blvd','Ksar Hadaka',98765,21),(8,'891 Corona Drive','Tataouine',56643,21),(9,'987 Kenobi Pkwy','Guilin',33445,14),(10,'543 Organa Blvd','Medinin',90546,21);
/*!40000 ALTER TABLE `cafe_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_first_name` varchar(45) NOT NULL,
  `employee_last_name` varchar(45) NOT NULL,
  `employee_id_mgr` int(11) DEFAULT NULL,
  `cafe_id` int(11) NOT NULL,
  `employee_email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Obi Wan','Kenobi',1,1,'kenobi@blackcat.cafe'),(2,'Galen','Erso',14,7,'erso3@blackcat.cafe'),(3,'Jyn','Erso',18,8,'erso2@blackcat.cafe'),(4,'Lyra','Erso',25,10,'erso1@blackcat.cafe'),(5,'Boba','Fett',14,5,'fett@blackcat.cafe'),(6,'Jango','Fett',2,2,'fett2@blackcat.cafe'),(7,'Sheev','Palpatine',21,10,'palpatine@blackcat.cafe'),(8,'Rey','Palpatine',1,2,'palpatine2@blackcat.cafe'),(9,'Dinee','Ellberger',8,6,'ellberger@blackcat.cafe'),(10,'Gavyn','Sykes',14,7,'sykes@blackcat.cafe'),(11,'Gregar','Typho',8,6,'typho@blackcat.cafe'),(12,'Mon','Mothma',2,2,'mothma@blackcat.cafe'),(13,'Biggs','Darklighter',8,4,'darklighter@blackcat.cafe'),(14,'Shmi','Skywalker',1,2,'skywalker@blackcat.cafe'),(15,'Jobal','Naberrie',18,8,'naberrie@blackcat.cafe'),(16,'Beru','Lars',8,4,'lars2@blackcat.cafe'),(17,'Cliegg','Lars',14,7,'lars@blackcat.cafe'),(18,'Qui-Gong','Jinn',1,1,NULL),(19,'Darth','Sidious',14,5,'sidious@blackcat.cafe'),(20,'Finn','FN-2187',8,3,'fn@blackcat.cafe'),(21,'Anakin','Skywalker',1,1,'skywalker@blackcat.cafe'),(22,'Paige','Tico',21,9,'tico@blackcat.cafe'),(23,'Cad','Bane',18,8,'bane@blackcat.cafe'),(24,'Count','Dooku',14,5,'dooku@blackcat.cafe'),(26,'Rose','Tico',14,5,'skywalker@blackcat.cafe'),(27,'Andy','Snoke',18,8,''),(28,'Maximilian','Veers',21,9,'veers@blackcat.cafe'),(29,'Benjamin','Solo',14,5,'solo@blackcat.cafe'),(30,'Padme','Amidala',25,10,'admidala@blackcat.cafe'),(31,'Cere','Junda',8,3,'junda@blackcat.cafe'),(32,'Sonja','Streuber',21,9,'streuber@blackcat.cafe');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_description` varchar(45) DEFAULT NULL,
  `menu_size_in_oz` int(11) DEFAULT NULL,
  `menu_temp` varchar(45) DEFAULT NULL,
  `menu_price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'americano',8,'160','3'),(2,'americano',16,'160','4'),(3,'americano',32,'160','7'),(4,'espresso',4,'160','2.50'),(5,'espresso',8,'160','4'),(6,'latte',8,'160','5'),(7,'latte',16,'160','6'),(8,'latte',32,'160','7.50'),(9,'chai',16,'160','3'),(10,'chai',32,'160','5'),(11,'soy chai latte',16,'160','7.50'),(12,'soy chai latte',32,'160','9'),(13,'iced coffee',8,'40','3'),(14,'iced coffee',16,'40','4'),(15,'iced coffee',32,'40','7'),(16,'iced chai',8,'40','2'),(17,'iced chai',16,'40','4'),(18,'iced chai',32,'40','6'),(19,'iced latte',8,'40','4'),(20,'iced latte',16,'40','6'),(21,'iced latte',32,'40','8');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_date` date NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `orders_preptime` int(11) DEFAULT NULL,
  `orders_temp` varchar(45) DEFAULT NULL,
  `orders_price` varchar(45) NOT NULL,
  `complaint` varchar(45) DEFAULT NULL,
  `coupon_issued` varchar(45) DEFAULT NULL,
  `cafe_id` int(11) NOT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `menu_id_idx` (`menu_id`),
  KEY `employee_id_idx` (`employee_id`),
  KEY `orders_cafe_id_idx` (`cafe_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`),
  CONSTRAINT `orders_cafe_id` FOREIGN KEY (`cafe_id`) REFERENCES `cafe_store` (`cafe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2020-10-01',1,3,2,'160','3',NULL,NULL,1),(2,'2020-10-01',2,24,23,'40','4','y','y',1),(3,'2020-10-01',3,27,24,'160','7',NULL,NULL,1),(4,'2020-10-05',4,3,3,'50','3','y','y',1),(5,'2020-10-05',4,7,5,'160','5',NULL,NULL,1),(6,'2020-10-15',5,3,3,'160','7','y','y',1),(7,'2020-10-15',6,27,1,'160','4',NULL,NULL,1),(8,'2020-10-20',7,7,7,'90','3',NULL,NULL,1),(9,'2020-10-20',8,28,5,'160','5',NULL,NULL,1),(10,'2020-10-25',9,29,2,'160','1','y',NULL,1),(11,'2020-11-01',11,24,12,'160','9',NULL,NULL,1),(12,'2020-11-02',10,3,2,'90','9','y','y',1),(13,'2020-11-03',11,7,6,'40','9',NULL,NULL,1),(14,'2020-11-04',12,27,3,'160','9',NULL,NULL,1),(15,'2020-11-05',13,12,2,'40','9',NULL,NULL,1),(16,'2020-11-05',14,24,5,'40','9',NULL,NULL,1),(17,'2020-11-05',20,7,4,'40','5','y',NULL,1),(18,'2020-11-06',21,12,2,'40','5',NULL,NULL,1),(19,'2020-11-07',4,27,17,'160','4','y','y',1),(20,'2020-11-08',1,12,3,'160','3',NULL,NULL,1),(21,'2020-11-09',4,23,1,'160','7',NULL,NULL,1),(22,'2020-11-10',7,24,8,'160','2',NULL,NULL,1),(23,'2020-11-11',8,28,6,'40','3','y','y',1),(24,'2020-11-12',12,7,1,'160','5',NULL,NULL,1),(25,'2020-11-12',20,3,4,'40','4','y',NULL,1),(26,'2020-11-13',14,12,2,'40','5',NULL,NULL,1),(27,'2020-11-13',14,24,23,'120','5',NULL,'y',1),(28,'2020-11-15',3,23,3,'160','5',NULL,NULL,1),(29,'2020-11-15',21,23,3,'120','5',NULL,'y',1),(30,'2020-11-15',12,7,5,'160','6',NULL,NULL,1),(31,'2020-11-16',14,27,2,'40','7','y',NULL,1),(32,'2020-11-17',14,28,7,'90','3',NULL,NULL,1),(33,'2020-11-18',4,7,7,'160','4',NULL,'y',1),(34,'2020-11-19',3,3,2,'70','7',NULL,NULL,1),(35,'2020-11-20',3,24,25,'160','3','y',NULL,1),(36,'2020-11-21',3,12,1,'90','4',NULL,NULL,1),(37,'2020-11-22',3,27,25,'160','7',NULL,NULL,1),(38,'2020-11-23',11,28,8,'40','3',NULL,NULL,1),(39,'2020-11-24',19,12,2,'40','4','y',NULL,1),(40,'2020-11-25',20,24,3,'40','7',NULL,'y',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-19 15:09:44
