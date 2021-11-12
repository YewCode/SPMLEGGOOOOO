-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: spmproject
-- ------------------------------------------------------
-- Server version       8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0                                                                                                */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `ClassID` int NOT NULL,
  `CourseID` int NOT NULL,
  `Capacity` int NOT NULL,
  `ClassTime` varchar(50) NOT NULL,
  PRIMARY KEY (`CourseID`,`ClassID`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,1,20,'Thursday 12:00pm'),(2,1,30,'Thursday 3:15pm'                                                                                               ),(1,2,30,'Monday 8:15am'),(1,3,15,'Friday 11:30am');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_trainer`
--

DROP TABLE IF EXISTS `class_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_trainer` (
  `ClassID` int NOT NULL,
  `EID` int NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`EID`,`ClassID`,`CourseID`),
  KEY `CourseID` (`CourseID`,`ClassID`),
  CONSTRAINT `class_trainer_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`                                                                                               EngineerID`),
  CONSTRAINT `class_trainer_ibfk_2` FOREIGN KEY (`CourseID`, `ClassID`) REFERENC                                                                                               ES `class` (`CourseID`, `ClassID`),
  CONSTRAINT `class_trainer_ibfk_3` FOREIGN KEY (`CourseID`) REFERENCES `course`                                                                                                (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_trainer`
--

LOCK TABLES `class_trainer` WRITE;
/*!40000 ALTER TABLE `class_trainer` DISABLE KEYS */;
INSERT INTO `class_trainer` VALUES (1,2,1),(2,2,1),(1,3,2);
/*!40000 ALTER TABLE `class_trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CID` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(100) NOT NULL,
  `courseDescription` varchar(500) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `courseImg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai                                                                                               _ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Engineering 101','This is clearly a course all a                                                                                               bout electricity. Eventually you will become electricman.','2021-11-23','2022-11                                                                                               -23','images/electronics101.jpg'),(2,'Thermodynamics','This is a module that eve                                                                                               ry engineer hates but is absoultely useful in the long term, just ask around','2                                                                                               021-11-05','2022-11-05','images/thermo.png'),(3,'Materials and Structures','This                                                                                                course focuses on the development and the optimization of materials, processes,                                                                                                and devices used for operations in extreme environments and special application                                                                                               s.','2021-11-10','2021-11-11','images/materials.jpg'),(4,'Engineering Basic','Th                                                                                               is is clearly a course all about electricity. Eventually you will become electri                                                                                               cman.','2020-10-23','2021-10-23','images/basics.jpg');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_completed`
--

DROP TABLE IF EXISTS `course_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_completed` (
  `CID` int NOT NULL,
  `EID` int NOT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`),
  CONSTRAINT `course_completed_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer`                                                                                                (`EngineerID`),
  CONSTRAINT `course_completed_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (                                                                                               `CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_completed`
--

LOCK TABLES `course_completed` WRITE;
/*!40000 ALTER TABLE `course_completed` DISABLE KEYS */;
INSERT INTO `course_completed` VALUES (4,1);
/*!40000 ALTER TABLE `course_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_enrolled`
--

DROP TABLE IF EXISTS `course_enrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_enrolled` (
  `CID` int NOT NULL,
  `EID` int NOT NULL,
  `active` int DEFAULT NULL,
  `ClassID` int DEFAULT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`),
  CONSTRAINT `course_enrolled_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer`                                                                                                (`EngineerID`),
  CONSTRAINT `course_enrolled_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`                                                                                               CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_enrolled`
--

LOCK TABLES `course_enrolled` WRITE;
/*!40000 ALTER TABLE `course_enrolled` DISABLE KEYS */;
INSERT INTO `course_enrolled` VALUES (1,1,1,1),(2,1,1,1),(4,1,0,1),(2,2,1,1),(1,                                                                                               3,1,1),(2,4,1,1),(1,5,1,1),(1,6,1,1);
/*!40000 ALTER TABLE `course_enrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_enrollmentpending`
--

DROP TABLE IF EXISTS `course_enrollmentpending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_enrollmentpending` (
  `CID` int NOT NULL,
  `EID` int NOT NULL,
  `active` int DEFAULT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`),
  CONSTRAINT `course_enrollmentpending_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `e                                                                                               ngineer` (`EngineerID`),
  CONSTRAINT `course_enrollmentpending_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `c                                                                                               ourse` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_enrollmentpending`
--

LOCK TABLES `course_enrollmentpending` WRITE;
/*!40000 ALTER TABLE `course_enrollmentpending` DISABLE KEYS */;
INSERT INTO `course_enrollmentpending` VALUES (1,1,0),(2,1,0),(4,1,0);
/*!40000 ALTER TABLE `course_enrollmentpending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_trainer`
--

DROP TABLE IF EXISTS `course_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_trainer` (
  `CID` int NOT NULL,
  `EID` int NOT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`),
  CONSTRAINT `course_trainer_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (                                                                                               `EngineerID`),
  CONSTRAINT `course_trainer_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`C                                                                                               ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_trainer`
--

LOCK TABLES `course_trainer` WRITE;
/*!40000 ALTER TABLE `course_trainer` DISABLE KEYS */;
INSERT INTO `course_trainer` VALUES (1,2),(2,3);
/*!40000 ALTER TABLE `course_trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engineer` (
  `EngineerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(100) NOT NULL,
  PRIMARY KEY (`EngineerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai                                                                                               _ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineer`
--

LOCK TABLES `engineer` WRITE;
/*!40000 ALTER TABLE `engineer` DISABLE KEYS */;
INSERT INTO `engineer` VALUES (1,'Ben Lim','Engineer'),(2,'John Tan','Senior Eng                                                                                               ineer'),(3,'May Chan','Senior Engineer'),(4,'Tiffany Lim','Engineer'),(5,'Alice                                                                                                Chong','Engineer'),(6,'Bob Chang','Engineer');
/*!40000 ALTER TABLE `engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisites`
--

DROP TABLE IF EXISTS `prerequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prerequisites` (
  `prerequisites_CID` int NOT NULL,
  `for_CID` int NOT NULL,
  PRIMARY KEY (`prerequisites_CID`,`for_CID`),
  KEY `for_CID` (`for_CID`),
  CONSTRAINT `prerequisites_ibfk_1` FOREIGN KEY (`prerequisites_CID`) REFERENCES                                                                                                `course` (`CID`),
  CONSTRAINT `prerequisites_ibfk_2` FOREIGN KEY (`for_CID`) REFERENCES `course`                                                                                                (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisites`
--

LOCK TABLES `prerequisites` WRITE;
/*!40000 ALTER TABLE `prerequisites` DISABLE KEYS */;
INSERT INTO `prerequisites` VALUES (4,1);
/*!40000 ALTER TABLE `prerequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progress` (
  `progressid` int NOT NULL AUTO_INCREMENT,
  `EngineerID` int NOT NULL,
  `QuizID` int DEFAULT NULL,
  `ProgressStatus` varchar(50) DEFAULT NULL,
  `materialid` int DEFAULT NULL,
  `QuizScore` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`progressid`),
  KEY `QuizID` (`QuizID`),
  KEY `materialid` (`materialid`),
  CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID                                                                                               `),
  CONSTRAINT `progress_ibfk_2` FOREIGN KEY (`materialid`) REFERENCES `training_m                                                                                               aterials` (`materialid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_a                                                                                               i_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (9,1,NULL,'Open',32,NULL);
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualification` (
  `EID` int NOT NULL,
  `CID` int NOT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`),
  CONSTRAINT `qualification_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`                                                                                               EngineerID`),
  CONSTRAINT `qualification_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CI                                                                                               D`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification`
--

LOCK TABLES `qualification` WRITE;
/*!40000 ALTER TABLE `qualification` DISABLE KEYS */;
INSERT INTO `qualification` VALUES (2,2),(3,2);
/*!40000 ALTER TABLE `qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `QuizID` int NOT NULL,
  `QnNum` int NOT NULL,
  `Qn_type` varchar(100) NOT NULL,
  `Qn_Description` varchar(250) DEFAULT NULL,
  `options` varchar(1000) DEFAULT NULL,
  `answer` varchar(100) NOT NULL,
  PRIMARY KEY (`QuizID`,`QnNum`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID                                                                                               `)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'MCQ','Which of the Following are the Design                                                                                                Process in order?','\"\'Ask Research Imagine Research Plan Improve\',\'Ask Imagi                                                                                               ne Improve Research Plan\',\'Ask Research Imagine Plan Improve\'\"','\'Ask Resea                                                                                               rch Imagine Plan Improve\''),(1,2,'T/F','Carbon arc lamps need frequent adjustme                                                                                               nt and replacement of carbon rod.','\"\'True\',\'False\'\"','\'True\''),(1,3,'mc                                                                                               q','What is Newton\'s 3rd Law of Motion?','Law of Motion,Law of Lotion,Law of Tr                                                                                               ojan','Law of Motion'),(2,1,'mcq','What is  1+2','1,2,3','3'),(2,2,'tf','Is the                                                                                                earth flat?','True,False','True'),(2,3,'tf','This is the best quiz ever','True,F                                                                                               alse','True'),(2,4,'mcq','What is the best module ever','SPM,IS111,IS110','SPM')                                                                                               ,(3,1,'mcq','What is 1 + 2','1,2,3','3'),(3,2,'tf','Is the earth flat','True,Fal                                                                                               se','False'),(5,1,'mcq','What is 1 + 2','1,2 ,3','3'),(5,2,'tf','Is the earth fl                                                                                               at','True,False','False '),(6,1,'mcq','What is 1 + 2','1,2,3','3'),(6,2,'tf','Is                                                                                                the earth flat','True,False','False');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `QuizID` int NOT NULL AUTO_INCREMENT,
  `CourseID` int DEFAULT NULL,
  `ClassID` int NOT NULL,
  `SectionID` int NOT NULL,
  `quiz_name` varchar(50) DEFAULT NULL,
  `Timelimit` varchar(50) DEFAULT NULL,
  `isHidden` int DEFAULT NULL,
  `passing_requirements` decimal(10,2) DEFAULT NULL,
  `isGraded` int DEFAULT NULL,
  `grades` int DEFAULT NULL,
  PRIMARY KEY (`QuizID`,`ClassID`,`SectionID`),
  KEY `CourseID` (`CourseID`,`ClassID`),
  KEY `SectionID` (`SectionID`),
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`CourseID`, `ClassID`) REFERENCES `class                                                                                               ` (`CourseID`, `ClassID`),
  CONSTRAINT `quiz_ibfk_2` FOREIGN KEY (`SectionID`) REFERENCES `section` (`Sect                                                                                               ionID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai                                                                                               _ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,1,1,1,'Class 1 Section 1 Quiz','10',0,60.00,NULL,NU                                                                                               LL),(2,1,1,2,'Intro to programming','15',0,80.00,NULL,NULL),(3,1,1,3,'Intro to E                                                                                               lectricity','15',0,80.00,NULL,NULL),(4,1,1,4,'intro','10',0,80.00,NULL,NULL),(5,                                                                                               1,1,5,'Test 2','15',0,80.00,NULL,NULL),(6,1,1,6,'Intro to SPM','10',0,80.00,NULL                                                                                               ,NULL);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_attempt`
--

DROP TABLE IF EXISTS `quiz_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_attempt` (
  `EngineerID` int NOT NULL,
  `QuizID` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `Attemptid` int NOT NULL,
  `QnNum` int NOT NULL,
  `given_answer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `QuizID` (`QuizID`,`QnNum`),
  KEY `EngineerID` (`EngineerID`),
  CONSTRAINT `quiz_attempt_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`Qu                                                                                               izID`),
  CONSTRAINT `quiz_attempt_ibfk_2` FOREIGN KEY (`EngineerID`) REFERENCES `engine                                                                                               er` (`EngineerID`),
  CONSTRAINT `quiz_attempt_ibfk_3` FOREIGN KEY (`QuizID`, `QnNum`) REFERENCES `q                                                                                               uestion` (`QuizID`, `QnNum`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_a                                                                                               i_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_attempt`
--

LOCK TABLES `quiz_attempt` WRITE;
/*!40000 ALTER TABLE `quiz_attempt` DISABLE KEYS */;
INSERT INTO `quiz_attempt` VALUES (1,1,3,1,2,'True'),(1,1,4,1,1,'Ask Imagine Imp                                                                                               rove Research Plan'),(1,1,5,2,1,'Ask Imagine Improve Research Plan'),(1,1,6,2,2,                                                                                               'False'),(1,2,7,1,4,'SPM'),(1,2,8,1,1,'1'),(1,2,9,1,2,'True'),(1,2,10,1,3,'True'                                                                                               ),(1,2,11,2,3,'True'),(1,2,12,2,2,'True'),(1,2,13,2,1,'3'),(1,2,14,2,4,'SPM'),(1                                                                                               ,3,15,1,2,'False'),(1,3,16,1,1,'3'),(1,1,17,1,3,'Law of Motion'),(1,5,18,1,2,'Fa                                                                                               lse'),(1,5,19,1,1,'3'),(1,6,20,1,1,'3'),(1,6,21,1,2,'False');
/*!40000 ALTER TABLE `quiz_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `SectionID` int NOT NULL,
  `ClassID` int NOT NULL,
  `CourseID` int NOT NULL,
  `SectionName` varchar(100) NOT NULL,
  `End_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`SectionID`,`ClassID`,`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,1,1,'Section 1',NULL),(1,1,2,'Section 1',NULL),(                                                                                               2,1,1,'Section 2',NULL),(3,1,1,'Section 3',NULL),(4,1,1,'Section 4',NULL),(5,1,1                                                                                               ,'Section 5',NULL),(6,1,1,'Section 6',NULL);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_materials`
--

DROP TABLE IF EXISTS `training_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_materials` (
  `materialid` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(50) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `isHidden` int DEFAULT NULL,
  `ClassID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `SectionID` int DEFAULT NULL,
  PRIMARY KEY (`materialid`),
  KEY `CourseID` (`CourseID`,`ClassID`),
  KEY `SectionID` (`SectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_a                                                                                               i_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_materials`
--

LOCK TABLES `training_materials` WRITE;
/*!40000 ALTER TABLE `training_materials` DISABLE KEYS */;
INSERT INTO `training_materials` VALUES (26,NULL,'https://www.youtube.com/embed/                                                                                               btGYcizV0iI',0,1,1,1),(27,NULL,'https://www.youtube.com/embed/NyOYW07-L5g',0,1,1                                                                                               ,1),(28,NULL,'https://www.youtube.com/embed/btGYcizV0iI',0,1,1,2),(29,NULL,'http                                                                                               s://www.youtube.com/embed/-xbtnz4wdaA',0,1,1,1),(30,NULL,'https://www.youtube.co                                                                                               m/embed/uTWHMchUlws',0,1,1,3),(31,'20211112-015526_Introducing to Electricity.do                                                                                               cx',NULL,0,1,1,1),(32,'20211112-020648_Introduction.docx',NULL,0,1,1,1);
/*!40000 ALTER TABLE `training_materials` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-12  8:05:22
ubuntu@ip-172-31-23-216:~$ ls
data-dump.sql  files  main.py
ubuntu@ip-172-31-23-216:~$ sudo mysqldump  -p spmproject < data-dump.sql
Enter password:
-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: spmproject
-- ------------------------------------------------------
-- Server version       8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `ClassID` int NOT NULL,
  `CourseID` int NOT NULL,
  `Capacity` int NOT NULL,
  `ClassTime` varchar(50) NOT NULL,
  PRIMARY KEY (`CourseID`,`ClassID`),
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,1,20,'Thursday 12:00pm'),(2,1,30,'Thursday 3:15pm'),(1,2,30,'Monday 8:15am'),(1,3,15,'Friday 11:30am');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_trainer`
--

DROP TABLE IF EXISTS `class_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_trainer` (
  `ClassID` int NOT NULL,
  `EID` int NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`EID`,`ClassID`,`CourseID`),
  KEY `CourseID` (`CourseID`,`ClassID`),
  CONSTRAINT `class_trainer_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  CONSTRAINT `class_trainer_ibfk_2` FOREIGN KEY (`CourseID`, `ClassID`) REFERENCES `class` (`CourseID`, `ClassID`),
  CONSTRAINT `class_trainer_ibfk_3` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_trainer`
--

LOCK TABLES `class_trainer` WRITE;
/*!40000 ALTER TABLE `class_trainer` DISABLE KEYS */;
INSERT INTO `class_trainer` VALUES (1,2,1),(2,2,1),(1,3,2);
/*!40000 ALTER TABLE `class_trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CID` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(100) NOT NULL,
  `courseDescription` varchar(500) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `courseImg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Engineering 101','This is clearly a course all about electricity. Eventually you will become electricman.','2021-11-23','2022-11-23','images/electronics101.jpg'),(2,'Thermodynamics','This is a module that every engineer hates but is absoultely useful in the long term, just ask around','2021-11-05','2022-11-05','images/thermo.png'),(3,'Materials and Structures','This course focuses on the development and the optimization of materials, processes, and devices used for operations in extreme environments and special applications.','2021-11-10','2021-11-11','images/materials.jpg'),(4,'Engineering Basic','This is clearly a course all about electricity. Eventually you will become electricman.','2020-10-23','2021-10-23','images/basics.jpg');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_completed`
--

DROP TABLE IF EXISTS `course_completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_completed` (
  `CID` int NOT NULL,
  `EID` int NOT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`),
  CONSTRAINT `course_completed_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  CONSTRAINT `course_completed_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_completed`
--

LOCK TABLES `course_completed` WRITE;
/*!40000 ALTER TABLE `course_completed` DISABLE KEYS */;
INSERT INTO `course_completed` VALUES (4,1);
/*!40000 ALTER TABLE `course_completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_enrolled`
--

DROP TABLE IF EXISTS `course_enrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_enrolled` (
  `CID` int NOT NULL,
  `EID` int NOT NULL,
  `active` int DEFAULT NULL,
  `ClassID` int DEFAULT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`),
  CONSTRAINT `course_enrolled_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  CONSTRAINT `course_enrolled_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_enrolled`
--

LOCK TABLES `course_enrolled` WRITE;
/*!40000 ALTER TABLE `course_enrolled` DISABLE KEYS */;
INSERT INTO `course_enrolled` VALUES (1,1,1,1),(2,1,1,1),(4,1,0,1),(2,2,1,1),(1,3,1,1),(2,4,1,1),(1,5,1,1),(1,6,1,1);
/*!40000 ALTER TABLE `course_enrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_enrollmentpending`
--

DROP TABLE IF EXISTS `course_enrollmentpending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_enrollmentpending` (
  `CID` int NOT NULL,
  `EID` int NOT NULL,
  `active` int DEFAULT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`),
  CONSTRAINT `course_enrollmentpending_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  CONSTRAINT `course_enrollmentpending_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_enrollmentpending`
--

LOCK TABLES `course_enrollmentpending` WRITE;
/*!40000 ALTER TABLE `course_enrollmentpending` DISABLE KEYS */;
INSERT INTO `course_enrollmentpending` VALUES (1,1,0),(2,1,0),(4,1,0);
/*!40000 ALTER TABLE `course_enrollmentpending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_trainer`
--

DROP TABLE IF EXISTS `course_trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_trainer` (
  `CID` int NOT NULL,
  `EID` int NOT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`),
  CONSTRAINT `course_trainer_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  CONSTRAINT `course_trainer_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_trainer`
--

LOCK TABLES `course_trainer` WRITE;
/*!40000 ALTER TABLE `course_trainer` DISABLE KEYS */;
INSERT INTO `course_trainer` VALUES (1,2),(2,3);
/*!40000 ALTER TABLE `course_trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engineer` (
  `EngineerID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(100) NOT NULL,
  PRIMARY KEY (`EngineerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineer`
--

LOCK TABLES `engineer` WRITE;
/*!40000 ALTER TABLE `engineer` DISABLE KEYS */;
INSERT INTO `engineer` VALUES (1,'Ben Lim','Engineer'),(2,'John Tan','Senior Engineer'),(3,'May Chan','Senior Engineer'),(4,'Tiffany Lim','Engineer'),(5,'Alice Chong','Engineer'),(6,'Bob Chang','Engineer');
/*!40000 ALTER TABLE `engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisites`
--

DROP TABLE IF EXISTS `prerequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prerequisites` (
  `prerequisites_CID` int NOT NULL,
  `for_CID` int NOT NULL,
  PRIMARY KEY (`prerequisites_CID`,`for_CID`),
  KEY `for_CID` (`for_CID`),
  CONSTRAINT `prerequisites_ibfk_1` FOREIGN KEY (`prerequisites_CID`) REFERENCES `course` (`CID`),
  CONSTRAINT `prerequisites_ibfk_2` FOREIGN KEY (`for_CID`) REFERENCES `course` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisites`
--

LOCK TABLES `prerequisites` WRITE;
/*!40000 ALTER TABLE `prerequisites` DISABLE KEYS */;
INSERT INTO `prerequisites` VALUES (4,1);
/*!40000 ALTER TABLE `prerequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progress` (
  `progressid` int NOT NULL AUTO_INCREMENT,
  `EngineerID` int NOT NULL,
  `QuizID` int DEFAULT NULL,
  `ProgressStatus` varchar(50) DEFAULT NULL,
  `materialid` int DEFAULT NULL,
  `QuizScore` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`progressid`),
  KEY `QuizID` (`QuizID`),
  KEY `materialid` (`materialid`),
  CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`),
  CONSTRAINT `progress_ibfk_2` FOREIGN KEY (`materialid`) REFERENCES `training_materials` (`materialid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress`
--

LOCK TABLES `progress` WRITE;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` VALUES (9,1,NULL,'Open',32,NULL);
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualification` (
  `EID` int NOT NULL,
  `CID` int NOT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`),
  CONSTRAINT `qualification_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  CONSTRAINT `qualification_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification`
--

LOCK TABLES `qualification` WRITE;
/*!40000 ALTER TABLE `qualification` DISABLE KEYS */;
INSERT INTO `qualification` VALUES (2,2),(3,2);
/*!40000 ALTER TABLE `qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `QuizID` int NOT NULL,
  `QnNum` int NOT NULL,
  `Qn_type` varchar(100) NOT NULL,
  `Qn_Description` varchar(250) DEFAULT NULL,
  `options` varchar(1000) DEFAULT NULL,
  `answer` varchar(100) NOT NULL,
  PRIMARY KEY (`QuizID`,`QnNum`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'MCQ','Which of the Following are the Design Process in order?','\"\'Ask Research Imagine Research Plan Improve\',\'Ask Imagine Improve Research Plan\',\'Ask Research Imagine Plan Improve\'\"','\'Ask Research Imagine Plan Improve\''),(1,2,'T/F','Carbon arc lamps need frequent adjustment and replacement of carbon rod.','\"\'True\',\'False\'\"','\'True\''),(1,3,'mcq','What is Newton\'s 3rd Law of Motion?','Law of Motion,Law of Lotion,Law of Trojan','Law of Motion'),(2,1,'mcq','What is  1+2','1,2,3','3'),(2,2,'tf','Is the earth flat?','True,False','True'),(2,3,'tf','This is the best quiz ever','True,False','True'),(2,4,'mcq','What is the best module ever','SPM,IS111,IS110','SPM'),(3,1,'mcq','What is 1 + 2','1,2,3','3'),(3,2,'tf','Is the earth flat','True,False','False'),(5,1,'mcq','What is 1 + 2','1,2 ,3','3'),(5,2,'tf','Is the earth flat','True,False','False '),(6,1,'mcq','What is 1 + 2','1,2,3','3'),(6,2,'tf','Is the earth flat','True,False','False');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `QuizID` int NOT NULL AUTO_INCREMENT,
  `CourseID` int DEFAULT NULL,
  `ClassID` int NOT NULL,
  `SectionID` int NOT NULL,
  `quiz_name` varchar(50) DEFAULT NULL,
  `Timelimit` varchar(50) DEFAULT NULL,
  `isHidden` int DEFAULT NULL,
  `passing_requirements` decimal(10,2) DEFAULT NULL,
  `isGraded` int DEFAULT NULL,
  `grades` int DEFAULT NULL,
  PRIMARY KEY (`QuizID`,`ClassID`,`SectionID`),
  KEY `CourseID` (`CourseID`,`ClassID`),
  KEY `SectionID` (`SectionID`),
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`CourseID`, `ClassID`) REFERENCES `class` (`CourseID`, `ClassID`),
  CONSTRAINT `quiz_ibfk_2` FOREIGN KEY (`SectionID`) REFERENCES `section` (`SectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,1,1,1,'Class 1 Section 1 Quiz','10',0,60.00,NULL,NULL),(2,1,1,2,'Intro to programming','15',0,80.00,NULL,NULL),(3,1,1,3,'Intro to Electricity','15',0,80.00,NULL,NULL),(4,1,1,4,'intro','10',0,80.00,NULL,NULL),(5,1,1,5,'Test 2','15',0,80.00,NULL,NULL),(6,1,1,6,'Intro to SPM','10',0,80.00,NULL,NULL);
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_attempt`
--

DROP TABLE IF EXISTS `quiz_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_attempt` (
  `EngineerID` int NOT NULL,
  `QuizID` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `Attemptid` int NOT NULL,
  `QnNum` int NOT NULL,
  `given_answer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `QuizID` (`QuizID`,`QnNum`),
  KEY `EngineerID` (`EngineerID`),
  CONSTRAINT `quiz_attempt_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`),
  CONSTRAINT `quiz_attempt_ibfk_2` FOREIGN KEY (`EngineerID`) REFERENCES `engineer` (`EngineerID`),
  CONSTRAINT `quiz_attempt_ibfk_3` FOREIGN KEY (`QuizID`, `QnNum`) REFERENCES `question` (`QuizID`, `QnNum`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_attempt`
--

LOCK TABLES `quiz_attempt` WRITE;
/*!40000 ALTER TABLE `quiz_attempt` DISABLE KEYS */;
INSERT INTO `quiz_attempt` VALUES (1,1,3,1,2,'True'),(1,1,4,1,1,'Ask Imagine Improve Research Plan'),(1,1,5,2,1,'Ask Imagine Improve Research Plan'),(1,1,6,2,2,'False'),(1,2,7,1,4,'SPM'),(1,2,8,1,1,'1'),(1,2,9,1,2,'True'),(1,2,10,1,3,'True'),(1,2,11,2,3,'True'),(1,2,12,2,2,'True'),(1,2,13,2,1,'3'),(1,2,14,2,4,'SPM'),(1,3,15,1,2,'False'),(1,3,16,1,1,'3'),(1,1,17,1,3,'Law of Motion'),(1,5,18,1,2,'False'),(1,5,19,1,1,'3'),(1,6,20,1,1,'3'),(1,6,21,1,2,'False');
/*!40000 ALTER TABLE `quiz_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `SectionID` int NOT NULL,
  `ClassID` int NOT NULL,
  `CourseID` int NOT NULL,
  `SectionName` varchar(100) NOT NULL,
  `End_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`SectionID`,`ClassID`,`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,1,1,'Section 1',NULL),(1,1,2,'Section 1',NULL),(2,1,1,'Section 2',NULL),(3,1,1,'Section 3',NULL),(4,1,1,'Section 4',NULL),(5,1,1,'Section 5',NULL),(6,1,1,'Section 6',NULL);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_materials`
--

DROP TABLE IF EXISTS `training_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_materials` (
  `materialid` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(50) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `isHidden` int DEFAULT NULL,
  `ClassID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `SectionID` int DEFAULT NULL,
  PRIMARY KEY (`materialid`),
  KEY `CourseID` (`CourseID`,`ClassID`),
  KEY `SectionID` (`SectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_materials`
--

LOCK TABLES `training_materials` WRITE;
/*!40000 ALTER TABLE `training_materials` DISABLE KEYS */;
INSERT INTO `training_materials` VALUES (26,NULL,'https://www.youtube.com/embed/btGYcizV0iI',0,1,1,1),(27,NULL,'https://www.youtube.com/embed/NyOYW07-L5g',0,1,1,1),(28,NULL,'https://www.youtube.com/embed/btGYcizV0iI',0,1,1,2),(29,NULL,'https://www.youtube.com/embed/-xbtnz4wdaA',0,1,1,1),(30,NULL,'https://www.youtube.com/embed/uTWHMchUlws',0,1,1,3),(31,'20211112-015526_Introducing to Electricity.docx',NULL,0,1,1,1),(32,'20211112-020648_Introduction.docx',NULL,0,1,1,1);
/*!40000 ALTER TABLE `training_materials` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-12  8:07:06
