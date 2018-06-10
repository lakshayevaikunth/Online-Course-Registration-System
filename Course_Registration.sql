-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 10, 2016 at 08:20 PM
-- Server version: 5.6.30-1
-- PHP Version: 5.6.17-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Course_Registration`
--

-- --------------------------------------------------------

--
-- Table structure for table `Course_Available`
--

CREATE TABLE `Course_Available` (
  `CCode` varchar(7) NOT NULL,
  `Slot` varchar(2) NOT NULL,
  `FNo` int(11) NOT NULL,
  `CNo` int(11) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `Seats_left` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Course_Available`
--

INSERT INTO `Course_Available` (`CCode`, `Slot`, `FNo`, `CNo`, `Location`, `Seats_left`) VALUES
('CSE1001', 'A1', 1, 303, 'SJT', 4),
('CSE1001', 'A1', 2, 303, 'SJT', 25),
('CSE1002', 'A2', 1, 303, 'SJT', 24),
('CSE2001', 'D1', 7, 101, 'SJT', 44),
('CSE2001', 'D2', 8, 103, 'SJT', 25),
('CSE2002', 'E1', 5, 303, 'SJT', 14),
('ECE2001', 'A2', 3, 123, 'TT', 35),
('ECE2002', 'F1', 9, 555, 'TT', 24),
('ECE2002', 'F2', 9, 512, 'TT', 55),
('EEE2001', 'D1', 6, 201, 'TT', 0),
('EEE2001', 'D2', 5, 202, 'TT', 17),
('EEE2004', 'B1', 10, 728, 'SJT', 28),
('EEE2004', 'B2', 4, 444, 'SJT', 58),
('MAT1001', 'A1', 1, 303, 'SJT', 10),
('MAT1002', 'C1', 4, 202, 'TT', 35),
('MAT1002', 'C2', 4, 201, 'TT', 65);

-- --------------------------------------------------------

--
-- Table structure for table `Course_Details`
--

