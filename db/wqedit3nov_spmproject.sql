-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 03, 2021 at 06:55 AM
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
DROP Database IF EXISTS `spmproject`;
Create DATABASE `spmproject`;
USE `spmproject`;

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
);

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

-- Assume that eid 1 completed course 4
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
(1, 4, 1);

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
) ;

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
-- Table structure for table `prerequites`
--

DROP TABLE IF EXISTS `prerequisites`;
CREATE TABLE IF NOT EXISTS `prerequisites` (
  `prerequisites_CID` int(11) NOT NULL,
  `for_CID` int(11) NOT NULL,
  PRIMARY KEY (`prerequisites_CID`,`for_CID`),
  KEY `for_CID` (`for_CID`)
) ;

-- Assume cid 4 is pre_req for cid 1
INSERT INTO `prerequisites`
VALUES
(4, 1);

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
) ;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempt`
--

DROP TABLE IF EXISTS `quiz_attempt`;
CREATE TABLE IF NOT EXISTS `quiz_attempt` (
  `EngineerID` int(11) NOT NULL,
  `QuizID` int(11) NOT NULL,
  `AttemptID` int(11) NOT NULL,
  `QnNum` int(11) NOT NULL,
  `given_answer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EngineerID`,`QuizID`,`AttemptID`,`QnNum`),
  KEY `QuizID` (`QuizID`,`QnNum`)
) ;

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
) ;

--
-- Dumping data for table `training_materials`
--

INSERT INTO `training_materials` (`materialid`, `filename`, `url`, `isHidden`, `ClassID`, `CourseID`, `SectionID`) VALUES
(2, '20211102-173137_ESR Slides Week 11.pdf', NULL, 0, 1, 1, 1),
(3, '20211102-173204_ESR Slides Week 11.pdf', NULL, 0, 1, 1, 2),
(4, '20211102-173533_ESR Slides Week 11.pdf', NULL, 0, 1, 1, 1),
(5, '20211102-173803_ESR Slides Week 11.pdf', NULL, 0, 1, 1, 1),
(6, '20211102-173928_ESR Slides Week 11.pdf', NULL, 0, 1, 1, 1),
(7, '20211102-174105_Contextual gaps_privacy issues on ', NULL, 0, 1, 1, 1),
(8, '20211102-174522_Contextual gaps_privacy issues on ', NULL, 0, 1, 1, 1),
(9, '20211102-174850_Contextual gaps_privacy issues on ', NULL, 0, 1, 1, 1),
(10, '20211102-175010_Week 12 Reading List and Questions', NULL, 0, 1, 1, 1),
(11, '20211102-175334_ESR Slides Week 11.pdf', NULL, 0, 1, 1, 1),
(12, '20211102-175402_ESR Slides Week 11.pdf', NULL, 0, 1, 1, 1),
(13, '20211102-175546_ESR Slides Week 11.pdf', NULL, 0, 1, 1, 1),
(14, '20211102-175734_Session 10 Market Basket Analysis.', NULL, 0, 1, 1, 1),
(15, '20211102-175823_Lab0-ToolsInstallationGuide.docx', NULL, 0, 1, 1, 1),
(16, '20211102-175855_ESR Slides Week 11.pdf', NULL, 0, 1, 1, 1),
(17, '20211102-175922_ESR Slides Week 11.pdf', NULL, 0, 1, 1, 1),
(18, '20211103-133259_Lab9_WebSecurity.docx', NULL, 0, 1, 1, 1),
(19, '20211103-133400_Estimation CA (baseline).docx', NULL, 0, 1, 1, 1);

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
-- Constraints for table `prerequites`
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
  ADD CONSTRAINT `quiz_attempt_ibfk_1` FOREIGN KEY (`EngineerID`) REFERENCES `engineer` (`EngineerID`),
  ADD CONSTRAINT `quiz_attempt_ibfk_2` FOREIGN KEY (`QuizID`,`QnNum`) REFERENCES `question` (`QuizID`, `QnNum`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
