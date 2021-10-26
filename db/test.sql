CREATE TABLE `testdb`.`engineer` (
EngineerID int AUTO_INCREMENT PRIMARY KEY,
 `Name` varchar(100) not null,
 `Role` varchar(100) not null
);

insert into  `engineer` (`name`, `role`)
VALUES ('John Tan','Senior Engineer'),
('May Chan','Senior Engineer'),
('Alice Chong','Engineer'),
('Simu Liu','Engineer');


CREATE TABLE `testdb`.`course` (
CID int AUTO_INCREMENT PRIMARY KEY,
`CourseName` varchar(100) not null,
`Description` varchar(200) not null,
`StartDate` date not null,
`EndDate` date not null
);

INSERT INTO `course` (`coursename`, `description`, `startdate`, `enddate`)
VALUES ('Engineering 101', 'This is clearly a course all about electricity. Eventually you will become electricman.', '2021-10-25', '2022-10-25'),
('Thermodynamics', 'This is a module that every engineer hates but is absoultely useful in the long term, just ask around', '2021-11-05', '2022-11-05');


CREATE TABLE `testdb`.`classes` (
ClassID int,
`CourseID` int,
`Capacity` int not null,
`ClassTime` datetime not null,
`TrainerID` int not null,
PRIMARY KEY (CourseID,ClassID),
FOREIGN KEY (CourseID) REFERENCES course(CID),
FOREIGN KEY (TrainerID) REFERENCES engineer(EngineerID)
);

INSERT INTO `classes` (`classid`, `courseid`, `capacity`, `classtime`, `trainerid`)
VALUES (1, 1, 15, '2021-11-07 12:00:00', 1),
(2, 1, 15, '2021-11-07 15:30:00', 2),
(3, 2, 10, '2021-11-07 15:30:00', 1);


CREATE TABLE `testdb`.`pending` (
PID int AUTO_INCREMENT PRIMARY KEY,
`EID` int not null,
`CID` int not null,
FOREIGN KEY (EID) REFERENCES engineer(EngineerID),
FOREIGN KEY (CID) REFERENCES course(CID)
);

INSERT INTO `pending` (`eid`, `cid`)
VALUES (1, 1),
(2, 1);

