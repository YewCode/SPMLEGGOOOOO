-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 09, 2021 at 07:21 PM
-- Server version: 8.0.18
-- PHP Version: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spmproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `ClassID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `ClassTime` varchar(50) NOT NULL,
  PRIMARY KEY (`CourseID`,`ClassID`)
) ;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`ClassID`, `CourseID`, `Capacity`, `ClassTime`) VALUES
(1, 1, 20, 'Thursday 12:00pm'),
(2, 1, 30, 'Thursday 3:15pm'),
(1, 2, 30, 'Monday 8:15am'),
(1, 3, 15, 'Friday 11:30am');

-- --------------------------------------------------------

--
-- Table structure for table `class_trainer`
--

DROP TABLE IF EXISTS `class_trainer`;
CREATE TABLE IF NOT EXISTS `class_trainer` (
  `ClassID` int(11) NOT NULL,
  `EID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  PRIMARY KEY (`EID`,`ClassID`,`CourseID`),
  KEY `CourseID` (`CourseID`,`ClassID`)
) ;

--
-- Dumping data for table `class_trainer`
--

INSERT INTO `class_trainer` (`ClassID`, `EID`, `CourseID`) VALUES
(1, 2, 1),
(2, 2, 1),
(1, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(100) NOT NULL,
  `courseDescription` varchar(500) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `courseImg` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CID`, `courseName`, `courseDescription`, `StartDate`, `EndDate`, `courseImg`) VALUES
(1, 'Engineering 101', 'This is clearly a course all about electricity. Eventually you will become electricman.', '2021-11-23', '2022-11-23', 'images/electronics101.jpg'),
(2, 'Thermodynamics', 'This is a module that every engineer hates but is absoultely useful in the long term, just ask around', '2021-11-05', '2022-11-05', 'images/thermo.png'),
(3, 'Materials and Structures', 'This course focuses on the development and the optimization of materials, processes, and devices used for operations in extreme environments and special applications.', '2021-11-10', '2021-11-11', 'images/materials.jpg'),
(4, 'Engineering Basic', 'This is clearly a course all about electricity. Eventually you will become electricman.', '2020-10-23', '2021-10-23', 'images/basics.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `course_completed`
--

DROP TABLE IF EXISTS `course_completed`;
CREATE TABLE IF NOT EXISTS `course_completed` (
  `CID` int(11) NOT NULL,
  `EID` int(11) NOT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`)
) ;

--
-- Dumping data for table `course_completed`
--

INSERT INTO `course_completed` (`CID`, `EID`) VALUES
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `course_enrolled`
--

DROP TABLE IF EXISTS `course_enrolled`;
CREATE TABLE IF NOT EXISTS `course_enrolled` (
  `CID` int(11) NOT NULL,
  `EID` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`)
) ;

--
-- Dumping data for table `course_enrolled`
--

INSERT INTO `course_enrolled` (`CID`, `EID`, `active`, `ClassID`) VALUES
(1, 1, 1, NULL),
(2, 1, 1, NULL),
(1, 2, 1, 1),
(1, 6, 1, NULL),
(2, 6, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollmentpending`
--

DROP TABLE IF EXISTS `course_enrollmentpending`;
CREATE TABLE IF NOT EXISTS `course_enrollmentpending` (
  `CID` int(11) NOT NULL,
  `EID` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`)
) ;

--
-- Dumping data for table `course_enrollmentpending`
--

INSERT INTO `course_enrollmentpending` (`CID`, `EID`, `active`) VALUES
(1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `course_trainer`
--

DROP TABLE IF EXISTS `course_trainer`;
CREATE TABLE IF NOT EXISTS `course_trainer` (
  `CID` int(11) NOT NULL,
  `EID` int(11) NOT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`)
) ;

--
-- Dumping data for table `course_trainer`
--

INSERT INTO `course_trainer` (`CID`, `EID`) VALUES
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `engineer`
--

