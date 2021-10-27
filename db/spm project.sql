# CREATE DATABASE `spmproject`;

use `spmproject` ;

CREATE TABLE `spmproject`.`Engineer` (
EngineerID int AUTO_INCREMENT PRIMARY KEY,
 `Name` varchar(100) not null,
 `Role` varchar(100) not null
);
insert into  Engineer (name, role)
VALUES ('Ben Lim','Engineer');

insert into  Engineer (name, role)
VALUES ('John Tan','Senior Engineer');

insert into  Engineer (name, role)
VALUES ('May Chan','Senior Engineer');

insert into  Engineer (name, role)
VALUES ('Tiffany Lim','Engineer');

insert into  Engineer (name, role)
VALUES ('Alice Chong','Engineer');

insert into  Engineer (name, role)
VALUES ('Bob Chang','Engineer');


CREATE TABLE `spmproject`.`Course` (
CID int AUTO_INCREMENT PRIMARY KEY,
 `courseName` varchar(100) not null,
 `courseDescription` varchar(500) not null,
 `StartDate` date not null,
 `EndDate` date not null
);
INSERT INTO course (`coursename`, `coursedescription`, `startdate`, `enddate`)
VALUES ('Engineering 101', 'This is clearly a course all about electricity. Eventually you will become electricman.', '2021-11-23', '2022-11-23'),
('Thermodynamics', 'This is a module that every engineer hates but is absoultely useful in the long term, just ask around', '2021-11-05', '2022-11-05');

CREATE TABLE `spmproject`.`Course_Trainer` (
CID int,
EID int,
primary key (EID,CID),
foreign key (EID) references Engineer(EngineerID),
foreign key (CID) references Course(CID)
);
insert into  course_trainer 
Values (1,2);

insert into  course_trainer 
Values (2,3);

CREATE TABLE `spmproject`.`Course_Enrolled` (
CID int,
EID int,
Active int,
primary key (EID,CID),
foreign key (EID) references Engineer(EngineerID),
foreign key (CID) references Course(CID)
);
insert into  course_enrolled 
Values (1,1,1);

insert into  course_enrolled 
Values (1,6,1);

insert into  course_enrolled 
Values (2,1,1);


CREATE TABLE `spmproject`.`Course_EnrollmentPending` (
CID int,
EID int,
Active int,
primary key (EID,CID),
foreign key (EID) references Engineer(EngineerID),
foreign key (CID) references Course(CID)
);
insert into  Course_EnrollmentPending 
Values (1,1,1);


CREATE TABLE `spmproject`.`Course_Completed` (
CID int,
EID int,
primary key (EID,CID),
foreign key (EID) references Engineer(EngineerID),
foreign key (CID) references Course(CID)
);
insert into  course_Completed 
Values (1,4);

CREATE TABLE `spmproject`.`Class` (
ClassID int ,
CourseID int ,
Capacity int not null,
ClassTime varchar(50) not null,
PRIMARY KEY (CourseID,ClassID),
FOREIGN KEY (CourseID) REFERENCES Course(CID)
);
insert into class 
Values (1,1,20, 'Thursday 12:00pm');

insert into class 
Values (2,1,30, 'Thursday 3:15pm');

CREATE TABLE `spmproject`.`Class_Trainer` (
ClassID int,
EID int,
CourseID int ,
primary key (EID,ClassID,CourseID),
foreign key (EID) references Engineer(EngineerID),
foreign key (CourseID,ClassID) references Class (CourseID,ClassID),
FOREIGN KEY (CourseID) REFERENCES Course (CID)
);

insert into class_trainer
Values (1,2,1 );

insert into class_trainer
Values (2,2,1 );

insert into class_trainer
Values (1,3,2 );



CREATE TABLE `spmproject`.`Section` (
SectionID int ,
ClassID int ,
CourseID int,
SectionName varchar(100) not null,
End_Date datetime,
PRIMARY KEY (SectionID,ClassID,CourseID)
);

CREATE TABLE `spmproject`.`training_materials` (
MaterialID int  ,
ClassID int ,
SectionID int ,
filename varchar(50) ,
filedirectory varchar(250) ,
isHidden int,
PRIMARY KEY (ClassID,SectionID)-- ,
-- FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
-- FOREIGN KEY (SectionID) REFERENCES Section(SectionID)
);

CREATE TABLE `spmproject`.`Quiz` (
QuizID int AUTO_INCREMENT not null,
CourseID int ,
ClassID int not null,
SectionID int not null,
quiz_name varchar(50),
Timelimit varchar(50) ,
isHidden int,
passing_requirements decimal(10,2),
isGraded int,
grades int,
PRIMARY KEY (QuizID,ClassID,SectionID),
FOREIGN KEY (CourseID,ClassID) REFERENCES Class(CourseID,ClassID),
FOREIGN KEY (SectionID) REFERENCES Section(SectionID)
);

CREATE TABLE `spmproject`.`Question` (
QuizID int ,
QnNum int ,
Qn_type varchar(100) not null,
Qn_Description varchar(250) ,
options varchar(1000) ,
answer varchar(100) not null,
PRIMARY KEY (QuizID,QnNum),
FOREIGN KEY (QuizID) REFERENCES Quiz(QuizID)
);

CREATE TABLE `spmproject`.`quiz_attempt` (
EngineerID int ,
QuizID int ,
AttemptID int ,
QnNum int,
given_answer varchar(100),
PRIMARY KEY (EngineerID,QuizID,AttemptID,QnNum),
FOREIGN KEY (EngineerID) REFERENCES Engineer(EngineerID), 
FOREIGN KEY (QuizID,QnNum) REFERENCES Question(QuizID,QnNum)
);

CREATE TABLE `spmproject`.`Progress` (
SectionID int  ,
EngineerID int ,
QuizID int ,
ProgressStatus varchar(50),
QuizScore decimal ,
PRIMARY KEY (SectionID,EngineerID,QuizID),
FOREIGN KEY (SectionID) REFERENCES Section(SectionID),
FOREIGN KEY (EngineerID) REFERENCES Engineer(EngineerID), 
FOREIGN KEY (QuizID) REFERENCES Quiz(QuizID)
);