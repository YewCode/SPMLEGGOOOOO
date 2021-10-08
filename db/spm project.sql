# CREATE SCHEMA `spmproject` ;
use `spmproject` ;

CREATE TABLE `spmproject`.`Engineer` (
EngineerID int AUTO_INCREMENT PRIMARY KEY,
 `Name` varchar(100) not null,
 `Role` varchar(100) not null
);


CREATE TABLE `spmproject`.`Course` (
CID int AUTO_INCREMENT PRIMARY KEY,
 `Course Name` varchar(100) not null,
 `Course Description` varchar(500) not null
);

CREATE TABLE `spmproject`.`Course_Trainer` (
CID int,
EID int,
primary key (EID,CID),
foreign key (EID) references Engineer(EngineerID),
foreign key (CID) references Course(CID)
);

CREATE TABLE `spmproject`.`Course_assigned` (
CID int,
EID int,
Assignment_reason varchar(250),
primary key (EID,CID),
foreign key (EID) references Engineer(EngineerID),
foreign key (CID) references Course(CID)
);

CREATE TABLE `spmproject`.`Course_Enrolled` (
CID int,
EID int,
Active int,
primary key (EID,CID),
foreign key (EID) references Engineer(EngineerID),
foreign key (CID) references Course(CID)
);
CREATE TABLE `spmproject`.`Course_Completed` (
CID int,
EID int,
primary key (EID,CID),
foreign key (EID) references Engineer(EngineerID),
foreign key (CID) references Course(CID)
);

CREATE TABLE `spmproject`.`Class` (
ClassID int ,
CourseID int ,
Capacity int not null,
Start_Date datetime,
End_Date datetime,
class_type varchar(50),
PRIMARY KEY (CourseID,ClassID),
FOREIGN KEY (CourseID) REFERENCES Course(CID)
);

CREATE TABLE `spmproject`.`Class_Trainer` (
ClassID int,
EID int,
CourseID int ,
primary key (EID,ClassID,CourseID),
foreign key (EID) references Engineer(EngineerID),
foreign key (ClassID) references Class(ClassID),
FOREIGN KEY (CourseID) REFERENCES Class(CID)
);

CREATE TABLE `spmproject`.`Class_Enrolled` (
ClassID int,
EID int,
primary key (EID,ClassID),
foreign key (EID) references Engineer(EngineerID),
foreign key (ClassID) references Class(ClassID)
);

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
QuizID int AUTO_INCREMENT ,
ClassID int ,
SectionID int ,
Timelimit varchar(50) ,
no_of_qns int,
isHidden int,
PRIMARY KEY (QuizID,ClassID,SectionID),
-- FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
FOREIGN KEY (SectionID) REFERENCES Section(SectionID)
);

CREATE TABLE `spmproject`.`Question` (
QuizID int ,
QnNum int ,
Qn_type varchar(100) not null,
Qn_Description varchar(250) ,
PRIMARY KEY (QuizID,QnNum),
FOREIGN KEY (QuizID) REFERENCES Quiz(QuizID)
);


CREATE TABLE `spmproject`.`Enrollment` (
CID int  ,
EngineerID int ,
ClassID int NULL,
isApproved int,
Active int ,
PRIMARY KEY (cid,EngineerID),
FOREIGN KEY (CID) REFERENCES Course(cid),
FOREIGN KEY (EngineerID) REFERENCES Engineer(EngineerID)-- , 
-- FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
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