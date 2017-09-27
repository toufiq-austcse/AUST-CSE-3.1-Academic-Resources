-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: db_university
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advisor` (
  `s_id` char(12) NOT NULL,
  `i_id` char(12) NOT NULL,
  PRIMARY KEY (`s_id`),
  KEY `fk_advisor_2` (`i_id`),
  CONSTRAINT `fk_advisor_1` FOREIGN KEY (`s_id`) REFERENCES `student` (`ID`),
  CONSTRAINT `fk_advisor_2` FOREIGN KEY (`i_id`) REFERENCES `instructor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
INSERT INTO `advisor` VALUES ('15.01.06.118','001'),('15.01.04.118','003'),('15.01.04.117','004');
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classroom` (
  `building` char(1) NOT NULL,
  `room_no` char(4) NOT NULL,
  `capacity` int(3) DEFAULT NULL,
  PRIMARY KEY (`building`,`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES ('A','7A05',50),('A','7A06',60),('B','7B01',30),('B','7B07',40),('C','7C07',60);
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` char(7) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `credit` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `fk_course_1` (`dept_name`),
  CONSTRAINT `fk_course_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('CSE3103','Database','CSE',3.00),('CSE3104','Database Lab','CSE',1.50),('HUM3115','Economics and Accounting','HUM',3.00);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_name` varchar(50) NOT NULL,
  `building` char(1) NOT NULL,
  `budget` char(5) DEFAULT NULL,
  PRIMARY KEY (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('CE','C','10M'),('CSE','B','25M'),('EEE','A','20M'),('HUM','B','5M'),('ME','A','20M');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `ID` char(12) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `salary` int(7) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_instructor_1` (`dept_name`),
  CONSTRAINT `fk_instructor_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('001','Sujon Sarkar','CSE',200000),('003','Hasib Ahmed','CE',100000),('004','Fahim Ahmed','EEE',80000);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prereq` (
  `course_id` char(7) NOT NULL,
  `prereq_id` char(7) NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `fk_prereq_2` (`prereq_id`),
  CONSTRAINT `fk_prereq_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `fk_prereq_2` FOREIGN KEY (`prereq_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq`
--

LOCK TABLES `prereq` WRITE;
/*!40000 ALTER TABLE `prereq` DISABLE KEYS */;
INSERT INTO `prereq` VALUES ('CSE3104','CSE3103');
/*!40000 ALTER TABLE `prereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `course_id` char(7) NOT NULL,
  `sec_id` char(2) NOT NULL,
  `semester` int(1) NOT NULL,
  `year` int(1) NOT NULL,
  `building` char(1) DEFAULT NULL,
  `room_no` char(4) NOT NULL,
  `time_slot_id` char(10) NOT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`),
  KEY `fk_section_1` (`building`,`room_no`),
  KEY `fk_section_2` (`time_slot_id`),
  CONSTRAINT `fk_section_1` FOREIGN KEY (`building`, `room_no`) REFERENCES `classroom` (`building`, `room_no`),
  CONSTRAINT `fk_section_2` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`time_slot_id`),
  CONSTRAINT `fk_section_3` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('CSE3103','B2',1,3,'C','7C07','113001350'),('CSE3103','C2',1,3,'B','7B07','210501140'),('CSE3104','C1',1,3,'B','7B07','210501140');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `ID` char(12) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `dept_name` varchar(50) NOT NULL,
  `tot_cred` int(3) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_student_1` (`dept_name`),
  CONSTRAINT `fk_student_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('15.01.04.117','Rasheeq Zaman','CSE',160),('15.01.04.118','Amir Hamza','CSE',160),('15.01.06.118','Kifayet Shoumik','CE',140);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `takes` (
  `ID` char(12) NOT NULL,
  `course_id` char(7) NOT NULL,
  `sec_id` char(2) NOT NULL,
  `semester` int(1) NOT NULL,
  `year` int(1) NOT NULL,
  `grade` char(2) DEFAULT NULL,
  PRIMARY KEY (`ID`,`course_id`),
  KEY `fk_takes_1` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `fk_takes_1` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`),
  CONSTRAINT `fk_takes_2` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
INSERT INTO `takes` VALUES ('15.01.04.117','CSE3103','C2',1,3,'A'),('15.01.04.117','CSE3104','C1',1,3,'A'),('15.01.04.118','CSE3103','C2',1,3,'A');
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches` (
  `ID` char(12) NOT NULL,
  `course_id` char(7) NOT NULL,
  `sec_id` char(2) NOT NULL,
  `semester` int(1) NOT NULL,
  `year` int(1) NOT NULL,
  PRIMARY KEY (`ID`,`course_id`),
  KEY `fk_teaches_1` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `fk_teaches_1` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`),
  CONSTRAINT `fk_teaches_2` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES ('001','CSE3103','C2',1,3),('003','CSE3103','C2',1,3),('004','CSE3104','C1',1,3);
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_slot` (
  `time_slot_id` char(10) NOT NULL,
  `day` char(3) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`time_slot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` VALUES ('113001350','SUN','13:00:00','13:50:00'),('210001050','MON','10:00:00','10:50:00'),('210501140','MON','10:50:00','11:40:00'),('310001050','TUE','10:00:00','10:50:00');
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-06  1:40:09
