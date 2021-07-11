
CREATE TABLE `storagebox` (
   `boxId` int NOT NULL AUTO_INCREMENT,
   `boxCapacity` int DEFAULT NULL,
   `containerType` varchar(20) DEFAULT NULL,
   `noOfSampleStored` int DEFAULT NULL,
   PRIMARY KEY (`boxId`)
 ) ;
 CREATE TABLE `technicians` (
   `T_ID` int NOT NULL AUTO_INCREMENT,
   `name` char(30) DEFAULT NULL,
   `degree` varchar(30) DEFAULT NULL,
   `yearOfPassing` int DEFAULT NULL,
   `emailId` varchar(40) DEFAULT NULL,
   `phoneNumber` bigint NOT NULL,
   `isApproved` tinyint(1) NOT NULL DEFAULT '0',
   PRIMARY KEY (`T_ID`)
 ) ;
  CREATE TABLE `usersystem` (
   `technicianUId` int NOT NULL AUTO_INCREMENT,
   `T_ID` int DEFAULT NULL,
   `password` varchar(100) NOT NULL DEFAULT 'NAN',
   `admin` tinyint(1) DEFAULT '0',
   PRIMARY KEY (`technicianUId`),
   KEY `usersystem_ibfk_1` (`T_ID`),
   CONSTRAINT `usersystem_ibfk_1` FOREIGN KEY (`T_ID`) REFERENCES `technicians` (`T_ID`) ON DELETE CASCADE ON UPDATE CASCADE
 ) ;
 

 
  CREATE TABLE `patient` (
   `P_ID` int NOT NULL AUTO_INCREMENT,
   `name` varchar(30) DEFAULT NULL,
   `sex` char(6) DEFAULT NULL,
   `p_district` varchar(25) DEFAULT NULL,
   `p_state` varchar(30) DEFAULT NULL,
   `hospitalOPNumber` int NOT NULL,
   `DOB` date DEFAULT NULL,
   `t_district` varchar(25) DEFAULT NULL,
   `t_state` varchar(30) DEFAULT NULL,
   `contactNumber` bigint DEFAULT NULL,
   PRIMARY KEY (`P_ID`)
 ) ;
CREATE TABLE `test` (
   `testId` int NOT NULL AUTO_INCREMENT,
   `testType` char(12) NOT NULL,
   `T_ID` int DEFAULT NULL,
   PRIMARY KEY (`testId`),
   UNIQUE KEY `testType_UNIQUE` (`testType`),
   KEY `test_ibfk_1` (`T_ID`),
   CONSTRAINT `test_ibfk_1` FOREIGN KEY (`T_ID`) REFERENCES `technicians` (`T_ID`) ON DELETE SET NULL ON UPDATE CASCADE
 ) ;
 CREATE TABLE `sample` (
   `sampleId` int NOT NULL AUTO_INCREMENT,
   `sampleType` varchar(20) DEFAULT NULL,
   `recievingDate` date DEFAULT NULL,
   `dateOfAllotment` date DEFAULT NULL,
   `P_ID` int NOT NULL,
   `boxId` int DEFAULT NULL,
   PRIMARY KEY (`sampleId`),
   KEY `sample_ibfk_3` (`boxId`),
   KEY `sample_ibfk_4` (`P_ID`),
   CONSTRAINT `sample_ibfk_3` FOREIGN KEY (`boxId`) REFERENCES `storagebox` (`boxId`) ON DELETE SET NULL ON UPDATE CASCADE,
   CONSTRAINT `sample_ibfk_4` FOREIGN KEY (`P_ID`) REFERENCES `patient` (`P_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
 ) ;
 
 CREATE TABLE `requestedtests` (
   `sampleId` int NOT NULL,
   `testId` int NOT NULL,
   `isCompleted` tinyint(1) DEFAULT '0',
   `testReport` varchar(100) DEFAULT NULL,
   `verdict` tinyint(1) DEFAULT NULL,
   `reportDate` date DEFAULT NULL,
   PRIMARY KEY (`sampleId`,`testId`),
   KEY `requestedtests_ibfk_2` (`testId`),
   CONSTRAINT `requestedtests_ibfk_1` FOREIGN KEY (`sampleId`) REFERENCES `sample` (`sampleId`) ON DELETE CASCADE ON UPDATE RESTRICT,
   CONSTRAINT `requestedtests_ibfk_2` FOREIGN KEY (`testId`) REFERENCES `test` (`testId`)
 ) ;
 
 CREATE TABLE `finalreport` (
   `reportId` int NOT NULL AUTO_INCREMENT,
   `sampleId` int DEFAULT NULL,
   `T_ID` int DEFAULT NULL,
   `resultOfReport` varchar(100) DEFAULT NULL,
   `reportingDate` date DEFAULT NULL,
   PRIMARY KEY (`reportId`),
   UNIQUE KEY `reportId` (`reportId`),
   KEY `finalreport_ibfk_2` (`T_ID`),
   KEY `finalreport_ibfk_1` (`sampleId`),
   CONSTRAINT `finalreport_ibfk_1` FOREIGN KEY (`sampleId`) REFERENCES `sample` (`sampleId`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `finalreport_ibfk_2` FOREIGN KEY (`T_ID`) REFERENCES `technicians` (`T_ID`) ON DELETE SET NULL ON UPDATE CASCADE
 ) ;
 

 
 