CREATE TABLE `Course_Details` (
  `CCode` varchar(7) NOT NULL,
  `CName` varchar(20) NOT NULL,
  `Credits` int(11) NOT NULL,
  `DNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Course_Details`
--

INSERT INTO `Course_Details` (`CCode`, `CName`, `Credits`, `DNo`) VALUES
('CSE1001', 'Python', 4, 1),
('CSE1002', 'C++', 4, 1),
('CSE2001', 'Computer Architectur', 3, 1),
('CSE2002', 'Theory of Computatio', 4, 1),
('ECE2001', 'Semiconductors', 4, 2),
('ECE2002', 'Signals and Processi', 3, 2),
('EEE2001', 'Basic EEE', 2, 3),
('EEE2004', 'Network Theory', 4, 3),
('MAT1001', 'Maths for Engineers', 5, 1),
('MAT1002', 'Statistics', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Course_Prerequisite`
--

CREATE TABLE `Course_Prerequisite` (
  `CCode` varchar(7) NOT NULL,
  `PreCCode` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Course_Prerequisite`
--

INSERT INTO `Course_Prerequisite` (`CCode`, `PreCCode`) VALUES
('CSE1002', 'CSE1001'),
('CSE1002', 'MAT1001'),
('EEE2004', 'EEE2001'),
('ECE2002', 'ECE2001'),
('MAT1002', 'MAT1001');

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `Dno` int(11) NOT NULL,
  `Dname` varchar(20) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `DeanFNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`Dno`, `Dname`, `Location`, `DeanFNo`) VALUES
(1, 'SCOPE', 'SJT', 1),
(2, 'SELECT', 'TT', 2),
(3, 'SENSE', 'TT', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Faculty`
--

CREATE TABLE `Faculty` (
  `FNo` int(11) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `DOB` date NOT NULL,
  `PhNo` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `DNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Faculty`
--

INSERT INTO `Faculty` (`FNo`, `FName`, `LName`, `Gender`, `DOB`, `PhNo`, `Address`, `Email`, `DNo`) VALUES
(1, 'Ram', 'Kumar', 'M', '1977-08-22', '9962562195', 'Vellore', 'ramkumar@gmail.com', 1),
(2, 'Lionel', 'Messi', 'M', '1966-07-01', '9884282603', 'Argentina', 'cr7@gmail.com', 1),
(3, 'Vijaya', 'Kumar', 'M', '1965-01-21', '9092399767', 'Chennai', 'vij@gmail.com', 1),
(4, 'Raj', 'Kumar', 'M', '1968-01-21', '9092831574', 'Madurai', 'raj@gmail.com', 2),
(5, 'Sai', 'Kumar', 'M', '1974-05-21', '9092831569', 'Dindugul', 'sai@gmail.com', 3),
(6, 'Meena', 'Kumari', 'F', '1981-01-15', '8992831574', 'Chennai', 'kumari@gmail.com', 2),
(7, 'John', 'Snow', 'F', '1991-01-15', '9092855574', 'America', 'nothing@gmail.com', 3),
(8, 'Kevin', 'Paul', 'M', '1981-09-15', '8012855574', 'Thanjavur', 'kevin@gmail.com', 3),
(9, 'Johhny', 'Singh', 'M', '1975-05-15', '9012812374', 'Punjab', 'johnny@gmail.com', 2),
(10, 'Nigel', 'John', 'F', '1988-04-21', '8882812374', 'Kerala', 'nigel@gmail.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Login`
--

CREATE TABLE `Login` (
  `Rno` varchar(9) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Login`
--

INSERT INTO `Login` (`Rno`, `Password`) VALUES
('15BCE0012', 'adithya'),
('15BCE0069', 'lakshay'),
('15BCE0123', 'raghav'),
('15BEC2064', 'ananya'),
('15BEE0089', 'Nithya');

-- --------------------------------------------------------

--
-- Table structure for table `Room`
--

CREATE TABLE `Room` (
  `CNo` int(11) NOT NULL,
  `Location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Room`
--

INSERT INTO `Room` (`CNo`, `Location`) VALUES
(101, 'SJT'),
(103, 'SJT'),
(133, 'SJT'),
(303, 'SJT'),
(444, 'SJT'),
(728, 'SJT'),
(123, 'TT'),
(201, 'TT'),
(202, 'TT'),
(512, 'TT'),
(555, 'TT');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `RNo` varchar(9) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(80) NOT NULL,
  `DOB` date NOT NULL,
  `Phno` varchar(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Dno` int(11) NOT NULL,
  `Credits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`RNo`, `Fname`, `Lname`, `Address`, `DOB`, `Phno`, `Email`, `Gender`, `Dno`, `Credits`) VALUES
('15BCE0012', 'Adithya', 'Murali', 'Chennai', '1997-08-22', '9962562193', 'madi770@gmail.com', 'M', 1, 4),
('15BCE0069', 'Lakshay', 'Vaikunth', 'Chennai', '1997-11-11', '123456789', 'lak@gmail.com', 'M', 1, 4),
('15BCE0123', 'Raghav', 'Ananth', 'Chennai', '1997-12-01', '9092399767', 'raghav@gmail.com', 'M', 1, 2),
('15BEC2064', 'Ananya', 'Mathur', 'Delhi', '1997-12-05', '9092512345', 'ananya@gmail.com', 'F', 2, 2),
('15BEE0089', 'Nithya', 'Ratan', 'Somalia', '1997-12-05', '6969696969', 'vaishu@gmail.com', 'M', 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Student_Completed`
--

CREATE TABLE `Student_Completed` (
  `RNo` varchar(9) NOT NULL,
  `CCode` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Student_Completed`
--

INSERT INTO `Student_Completed` (`RNo`, `CCode`) VALUES
('15BCE0012', 'ECE2001');

-- --------------------------------------------------------

--
-- Table structure for table `Student_Registers`
--

CREATE TABLE `Student_Registers` (
  `RNo` varchar(9) NOT NULL,
  `Slot` varchar(2) NOT NULL,
  `CCode` varchar(7) NOT NULL,
  `FNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Course_Available`
--
ALTER TABLE `Course_Available`
  ADD PRIMARY KEY (`CCode`,`Slot`,`FNo`),
  ADD KEY `FNo` (`FNo`),
  ADD KEY `CNo` (`CNo`),
  ADD KEY `Location` (`Location`),
  ADD KEY `Slot` (`Slot`),
  ADD KEY `CCode` (`CCode`,`Slot`);

--
-- Indexes for table `Course_Details`
--
ALTER TABLE `Course_Details`
  ADD PRIMARY KEY (`CCode`),
  ADD KEY `DNo` (`DNo`);

--
-- Indexes for table `Course_Prerequisite`
--
ALTER TABLE `Course_Prerequisite`
  ADD KEY `CCode` (`CCode`),
  ADD KEY `PreCCode` (`PreCCode`);

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`Dno`),
  ADD UNIQUE KEY `Dname` (`Dname`),
  ADD KEY `Location` (`Location`),
  ADD KEY `DeanFNo` (`DeanFNo`);

--
-- Indexes for table `Faculty`
--
ALTER TABLE `Faculty`
  ADD PRIMARY KEY (`FNo`),
  ADD UNIQUE KEY `PhNo` (`PhNo`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `DNo_2` (`DNo`);

--
-- Indexes for table `Login`
--
ALTER TABLE `Login`
  ADD UNIQUE KEY `Rno` (`Rno`);

--
-- Indexes for table `Room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`CNo`),
  ADD KEY `Location` (`Location`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`RNo`),
  ADD UNIQUE KEY `Phno` (`Phno`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `Dno_2` (`Dno`);

--
-- Indexes for table `Student_Completed`
--
ALTER TABLE `Student_Completed`
  ADD KEY `RNo` (`RNo`),
  ADD KEY `CCode` (`CCode`);

--
-- Indexes for table `Student_Registers`
--
ALTER TABLE `Student_Registers`
  ADD KEY `RNo` (`RNo`,`Slot`,`CCode`,`FNo`),
  ADD KEY `FNo` (`FNo`),
  ADD KEY `Student_Registers_ibfk_3` (`CCode`),
  ADD KEY `Slot` (`Slot`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Course_Available`
--
ALTER TABLE `Course_Available`
  ADD CONSTRAINT `Course_Available_ibfk_1` FOREIGN KEY (`CCode`) REFERENCES `Course_Details` (`CCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Course_Available_ibfk_2` FOREIGN KEY (`FNo`) REFERENCES `Faculty` (`FNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Course_Available_ibfk_3` FOREIGN KEY (`CNo`) REFERENCES `Room` (`CNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Course_Available_ibfk_4` FOREIGN KEY (`Location`) REFERENCES `Room` (`Location`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Course_Details`
--
ALTER TABLE `Course_Details`
  ADD CONSTRAINT `Course_Details_ibfk_1` FOREIGN KEY (`DNo`) REFERENCES `Department` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Course_Prerequisite`
--
ALTER TABLE `Course_Prerequisite`
  ADD CONSTRAINT `Course_Prerequisite_ibfk_1` FOREIGN KEY (`CCode`) REFERENCES `Course_Details` (`CCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Course_Prerequisite_ibfk_2` FOREIGN KEY (`PreCCode`) REFERENCES `Course_Details` (`CCode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Department`
--
ALTER TABLE `Department`
  ADD CONSTRAINT `Department_ibfk_1` FOREIGN KEY (`DeanFNo`) REFERENCES `Faculty` (`FNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Faculty`
--
ALTER TABLE `Faculty`
  ADD CONSTRAINT `Faculty_ibfk_1` FOREIGN KEY (`DNo`) REFERENCES `Department` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Login`
--
ALTER TABLE `Login`
  ADD CONSTRAINT `Login_ibfk_1` FOREIGN KEY (`Rno`) REFERENCES `Student` (`RNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Room`
--
ALTER TABLE `Room`
  ADD CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`Location`) REFERENCES `Department` (`Location`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `Department` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Student_Completed`
--
ALTER TABLE `Student_Completed`
  ADD CONSTRAINT `Student_Completed_ibfk_1` FOREIGN KEY (`CCode`) REFERENCES `Course_Details` (`CCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Student_Completed_ibfk_2` FOREIGN KEY (`RNo`) REFERENCES `Student` (`RNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Student_Registers`
--
ALTER TABLE `Student_Registers`
  ADD CONSTRAINT `Student_Registers_ibfk_1` FOREIGN KEY (`RNo`) REFERENCES `Student` (`RNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Student_Registers_ibfk_3` FOREIGN KEY (`CCode`) REFERENCES `Course_Details` (`CCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Student_Registers_ibfk_4` FOREIGN KEY (`FNo`) REFERENCES `Faculty` (`FNo`),
  ADD CONSTRAINT `Student_Registers_ibfk_5` FOREIGN KEY (`Slot`) REFERENCES `Course_Available` (`Slot`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
