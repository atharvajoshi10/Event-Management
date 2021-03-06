-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Event_Management
-- ------------------------------------------------------
-- Server version	10.4.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `event_communication`
--

DROP TABLE IF EXISTS `event_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_communication` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL,
  KEY `fk4` (`event_id`),
  CONSTRAINT `fk4` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_communication`
--

LOCK TABLES `event_communication` WRITE;
/*!40000 ALTER TABLE `event_communication` DISABLE KEYS */;
INSERT INTO `event_communication` VALUES (19,'hello',1,0);
/*!40000 ALTER TABLE `event_communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_communication_history`
--

DROP TABLE IF EXISTS `event_communication_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_communication_history` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_communication_history`
--

LOCK TABLES `event_communication_history` WRITE;
/*!40000 ALTER TABLE `event_communication_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_communication_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_ledger`
--

DROP TABLE IF EXISTS `event_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_ledger` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_level` int(11) NOT NULL,
  `prev_status_level` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `username` (`username`),
  CONSTRAINT `event_ledger_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_ledger`
--

LOCK TABLES `event_ledger` WRITE;
/*!40000 ALTER TABLE `event_ledger` DISABLE KEYS */;
INSERT INTO `event_ledger` VALUES (19,'A','A','aj10',3,3,'2019-10-23','2019-10-24'),(20,'8','8','aj10',3,3,'2019-10-23','2019-11-01'),(21,'1','1','aj10',3,3,'2019-10-23','2019-11-01'),(22,'2','2','aj10',5,5,'2019-10-23','2019-11-08');
/*!40000 ALTER TABLE `event_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_ledger_history`
--

DROP TABLE IF EXISTS `event_ledger_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_ledger_history` (
  `event_id` int(11) NOT NULL DEFAULT 0,
  `event_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_level` int(11) NOT NULL,
  `prev_status_level` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_ledger_history`
--

LOCK TABLES `event_ledger_history` WRITE;
/*!40000 ALTER TABLE `event_ledger_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_ledger_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc_ledger`
--

DROP TABLE IF EXISTS `misc_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misc_ledger` (
  `event_id` int(11) DEFAULT NULL,
  `permission_type` int(11) DEFAULT NULL,
  `req_start` date NOT NULL,
  `req_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_status` int(11) DEFAULT NULL,
  `req_end` date NOT NULL,
  KEY `event_id` (`event_id`),
  CONSTRAINT `misc_ledger_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc_ledger`
--

LOCK TABLES `misc_ledger` WRITE;
/*!40000 ALTER TABLE `misc_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `misc_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc_ledger_history`
--

DROP TABLE IF EXISTS `misc_ledger_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misc_ledger_history` (
  `event_id` int(11) DEFAULT NULL,
  `request_number` int(11) NOT NULL,
  `req_start` date NOT NULL,
  `req_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_category` int(11) NOT NULL,
  `req_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc_ledger_history`
--

LOCK TABLES `misc_ledger_history` WRITE;
/*!40000 ALTER TABLE `misc_ledger_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `misc_ledger_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES ('CSI',1);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_communication`
--

DROP TABLE IF EXISTS `resource_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_communication` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL,
  KEY `fk12` (`event_id`),
  CONSTRAINT `fk12` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_communication`
--

LOCK TABLES `resource_communication` WRITE;
/*!40000 ALTER TABLE `resource_communication` DISABLE KEYS */;
INSERT INTO `resource_communication` VALUES (19,'Permissin Granted : Best Of Luck !',1,1),(20,'You can go ahead ! I am with you !',1,1),(19,'Please Select Another set of rooms for your event',2,1),(19,'Please Select Another set of rooms for your event',2,1),(20,'Permissin Granted : Best Of Luck !',2,1),(20,'nice work bois',3,0),(20,'k',4,0),(20,'r',5,0),(20,'u',6,0),(20,'a',7,0),(20,'Please Select Another set of rooms for your event',1,1),(21,'Please Select Another set of rooms for your event',1,1),(22,'You can go ahead ! I am with you !',1,1);
/*!40000 ALTER TABLE `resource_communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_communication_history`
--

DROP TABLE IF EXISTS `resource_communication_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_communication_history` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_communication_history`
--

LOCK TABLES `resource_communication_history` WRITE;
/*!40000 ALTER TABLE `resource_communication_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_communication_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_computers` int(11) NOT NULL,
  `projector_support` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `emp_incharge` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'mllab',20,0,20,'Mr.Kambale Sir'),(2,'classroom-201',20,1,50,'Mr.Murumkar Sir'),(3,'classroom-301',20,1,50,'Mr.Patil Sir'),(4,'classroom-401',20,1,50,'Mr.Bansod Sir'),(5,'IT-Seminar Hall',200,3,2,'Mrs.Jagdale Ma\'am'),(6,'CS-Seminar Hall',200,3,2,'Mrs.Joshi Ma\'am'),(7,'ENTC-Seminar Hall',500,1,1,'Mr.Jadhav Sir'),(8,'Auditorium',1000,5,4,'Mr.Pande Sir'),(9,'Ground',1000,0,0,'Mr.Dhoni Sir');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_acknowledgement`
--

DROP TABLE IF EXISTS `security_acknowledgement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_acknowledgement` (
  `event_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL,
  KEY `fk13` (`event_id`),
  CONSTRAINT `fk13` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_acknowledgement`
--

LOCK TABLES `security_acknowledgement` WRITE;
/*!40000 ALTER TABLE `security_acknowledgement` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_acknowledgement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_acknowledgement_history`
--

DROP TABLE IF EXISTS `security_acknowledgement_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_acknowledgement_history` (
  `event_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_acknowledgement_history`
--

LOCK TABLES `security_acknowledgement_history` WRITE;
/*!40000 ALTER TABLE `security_acknowledgement_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_acknowledgement_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slots_and_details`
--

DROP TABLE IF EXISTS `slots_and_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slots_and_details` (
  `event_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status_level` int(11) NOT NULL,
  `prev_status_level` int(11) NOT NULL,
  `purpose` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose_explained` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_slot` int(11) DEFAULT NULL,
  KEY `fk1` (`room_id`),
  KEY `fk3` (`event_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `fk3` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots_and_details`
--

LOCK TABLES `slots_and_details` WRITE;
/*!40000 ALTER TABLE `slots_and_details` DISABLE KEYS */;
INSERT INTO `slots_and_details` VALUES (22,3,1,1,'3 ','',1);
/*!40000 ALTER TABLE `slots_and_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pratham`@`localhost`*/ /*!50003 trigger update_status_4
  after insert
  on slots_and_details for each row
  begin
  update `event_ledger` set status_level=4 where event_id=NEW.event_id;
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `slots_and_details_history`
--

DROP TABLE IF EXISTS `slots_and_details_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slots_and_details_history` (
  `event_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status_level` int(11) NOT NULL,
  `prev_status_level` int(11) NOT NULL,
  `purpose` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose_explained` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_slot_start` time NOT NULL,
  `time_slot_end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots_and_details_history`
--

LOCK TABLES `slots_and_details_history` WRITE;
/*!40000 ALTER TABLE `slots_and_details_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `slots_and_details_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `id` int(11) DEFAULT NULL,
  `t` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_level` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` int(11) DEFAULT NULL,
  `email_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('aj10','aj10',1,'Atharva',1,'ayhu@.com'),('ap','ap',1,'Ayushi',1,'122@.com'),('hod','1',3,'MOD',1,'ayhu@.com'),('princi','princi',2,'princi',1,'ema@.com'),('test','test123',1,'test',1,'as@.com'),('test1','test',1,'test',1,'@.com');
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

-- Dump completed on 2019-10-23  0:01:02