DROP TABLE IF EXISTS `engineer`;
CREATE TABLE IF NOT EXISTS `engineer` (
  `EngineerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(100) NOT NULL,
  PRIMARY KEY (`EngineerID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `engineer`
--

INSERT INTO `engineer` (`EngineerID`, `Name`, `Role`) VALUES
(1, 'Ben Lim', 'Engineer'),
(2, 'John Tan', 'Senior Engineer'),
(3, 'May Chan', 'Senior Engineer'),
(4, 'Tiffany Lim', 'Engineer'),
(5, 'Alice Chong', 'Engineer'),
(6, 'Bob Chang', 'Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `prerequisites`
--

DROP TABLE IF EXISTS `prerequisites`;
CREATE TABLE IF NOT EXISTS `prerequisites` (
  `prerequisites_CID` int(11) NOT NULL,
  `for_CID` int(11) NOT NULL,
  PRIMARY KEY (`prerequisites_CID`,`for_CID`),
  KEY `for_CID` (`for_CID`)
) ;

--
-- Dumping data for table `prerequisites`
--

INSERT INTO `prerequisites` (`prerequisites_CID`, `for_CID`) VALUES
(4, 1),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

DROP TABLE IF EXISTS `progress`;
CREATE TABLE IF NOT EXISTS `progress` (
  `SectionID` int(11) NOT NULL,
  `EngineerID` int(11) NOT NULL,
  `QuizID` int(11) NOT NULL,
  `ProgressStatus` varchar(50) DEFAULT NULL,
  `QuizScore` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`SectionID`,`EngineerID`,`QuizID`),
  KEY `EngineerID` (`EngineerID`),
  KEY `QuizID` (`QuizID`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `qualification`
--

DROP TABLE IF EXISTS `qualification`;
CREATE TABLE IF NOT EXISTS `qualification` (
  `EID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`)
) ;

--
-- Dumping data for table `qualification`
--

INSERT INTO `qualification` (`EID`, `CID`) VALUES
(2, 2),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `QuizID` int(11) NOT NULL,
  `QnNum` int(11) NOT NULL,
  `Qn_type` varchar(100) NOT NULL,
  `Qn_Description` varchar(250) DEFAULT NULL,
  `options` varchar(1000) DEFAULT NULL,
  `answer` varchar(100) NOT NULL,
  PRIMARY KEY (`QuizID`,`QnNum`)
) ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`QuizID`, `QnNum`, `Qn_type`, `Qn_Description`, `options`, `answer`) VALUES
(1, 1, 'MCQ', 'Which of the Following are the Design Process in order?', '\"\'Ask Research Imagine Research Plan Improve\',\'Ask Imagine Improve Research Plan\',\'Ask Research Imagine Plan Improve\'\"', '\'Ask Research Imagine Plan Improve\''),
(1, 2, 'T/F', 'Carbon arc lamps need frequent adjustment and replacement of carbon rod.', '\"\'True\',\'False\'\"', '\'True\'');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `QuizID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) DEFAULT NULL,
  `ClassID` int(11) NOT NULL,
  `SectionID` int(11) NOT NULL,
  `quiz_name` varchar(50) DEFAULT NULL,
  `Timelimit` varchar(50) DEFAULT NULL,
  `isHidden` int(11) DEFAULT NULL,
  `passing_requirements` decimal(10,2) DEFAULT NULL,
  `isGraded` int(11) DEFAULT NULL,
  `grades` int(11) DEFAULT NULL,
  PRIMARY KEY (`QuizID`,`ClassID`,`SectionID`),
  KEY `CourseID` (`CourseID`,`ClassID`),
  KEY `SectionID` (`SectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`QuizID`, `CourseID`, `ClassID`, `SectionID`, `quiz_name`, `Timelimit`, `isHidden`, `passing_requirements`, `isGraded`, `grades`) VALUES
