-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 27, 2021 at 09:18 AM
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`ClassID`, `CourseID`, `Capacity`, `ClassTime`) VALUES
(1, 1, 20, 'Thursday 12:00pm'),
(2, 1, 30, 'Thursday 3:15pm'),
(1, 2, 30, 'Monday 8:15am');

-- --------------------------------------------------------

--
-- Table structure for table `class_enrolled`
--

DROP TABLE IF EXISTS `class_enrolled`;
CREATE TABLE IF NOT EXISTS `class_enrolled` (
  `ClassID` int(11) NOT NULL,
  `EID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  PRIMARY KEY (`EID`,`ClassID`,`CourseID`),
  KEY `CourseID` (`CourseID`,`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CID`, `courseName`, `courseDescription`, `StartDate`, `EndDate`) VALUES
(1, 'Engineering 101', 'This is clearly a course all about electricity. Eventually you will become electricman.', '2021-11-23', '2022-11-23'),
(2, 'Thermodynamics', 'This is a module that every engineer hates but is absoultely useful in the long term, just ask around', '2021-11-05', '2022-11-05'),
(3, 'Materials and Structures', 'This course focuses on the development and the optimization of materials, processes, and devices used for operations in extreme environments and special applications.', '2021-11-10', '2021-11-11');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_completed`
--

INSERT INTO `course_completed` (`CID`, `EID`) VALUES
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `course_enrolled`
--

DROP TABLE IF EXISTS `course_enrolled`;
CREATE TABLE IF NOT EXISTS `course_enrolled` (
  `CID` int(11) NOT NULL,
  `EID` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`EID`,`CID`),
  KEY `CID` (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_enrolled`
--

INSERT INTO `course_enrolled` (`CID`, `EID`, `active`) VALUES
(1, 1, 1),
(2, 1, 1),
(1, 6, 1),
(2, 6, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_enrollmentpending`
--

INSERT INTO `course_enrollmentpending` (`CID`, `EID`, `active`) VALUES
(1, 6, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Table structure for table `prerequites`
--

DROP TABLE IF EXISTS `prerequites`;
CREATE TABLE IF NOT EXISTS `prerequites` (
  `prerequites_CID` int(11) NOT NULL,
  `postrequite_CID` int(11) NOT NULL,
  PRIMARY KEY (`prerequites_CID`,`postrequite_CID`),
  KEY `postrequite_CID` (`postrequite_CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training_materials`
--

DROP TABLE IF EXISTS `training_materials`;
CREATE TABLE IF NOT EXISTS `training_materials` (
  `MaterialID` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(50) DEFAULT NULL,
  `filedirectory` varchar(250) DEFAULT NULL,
  `isHidden` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `SectionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaterialID`),
  KEY `CourseID` (`CourseID`,`ClassID`),
  KEY `SectionID` (`SectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CID`);

--
-- Constraints for table `class_enrolled`
--
ALTER TABLE `class_enrolled`
  ADD CONSTRAINT `class_enrolled_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `engineer` (`EngineerID`),
  ADD CONSTRAINT `class_enrolled_ibfk_2` FOREIGN KEY (`CourseID`,`ClassID`) REFERENCES `class` (`CourseID`, `ClassID`);

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
ALTER TABLE `prerequites`
  ADD CONSTRAINT `prerequites_ibfk_1` FOREIGN KEY (`prerequites_CID`) REFERENCES `course` (`CID`),
  ADD CONSTRAINT `prerequites_ibfk_2` FOREIGN KEY (`postrequite_CID`) REFERENCES `course` (`CID`);

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

--
-- Constraints for table `training_materials`
--
ALTER TABLE `training_materials`
  ADD CONSTRAINT `training_materials_ibfk_1` FOREIGN KEY (`CourseID`,`ClassID`) REFERENCES `class` (`CourseID`, `ClassID`),
  ADD CONSTRAINT `training_materials_ibfk_2` FOREIGN KEY (`SectionID`) REFERENCES `section` (`SectionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
