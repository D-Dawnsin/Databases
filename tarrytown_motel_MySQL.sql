CREATE DATABASE  IF NOT EXISTS `tarrytown_motel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tarrytown_motel`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tarrytown_motel
-- ------------------------------------------------------
-- Server version	5.6.21-log

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

DROP DATABASE IF EXISTS tarrytown_motel;

CREATE DATABASE tarrytown_motel;
USE tarrytown_motel;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `ROOM_ID` int(11) NOT NULL,
  `ROOM_BUILDING` char(5) NOT NULL,
  `ROOM_STYLE` char(12) NOT NULL,
  `ROOM_NAME` varchar(100) NOT NULL,
  `PRICE_NIGHT_WKDAY` decimal(5,2) DEFAULT NULL,
  `PRICE_NIGHT_WKEND` decimal(5,2) DEFAULT NULL,
  `YEAR_RENOVATED` char(4) DEFAULT NULL,
  PRIMARY KEY (`ROOM_ID`),
  KEY `ROOM_STYLE` (`ROOM_STYLE`),
  KEY `IX_ROOM_BUILDING` (`ROOM_BUILDING`),
  KEY `IX_ROOM_NAME` (`ROOM_NAME`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`ROOM_BUILDING`) REFERENCES `room_building` (`ROOM_BUILDING`),
  CONSTRAINT `room_ibfk_2` FOREIGN KEY (`ROOM_STYLE`) REFERENCES `room_layout` (`ROOM_STYLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'NW','1br2q','Pilgrim',12.00,150.00,'2010'),(2,'NW','ste2q','Mayflower',13.00,150.00,'2011'),(3,'NW','1br1k','Jonestown',15.00,150.00,'2012'),(4,'NW','ste1k','Plymouth',16.00,150.00,'2013'),(5,'NW','apt3q','Massachusetts',20.00,150.00,'2014'),(6,'NO','1br2q','Pilgrim',12.00,150.00,'2010'),(7,'NO','ste2q','Mayflower',13.00,150.00,'2011'),(8,'NO','1br1k','Jonestown',15.00,150.00,'2012'),(9,'NO','ste1k','Plymouth',16.00,150.00,'2013'),(10,'NO','apt3q','Massachusetts',20.00,150.00,'2014'),(11,'NE','1br2q','Pilgrim',12.00,150.00,'2010'),(12,'NE','ste2q','Mayflower',13.00,150.00,'2011');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_building`
--

DROP TABLE IF EXISTS `room_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_building` (
  `ROOM_BUILDING` char(5) NOT NULL,
  `ROOM_BUILDING_DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY (`ROOM_BUILDING`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_building`
--

LOCK TABLES `room_building` WRITE;
/*!40000 ALTER TABLE `room_building` DISABLE KEYS */;
INSERT INTO `room_building` VALUES ('NE','Northeast facing boardwalk'),('NO','North facing Ocean Blvd'),('NW','Northwest facing pool'),('SE','Southeast facing parking garage'),('SO','South facing Shoreline Ave'),('SW','Southwest facing pool');
/*!40000 ALTER TABLE `room_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_ind`
--

DROP TABLE IF EXISTS `room_ind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_ind` (
  `ROOM_ID` int(11) NOT NULL,
  `UNIT_NUMBER` int(11) NOT NULL,
  `DATE_OPENED` date NOT NULL,
  `DATE_DECOMMISSIONED` date DEFAULT NULL,
  `ROOM_FLOOR` varchar(2) NOT NULL,
  PRIMARY KEY (`ROOM_ID`,`UNIT_NUMBER`),
  CONSTRAINT `room_ind_ibfk_1` FOREIGN KEY (`ROOM_ID`) REFERENCES `room` (`ROOM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_ind`
--

LOCK TABLES `room_ind` WRITE;
/*!40000 ALTER TABLE `room_ind` DISABLE KEYS */;
INSERT INTO `room_ind` VALUES (1,1,'1990-01-01',NULL,'U'),(1,2,'1990-01-10',NULL,'D'),(2,1,'1990-01-01',NULL,'U'),(2,2,'1990-01-10','2010-01-30','U'),(3,1,'1990-01-01',NULL,'D'),(3,2,'1990-01-10',NULL,'U'),(4,1,'1990-01-01',NULL,'D'),(4,2,'1990-01-10',NULL,'U'),(5,1,'1990-01-01',NULL,'D'),(5,2,'1990-01-10',NULL,'U'),(6,1,'1990-02-01','2010-03-15','D'),(6,2,'1990-02-10',NULL,'U'),(7,1,'1990-02-01',NULL,'D'),(7,2,'1990-02-10',NULL,'U'),(8,1,'1990-02-01',NULL,'D'),(8,2,'1990-02-10',NULL,'U'),(9,1,'1990-02-01',NULL,'D'),(9,2,'1990-02-10',NULL,'U'),(10,1,'1990-02-01',NULL,'D'),(10,2,'1990-02-10',NULL,'U'),(11,1,'1990-03-01',NULL,'D'),(11,2,'1990-03-10',NULL,'U'),(12,1,'1990-03-01',NULL,'D'),(12,2,'1990-03-10',NULL,'U');
/*!40000 ALTER TABLE `room_ind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_rent`
--

DROP TABLE IF EXISTS `room_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_rent` (
  `ROOM_ID` int(11) NOT NULL,
  `UNIT_NUMBER` int(11) NOT NULL,
  `TRANSACTION_ID` int(11) NOT NULL,
  `CHECKOUT_DATE` date DEFAULT NULL,
  `RENT_AMOUNT` decimal(7,2) DEFAULT NULL,
  `LATE_OR_OTHER_FEE` decimal(5,2) DEFAULT NULL,
  `PAID_DATE` date DEFAULT NULL,
  PRIMARY KEY (`ROOM_ID`,`UNIT_NUMBER`,`TRANSACTION_ID`),
  KEY `IX_ROOM_GUEST_TRANS` (`TRANSACTION_ID`),
  CONSTRAINT `room_rent_ibfk_1` FOREIGN KEY (`ROOM_ID`, `UNIT_NUMBER`) REFERENCES `room_unit` (`ROOM_ID`, `UNIT_NUMBER`),
  CONSTRAINT `room_rent_ibfk_2` FOREIGN KEY (`TRANSACTION_ID`) REFERENCES `guest_transaction` (`TRANSACTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_rent`
--

LOCK TABLES `room_rent` WRITE;
/*!40000 ALTER TABLE `room_rent` DISABLE KEYS */;
INSERT INTO `room_rent` VALUES (1,1,1,'2014-11-01',625.00,NULL,'2014-11-01'),(1,1,21,'2014-12-01',625.00,50.00,'2014-12-05'),(1,2,2,'2014-11-01',650.00,50.00,'2014-11-05'),(1,2,22,'2014-12-01',650.00,NULL,'2014-12-01'),(2,1,3,'2014-11-01',675.00,50.00,'2014-11-15'),(2,1,23,'2014-12-01',675.00,NULL,'2014-12-03'),(3,1,4,'2014-11-01',667.00,50.00,'2014-11-10'),(3,1,24,'2014-12-01',667.00,NULL,'2014-12-01'),(3,2,5,'2014-11-01',725.00,NULL,'2014-11-01'),(3,2,25,'2014-12-01',725.00,50.00,'2014-12-05'),(4,1,6,'2014-11-01',675.00,NULL,'2014-10-31'),(4,1,26,'2014-12-01',675.00,NULL,'2014-12-01'),(4,2,7,'2014-11-01',750.00,NULL,'2014-10-29'),(4,2,27,'2014-12-01',750.00,NULL,'2014-12-03'),(5,1,8,'2014-11-01',635.00,NULL,'2014-11-01'),(5,1,28,'2014-12-01',635.00,NULL,'2014-12-01'),(5,2,9,'2014-11-01',650.00,NULL,'2014-11-03'),(5,2,29,'2014-12-01',650.00,50.00,'2014-12-05'),(6,2,10,'2014-11-01',700.00,NULL,'2014-11-01'),(6,2,30,'2014-12-01',700.00,NULL,'2014-12-01'),(7,1,11,'2014-11-01',725.00,50.00,'2014-11-05'),(7,1,31,'2014-12-01',725.00,NULL,'2014-12-03'),(7,2,12,'2014-11-01',700.00,50.00,'2014-11-15'),(7,2,32,'2014-12-01',700.00,NULL,'2014-12-01'),(8,1,13,'2014-11-01',800.00,50.00,'2014-11-10'),(8,1,33,'2014-12-01',800.00,50.00,'2014-12-05'),(8,2,14,'2014-11-01',775.00,NULL,'2014-10-31'),(8,2,34,'2014-12-01',775.00,50.00,'2014-12-05'),(9,1,15,'2014-11-01',775.00,NULL,'2014-10-29'),(9,1,35,'2014-12-01',775.00,50.00,'2014-12-15'),(9,2,16,'2014-11-01',800.00,NULL,'2014-10-31'),(9,2,36,'2014-12-01',800.00,50.00,'2014-12-10'),(10,1,17,'2014-11-01',750.00,NULL,'2014-10-29'),(10,1,37,'2014-12-01',750.00,NULL,'2014-12-01'),(10,2,18,'2014-11-01',775.00,NULL,'2014-11-01'),(10,2,38,'2014-12-01',775.00,NULL,'2014-11-29'),(11,1,19,'2014-11-01',700.00,NULL,'2014-11-03'),(11,1,39,'2014-12-01',700.00,NULL,'2014-12-01'),(11,2,20,'2014-11-01',700.00,NULL,'2014-11-01'),(11,2,40,'2014-12-01',700.00,NULL,'2014-12-03');
/*!40000 ALTER TABLE `room_rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_maintenance`
--

DROP TABLE IF EXISTS `room_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_maintenance` (
  `ROOM_ID` int(11) NOT NULL,
  `MAINT_CODE` char(2) NOT NULL,
  PRIMARY KEY (`ROOM_ID`,`MAINT_CODE`),
  KEY `IX_LANG_ROOM_LANG` (`MAINT_CODE`),
  CONSTRAINT `room_maintenance_ibfk_1` FOREIGN KEY (`MAINT_CODE`) REFERENCES `maintenance_codes` (`MAINT_CODE`),
  CONSTRAINT `room_maintenance_ibfk_2` FOREIGN KEY (`ROOM_ID`) REFERENCES `room` (`ROOM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_maintenance`
--

LOCK TABLES `room_maintenance` WRITE;
/*!40000 ALTER TABLE `room_maintenance` DISABLE KEYS */;
INSERT INTO `room_maintenance` VALUES (1,'CC'),(9,'CC'),(16,'CC'),(19,'CC'),(1,'LB'),(2,'LB'),(3,'LB'),(4,'LB'),(5,'LB'),(6,'LB'),(7,'LB'),(8,'LB'),(9,'LB'),(10,'LB'),(11,'LB'),(12,'LB'),(13,'LB'),(14,'LB'),(15,'LB'),(16,'LB'),(17,'LB'),(18,'LB'),(19,'LB'),(20,'LB'),(20,'MW'),(2,'OR'),(3,'OR'),(4,'OR'),(5,'OR'),(6,'OR'),(7,'OR'),(8,'OR'),(9,'OR'),(10,'OR'),(11,'OR'),(12,'OR'),(13,'OR'),(15,'OR'),(20,'OR');
/*!40000 ALTER TABLE `room_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_layout`
--

DROP TABLE IF EXISTS `room_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_layout` (
  `ROOM_STYLE` varchar(6) NOT NULL,
  `ROOM_STYLE_DESCRIPTION` varchar(100) NOT NULL,
  PRIMARY KEY (`ROOM_STYLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_layout`
--

LOCK TABLES `room_layout` WRITE;
/*!40000 ALTER TABLE `room_layout` DISABLE KEYS */;
INSERT INTO `room_layout` VALUES ('1br2q','One bedroom two queen beds'),('ste2q','Suite two queen beds'),('1br1k','One bedroom one king bed'),('ste1k','Suite one king  bed'),('apt3q','Apartment 3 queen beds');
/*!40000 ALTER TABLE `room_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_unit`
--

DROP TABLE IF EXISTS `room_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_unit` (
  `ROOM_ID` int(11) NOT NULL,
  `UNIT_NUMBER` int(11) NOT NULL,
  `DATE_OPENED` date NOT NULL,
  `DATE_DECOMMISSIONED` date DEFAULT NULL,
  `ROOM_FLOOR` char(1) NOT NULL,
  PRIMARY KEY (`ROOM_ID`,`UNIT_NUMBER`),
  CONSTRAINT `room_unit_ibfk_1` FOREIGN KEY (`ROOM_ID`) REFERENCES `room` (`ROOM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_unit`
--

LOCK TABLES `room_unit` WRITE;
/*!40000 ALTER TABLE `room_unit` DISABLE KEYS */;
INSERT INTO `room_unit` VALUES (1,1,'2010-01-01',NULL,'D'),(1,2,'0000-00-00',NULL,'U'),(2,1,'2010-01-10',NULL,'D'),(2,2,'2010-01-01',NULL,'U'),(3,1,'2010-01-01','2010-01-30','D'),(3,2,'2010-02-15',NULL,'U'),(4,1,'2010-02-15',NULL,'D'),(4,2,'2010-03-01',NULL,'U'),(5,1,'2010-02-15',NULL,'D'),(5,2,'2010-02-15',NULL,'U'),(6,1,'2010-02-15',NULL,'D'),(6,2,'2010-02-15',NULL,'U'),(7,1,'2010-02-28',NULL,'D'),(7,2,'2010-02-28',NULL,'U'),(8,1,'2010-02-28','2010-03-15','D'),(8,2,'2010-02-28','2010-03-15','U'),(9,1,'2010-02-28',NULL,'D'),(9,2,'2010-02-28',NULL,'U'),(10,1,'2010-03-01',NULL,'D'),(10,2,'2010-03-01',NULL,'U'),(11,1,'2010-03-10',NULL,'D'),(11,2,'2010-02-28',NULL,'U'),(12,1,'2010-03-10',NULL,'D'),(12,2,'2010-03-10',NULL,'U');
/*!40000 ALTER TABLE `room_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `INDIVIDUAL_ID` int(11) NOT NULL,
  `SUPERVISOR_INDIVIDUAL_ID` int(11) DEFAULT NULL,
  `EMPLOYEE_TAX_ID` varchar(15) NOT NULL,
  `EMPLOYEE_JOB_CATEGORY` char(1) NOT NULL,
  `EMPLOYEE_HOURLY_RATE` decimal(5,2) NOT NULL,
  `HIRE_DATE` date NOT NULL,
  `TERMINATION_DATE` date DEFAULT NULL,
  PRIMARY KEY (`INDIVIDUAL_ID`),
  KEY `IX_SUPERVISOR_INDIVIDUAL_ID` (`SUPERVISOR_INDIVIDUAL_ID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`INDIVIDUAL_ID`) REFERENCES `individual` (`INDIVIDUAL_ID`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`SUPERVISOR_INDIVIDUAL_ID`) REFERENCES `employee` (`INDIVIDUAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,NULL,'000-01-1234','M',50.00,'2013-01-01',NULL),(2,1,'000-02-8564','C',9.75,'2013-01-01','2013-06-01'),(4,3000,'000-45-3456','C',12.00,'2014-01-01',NULL),(10,1,'000-57-8385','C',9.75,'2013-03-01',NULL),(15,3000,'000-78-9876','C',12.00,'2014-01-01',NULL),(3000,1,'000-43-1234','M',50.00,'2013-01-01',NULL),(3001,3000,'000-45-5678','C',12.00,'2014-01-01',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individual`
--

DROP TABLE IF EXISTS `individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `individual` (
  `INDIVIDUAL_ID` int(11) NOT NULL,
  `INDIVIDUAL_GIVEN_NAME` varchar(25) NOT NULL,
  `INDIVIDUAL_MIDDLE_NAME` varchar(25) DEFAULT NULL,
  `INDIVIDUAL_FAMILY_NAME` varchar(25) NOT NULL,
  `INDIVIDUAL_ADDRESS_1` varchar(100) DEFAULT NULL,
  `INDIVIDUAL_ADDRESS_2` varchar(100) DEFAULT NULL,
  `INDIVIDUAL_ADDRESS_CITY` varchar(40) DEFAULT NULL,
  `INDIVIDUAL_ADDRESS_STATE_PROV` char(2) DEFAULT NULL,
  `INDIVIDUAL_ADDRESS_ZIP` varchar(10) DEFAULT NULL,
  `INDIVIDUAL_ADDRESS_COUNTRY` char(2) DEFAULT NULL,
  `INDIVIDUAL_PHONE` varchar(15) DEFAULT NULL,
  `INDIVIDUAL_BIRTH_DATE` date DEFAULT NULL,
  `INDIVIDUAL_DEATH_DATE` date DEFAULT NULL,
  PRIMARY KEY (`INDIVIDUAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual`
--

LOCK TABLES `individual` WRITE;
/*!40000 ALTER TABLE `individual` DISABLE KEYS */;
INSERT INTO `individual` VALUES (1,'Cong','L','Yu','238 irish Lane',NULL,'Lancaster','Wi','53813','US','608 723 4219','1970-07-04',NULL),(2,'Yamila','H','Concepcion','4088 Briarwood Road',NULL,'Springfield','MO','65804','US','417 885 2573','1968-05-05',NULL),(3,'Tobias','U','Holtzmann','760 Langtown Road',NULL,'Zwingle','iA','52079','US','563 686 8388','1981-09-27',NULL),(4,'Mavise','C','Gagnon','3524 Goldie Lane',NULL,'Middletown','OH','45044','US','513 420 8726','1983-08-26',NULL),(5,'Marius','L','Schultz','2533 Alpaca Way',NULL,'Orange','CA','92632','US','714 771 0603','1951-06-20',NULL),(6,'Karl','S','Pettersson','4478 Collins Street',NULL,'Genesee','PA','16923','US','814 228 3988','1953-12-15',NULL),(7,'Glen','A','Lavigne','2902 Libby Street',NULL,'Gardena','CA','90247','US','310 327 9257','1980-04-16',NULL),(8,'Tosh','C','Jacobsen','171 B Street',NULL,'Shoreview','MN','55126','US','651 486 3207','1949-03-16','2013-03-30'),(9,'Filip','D','Krusina','1547 Callison Lane',NULL,'WiLiangton','DE','19801','US','302 384 5469','1981-02-28',NULL),(10,'Elisabeth','W','Kaneshiro','1574 Elk Street',NULL,'Los Angeles','CA','90017','US','949 606 3845','1959-08-13',NULL),(11,'Radek','L','Zouhar','2706 Williams Mine Road',NULL,'Gambell','AK','99742','US','907 985 1060','1960-04-16',NULL),(12,'Yoshihide','S','Ono','943 Sumner Street',NULL,'Los Angeles','CA','90017','US','310 620 8198','1994-06-17',NULL),(13,'Ananias','M','Sauceda','541 Christie Way',NULL,'Framingham','MA','1702','US','978 831 8609','1974-11-15',NULL),(14,'Tim','M','Holmberg','1555 Granville Lane',NULL,'Wayne','NJ','7477','US','973 517 9993','1974-12-21',NULL),(15,'Meisie','B','Alanis','1950 Bingamon Branch Road',NULL,'Wurtsboro','NY','12790','US','845 888 1375','1976-05-14',NULL),(16,'Jennifer','H','Turner','1907 Walton Street','Apt 12','Orem','UT','84058','US','801 431 8099','1953-07-16',NULL),(17,'Amarante','P','Clement','1258 Boring Lane',NULL,'Dublin','CA','94568','US','415 720 2952','1988-08-01',NULL),(18,'Shizuru','T','Oota','3633 Prudence Street',NULL,'Southfield','Mi','48235','US','313 344 9647','1987-08-28',NULL),(19,'Cong','L','Yu','238 irish Lane',NULL,'Lancaster','Wi','53813','US','608 723 4219','1952-11-27','2010-03-30'),(20,'Marko','L','Probst','2469 Late Avenue',NULL,'Durant','OK','74701','US','580 745 6377','1950-09-05',NULL),(21,'Toc','H','Ton','1957 Martha Ellen Drive',NULL,'Reno','NE','89503','US','775 787 2854','1956-05-14',NULL),(22,'Waliy al Din','Z','Kalb','2853 Joes Road',NULL,'Plattsburgh','NY','12901','US','518 817 5307','1946-11-28',NULL),(23,'Kazuhiro','U','Oike','4145 Romano Street',NULL,'Wakefield','MA','1880','US','781 438 2337','1961-07-28',NULL),(24,'Sander','S','Nygaard','585 Briercliff Road',NULL,'Brooklyn','NY','11206','US','718 606 7820','1945-04-21',NULL),(25,'irena','F','Zykova','921 Bungalow Road',NULL,'Omaha','NE','68124','US','402 938 5663','1986-09-29',NULL),(26,'Dana','J','Zemanova','595 Thompson Street',NULL,'Los Angeles','CA','90017','US','562 681 0868','1976-04-07',NULL),(27,'Vera','i','Blazkova','1016 Stonecoal Road',NULL,'Clyde','OH','43410','US','419 547 9462','1966-04-14',NULL),(28,'Chalten','U','Galvan','3603 Pinnickinnick Street',NULL,'Freehold','NJ','7728','US','732 780 6216','1952-02-06',NULL),(29,'Buthaynah','W','Shammas','348 Mulberry Street',NULL,'Center','TX','75935','US','936 556 1088','1966-12-22',NULL),(30,'Melusina','C','Plante','1902 Collins Avenue',NULL,'Columbus','OH','43213','US','614 860 5981','1963-06-26',NULL),(3000,'Wilmer','D','Lund','127 Nicholas Street',NULL,'Ottawa','KS','66067','US','785 242 7220','1979-08-17',NULL),(3001,'Fiona','T','Lund','127 Nicholas Street',NULL,'Ottawa','KS','66067','US','785 242 7220','1979-08-24',NULL),(3002,'Agaton','J','Magnusson','185 Losh Lane',NULL,'Crafton','PA','15205','US','412 671 9110','1970-01-09',NULL),(3003,'Douglas','U','Magnusson','3412 Peck Court',NULL,'Fullerton','CA','93632','US','949 463 0237','1970-07-25',NULL),(3004,'Falah','L','Mansour','1041 Stonecoal Road',NULL,'Defiance','OH','43512','US','419 570 2626','1981-08-25',NULL),(3005,'Naila','Akilah','Mansour','1041 Stonecoal Road',NULL,'Defiance','OH','43512','US','419 570 2626','1988-05-25',NULL),(3006,'Kaseeb','H','Mansour','1041 Stonecoal Road',NULL,'Defiance','OH','43512','US','419 570 2626','2000-05-25',NULL),(3007,'Yehuda','israel','Abramowitz','2179 Clarksburg Park Road',NULL,'St Johns','AZ','85936','US','928 337 7737','1956-04-24',NULL),(3008,'Veda','Reddy','Achaya','1757 Progress Way',NULL,'Denver','iA','50622','US','319 984 8012','1993-05-03',NULL),(3009,'Selah','Corinne','Adams','2894 Wilson Avenue',NULL,'Dallas','TX','75248','US','972 523 9938','1995-05-05',NULL),(3010,'Jessica','M','Martin','4320 Charles Street',NULL,'Livonia','Mi','48150','US','734 422 0624','1971-06-06',NULL),(3011,'Langston','James','Martin','4646 Ashwood Drive',NULL,'Whiting','iA','51063','US','712 455 4183','1972-06-08',NULL);
/*!40000 ALTER TABLE `individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_codes`
--

DROP TABLE IF EXISTS `maintenance_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_codes` (
  `MAINT_CODE` char(3) NOT NULL,
  `MAINT_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`MAINT_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_codes`
--

LOCK TABLES `maintenance_codes` WRITE;
/*!40000 ALTER TABLE `maintenance_codes` DISABLE KEYS */;
INSERT INTO `maintenance_codes` VALUES ('CC','Carpet Cleaning'),('EL','Electrical'),('GL','Glass'),('LB','Light Bulbs'),('MW','Microwave'),('OR','Oven Range'),('OT','Other'),('PB','Plumbing'),('PT','Paint');
/*!40000 ALTER TABLE `maintenance_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_account`
--

DROP TABLE IF EXISTS `guest_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest_account` (
  `GUEST_ACCOUNT_ID` int(11) NOT NULL,
  `GUEST_ALERT_ON` char(1) NOT NULL DEFAULT 'N',
  `DATE_CREATED` date NOT NULL,
  `DATE_CLOSED` date DEFAULT NULL,
  `GUEST_DEPOSIT_AMOUNT` decimal(5,2) DEFAULT NULL,
  `CREDIT_CARD_ON_FILE_FLAG` char(1) NOT NULL,
  `CREDIT_CHECK_FLAG` char(1) NOT NULL,
  PRIMARY KEY (`GUEST_ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_account`
--

LOCK TABLES `guest_account` WRITE;
/*!40000 ALTER TABLE `guest_account` DISABLE KEYS */;
INSERT INTO `guest_account` VALUES (1,'N','2013-01-01',NULL,100.00,'Y','N'),(2,'N','2013-01-18',NULL,250.00,'Y','N'),(3,'N','2013-02-01',NULL,250.00,'Y','N'),(4,'N','2013-02-01',NULL,250.00,'Y','N'),(5,'N','2013-02-01',NULL,250.00,'Y','N'),(6,'Y','2013-02-15','2013-03-01',250.00,'Y','Y'),(7,'N','2013-02-15',NULL,250.00,'Y','N'),(8,'N','2013-03-01',NULL,250.00,'Y','N'),(9,'Y','2005-03-01',NULL,100.00,'Y','N'),(10,'N','2013-01-01',NULL,100.00,'Y','Y'),(11,'N','2013-01-18',NULL,250.00,'Y','N'),(12,'N','2013-02-01',NULL,250.00,'Y','N'),(13,'N','2013-02-01',NULL,250.00,'Y','N'),(14,'N','2013-02-01',NULL,250.00,'Y','N'),(15,'N','2013-02-15',NULL,250.00,'N','Y'),(16,'Y','2013-02-15',NULL,250.00,'Y','N'),(17,'N','2013-03-01',NULL,250.00,'Y','N'),(18,'N','2005-03-01',NULL,250.00,'Y','N'),(19,'Y','2013-01-01',NULL,250.00,'N','N'),(20,'N','2013-01-18',NULL,250.00,'Y','N'),(21,'N','2013-02-01',NULL,250.00,'Y','N'),(22,'N','2013-02-01',NULL,250.00,'Y','N'),(23,'N','2013-02-01',NULL,250.00,'Y','N'),(24,'N','2013-02-15',NULL,250.00,'N','Y'),(100,'N','2013-02-15',NULL,250.00,'Y','N'),(101,'Y','2013-03-01',NULL,250.00,'Y','N'),(102,'N','2005-03-01',NULL,250.00,'Y','N'),(103,'N','2013-01-01',NULL,250.00,'Y','N'),(104,'Y','2013-01-18',NULL,250.00,'Y','N'),(105,'N','2013-02-01',NULL,250.00,'N','Y'),(106,'N','2013-02-01',NULL,250.00,'N','N'),(107,'N','2013-02-01',NULL,250.00,'N','N'),(108,'N','2013-02-15',NULL,250.00,'N','N');
/*!40000 ALTER TABLE `guest_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_account_individual`
--

DROP TABLE IF EXISTS `guest_account_individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest_account_individual` (
  `GUEST_ACCOUNT_ID` int(11) NOT NULL,
  `INDIVIDUAL_ID` int(11) NOT NULL,
  PRIMARY KEY (`GUEST_ACCOUNT_ID`,`INDIVIDUAL_ID`),
  KEY `IX_INDIVIDUAL_GUEST_ACCT_INDIVIDUAL` (`INDIVIDUAL_ID`),
  CONSTRAINT `guest_account_individual_ibfk_1` FOREIGN KEY (`INDIVIDUAL_ID`) REFERENCES `individual` (`INDIVIDUAL_ID`),
  CONSTRAINT `guest_account_individual_ibfk_2` FOREIGN KEY (`GUEST_ACCOUNT_ID`) REFERENCES `guest_account` (`GUEST_ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_account_individual`
--

LOCK TABLES `guest_account_individual` WRITE;
/*!40000 ALTER TABLE `guest_account_individual` DISABLE KEYS */;
INSERT INTO `guest_account_individual` VALUES (1,1),(2,2),(3,3),(3,4),(4,5),(4,6),(3,7),(4,7),(5,8),(6,9),(7,10),(7,11),(7,12),(8,13),(8,14),(9,15),(10,16),(11,17),(12,18),(13,19),(14,20),(15,21),(16,22),(17,23),(18,24),(20,25),(20,26),(21,27),(22,28),(23,29),(24,30),(100,3000),(101,3001),(102,3002),(103,3003),(104,3004),(104,3005),(104,3006),(105,3007),(106,3008),(107,3009),(108,3010),(108,3011);
/*!40000 ALTER TABLE `guest_account_individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_transaction`
--

DROP TABLE IF EXISTS `guest_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest_transaction` (
  `TRANSACTION_ID` int(11) NOT NULL,
  `GUEST_ACCOUNT_ID` int(11) NOT NULL,
  `EMPLOYEE_INDIVIDUAL_ID` int(11) NOT NULL,
  `TRANSACTION_DATE` date NOT NULL,
  `PET_FEES` decimal(5,2) NOT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `IX_EMPLOYEE_GUEST_TRANS` (`EMPLOYEE_INDIVIDUAL_ID`),
  KEY `IX_GUEST_ACCT_GUEST_TRANS` (`GUEST_ACCOUNT_ID`),
  CONSTRAINT `guest_transaction_ibfk_1` FOREIGN KEY (`EMPLOYEE_INDIVIDUAL_ID`) REFERENCES `employee` (`INDIVIDUAL_ID`),
  CONSTRAINT `guest_transaction_ibfk_2` FOREIGN KEY (`GUEST_ACCOUNT_ID`) REFERENCES `guest_account` (`GUEST_ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_transaction`
--

LOCK TABLES `guest_transaction` WRITE;
/*!40000 ALTER TABLE `guest_transaction` DISABLE KEYS */;
INSERT INTO `guest_transaction` VALUES (1,10,1,'2014-11-01',50.00),(2,9,1,'2014-11-05',0.00),(3,8,2,'2014-11-15',0.00),(4,7,1,'2014-11-10',0.00),(5,12,2,'2014-11-01',0.00),(6,5,2,'2014-10-31',0.00),(7,4,1,'2014-10-29',100.00),(8,3,1,'2014-11-01',0.00),(9,2,10,'2014-11-03',0.00),(10,20,10,'2014-11-01',25.00),(11,21,4,'2014-11-05',0.00),(12,22,15,'2014-11-15',0.00),(13,23,3000,'2014-11-10',0.00),(14,24,3001,'2014-10-31',0.00),(15,100,1,'2014-10-29',25.00),(16,101,4,'2014-10-31',0.00),(17,102,10,'2014-10-29',50.00),(18,103,10,'2014-11-01',0.00),(19,104,10,'2014-11-03',0.00),(20,105,10,'2014-11-01',0.00),(21,10,4,'2014-12-05',50.00),(22,9,4,'2014-12-01',0.00),(23,8,15,'2014-12-03',0.00),(24,7,4,'2014-12-01',0.00),(25,12,15,'2014-12-05',0.00),(26,5,4,'2014-12-01',0.00),(27,4,15,'2014-12-03',100.00),(28,3,3000,'2014-12-01',0.00),(29,2,4,'2014-12-05',0.00),(30,20,15,'2014-12-01',25.00),(31,21,15,'2014-12-03',0.00),(32,22,3000,'2014-12-01',0.00),(33,23,3000,'2014-12-05',0.00),(34,24,3000,'2014-12-05',0.00),(35,100,3001,'2014-12-15',25.00),(36,101,3000,'2014-12-10',0.00),(37,102,3000,'2014-12-01',50.00),(38,103,3000,'2014-11-29',0.00),(39,104,3000,'2014-12-01',0.00),(40,105,3000,'2014-12-03',0.00);
/*!40000 ALTER TABLE `guest_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-01 16:08:56