(1, 1, 1, 1, 'Class 1 Section 1 Quiz', '10', 0, '60.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempt`
--

DROP TABLE IF EXISTS `quiz_attempt`;
CREATE TABLE IF NOT EXISTS `quiz_attempt` (
  `EngineerID` int(11) NOT NULL,
  `QuizID` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Attemptid` int(11) NOT NULL,
  `QnNum` int(11) NOT NULL,
  `given_answer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `QuizID` (`QuizID`,`QnNum`),
  KEY `EngineerID` (`EngineerID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quiz_attempt`
--

INSERT INTO `quiz_attempt` (`EngineerID`, `QuizID`, `id`, `Attemptid`, `QnNum`, `given_answer`) VALUES
(1, 1, 1, 1, 1, 'Ask Imagine Improve Research Plan'),
(1, 1, 2, 1, 2, 'True'),
(1, 1, 3, 1, 1, 'Ask Imagine Improve Research Plan'),
(1, 1, 4, 1, 2, 'True'),
(1, 1, 5, 1, 2, 'True'),
(1, 1, 6, 1, 1, 'Ask Imagine Improve Research Plan'),
(1, 1, 7, 2, 1, 'Ask Imagine Improve Research Plan'),
(1, 1, 8, 2, 2, 'True'),
(1, 1, 9, 3, 1, 'Ask Imagine Improve Research Plan'),
(1, 1, 10, 3, 2, 'True'),
(1, 1, 11, 4, 1, 'Ask Imagine Improve Research Plan'),
(1, 1, 12, 4, 2, 'True'),
(1, 1, 13, 5, 1, 'Ask Imagine Improve Research Plan'),
(1, 1, 14, 5, 2, 'True'),
(1, 1, 15, 6, 1, 'Ask Imagine Improve Research Plan'),
(1, 1, 16, 6, 2, 'True'),
(1, 1, 17, 7, 2, 'True'),
(1, 1, 18, 7, 1, 'Ask Imagine Improve Research Plan'),
(1, 1, 19, 8, 2, 'True'),
(1, 1, 20, 8, 1, 'Ask Imagine Improve Research Plan'),
(1, 1, 21, 9, 2, 'True'),
(1, 1, 22, 9, 1, 'Ask Imagine Improve Research Plan');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `SectionID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `SectionName` varchar(100) NOT NULL,
  `End_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`SectionID`,`ClassID`,`CourseID`)
) ;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`SectionID`, `ClassID`, `CourseID`, `SectionName`, `End_Date`) VALUES
(1, 1, 1, 'Section 1', NULL),
(2, 1, 1, 'Section 2', NULL),
(3, 1, 1, 'Section 3', NULL),
(4, 1, 1, 'Section 4', NULL),
(5, 1, 1, 'Section 5', NULL),
(6, 1, 1, 'Section 6', NULL),
(7, 1, 1, 'Section 7', NULL),
(8, 1, 1, 'Section 8', NULL),
(9, 1, 1, 'Section 9', NULL),
(10, 1, 1, 'Section 10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `training_materials`
--

DROP TABLE IF EXISTS `training_materials`;
CREATE TABLE IF NOT EXISTS `training_materials` (
  `materialid` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(50) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `isHidden` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `SectionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`materialid`),
  KEY `CourseID` (`CourseID`,`ClassID`),
  KEY `SectionID` (`SectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `training_materials`
--

INSERT INTO `training_materials` (`materialid`, `filename`, `url`, `isHidden`, `ClassID`, `CourseID`, `SectionID`) VALUES
(20, NULL, 'https://www.youtube.com/embed/btGYcizV0iI', 0, 1, 1, 1),
(21, '20211106-194624_Introduction.docx', NULL, 0, 1, 1, 1),
(22, '20211106-200127_Introducing to Electricity.docx', NULL, 0, 1, 1, 1),
(23, NULL, 'https://www.youtube.com/embed/ru032Mfsfig', 0, 1, 1, 1),
(24, '20211108-155134_Introducing to Electricity.docx', NULL, 0, 1, 1, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CID`);

--
-- Constraints for table `class_trainer`
--
ALTER TABLE `class_trainer`
  ADD CONSTRAINT `class_trainer_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  ADD CONSTRAINT `class_trainer_ibfk_2` FOREIGN KEY (`CourseID`,`ClassID`) REFERENCES `class` (`CourseID`, `ClassID`),
  ADD CONSTRAINT `class_trainer_ibfk_3` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CID`);

--
-- Constraints for table `course_completed`
--
ALTER TABLE `course_completed`
  ADD CONSTRAINT `course_completed_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  ADD CONSTRAINT `course_completed_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`);

--
-- Constraints for table `course_enrolled`
--
ALTER TABLE `course_enrolled`
  ADD CONSTRAINT `course_enrolled_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  ADD CONSTRAINT `course_enrolled_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`);

--
-- Constraints for table `course_enrollmentpending`
--
ALTER TABLE `course_enrollmentpending`
  ADD CONSTRAINT `course_enrollmentpending_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  ADD CONSTRAINT `course_enrollmentpending_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`);

--
-- Constraints for table `course_trainer`
--
ALTER TABLE `course_trainer`
  ADD CONSTRAINT `course_trainer_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  ADD CONSTRAINT `course_trainer_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`);

--
-- Constraints for table `prerequisites`
--
ALTER TABLE `prerequisites`
  ADD CONSTRAINT `prerequisites_ibfk_1` FOREIGN KEY (`prerequisites_CID`) REFERENCES `course` (`CID`),
  ADD CONSTRAINT `prerequisites_ibfk_2` FOREIGN KEY (`for_CID`) REFERENCES `course` (`CID`);

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`SectionID`) REFERENCES `section` (`SectionID`),
  ADD CONSTRAINT `progress_ibfk_2` FOREIGN KEY (`EngineerID`) REFERENCES `engineer` (`EngineerID`),
  ADD CONSTRAINT `progress_ibfk_3` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`);

--
-- Constraints for table `qualification`
--
ALTER TABLE `qualification`
  ADD CONSTRAINT `qualification_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  ADD CONSTRAINT `qualification_ibfk_2` FOREIGN KEY (`CID`) REFERENCES `course` (`CID`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`CourseID`,`ClassID`) REFERENCES `class` (`CourseID`, `ClassID`),
  ADD CONSTRAINT `quiz_ibfk_2` FOREIGN KEY (`SectionID`) REFERENCES `section` (`SectionID`);

--
-- Constraints for table `quiz_attempt`
--
ALTER TABLE `quiz_attempt`
  ADD CONSTRAINT `quiz_attempt_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`),
  ADD CONSTRAINT `quiz_attempt_ibfk_2` FOREIGN KEY (`EngineerID`) REFERENCES `engineer` (`EngineerID`),
  ADD CONSTRAINT `quiz_attempt_ibfk_3` FOREIGN KEY (`QuizID`,`QnNum`) REFERENCES `question` (`QuizID`, `QnNum`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
