-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2024 at 02:14 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gpa_admin_panel`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `ActivityType` varchar(200) NOT NULL,
  `ActivityTitle` varchar(300) CHARACTER SET utf8 NOT NULL,
  `StartDate` varchar(50) NOT NULL,
  `EndDate` varchar(50) NOT NULL,
  `Description` varchar(3000) NOT NULL,
  `Venue` varchar(100) NOT NULL,
  `ActivityReportFileName` varchar(200) DEFAULT NULL,
  `Status` varchar(25) DEFAULT 'Active',
  `CreatedBy` varchar(150) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedBy` varchar(150) NOT NULL,
  `ModfiedDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`ID`, `DepartmentID`, `ActivityType`, `ActivityTitle`, `StartDate`, `EndDate`, `Description`, `Venue`, `ActivityReportFileName`, `Status`, `CreatedBy`, `CreatedDate`, `ModifiedBy`, `ModfiedDate`) VALUES
(1, 2, 'Co-curricular', 'Test', '2024-07-24', '2024-07-26', 'dfdsfdsf', 'Test', 'uploads/activity/1721994291_test.pdf', 'Active', 'MR. Dishant Makwana', '2024-07-26 17:14:51', 'Mr. Kunj Bhala', '2024-07-26 13:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `aicte_eoa_approvals`
--

CREATE TABLE `aicte_eoa_approvals` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aicte_eoa_approvals`
--

INSERT INTO `aicte_eoa_approvals` (`id`, `name`, `file`) VALUES
(3, 'AICTE Approvals EOA 2024-2025 Report', 'uploads/aicte_eoa_approvals/1721283029_SI.pdf'),
(4, 'test', 'uploads/aicte_eoa_approvals/1721630495_unit-1-software-process-models_updated.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `degreetype`
--

CREATE TABLE `degreetype` (
  `Degree` varchar(100) NOT NULL,
  `Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(100) NOT NULL,
  `About` text NOT NULL,
  `LogoName` varchar(200) NOT NULL,
  `Facility1` varchar(100) DEFAULT NULL,
  `Facility2` varchar(100) DEFAULT NULL,
  `Facility3` varchar(100) DEFAULT NULL,
  `Facility4` varchar(100) DEFAULT NULL,
  `Facility5` varchar(100) DEFAULT NULL,
  `Facility6` varchar(100) NOT NULL,
  `Facility7` varchar(100) NOT NULL,
  `Facility8` varchar(100) NOT NULL,
  `Facility9` varchar(100) NOT NULL,
  `Facility10` varchar(100) NOT NULL,
  `FacilityLink1` varchar(200) NOT NULL,
  `FacilityLink2` varchar(200) NOT NULL,
  `FacilityLink3` varchar(200) NOT NULL,
  `ImageName1` varchar(200) NOT NULL,
  `ImageName2` varchar(200) NOT NULL,
  `ImageName3` varchar(200) NOT NULL,
  `ImageName4` varchar(200) NOT NULL,
  `ImageName5` varchar(200) NOT NULL,
  `ImageDesc1` varchar(100) NOT NULL,
  `ImageDesc2` varchar(100) NOT NULL,
  `ImageDesc3` varchar(100) NOT NULL,
  `ImageDesc4` varchar(100) NOT NULL,
  `ImageDesc5` varchar(100) NOT NULL,
  `YearofStarting` varchar(4) NOT NULL,
  `Level` varchar(50) NOT NULL,
  `FirstYearofApprovalFromCouncil` varchar(50) NOT NULL,
  `Period` int(11) NOT NULL,
  `Intake` varchar(10) NOT NULL,
  `Vision` varchar(500) NOT NULL,
  `Mission1` varchar(300) NOT NULL,
  `Mission2` varchar(300) DEFAULT NULL,
  `Mission3` varchar(300) DEFAULT NULL,
  `Mission4` varchar(300) DEFAULT NULL,
  `Mission5` varchar(300) DEFAULT NULL,
  `PEO1` varchar(500) NOT NULL,
  `PEO2` varchar(500) NOT NULL,
  `PEO3` varchar(500) DEFAULT NULL,
  `PEO4` varchar(500) DEFAULT NULL,
  `PEO5` varchar(500) DEFAULT NULL,
  `PSO1` varchar(500) NOT NULL,
  `PSO2` varchar(500) DEFAULT NULL,
  `PSO3` varchar(500) DEFAULT NULL,
  `PSO4` varchar(500) DEFAULT NULL,
  `PSO5` varchar(500) DEFAULT '',
  `UserName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 KEY_BLOCK_SIZE=8 ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `About`, `LogoName`, `Facility1`, `Facility2`, `Facility3`, `Facility4`, `Facility5`, `Facility6`, `Facility7`, `Facility8`, `Facility9`, `Facility10`, `FacilityLink1`, `FacilityLink2`, `FacilityLink3`, `ImageName1`, `ImageName2`, `ImageName3`, `ImageName4`, `ImageName5`, `ImageDesc1`, `ImageDesc2`, `ImageDesc3`, `ImageDesc4`, `ImageDesc5`, `YearofStarting`, `Level`, `FirstYearofApprovalFromCouncil`, `Period`, `Intake`, `Vision`, `Mission1`, `Mission2`, `Mission3`, `Mission4`, `Mission5`, `PEO1`, `PEO2`, `PEO3`, `PEO4`, `PEO5`, `PSO1`, `PSO2`, `PSO3`, `PSO4`, `PSO5`, `UserName`) VALUES
(1, 'IT', 'THisdhisdaskfnasdsfds it dept', 'uploads/../../uploads/department_images/1/1721995634_Color Hunt Palette b4b4b8c7c8cce3e1d9f2efe5.png', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', 'uploads/../../uploads/department_images/1/1721713511_download.jpeg', '', '', '', '', 'Com', '', '', '', 'vsv', '', '', '', 0, '', '', 'dssdsdfs', 'ggt', 'ththtr', 'gtgthhthtgbd', 'thyhh', '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, '', ''),
(2, 'Com', 'Com', 'uploads/../../uploads/department_images/2/1721366289_Add a heading (1).png', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', '', '', '', '', '', 'Com', 'Com', 'Com', 'Com', 'Com', '2022', '1', '1', 1, '1', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com');

-- --------------------------------------------------------

--
-- Table structure for table `dept_academiccalender`
--

CREATE TABLE `dept_academiccalender` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `TermType` varchar(20) NOT NULL,
  `TermYearFrom` int(11) NOT NULL,
  `TermYearTo` int(11) NOT NULL,
  `FileName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dept_academiccalender`
--

INSERT INTO `dept_academiccalender` (`ID`, `DepartmentID`, `TermType`, `TermYearFrom`, `TermYearTo`, `FileName`) VALUES
(0, 1, 'Even', 2020, 2020, 'uploads/academic_calendar/1721282236_SI.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `dept_magazine`
--

CREATE TABLE `dept_magazine` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `FileName` varchar(150) NOT NULL,
  `LaunchON` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept_magazine`
--

INSERT INTO `dept_magazine` (`ID`, `DepartmentID`, `Name`, `FileName`, `LaunchON`) VALUES
(2, 1, 'Test999', 'uploads/magazine/1721284289_test.pdf', 'September 2024'),
(3, 2, 'Test99889', 'uploads/magazine/1721969261_test.pdf', 'June 2024');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `DesignationID` int(11) NOT NULL,
  `DesignationName` varchar(100) NOT NULL,
  `Class` int(11) NOT NULL,
  `ISHod` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disclosure`
--

CREATE TABLE `disclosure` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `disclosure`
--

INSERT INTO `disclosure` (`id`, `name`, `file`) VALUES
(2, 'Fire Safety Certificate', 'uploads/disclosure/1721277489_SI.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `eventphotos`
--

CREATE TABLE `eventphotos` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `PhotoDescription` varchar(100) NOT NULL,
  `PhotoPath` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `EventName` varchar(200) NOT NULL,
  `EventDate` date NOT NULL,
  `EventDescription` varchar(500) NOT NULL,
  `EventVenue` varchar(500) NOT NULL,
  `EventPhotoPath` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `DepartmentID` int(10) NOT NULL,
  `FacultyID` int(11) NOT NULL,
  `FacultySeniortyIndex` int(11) NOT NULL,
  `Prefix` varchar(100) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `DesignationID` int(10) NOT NULL,
  `JoiningDate` varchar(10) NOT NULL,
  `InstituteJoiningDate` varchar(10) NOT NULL,
  `ProfessionalEmail` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `ContactNo` varchar(15) DEFAULT NULL,
  `MaxEducationQualification` varchar(100) NOT NULL,
  `AreaofIntrest` varchar(200) DEFAULT NULL,
  `TeachingExp` varchar(20) NOT NULL,
  `IndustrialExp` varchar(20) NOT NULL,
  `TotalExp` varchar(20) NOT NULL,
  `GTUStaffID` varchar(20) DEFAULT NULL,
  `UserName` varchar(191) DEFAULT NULL,
  `Password` varchar(100) NOT NULL,
  `Password_hash` varchar(1000) NOT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `FacultyStatus` varchar(15) DEFAULT 'Active',
  `isAdmin` varchar(10) NOT NULL,
  `isDAdmin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`DepartmentID`, `FacultyID`, `FacultySeniortyIndex`, `Prefix`, `FirstName`, `LastName`, `DesignationID`, `JoiningDate`, `InstituteJoiningDate`, `ProfessionalEmail`, `Email`, `ContactNo`, `MaxEducationQualification`, `AreaofIntrest`, `TeachingExp`, `IndustrialExp`, `TotalExp`, `GTUStaffID`, `UserName`, `Password`, `Password_hash`, `Photo`, `FacultyStatus`, `isAdmin`, `isDAdmin`) VALUES
(1, 1, 0, ' ', 'Super', 'Admin', 0, '2024-07-11', '2024-06-26', 'superadmin@gpa.com', 'superadmin@gpa.com', '787787878', 'Diploma', 'Coding', '2', '7', '9', '0001', 'superadmin@gpa.com', '1234', '', 'uploads/faculty_profile/1721989657_Final.jpg', 'Active', 'Yes', 'Yes'),
(2, 4, 0, ' ', 'Department', 'Admin', 0, '2024-07-10', '2024-07-26', 'admin@gpa.com', 'admin@gpa.com', '9999', 'Diploma', 'Testing', '2', '2', '4', '0002', 'admin@gpa.com', '123', '', 'uploads/faculty_profile/1721991144_Miduam Lofo.png', 'Active', 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `facultyeducation`
--

CREATE TABLE `facultyeducation` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `FacultyID` int(11) NOT NULL,
  `Degree` varchar(100) NOT NULL,
  `University` varchar(100) NOT NULL,
  `PassingYear` varchar(10) NOT NULL,
  `Specialization` varchar(150) NOT NULL,
  `Percentage` varchar(10) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'Active',
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facultyeducation`
--

INSERT INTO `facultyeducation` (`ID`, `DepartmentID`, `FacultyID`, `Degree`, `University`, `PassingYear`, `Specialization`, `Percentage`, `UserName`, `status`, `CreatedDate`) VALUES
(1, 1, 1, 'Test', 'GPA', '2024', 'sdfsfd', '100', '', 'Active', '2024-07-23 11:12:50');

-- --------------------------------------------------------

--
-- Table structure for table `facultyexperience`
--

CREATE TABLE `facultyexperience` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `FacultyID` int(11) NOT NULL,
  `InstituteorCompany` varchar(150) NOT NULL,
  `Designation` varchar(90) NOT NULL,
  `StartDate` varchar(15) NOT NULL,
  `EndDate` varchar(30) DEFAULT NULL,
  `UserName` varchar(50) NOT NULL,
  `Status` varchar(15) NOT NULL DEFAULT 'Active',
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `facultypubliation`
--

CREATE TABLE `facultypubliation` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `FacultyID` int(11) NOT NULL,
  `Type` varchar(100) NOT NULL,
  `PublicationDate` date NOT NULL,
  `Title` varchar(500) NOT NULL,
  `Author` varchar(200) NOT NULL,
  `ConferenceJournal` varchar(500) NOT NULL,
  `Details` varchar(500) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `importantlinks`
--

CREATE TABLE `importantlinks` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `URL` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `importantlinks`
--

INSERT INTO `importantlinks` (`ID`, `DepartmentID`, `Title`, `URL`) VALUES
(1, 1, 'Test', 'http://localhost/admin-panel/add_edit_link.php');

-- --------------------------------------------------------

--
-- Table structure for table `importantnotice`
--

CREATE TABLE `importantnotice` (
  `ID` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `URL` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laboratorydetails`
--

CREATE TABLE `laboratorydetails` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `LaboratoryName` varchar(500) NOT NULL,
  `PhotoURL1` varchar(200) NOT NULL,
  `PhotoURL2` varchar(200) NOT NULL,
  `Description` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `FacultyID` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`new_data`)),
  `old_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`old_data`)),
  `TransDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`TransDetails`)),
  `log_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `DepartmentID`, `FacultyID`, `time`, `new_data`, `old_data`, `TransDetails`, `log_title`) VALUES
(413, 2, 2, '2024-07-23 14:35:37', '[]', '[]', '[]', 'Logged In'),
(414, 2, 2, '2024-07-23 14:35:49', '{\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaOfIntrest\":\"Gamming\",\"TeachingExp\":\"56\",\"IndustrialExp\":\"56\",\"TotalExp\":112,\"GTUStaffID\":\"56\",\"Photo\":null}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"FacultySeniortyIndex\":\"1\",\"Prefix\":\"MR\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2022\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"Email\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"56\",\"IndustrialExp\":\"56\",\"TotalExp\":\"112\",\"GTUStaffID\":\"56\",\"UserName\":\"dishant.ackplus@gmail.com\",\"Password\":\"123\",\"Password_hash\":\"\",\"Photo\":null,\"FacultyStatus\":\"Active\",\"isAdmin\":\"no\",\"isDAdmin\":\"yes\"}', '[]', 'Updated row in faculty'),
(415, 2, 2, '2024-07-23 14:35:56', '{\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaOfIntrest\":\"Gamming\",\"TeachingExp\":\"56\",\"IndustrialExp\":\"56\",\"TotalExp\":112,\"GTUStaffID\":\"56\",\"Photo\":\"uploads/faculty_profile/1721745356_download.jpeg\"}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"FacultySeniortyIndex\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2022\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"Email\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"56\",\"IndustrialExp\":\"56\",\"TotalExp\":\"112\",\"GTUStaffID\":\"56\",\"UserName\":\"dishant.ackplus@gmail.com\",\"Password\":\"123\",\"Password_hash\":\"\",\"Photo\":\"\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"no\",\"isDAdmin\":\"yes\"}', '[]', 'Updated row in faculty'),
(416, 2, 2, '2024-07-23 14:36:14', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"InstituteorCompany\":null,\"Designation\":null,\"StartDate\":null,\"EndDate\":null,\"Status\":null}', '[]', '[]', 'Inserted new row into facultyexperience'),
(417, 2, 2, '2024-07-23 14:36:19', '[]', '{\"ID\":\"2\",\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"InstituteorCompany\":\"\",\"Designation\":\"\",\"StartDate\":\"\",\"EndDate\":\"\",\"UserName\":\"\",\"Status\":\"\",\"CreatedDate\":\"2024-07-23 20:06:14\"}', '[]', 'Deleted row in facultyexperience'),
(418, 2, 2, '2024-07-23 14:36:22', '[]', '[]', '[]', 'Logged Out'),
(419, 1, 1, '2024-07-23 14:36:27', '[]', '[]', '[]', 'Logged In'),
(420, 2, 1, '2024-07-23 14:36:53', '2', '1', '[]', '{\"Department ID: \":\"2\"}'),
(421, 1, 1, '2024-07-23 14:37:05', '[]', '[]', '[]', 'Logged Out'),
(422, 0, 0, '2024-07-23 14:37:17', '{\"email\":\"makwanadishant644@gmail.com\",\"phone\":null,\"otp\":7150,\"resetKey\":\"dDjvErf6QvsdopmvghQ9IZsl\",\"expireAt\":\"2024-07-23 16:47:17\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(423, 0, 0, '2024-07-23 14:37:55', '{\"email\":\"makwanadishant644@gmail.com\",\"phone\":null,\"otp\":7116,\"resetKey\":\"dDjvErf6QvsdopmvghQ9IZsl\",\"expireAt\":\"2024-07-23 16:47:55\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(424, 0, 0, '2024-07-23 15:11:39', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":9322,\"resetKey\":\"dDjvErf6QvsdopmvghQ9IZsl\",\"expireAt\":\"2024-07-23 17:21:39\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(425, 0, 0, '2024-07-23 15:11:58', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":1468,\"resetKey\":\"dDjvErf6QvsdopmvghQ9IZsl\",\"expireAt\":\"2024-07-23 17:21:58\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(426, 0, 0, '2024-07-23 15:18:24', '{\"Password\":\"1234\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":\"5\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"123\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(427, 0, 0, '2024-07-23 15:19:09', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":9785,\"resetKey\":\"dDjvErf6QvsdopmvghQ9IZsl\",\"expireAt\":\"2024-07-23 17:29:09\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(428, 0, 0, '2024-07-23 15:19:39', '{\"Password\":\"1234\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":\"5\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(429, 0, 0, '2024-07-23 15:22:00', '{\"Password\":\"1234\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":\"5\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(430, 0, 0, '2024-07-23 15:25:14', '{\"Password\":\"1234\"}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"FacultySeniortyIndex\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2022\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"Email\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"56\",\"IndustrialExp\":\"56\",\"TotalExp\":\"112\",\"GTUStaffID\":\"56\",\"UserName\":\"dishant.ackplus@gmail.com\",\"Password\":\"123\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721745356_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"no\",\"isDAdmin\":\"yes\"}', '[]', 'Updated row in faculty'),
(431, 2, 2, '2024-07-23 15:25:48', '[]', '[]', '[]', 'Logged In'),
(432, 0, 0, '2024-07-24 06:06:15', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":5806,\"resetKey\":\"dDjvErf6QvsdopmvghQ9IZsl\",\"expireAt\":\"2024-07-24 08:16:15\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(433, 0, 0, '2024-07-24 06:18:26', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":8067,\"resetKey\":\"dDjvErf6QvsdopmvghQ9IZsl\",\"expireAt\":\"2024-07-24 08:28:26\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(434, 2, 2, '2024-07-24 06:28:32', '[]', '[]', '[]', 'Logged In'),
(435, 2, 2, '2024-07-24 06:28:37', '[]', '[]', '[]', 'Logged Out'),
(436, 1, 1, '2024-07-24 06:28:47', '[]', '[]', '[]', 'Logged In'),
(437, 2, 1, '2024-07-24 06:29:06', '2', '1', '[]', '{\"Department ID: \":\"2\"}'),
(438, 1, 1, '2024-07-24 06:29:13', '1', '1', '[]', '{\"Department ID: \":\"1\"}'),
(439, 1, 1, '2024-07-24 06:31:50', '[]', '[]', '[]', 'Logged Out'),
(440, 0, 0, '2024-07-24 06:39:21', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":6695,\"resetKey\":\"dDjvErf6QvsdopmvghQ9IZsl\",\"expireAt\":\"2024-07-24 08:49:21\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(441, 0, 0, '2024-07-24 06:39:51', '{\"Password\":\"12345\"}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"FacultySeniortyIndex\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2022\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"Email\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"56\",\"IndustrialExp\":\"56\",\"TotalExp\":\"112\",\"GTUStaffID\":\"56\",\"UserName\":\"dishant.ackplus@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721745356_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"no\",\"isDAdmin\":\"yes\"}', '[]', 'Updated row in faculty'),
(442, 2, 2, '2024-07-24 06:40:25', '[]', '[]', '[]', 'Logged In'),
(443, 2, 2, '2024-07-24 06:42:15', '[]', '[]', '[]', 'Logged Out'),
(444, 0, 0, '2024-07-24 06:44:23', '{\"email\":\"makwanadishant644@gmail.com\",\"phone\":null,\"otp\":5441,\"resetKey\":\"3c730fcb2b8f5b1b2efb2524\",\"expireAt\":\"2024-07-24 08:54:23\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(445, 0, 0, '2024-07-24 06:50:27', '{\"email\":\"makwanadishant644@gmail.com\",\"phone\":null,\"otp\":8607,\"resetKey\":\"b634123c51c076a60ae0e9e5\",\"expireAt\":\"2024-07-24 09:00:27\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(446, 0, 0, '2024-07-24 13:59:52', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":3529,\"resetKey\":\"0d611ab1f1cd598a8ab687e4\",\"expireAt\":\"2024-07-24 16:09:52\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(447, 0, 0, '2024-07-24 14:14:14', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":6647,\"resetKey\":\"0054dfee719d3cb61696ae1c\",\"expireAt\":\"2024-07-24 16:24:14\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(448, 0, 0, '2024-07-24 14:14:53', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":6821,\"resetKey\":\"27782dcbeebc996795685a78\",\"expireAt\":\"2024-07-24 16:15:53\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(449, 0, 0, '2024-07-24 14:17:37', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":5360,\"resetKey\":\"02d7625bfd5701a94c511078\",\"expireAt\":\"2024-07-24 16:18:37\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(450, 0, 0, '2024-07-24 14:21:59', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":9658,\"resetKey\":\"d723775a21c2a2c575b6c3af\",\"expireAt\":\"2024-07-24 16:22:59\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(451, 0, 0, '2024-07-24 14:26:43', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":1144,\"resetKey\":\"e4d0c67c0ca27bb35356705e\",\"expireAt\":\"2024-07-25 16:26:43\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(452, 0, 0, '2024-07-24 14:32:32', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":5015,\"resetKey\":\"2267330f231b97cfbf463070\",\"expireAt\":\"2024-07-25 16:32:32\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(453, 0, 0, '2024-07-24 14:36:26', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":4277,\"resetKey\":\"8d8ff5e25931f31759b7ccf7\",\"expireAt\":\"2024-07-25 16:36:26\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(454, 0, 0, '2024-07-24 14:51:32', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":8538,\"resetKey\":\"a26b6b1b8f631978559a0145\",\"expireAt\":\"2024-07-25 16:51:32\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(455, 0, 0, '2024-07-24 14:58:34', '{\"Password\":\"1234\"}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"FacultySeniortyIndex\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2022\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"Email\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"56\",\"IndustrialExp\":\"56\",\"TotalExp\":\"112\",\"GTUStaffID\":\"56\",\"UserName\":\"dishant.ackplus@gmail.com\",\"Password\":\"12345\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721745356_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"no\",\"isDAdmin\":\"yes\"}', '[]', 'Updated row in faculty'),
(456, 0, 0, '2024-07-24 14:58:34', '[]', '{\"id\":\"40\",\"email\":\"dishant.ackplus@gmail.com\",\"phone\":\"0\",\"otp\":\"8538\",\"resetKey\":\"a26b6b1b8f631978559a0145\",\"expireAt\":\"2024-07-25 16:51:32\"}', '[]', 'Deleted row in verify_otp'),
(457, 0, 0, '2024-07-24 14:59:55', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":1541,\"resetKey\":\"0c4c715c31f28469db1856bc\",\"expireAt\":\"2024-07-24 16:58:55\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(458, 0, 0, '2024-07-24 15:00:17', '[]', '{\"id\":\"41\",\"email\":\"dishant.ackplus@gmail.com\",\"phone\":\"0\",\"otp\":\"1541\",\"resetKey\":\"0c4c715c31f28469db1856bc\",\"expireAt\":\"2024-07-24 16:58:55\"}', '[]', 'Deleted row in verify_otp'),
(459, 0, 0, '2024-07-25 05:57:46', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":3099,\"resetKey\":\"689c1f55ac4f74df29a1fc10\",\"expireAt\":\"2024-07-25 07:56:46\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(460, 0, 0, '2024-07-25 06:03:43', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":9386,\"resetKey\":\"ee4afb3c8a63ecbc5371d86d\",\"expireAt\":\"2024-07-25 08:02:43\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(461, 0, 0, '2024-07-25 06:05:48', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":4202,\"resetKey\":\"7198a8a99c1bbbb5fa9f2982\",\"expireAt\":\"2024-07-25 08:04:48\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(462, 0, 0, '2024-07-25 06:06:42', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":7566,\"resetKey\":\"42b4a93335a9f2b556c9036d\",\"expireAt\":\"2024-07-25 08:05:42\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(463, 0, 0, '2024-07-25 06:06:54', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":8952,\"resetKey\":\"b0e7e60a7ba59e3a64545eda\",\"expireAt\":\"2024-07-25 08:05:54\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(464, 0, 0, '2024-07-25 06:10:06', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":6998,\"resetKey\":\"b5a228fda602957d3c205b6c\",\"expireAt\":\"2024-07-25 08:09:06\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(465, 0, 0, '2024-07-25 06:11:02', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":6589,\"resetKey\":\"c064551d341a8960ceb112f4\",\"expireAt\":\"2024-07-25 08:10:02\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(466, 0, 0, '2024-07-25 06:11:17', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":9144,\"resetKey\":\"05b78be51e99db9084c225af\",\"expireAt\":\"2024-07-25 08:10:17\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(467, 0, 0, '2024-07-25 06:11:38', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":9676,\"resetKey\":\"8c41ae4908e4414ec3979f20\",\"expireAt\":\"2024-07-25 08:10:38\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(468, 0, 0, '2024-07-25 06:13:04', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":8289,\"resetKey\":\"0bd5e900b76459ffb8004cd9\",\"expireAt\":\"2024-07-25 08:12:04\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(469, 0, 0, '2024-07-25 06:13:11', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":6074,\"resetKey\":\"d2bc0b7cc2d6b7d24ecc024e\",\"expireAt\":\"2024-07-25 08:12:11\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(470, 0, 0, '2024-07-25 06:14:32', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":5178,\"resetKey\":\"d02335886e2a3c995328ec2f\",\"expireAt\":\"2024-07-25 08:13:32\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(471, 0, 0, '2024-07-25 06:15:00', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":9001,\"resetKey\":\"90e8ab3d544e1a9eec224d8e\",\"expireAt\":\"2024-07-25 08:14:00\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(472, 0, 0, '2024-07-25 06:15:25', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":4853,\"resetKey\":\"2000b7d28a5f02cb69273bff\",\"expireAt\":\"2024-07-25 08:14:25\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(473, 0, 0, '2024-07-25 06:16:55', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":5854,\"resetKey\":\"667c64ec49e9531448abb193\",\"expireAt\":\"2024-07-25 08:15:55\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(474, 0, 0, '2024-07-25 06:17:00', '[]', '[]', '[]', 'Email sent to dishant.ackplus@gmail.com'),
(475, 0, 0, '2024-07-25 06:34:47', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":6838,\"resetKey\":\"d018bb2b2a877cbcd4bcb7ff\",\"expireAt\":\"2024-07-25 08:33:47\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(476, 0, 0, '2024-07-25 06:34:52', '[]', '[]', '[]', 'Email sent to dishant.ackplus@gmail.com'),
(477, 2, 2, '2024-07-25 06:37:23', '[]', '[]', '[]', 'Logged In'),
(478, 2, 2, '2024-07-25 06:38:14', '[]', '[]', '[]', 'Logged Out'),
(479, 0, 0, '2024-07-25 06:39:14', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":7458,\"resetKey\":\"c9f0cd58c4d44c2614f46cfa\",\"expireAt\":\"2024-07-25 08:38:14\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(480, 0, 0, '2024-07-25 06:39:21', '[]', '[]', '[]', 'Email sent to dishant.ackplus@gmail.com'),
(481, 0, 0, '2024-07-25 06:39:47', '[]', '{\"id\":\"58\",\"email\":\"dishant.ackplus@gmail.com\",\"phone\":\"0\",\"otp\":\"7458\",\"resetKey\":\"c9f0cd58c4d44c2614f46cfa\",\"expireAt\":\"2024-07-25 08:38:14\"}', '[]', 'Deleted row in verify_otp'),
(482, 0, 0, '2024-07-25 06:40:36', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":9996,\"resetKey\":\"be19342f2804a5c3ef2195dd\",\"expireAt\":\"2024-07-26 08:40:36\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(483, 0, 0, '2024-07-25 06:40:47', '[]', '[]', '[]', 'Email sent to dishant.ackplus@gmail.com'),
(484, 0, 0, '2024-07-25 06:40:47', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":7372,\"resetKey\":\"16668f1fe31f408ed6aa5ffb\",\"expireAt\":\"2024-07-26 08:40:47\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(485, 0, 0, '2024-07-25 06:41:00', '[]', '[]', '[]', 'Email sent to dishant.ackplus@gmail.com'),
(486, 2, 2, '2024-07-25 06:42:33', '[]', '[]', '[]', 'Logged In'),
(487, 2, 2, '2024-07-25 06:48:39', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"InstituteorCompany\":null,\"Designation\":null,\"StartDate\":null,\"EndDate\":null,\"Status\":null}', '[]', '[]', 'Inserted new row into facultyexperience'),
(488, 2, 2, '2024-07-25 06:48:50', '[]', '{\"ID\":\"3\",\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"InstituteorCompany\":\"\",\"Designation\":\"\",\"StartDate\":\"\",\"EndDate\":\"\",\"UserName\":\"\",\"Status\":\"\",\"CreatedDate\":\"2024-07-25 12:18:39\"}', '[]', 'Deleted row in facultyexperience'),
(489, 2, 2, '2024-07-25 06:48:53', '[]', '[]', '[]', 'Logged Out'),
(490, 0, 0, '2024-07-25 06:49:50', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":9004,\"resetKey\":\"ee2c307a0f7feade2679b968\",\"expireAt\":\"2024-07-26 08:49:50\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(491, 0, 0, '2024-07-25 06:49:58', '[]', '[]', '[]', 'Email sent to dishant.ackplus@gmail.com'),
(492, 0, 0, '2024-07-25 07:22:41', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":9231,\"resetKey\":\"33fe42b0eecb5077af22177e\",\"expireAt\":\"2024-07-26 09:22:41\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(493, 0, 0, '2024-07-25 07:22:46', '[]', '[]', '[]', 'Email sent to dishant.ackplus@gmail.com'),
(494, 2, 2, '2024-07-25 07:34:53', '[]', '[]', '[]', 'Logged In'),
(495, 0, 0, '2024-07-26 04:37:03', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":7377,\"resetKey\":\"c8130e3cbe9daa687f3b4610\",\"expireAt\":\"2024-07-27 06:37:03\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(496, 0, 0, '2024-07-26 04:37:12', '[]', '[]', '[]', 'Email sent to dishant.ackplus@gmail.com'),
(497, 0, 0, '2024-07-26 04:37:12', '{\"email\":\"dishant.ackplus@gmail.com\",\"phone\":null,\"otp\":7324,\"resetKey\":\"c5dc55045c3cb2bd9e1230cd\",\"expireAt\":\"2024-07-27 06:37:12\"}', '[]', '[]', 'Inserted new row into verify_otp'),
(498, 0, 0, '2024-07-26 04:37:17', '[]', '[]', '[]', 'Email sent to dishant.ackplus@gmail.com'),
(499, 0, 0, '2024-07-26 04:41:10', '{\"Password\":\"123\"}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"FacultySeniortyIndex\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2022\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"Email\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"56\",\"IndustrialExp\":\"56\",\"TotalExp\":\"112\",\"GTUStaffID\":\"56\",\"UserName\":\"dishant.ackplus@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721745356_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"no\",\"isDAdmin\":\"yes\"}', '[]', 'Updated row in faculty'),
(500, 0, 0, '2024-07-26 04:41:10', '[]', '{\"id\":\"64\",\"email\":\"dishant.ackplus@gmail.com\",\"phone\":\"0\",\"otp\":\"7324\",\"resetKey\":\"c5dc55045c3cb2bd9e1230cd\",\"expireAt\":\"2024-07-27 06:37:12\"}', '[]', 'Deleted row in verify_otp'),
(501, 2, 2, '2024-07-26 04:41:16', '[]', '[]', '[]', 'Logged In'),
(502, 2, 2, '2024-07-26 04:46:20', '[]', '[]', '[]', 'Logged Out'),
(503, 2, 2, '2024-07-26 04:47:25', '[]', '[]', '[]', 'Logged In'),
(504, 2, 2, '2024-07-26 04:47:41', '{\"Name\":\"Test99889\",\"LaunchON\":\"June 2024\",\"FileName\":\"uploads/magazine/1721969261_test.pdf\"}', '[]', '[]', 'Inserted new row into dept_magazine'),
(505, 2, 2, '2024-07-26 05:42:44', '[]', '[]', '[]', 'Logged Out'),
(506, 1, 1, '2024-07-26 05:42:49', '[]', '[]', '[]', 'Logged In'),
(507, 1, 1, '2024-07-26 06:04:27', '{\"DepartmentID\":\"1\",\"FirstName\":\"esdfgdfg\"}', '[]', '[]', 'Inserted new row into faculty'),
(508, 1, 1, '2024-07-26 06:11:08', '{\"DepartmentID\":\"1\",\"FirstName\":\"ddfgdfg\"}', '[]', '[]', 'Inserted new row into faculty'),
(509, 1, 1, '2024-07-26 06:11:16', '{\"DepartmentID\":\"2\",\"FirstName\":\"ddfgdfg\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"3\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"\",\"FirstName\":\"ddfgdfg\",\"LastName\":\"\",\"DesignationID\":\"0\",\"JoiningDate\":\"\",\"InstituteJoiningDate\":\"\",\"ProfessionalEmail\":null,\"Email\":null,\"ContactNo\":null,\"MaxEducationQualification\":\"\",\"AreaofIntrest\":null,\"TeachingExp\":\"\",\"IndustrialExp\":\"\",\"TotalExp\":\"\",\"GTUStaffID\":null,\"UserName\":null,\"Password\":\"\",\"Password_hash\":\"\",\"Photo\":null,\"FacultyStatus\":\"Active\",\"isAdmin\":\"\",\"isDAdmin\":\"\"}', '[]', 'Updated row in faculty'),
(510, 1, 1, '2024-07-26 06:22:58', '{\"DepartmentID\":\"1\",\"FirstName\":\"Dishant\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":\"5\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(511, 1, 1, '2024-07-26 07:12:13', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"LastName\":\"Makwana\",\"FirstName\":\"Dishant\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":null,\"isDAdmin\":\"on\",\"isAdmin\":null}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":\"5\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(512, 1, 1, '2024-07-26 07:12:44', '{\"DepartmentID\":\"2\",\"Prefix\":\"MR.\",\"LastName\":\"Bhalala\",\"FirstName\":\"Kunj\",\"Email\":\"dishant.ackplus@gmail.com\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"UserName\":\"dishant.ackplus@gmail.com\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-27\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"GTUStaffID\":\"1\",\"TeachingExp\":\"1\",\"IndustrialExp\":\"1\",\"TotalExp\":null,\"isDAdmin\":\"on\",\"isAdmin\":null}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"FacultySeniortyIndex\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2022\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"Email\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"56\",\"IndustrialExp\":\"56\",\"TotalExp\":\"112\",\"GTUStaffID\":\"56\",\"UserName\":\"dishant.ackplus@gmail.com\",\"Password\":\"123\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721745356_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"no\",\"isDAdmin\":\"no\"}', '[]', 'Updated row in faculty'),
(513, 1, 1, '2024-07-26 07:59:33', '{\"DepartmentID\":\"2\",\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"Email\":\"dishant.ackplus@gmail.com\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"UserName\":\"dishant.ackplus@gmail.com\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-27\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"GTUStaffID\":\"1\",\"TeachingExp\":\"1\",\"IndustrialExp\":\"1\",\"TotalExp\":null,\"isDAdmin\":null,\"isAdmin\":null}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"FacultySeniortyIndex\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"Email\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"1\",\"IndustrialExp\":\"1\",\"TotalExp\":\"\",\"GTUStaffID\":\"1\",\"UserName\":\"dishant.ackplus@gmail.com\",\"Password\":\"123\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721745356_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"\",\"isDAdmin\":\"on\"}', '[]', 'Updated row in faculty'),
(514, 1, 1, '2024-07-26 07:59:41', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":null,\"isDAdmin\":null,\"isAdmin\":null}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":\"\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"\",\"isDAdmin\":\"on\"}', '[]', 'Updated row in faculty'),
(515, 1, 1, '2024-07-26 08:11:01', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":null,\"isDAdmin\":null,\"isAdmin\":null}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":\"\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"\",\"isDAdmin\":\"\"}', '[]', 'Updated row in faculty'),
(516, 1, 1, '2024-07-26 08:11:07', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":null,\"isDAdmin\":null,\"isAdmin\":null}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":\"\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"\",\"isDAdmin\":\"\"}', '[]', 'Updated row in faculty'),
(517, 1, 1, '2024-07-26 08:12:27', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":null,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":null,\"isAdmin\":null}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":\"\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"\",\"isDAdmin\":\"\"}', '[]', 'Updated row in faculty'),
(518, 1, 1, '2024-07-26 08:12:33', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":null,\"FacultyStatus\":\"Active\",\"isDAdmin\":null,\"isAdmin\":null}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":\"\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"\",\"isDAdmin\":\"\"}', '[]', 'Updated row in faculty'),
(519, 1, 1, '2024-07-26 08:19:36', '{\"DepartmentID\":\"1\",\"Semester\":\"5\",\"SubjectCode\":\"4351601\",\"SubjectName\":\"Foundation of AI and ML\",\"Theory\":\"3\",\"Tutorial\":\"0\",\"Practical\":\"2\",\"TotalHours\":null,\"GTUTheory\":\"70\",\"MID\":\"30\",\"ESE\":\"25\",\"PA\":\"25\",\"Total\":null,\"SyllabusFile\":\"\",\"Assignments\":\"\",\"Status\":\"active\"}', '{\"DepartmentID\":\"1\",\"Semester\":\"5\",\"SubjectCode\":\"4351601\",\"SubjectName\":\"Foundation of AI and ML\",\"Theory\":\"3\",\"Tutorial\":\"0\",\"Practical\":\"2\",\"TotalHours\":\"5\",\"GTUTheory\":\"70\",\"MID\":\"30\",\"ESE\":\"25\",\"PA\":\"25\",\"Total\":\"150\",\"SyllabusFile\":\"\",\"Assignments\":\"\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(520, 1, 1, '2024-07-26 08:34:54', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Active\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"No\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"3\",\"TotalExp\":\"50\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"\",\"isDAdmin\":\"\"}', '[]', 'Updated row in faculty'),
(521, 1, 1, '2024-07-26 08:35:03', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Active\",\"isDAdmin\":\"No\",\"isAdmin\":\"Yes\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"No\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(522, 1, 1, '2024-07-26 08:35:16', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Active\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"No\"}', '[]', 'Updated row in faculty'),
(523, 1, 1, '2024-07-26 08:35:33', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(524, 1, 1, '2024-07-26 08:35:37', '[]', '[]', '[]', 'Logged Out'),
(525, 1, 1, '2024-07-26 08:35:39', '[]', '[]', '[]', 'Logged In'),
(526, 1, 1, '2024-07-26 08:35:50', '{\"DepartmentID\":\"2\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(527, 1, 1, '2024-07-26 08:35:56', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\"}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(528, 1, 1, '2024-07-26 08:36:17', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant 1\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(529, 1, 1, '2024-07-26 08:36:27', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant 1\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(530, 1, 1, '2024-07-26 08:39:06', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty');
INSERT INTO `log` (`id`, `DepartmentID`, `FacultyID`, `time`, `new_data`, `old_data`, `TransDetails`, `log_title`) VALUES
(531, 1, 1, '2024-07-26 08:39:25', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(532, 1, 1, '2024-07-26 08:40:31', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"No\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(533, 1, 1, '2024-07-26 08:40:35', '[]', '[]', '[]', 'Logged Out'),
(534, 1, 1, '2024-07-26 08:40:36', '[]', '[]', '[]', 'Logged In'),
(535, 1, 1, '2024-07-26 08:40:46', '[]', '[]', '[]', 'Logged In'),
(536, 1, 1, '2024-07-26 08:41:07', '[]', '[]', '[]', 'Logged Out'),
(537, 1, 1, '2024-07-26 08:41:08', '[]', '[]', '[]', 'Logged In'),
(538, 1, 1, '2024-07-26 08:41:16', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(539, 1, 1, '2024-07-26 10:26:47', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\",\"Photo\":\"uploads/faculty_profile/1721989607_Miduam Lofo.png\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721713325_download.jpeg\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(540, 1, 1, '2024-07-26 10:27:20', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\",\"Photo\":\"uploads/faculty_profile/1721989640_Favicon.png\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721989607_Miduam Lofo.png\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(541, 1, 1, '2024-07-26 10:27:37', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Transfer\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\",\"Photo\":\"uploads/faculty_profile/1721989657_Final.jpg\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721989640_Favicon.png\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(542, 1, 1, '2024-07-26 10:29:25', '[]', '{\"DepartmentID\":\"2\",\"FacultyID\":\"3\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"\",\"FirstName\":\"ddfgdfg\",\"LastName\":\"\",\"DesignationID\":\"0\",\"JoiningDate\":\"\",\"InstituteJoiningDate\":\"\",\"ProfessionalEmail\":null,\"Email\":null,\"ContactNo\":null,\"MaxEducationQualification\":\"\",\"AreaofIntrest\":null,\"TeachingExp\":\"\",\"IndustrialExp\":\"\",\"TotalExp\":\"\",\"GTUStaffID\":null,\"UserName\":null,\"Password\":\"\",\"Password_hash\":\"\",\"Photo\":null,\"FacultyStatus\":\"Active\",\"isAdmin\":\"\",\"isDAdmin\":\"\"}', '[]', 'Deleted row in faculty'),
(543, 1, 1, '2024-07-26 10:51:06', '{\"DepartmentID\":\"2\",\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"Email\":\"dishant.ackplus@gmail.com\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"UserName\":\"dishant.ackplus@gmail.com\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-27\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"GTUStaffID\":\"1\",\"TeachingExp\":\"1\",\"IndustrialExp\":\"1\",\"TotalExp\":2,\"FacultyStatus\":\"Active\",\"isDAdmin\":\"No\",\"isAdmin\":\"No\",\"Photo\":\"uploads/faculty_profile/1721991066_Color Hunt Palette b4b4b8c7c8cce3e1d9f2efe5.png\"}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"FacultySeniortyIndex\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"Email\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"1\",\"IndustrialExp\":\"1\",\"TotalExp\":\"\",\"GTUStaffID\":\"1\",\"UserName\":\"dishant.ackplus@gmail.com\",\"Password\":\"123\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721745356_download.jpeg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"\",\"isDAdmin\":\"\"}', '[]', 'Updated row in faculty'),
(544, 1, 1, '2024-07-26 10:51:13', '[]', '{\"DepartmentID\":\"2\",\"FacultyID\":\"2\",\"FacultySeniortyIndex\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhalala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-27\",\"ProfessionalEmail\":\"dishant.ackplus@gmail.com\",\"Email\":\"dishant.ackplus@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"1\",\"IndustrialExp\":\"1\",\"TotalExp\":\"2\",\"GTUStaffID\":\"1\",\"UserName\":\"dishant.ackplus@gmail.com\",\"Password\":\"123\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721991066_Color Hunt Palette b4b4b8c7c8cce3e1d9f2efe5.png\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"No\",\"isDAdmin\":\"No\"}', '[]', 'Deleted row in faculty'),
(545, 1, 1, '2024-07-26 10:52:24', '{\"DepartmentID\":\"2\",\"Prefix\":\"Mr.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhala\",\"Email\":\"bhalalakunj@gmail.com\",\"ProfessionalEmail\":\"bhalalakunj@gmail.com\",\"ContactNo\":\"8989\",\"UserName\":\"bhalalakunj@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-07-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"GTUStaffID\":\"0002\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"2\",\"TotalExp\":4,\"FacultyStatus\":\"Active\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"No\",\"Photo\":\"uploads/faculty_profile/1721991144_Miduam Lofo.png\"}', '[]', '[]', 'Inserted new row into faculty'),
(546, 1, 1, '2024-07-26 11:04:09', '{\"Password\":\"123\"}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"4\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"Mr.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-07-26\",\"ProfessionalEmail\":\"bhalalakunj@gmail.com\",\"Email\":\"bhalalakunj@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"2\",\"TotalExp\":\"4\",\"GTUStaffID\":\"0002\",\"UserName\":\"bhalalakunj@gmail.com\",\"Password\":\"\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721991144_Miduam Lofo.png\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"No\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(547, 1, 1, '2024-07-26 11:04:56', '{\"Password\":\"123\"}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"4\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"Mr.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-07-26\",\"ProfessionalEmail\":\"bhalalakunj@gmail.com\",\"Email\":\"bhalalakunj@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"2\",\"TotalExp\":\"4\",\"GTUStaffID\":\"0002\",\"UserName\":\"bhalalakunj@gmail.com\",\"Password\":\"123\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721991144_Miduam Lofo.png\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"No\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(548, 2, 4, '2024-07-26 11:05:28', '[]', '[]', '[]', 'Logged In'),
(549, 2, 1, '2024-07-26 11:15:36', '2', '1', '[]', '{\"Department ID: \":\"2\"}'),
(550, 2, 1, '2024-07-26 11:19:57', '{\"DepartmentID\":\"1\",\"Name\":\"Test999\",\"LaunchON\":\"September 2024\",\"FileName\":\"uploads/magazine/1721284289_test.pdf\"}', '{\"ID\":\"2\",\"DepartmentID\":\"0\",\"Name\":\"Test999\",\"FileName\":\"uploads/magazine/1721284289_test.pdf\",\"LaunchON\":\"September 2024\"}', '[]', 'Updated row in dept_magazine'),
(551, 2, 1, '2024-07-26 11:20:02', '{\"DepartmentID\":\"2\",\"Name\":\"Test99889\",\"LaunchON\":\"June 2024\",\"FileName\":\"uploads/magazine/1721969261_test.pdf\"}', '{\"ID\":\"3\",\"DepartmentID\":\"0\",\"Name\":\"Test99889\",\"FileName\":\"uploads/magazine/1721969261_test.pdf\",\"LaunchON\":\"June 2024\"}', '[]', 'Updated row in dept_magazine'),
(552, 1, 1, '2024-07-26 11:21:37', '1', '1', '[]', '{\"Department ID: \":\"1\"}'),
(553, 2, 4, '2024-07-26 11:26:39', '{\"DepartmentID\":\"2\",\"FacultyID\":\"4\",\"InstituteorCompany\":null,\"Designation\":null,\"StartDate\":null,\"EndDate\":null,\"Status\":null}', '[]', '[]', 'Inserted new row into facultyexperience'),
(554, 2, 4, '2024-07-26 11:26:43', '[]', '{\"ID\":\"4\",\"DepartmentID\":\"2\",\"FacultyID\":\"4\",\"InstituteorCompany\":\"\",\"Designation\":\"\",\"StartDate\":\"\",\"EndDate\":\"\",\"UserName\":\"\",\"Status\":\"\",\"CreatedDate\":\"2024-07-26 16:56:39\"}', '[]', 'Deleted row in facultyexperience'),
(555, 2, 4, '2024-07-26 11:26:47', '[]', '[]', '[]', 'Logged Out'),
(556, 1, 1, '2024-07-26 11:26:59', '[]', '[]', '[]', 'Logged In'),
(557, 1, 1, '2024-07-26 11:32:02', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"TrainingTitle\":\"Test\",\"HostingOrganization\":\"Test\",\"StartDate\":\"2024-07-23\",\"EndDate\":\"2024-07-26\",\"Noofweeks\":\"5\"}', '[]', '[]', 'Inserted new row into trainingdetails'),
(558, 2, 1, '2024-07-26 11:32:08', '2', '1', '[]', '{\"Department ID: \":\"2\"}'),
(559, 2, 1, '2024-07-26 11:35:21', '{\"DepartmentID\":\"2\",\"FacultyID\":\"1\",\"TrainingTitle\":\"Test\",\"HostingOrganization\":\"Test\",\"StartDate\":\"2024-07-23\",\"EndDate\":\"2024-07-26\",\"Noofweeks\":\"5\"}', '{\"ID\":\"1\",\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"TrainingTitle\":\"Test\",\"StartDate\":\"2024-07-23\",\"EndDate\":\"2024-07-26\",\"HostingOrganization\":\"Test\",\"Noofweeks\":\"5\",\"CreatedDate\":\"2024-07-26 17:02:02\"}', '[]', 'Updated row in trainingdetails'),
(560, 1, 1, '2024-07-26 11:36:50', '1', '1', '[]', '{\"Department ID: \":\"1\"}'),
(561, 2, 1, '2024-07-26 11:36:52', '2', '1', '[]', '{\"Department ID: \":\"2\"}'),
(562, 2, 4, '2024-07-26 11:37:26', '[]', '[]', '[]', 'Logged In'),
(563, 2, 1, '2024-07-26 11:40:01', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"TrainingTitle\":\"Dept Test\",\"HostingOrganization\":\"Test \",\"StartDate\":\"2024-07-18\",\"EndDate\":\"2024-07-26\",\"Noofweeks\":\"8\"}', '[]', '[]', 'Inserted new row into trainingdetails'),
(564, 1, 1, '2024-07-26 11:40:07', '1', '1', '[]', '{\"Department ID: \":\"1\"}'),
(565, 2, 1, '2024-07-26 11:41:36', '2', '1', '[]', '{\"Department ID: \":\"2\"}'),
(566, 1, 1, '2024-07-26 11:41:38', '1', '1', '[]', '{\"Department ID: \":\"1\"}'),
(567, 1, 1, '2024-07-26 11:44:51', '{\"CreatedBy\":\"1\",\"DepartmentID\":\"1\",\"ActivityTitle\":\"Test\",\"ActivityType\":\"Co-curricular\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Status\":\"active\",\"Venue\":\"GPA\"}', '[]', '[]', 'Inserted new row into activity'),
(568, 1, 1, '2024-07-26 11:45:24', '{\"CreatedBy\":\"1\",\"DepartmentID\":\"1\",\"ActivityTitle\":\"Test\",\"ActivityType\":\"Co-curricular\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Status\":\"active\",\"Venue\":\"Test\"}', '{\"ID\":\"1\",\"DepartmentID\":\"1\",\"ActivityType\":\"Co-curricular\",\"ActivityTitle\":\"Test\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Venue\":\"GPA\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"Status\":\"active\",\"CreatedBy\":\"1\",\"CreatedDate\":\"2024-07-26 17:14:51\",\"ModifiedBy\":\"\",\"ModfiedDate\":\"0000-00-00 00:00:00\"}', '[]', 'Updated row in activity'),
(569, 1, 1, '2024-07-26 11:45:53', '{\"CreatedBy\":\"1\",\"DepartmentID\":\"1\",\"ActivityTitle\":\"Test\",\"ActivityType\":\"Co-curricular\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Status\":\"active\",\"Venue\":\"Test\"}', '{\"ID\":\"1\",\"DepartmentID\":\"1\",\"ActivityType\":\"Co-curricular\",\"ActivityTitle\":\"Test\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Venue\":\"Test\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"Status\":\"active\",\"CreatedBy\":\"1\",\"CreatedDate\":\"2024-07-26 17:14:51\",\"ModifiedBy\":\"\",\"ModfiedDate\":\"0000-00-00 00:00:00\"}', '[]', 'Updated row in activity'),
(570, 1, 1, '2024-07-26 11:48:38', '[]', '[]', '[]', 'Logged Out'),
(571, 1, 1, '2024-07-26 11:48:43', '[]', '[]', '[]', 'Logged In'),
(572, 1, 1, '2024-07-26 11:54:01', '{\"CreatedBy\":\"MR. Dishant Makwana\",\"DepartmentID\":\"1\",\"ActivityTitle\":\"Test\",\"ActivityType\":\"Co-curricular\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Status\":\"Active\",\"Venue\":\"Test\"}', '{\"ID\":\"1\",\"DepartmentID\":\"1\",\"ActivityType\":\"Co-curricular\",\"ActivityTitle\":\"Test\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Venue\":\"Test\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"Status\":\"active\",\"CreatedBy\":\"1\",\"CreatedDate\":\"2024-07-26 17:14:51\",\"ModifiedBy\":\"\",\"ModfiedDate\":\"0000-00-00 00:00:00\"}', '[]', 'Updated row in activity'),
(573, 1, 1, '2024-07-26 11:54:52', '{\"DepartmentID\":\"1\",\"ActivityTitle\":\"Test\",\"ActivityType\":\"Co-curricular\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Status\":\"Active\",\"Venue\":\"Test\",\"ModifiedBy\":\"MR. Dishant Makwana\",\"ModfiedDate\":\"2024-07-26\"}', '{\"ID\":\"1\",\"DepartmentID\":\"1\",\"ActivityType\":\"Co-curricular\",\"ActivityTitle\":\"Test\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Venue\":\"Test\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"Status\":\"Active\",\"CreatedBy\":\"MR. Dishant Makwana\",\"CreatedDate\":\"2024-07-26 17:14:51\",\"ModifiedBy\":\"\",\"ModfiedDate\":\"0000-00-00 00:00:00\"}', '[]', 'Updated row in activity'),
(574, 1, 1, '2024-07-26 11:56:32', '{\"DepartmentID\":\"1\",\"ActivityTitle\":\"Test\",\"ActivityType\":\"Co-curricular\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Status\":\"Active\",\"Venue\":\"Test\",\"ModifiedBy\":\"MR. Dishant Makwana\",\"ModfiedDate\":\"2024-07-26 13:56:32\"}', '{\"ID\":\"1\",\"DepartmentID\":\"1\",\"ActivityType\":\"Co-curricular\",\"ActivityTitle\":\"Test\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Venue\":\"Test\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"Status\":\"Active\",\"CreatedBy\":\"MR. Dishant Makwana\",\"CreatedDate\":\"2024-07-26 17:14:51\",\"ModifiedBy\":\"MR. Dishant Makwana\",\"ModfiedDate\":\"2024-07-26 00:00:00\"}', '[]', 'Updated row in activity'),
(575, 1, 1, '2024-07-26 11:57:33', '{\"DepartmentID\":\"2\",\"ActivityTitle\":\"Test\",\"ActivityType\":\"Co-curricular\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Status\":\"Active\",\"Venue\":\"Test\",\"ModifiedBy\":\"MR. Dishant Makwana\",\"ModfiedDate\":\"2024-07-26 13:57:33\"}', '{\"ID\":\"1\",\"DepartmentID\":\"1\",\"ActivityType\":\"Co-curricular\",\"ActivityTitle\":\"Test\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Venue\":\"Test\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"Status\":\"Active\",\"CreatedBy\":\"MR. Dishant Makwana\",\"CreatedDate\":\"2024-07-26 17:14:51\",\"ModifiedBy\":\"MR. Dishant Makwana\",\"ModfiedDate\":\"2024-07-26 13:56:32\"}', '[]', 'Updated row in activity'),
(576, 2, 1, '2024-07-26 11:57:37', '2', '1', '[]', '{\"Department ID: \":\"2\"}'),
(577, 2, 4, '2024-07-26 11:58:05', '{\"DepartmentID\":\"2\",\"ActivityTitle\":\"Test\",\"ActivityType\":\"Co-curricular\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Status\":\"Active\",\"Venue\":\"Test\",\"ModifiedBy\":null,\"ModfiedDate\":\"2024-07-26 13:58:05\"}', '{\"ID\":\"1\",\"DepartmentID\":\"2\",\"ActivityType\":\"Co-curricular\",\"ActivityTitle\":\"Test\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Venue\":\"Test\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"Status\":\"Active\",\"CreatedBy\":\"MR. Dishant Makwana\",\"CreatedDate\":\"2024-07-26 17:14:51\",\"ModifiedBy\":\"MR. Dishant Makwana\",\"ModfiedDate\":\"2024-07-26 13:57:33\"}', '[]', 'Updated row in activity'),
(578, 2, 4, '2024-07-26 11:58:16', '[]', '[]', '[]', 'Logged Out'),
(579, 2, 4, '2024-07-26 11:58:17', '[]', '[]', '[]', 'Logged In'),
(580, 2, 4, '2024-07-26 11:58:21', '{\"DepartmentID\":\"2\",\"ActivityTitle\":\"Test\",\"ActivityType\":\"Co-curricular\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Status\":\"Active\",\"Venue\":\"Test\",\"ModifiedBy\":\"Mr. Kunj Bhala\",\"ModfiedDate\":\"2024-07-26 13:58:21\"}', '{\"ID\":\"1\",\"DepartmentID\":\"2\",\"ActivityType\":\"Co-curricular\",\"ActivityTitle\":\"Test\",\"StartDate\":\"2024-07-24\",\"EndDate\":\"2024-07-26\",\"Description\":\"dfdsfdsf\",\"Venue\":\"Test\",\"ActivityReportFileName\":\"uploads/activity/1721994291_test.pdf\",\"Status\":\"Active\",\"CreatedBy\":\"MR. Dishant Makwana\",\"CreatedDate\":\"2024-07-26 17:14:51\",\"ModifiedBy\":\"\",\"ModfiedDate\":\"2024-07-26 13:58:05\"}', '[]', 'Updated row in activity'),
(581, 2, 4, '2024-07-26 11:58:52', '{\"CreatedBy\":\"Mr. Kunj Bhala\",\"DepartmentID\":\"2\",\"ActivityTitle\":\"Test\",\"ActivityType\":\"Extra-Curricular\",\"ActivityReportFileName\":\"uploads/activity/1721995132_intership report.pptx\",\"StartDate\":\"2024-07-22\",\"EndDate\":\"2024-07-25\",\"Description\":\"sfsdf\",\"Status\":\"Active\",\"Venue\":\"fsdfdjn\"}', '[]', '[]', 'Inserted new row into activity'),
(582, 2, 1, '2024-07-26 11:59:51', '[]', '{\"ID\":\"2\",\"DepartmentID\":\"2\",\"ActivityType\":\"Extra-Curricular\",\"ActivityTitle\":\"Test\",\"StartDate\":\"2024-07-22\",\"EndDate\":\"2024-07-25\",\"Description\":\"sfsdf\",\"Venue\":\"fsdfdjn\",\"ActivityReportFileName\":\"uploads/activity/1721995132_intership report.pptx\",\"Status\":\"Active\",\"CreatedBy\":\"Mr. Kunj Bhala\",\"CreatedDate\":\"2024-07-26 17:28:52\",\"ModifiedBy\":\"\",\"ModfiedDate\":\"0000-00-00 00:00:00\"}', '[]', 'Deleted row in activity'),
(583, 2, 1, '2024-07-26 12:03:18', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"Degree\":\"Test\",\"University\":\"GPA\",\"Specialization\":\"sdfsfd\",\"Percentage\":\"100\",\"PassingYear\":\"2024\"}', '{\"ID\":\"1\",\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"Degree\":\"Test\",\"University\":\"GPA\",\"PassingYear\":\"2024\",\"Specialization\":\"sdfsfd\",\"Percentage\":\"100\",\"UserName\":\"\",\"status\":\"Active\",\"CreatedDate\":\"2024-07-23 11:12:50\"}', '[]', 'Updated row in facultyeducation'),
(584, 1, 1, '2024-07-26 12:06:18', '1', '1', '[]', '{\"Department ID: \":\"1\"}'),
(585, 1, 1, '2024-07-26 12:06:24', '{\"LogoName\":\"uploads/../../uploads/department_images/1/1721995584_download.jpeg\"}', '{\"DepartmentID\":\"1\",\"DepartmentName\":\"IT\",\"About\":\"test\",\"LogoName\":\"uploads/../../uploads/department_images/1/1721318874_1.PNG\",\"Facility1\":null,\"Facility2\":null,\"Facility3\":null,\"Facility4\":null,\"Facility5\":null,\"Facility6\":\"\",\"Facility7\":\"\",\"Facility8\":\"\",\"Facility9\":\"\",\"Facility10\":\"\",\"FacilityLink1\":\"\",\"FacilityLink2\":\"\",\"FacilityLink3\":\"\",\"ImageName1\":\"uploads/../../uploads/department_images/1/1721713511_download.jpeg\",\"ImageName2\":\"\",\"ImageName3\":\"\",\"ImageName4\":\"\",\"ImageName5\":\"\",\"ImageDesc1\":\"Com\",\"ImageDesc2\":\"\",\"ImageDesc3\":\"\",\"ImageDesc4\":\"\",\"ImageDesc5\":\"\",\"YearofStarting\":\"\",\"Level\":\"\",\"FirstYearofApprovalFromCouncil\":\"\",\"Period\":\"0\",\"Intake\":\"\",\"Vision\":\"\",\"Mission1\":\"tgthvyjyhjyffu\",\"Mission2\":\"ggt\",\"Mission3\":\"ththtr\",\"Mission4\":\"gtgthhthtgbd\",\"Mission5\":\"thyhh\",\"PEO1\":\"\",\"PEO2\":\"\",\"PEO3\":null,\"PEO4\":null,\"PEO5\":null,\"PSO1\":\"\",\"PSO2\":null,\"PSO3\":null,\"PSO4\":null,\"PSO5\":\"\",\"UserName\":\"\"}', '[]', 'Updated row in department'),
(586, 2, 1, '2024-07-26 12:06:29', '2', '1', '[]', '{\"Department ID: \":\"2\"}'),
(587, 1, 1, '2024-07-26 12:06:32', '1', '1', '[]', '{\"Department ID: \":\"1\"}'),
(588, 1, 1, '2024-07-26 12:06:41', '{\"About\":\"THisdhisdaskfnasdsfds it dept\"}', '{\"DepartmentID\":\"1\",\"DepartmentName\":\"IT\",\"About\":\"test\",\"LogoName\":\"uploads/../../uploads/department_images/1/1721995584_download.jpeg\",\"Facility1\":null,\"Facility2\":null,\"Facility3\":null,\"Facility4\":null,\"Facility5\":null,\"Facility6\":\"\",\"Facility7\":\"\",\"Facility8\":\"\",\"Facility9\":\"\",\"Facility10\":\"\",\"FacilityLink1\":\"\",\"FacilityLink2\":\"\",\"FacilityLink3\":\"\",\"ImageName1\":\"uploads/../../uploads/department_images/1/1721713511_download.jpeg\",\"ImageName2\":\"\",\"ImageName3\":\"\",\"ImageName4\":\"\",\"ImageName5\":\"\",\"ImageDesc1\":\"Com\",\"ImageDesc2\":\"\",\"ImageDesc3\":\"\",\"ImageDesc4\":\"\",\"ImageDesc5\":\"\",\"YearofStarting\":\"\",\"Level\":\"\",\"FirstYearofApprovalFromCouncil\":\"\",\"Period\":\"0\",\"Intake\":\"\",\"Vision\":\"\",\"Mission1\":\"tgthvyjyhjyffu\",\"Mission2\":\"ggt\",\"Mission3\":\"ththtr\",\"Mission4\":\"gtgthhthtgbd\",\"Mission5\":\"thyhh\",\"PEO1\":\"\",\"PEO2\":\"\",\"PEO3\":null,\"PEO4\":null,\"PEO5\":null,\"PSO1\":\"\",\"PSO2\":null,\"PSO3\":null,\"PSO4\":null,\"PSO5\":\"\",\"UserName\":\"\"}', '[]', 'Updated row in department'),
(589, 2, 1, '2024-07-26 12:06:46', '2', '1', '[]', '{\"Department ID: \":\"2\"}'),
(590, 2, 1, '2024-07-26 12:07:14', '{\"LogoName\":\"uploads/../../uploads/department_images/1/1721995634_Color Hunt Palette b4b4b8c7c8cce3e1d9f2efe5.png\"}', '{\"DepartmentID\":\"1\",\"DepartmentName\":\"IT\",\"About\":\"THisdhisdaskfnasdsfds it dept\",\"LogoName\":\"uploads/../../uploads/department_images/1/1721995584_download.jpeg\",\"Facility1\":null,\"Facility2\":null,\"Facility3\":null,\"Facility4\":null,\"Facility5\":null,\"Facility6\":\"\",\"Facility7\":\"\",\"Facility8\":\"\",\"Facility9\":\"\",\"Facility10\":\"\",\"FacilityLink1\":\"\",\"FacilityLink2\":\"\",\"FacilityLink3\":\"\",\"ImageName1\":\"uploads/../../uploads/department_images/1/1721713511_download.jpeg\",\"ImageName2\":\"\",\"ImageName3\":\"\",\"ImageName4\":\"\",\"ImageName5\":\"\",\"ImageDesc1\":\"Com\",\"ImageDesc2\":\"\",\"ImageDesc3\":\"\",\"ImageDesc4\":\"\",\"ImageDesc5\":\"\",\"YearofStarting\":\"\",\"Level\":\"\",\"FirstYearofApprovalFromCouncil\":\"\",\"Period\":\"0\",\"Intake\":\"\",\"Vision\":\"\",\"Mission1\":\"tgthvyjyhjyffu\",\"Mission2\":\"ggt\",\"Mission3\":\"ththtr\",\"Mission4\":\"gtgthhthtgbd\",\"Mission5\":\"thyhh\",\"PEO1\":\"\",\"PEO2\":\"\",\"PEO3\":null,\"PEO4\":null,\"PEO5\":null,\"PSO1\":\"\",\"PSO2\":null,\"PSO3\":null,\"PSO4\":null,\"PSO5\":\"\",\"UserName\":\"\"}', '[]', 'Updated row in department'),
(591, 1, 1, '2024-07-26 12:08:26', '1', '1', '[]', '{\"Department ID: \":\"1\"}'),
(592, 1, 1, '2024-07-26 12:10:52', '{\"ImageDesc5\":\"vsv\"}', '{\"DepartmentID\":\"1\",\"DepartmentName\":\"IT\",\"About\":\"THisdhisdaskfnasdsfds it dept\",\"LogoName\":\"uploads/../../uploads/department_images/1/1721995634_Color Hunt Palette b4b4b8c7c8cce3e1d9f2efe5.png\",\"Facility1\":null,\"Facility2\":null,\"Facility3\":null,\"Facility4\":null,\"Facility5\":null,\"Facility6\":\"\",\"Facility7\":\"\",\"Facility8\":\"\",\"Facility9\":\"\",\"Facility10\":\"\",\"FacilityLink1\":\"\",\"FacilityLink2\":\"\",\"FacilityLink3\":\"\",\"ImageName1\":\"uploads/../../uploads/department_images/1/1721713511_download.jpeg\",\"ImageName2\":\"\",\"ImageName3\":\"\",\"ImageName4\":\"\",\"ImageName5\":\"\",\"ImageDesc1\":\"Com\",\"ImageDesc2\":\"\",\"ImageDesc3\":\"\",\"ImageDesc4\":\"\",\"ImageDesc5\":\"\",\"YearofStarting\":\"\",\"Level\":\"\",\"FirstYearofApprovalFromCouncil\":\"\",\"Period\":\"0\",\"Intake\":\"\",\"Vision\":\"\",\"Mission1\":\"dssdsdfs\",\"Mission2\":\"ggt\",\"Mission3\":\"ththtr\",\"Mission4\":\"gtgthhthtgbd\",\"Mission5\":\"thyhh\",\"PEO1\":\"\",\"PEO2\":\"\",\"PEO3\":null,\"PEO4\":null,\"PEO5\":null,\"PSO1\":\"\",\"PSO2\":null,\"PSO3\":null,\"PSO4\":null,\"PSO5\":\"\",\"UserName\":\"\"}', '[]', 'Updated row in department'),
(593, 1, 1, '2024-07-26 12:12:31', '{\"DepartmentID\":\"1\",\"Prefix\":\" \",\"FirstName\":\"Super\",\"LastName\":\"Admin\",\"Email\":\"superadmin@gpa.com\",\"ProfessionalEmail\":\"superadmin@gpa.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"superadmin@gpa.com\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Coding\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Active\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\",\"Photo\":\"uploads/faculty_profile/1721989657_Final.jpg\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"makwanadishant644@gmail.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721989657_Final.jpg\",\"FacultyStatus\":\"Transfer\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(594, 1, 1, '2024-07-26 12:13:18', '{\"DepartmentID\":\"2\",\"Prefix\":\"Mr.\",\"FirstName\":\"Department\",\"LastName\":\"Admin\",\"Email\":\"admin@gpa.com\",\"ProfessionalEmail\":\"admin@gpa.com\",\"ContactNo\":\"9999\",\"UserName\":\"admin@gpa.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-07-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Testing\",\"GTUStaffID\":\"0002\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"2\",\"TotalExp\":4,\"FacultyStatus\":\"Active\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"No\",\"Photo\":\"uploads/faculty_profile/1721991144_Miduam Lofo.png\"}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"4\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"Mr.\",\"FirstName\":\"Kunj\",\"LastName\":\"Bhala\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-07-26\",\"ProfessionalEmail\":\"bhalalakunj@gmail.com\",\"Email\":\"bhalalakunj@gmail.com\",\"ContactNo\":\"8989\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Gamming\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"2\",\"TotalExp\":\"4\",\"GTUStaffID\":\"0002\",\"UserName\":\"bhalalakunj@gmail.com\",\"Password\":\"123\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721991144_Miduam Lofo.png\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"No\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(595, 1, 1, '2024-07-26 12:13:25', '{\"DepartmentID\":\"1\",\"Prefix\":\" \",\"FirstName\":\"Super\",\"LastName\":\"Admin\",\"Email\":\"superadmin@gpa.com\",\"ProfessionalEmail\":\"superadmin@gpa.com\",\"ContactNo\":\"787787878\",\"UserName\":\"superadmin@gpa.com\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Coding\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Active\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\",\"Photo\":\"uploads/faculty_profile/1721989657_Final.jpg\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\" \",\"FirstName\":\"Super\",\"LastName\":\"Admin\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-11\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"superadmin@gpa.com\",\"Email\":\"superadmin@gpa.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Coding\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\":\"0001\",\"UserName\":\"superadmin@gpa.com\",\"Password\":\"1234\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721989657_Final.jpg\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"Yes\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty'),
(596, 1, 1, '2024-07-26 12:13:34', '{\"DepartmentID\":\"2\",\"Prefix\":\" \",\"FirstName\":\"Department\",\"LastName\":\"Admin\",\"Email\":\"admin@gpa.com\",\"ProfessionalEmail\":\"admin@gpa.com\",\"ContactNo\":\"9999\",\"UserName\":\"admin@gpa.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-07-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Testing\",\"GTUStaffID\":\"0002\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"2\",\"TotalExp\":4,\"FacultyStatus\":\"Active\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"No\",\"Photo\":\"uploads/faculty_profile/1721991144_Miduam Lofo.png\"}', '{\"DepartmentID\":\"2\",\"FacultyID\":\"4\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"Mr.\",\"FirstName\":\"Department\",\"LastName\":\"Admin\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-07-26\",\"ProfessionalEmail\":\"admin@gpa.com\",\"Email\":\"admin@gpa.com\",\"ContactNo\":\"9999\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"Testing\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"2\",\"TotalExp\":\"4\",\"GTUStaffID\":\"0002\",\"UserName\":\"admin@gpa.com\",\"Password\":\"123\",\"Password_hash\":\"\",\"Photo\":\"uploads/faculty_profile/1721991144_Miduam Lofo.png\",\"FacultyStatus\":\"Active\",\"isAdmin\":\"No\",\"isDAdmin\":\"Yes\"}', '[]', 'Updated row in faculty');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `ID` int(11) NOT NULL,
  `NewsDate` date NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `NewsFile` longblob NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `news_update`
--

CREATE TABLE `news_update` (
  `news_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `news_title` varchar(300) DEFAULT NULL,
  `news_description` text NOT NULL,
  `news_image` longblob DEFAULT NULL,
  `news_pdf` longblob DEFAULT NULL,
  `inserted_by` int(11) DEFAULT NULL,
  `inserted_time` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_time` datetime NOT NULL DEFAULT current_timestamp(),
  `active` bit(1) NOT NULL DEFAULT b'1',
  `active_top` bit(1) NOT NULL DEFAULT b'1',
  `deleted` int(1) NOT NULL DEFAULT 0,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(15) NOT NULL,
  `otp` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subjectdetails`
--

CREATE TABLE `subjectdetails` (
  `DepartmentID` int(11) NOT NULL,
  `Semester` int(11) NOT NULL,
  `SubjectCode` varchar(10) NOT NULL,
  `SubjectName` varchar(200) NOT NULL,
  `Theory` int(11) NOT NULL,
  `Tutorial` int(11) NOT NULL,
  `Practical` int(11) NOT NULL,
  `TotalHours` int(11) NOT NULL,
  `GTUTheory` int(11) NOT NULL,
  `MID` int(11) NOT NULL,
  `ESE` int(11) NOT NULL,
  `PA` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `SyllabusFile` varchar(255) DEFAULT NULL,
  `Assignments` varchar(255) DEFAULT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjectdetails`
--

INSERT INTO `subjectdetails` (`DepartmentID`, `Semester`, `SubjectCode`, `SubjectName`, `Theory`, `Tutorial`, `Practical`, `TotalHours`, `GTUTheory`, `MID`, `ESE`, `PA`, `Total`, `SyllabusFile`, `Assignments`, `Status`) VALUES
(2, 5, '4350702', 'Introduction to Machine Learning', 3, 0, 4, 7, 70, 30, 25, 25, 150, '', '', 'active'),
(2, 5, '4350703', ' Mobile Application Development using Android', 0, 0, 4, 4, 0, 0, 25, 25, 50, '', '', 'active'),
(1, 5, '4351601', 'Foundation of AI and ML', 3, 0, 2, 0, 70, 30, 25, 25, 0, '', '', 'active'),
(1, 5, '4351602', 'Mobile Computing and Networks', 3, 0, 2, 5, 70, 30, 25, 25, 150, '', '', 'active'),
(1, 5, '4351603', ' Advanced Java Programming', 3, 0, 2, 5, 70, 30, 25, 25, 150, '', '', 'active'),
(1, 5, '4351604', ' Mobile Application Development', 0, 0, 4, 4, 0, 0, 25, 25, 50, '', '', 'active'),
(2, 5, '4350705', 'Fundamentals of Artificial Intelligence', 3, 0, 2, 5, 70, 30, 25, 25, 150, '', '', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `subjectunitdetails`
--

CREATE TABLE `subjectunitdetails` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `SubjectCode` varchar(10) NOT NULL,
  `Unit` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `UnitFile` varchar(255) NOT NULL DEFAULT '0',
  `AssignmentFile` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjectunitdetails`
--

INSERT INTO `subjectunitdetails` (`ID`, `DepartmentID`, `SubjectCode`, `Unit`, `Title`, `UnitFile`, `AssignmentFile`) VALUES
(35, 1, '4300021', 1, 'Introduction to Entrepreneu rship and Start – Ups', '', ''),
(36, 1, '4351601', 1, 'Basics of Computer Organization and Processor Evolution', '', ''),
(37, 2, '4350705', 1, 'Networking Essential', '', 'uploads/assignment_materials/1721365660_Acedamic Program Documentation.pdf'),
(38, 1, '4351603', 1, 'JAVA SWING', '', ''),
(39, 1, '4351604', 1, 'Introduction to Android App Development', '', ''),
(41, 2, '4350701', 1, 'Basics of Computer Organization and Processor Evolution', '', ''),
(42, 2, '4350702', 1, 'Introduction to machine learning', '', ''),
(43, 2, '4350703', 1, 'Basics of Android Development', '', ''),
(44, 1, '4351602', 1, 'Introduction to artificial intelligence', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `subjectwisegtupapers`
--

CREATE TABLE `subjectwisegtupapers` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `SubjectCode` varchar(10) NOT NULL,
  `GTUPaperFileName` varchar(100) NOT NULL,
  `Title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjectwisegtupapers`
--

INSERT INTO `subjectwisegtupapers` (`ID`, `DepartmentID`, `SubjectCode`, `GTUPaperFileName`, `Title`) VALUES
(29, 1, '4351601', '', 'Summer-2023'),
(30, 1, '4351602', '', 'Winter-2023'),
(31, 1, '4351603', '', 'Summer-2023'),
(32, 1, '4351604', '', 'Winter-2023'),
(35, 2, '4350703', '', 'Summer-2023'),
(36, 2, '4350702', '', 'Summer-2022'),
(37, 2, '4350705', '', 'Winter-2023');

-- --------------------------------------------------------

--
-- Table structure for table `sys_log`
--

CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL,
  `log` varchar(2000) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `UserName` varchar(200) NOT NULL,
  `TransDetails` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sys_log`
--

INSERT INTO `sys_log` (`id`, `log`, `time`, `UserName`, `TransDetails`) VALUES
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-28 13:51:46', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Updated Profile', '2024-06-28 13:53:22', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-06-28 13:54:07', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-28 13:54:16', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-06-28 13:55:20', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-28 13:55:27', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-06-28 13:59:36', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-28 13:59:43', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-28 18:18:19', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-29 08:19:47', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-29 13:48:45', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-29 17:38:00', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-29 19:22:56', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-30 09:23:32', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-30 15:19:46', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-06-30 20:21:20', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 09:20:42', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 10:54:37', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 12:56:21', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 15:59:45', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 18:33:37', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 18:51:40', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-07-01 18:52:51', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 18:53:11', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-07-01 18:53:17', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 18:53:18', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-07-01 19:22:37', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 19:22:39', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Logged In', '2024-07-01 19:28:44', '', ''),
(0, 'DepartmentID : 2 - FacultyID : 2 logged out', '2024-07-01 19:29:16', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Logged In', '2024-07-01 19:29:23', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Updated Profile', '2024-07-01 19:30:07', '', ''),
(0, 'DepartmentID : 2 - FacultyID : 2 logged out', '2024-07-01 19:31:33', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Logged In', '2024-07-01 19:31:59', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Updated Profile', '2024-07-01 19:37:02', '', ''),
(0, 'DepartmentID : 2 - FacultyID : 2 logged out', '2024-07-01 19:38:01', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 19:38:08', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-07-01 19:38:51', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Logged In', '2024-07-01 19:39:00', '', ''),
(0, 'DepartmentID : 2 - FacultyID : 2 logged out', '2024-07-01 19:41:53', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 19:41:57', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-07-01 19:44:29', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Logged In', '2024-07-01 19:44:37', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-07-01 19:45:06', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 19:45:07', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-07-01 19:45:11', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Logged In', '2024-07-01 19:45:19', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Logged In', '2024-07-01 19:50:19', '', ''),
(0, 'DepartmentID : 2 - FacultyID : 2 logged out', '2024-07-01 19:53:06', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 19:53:12', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Logged In', '2024-07-01 19:54:20', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 20:59:17', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-07-01 21:02:03', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Logged In', '2024-07-01 21:02:12', '', ''),
(0, 'DepartmentID : 2 and FacultyID : 2 Logged In', '2024-07-01 21:03:26', '', ''),
(0, 'DepartmentID : 2 - FacultyID : 2 logged out', '2024-07-01 21:14:53', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-01 21:15:00', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-04 09:53:28', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-04 13:15:02', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-04 13:21:24', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-04 16:33:12', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-04 22:22:21', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-04 22:27:12', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-05 21:45:02', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Added Experience', '2024-07-05 22:00:07', '1', 'INSERT INTO  facultyexperience ( DepartmentID    FacultyID    InstituteorCompany    Designation    StartDate    EndDate   UserName    status ) VALUES ( 1   1   sdfds   sdfds   2024-07-05   Currently Working   makwanadishant644@gmail.com    Active )'),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-06 09:21:44', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-07-06 09:21:50', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-06 09:21:59', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Updated Profile', '2024-07-06 09:22:03', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Deleted Experience', '2024-07-06 09:22:57', '1', 'DELETE FROM  facultyexperience  WHERE  facultyexperience . ID   =  0 AND DepartmentID =  1  AND FacultyID =  1 '),
(0, 'DepartmentID : 1 and FacultyID : 1 Deleted Experience', '2024-07-06 09:23:02', '1', 'DELETE FROM  facultyexperience  WHERE  facultyexperience . ID   =  0 AND DepartmentID =  1  AND FacultyID =  1 '),
(0, 'DepartmentID : 1 and FacultyID : 1 Changed Password', '2024-07-06 09:23:12', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 1 logged out', '2024-07-06 09:23:19', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-06 09:23:25', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-06 13:01:31', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-06 16:22:15', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-06 19:55:30', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-07 10:11:54', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-07 12:58:18', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-07 20:26:19', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-07 20:26:36', '', ''),
(0, 'DepartmentID : 1 - FacultyID : 2 logged out', '2024-07-08 12:27:49', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-08 12:28:07', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-09 10:46:20', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-10 09:13:11', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-10 11:23:41', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-12 14:08:34', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-12 14:52:12', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-12 15:26:43', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Updated Profile', '2024-07-22 11:09:30', '', ''),
(0, 'DepartmentID : 1 and FacultyID : 1 Updated Profile', '2024-07-22 11:12:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `trainingdetails`
--

CREATE TABLE `trainingdetails` (
  `ID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `FacultyID` int(11) NOT NULL,
  `TrainingTitle` varchar(200) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `HostingOrganization` varchar(200) NOT NULL,
  `Noofweeks` int(11) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trainingdetails`
--

INSERT INTO `trainingdetails` (`ID`, `DepartmentID`, `FacultyID`, `TrainingTitle`, `StartDate`, `EndDate`, `HostingOrganization`, `Noofweeks`, `CreatedDate`) VALUES
(1, 2, 1, 'Test', '2024-07-23', '2024-07-26', 'Test', 5, '2024-07-26 17:02:02'),
(2, 1, 1, 'Dept Test', '2024-07-18', '2024-07-26', 'Test ', 8, '2024-07-26 17:10:01');

-- --------------------------------------------------------

--
-- Table structure for table `verify_otp`
--

CREATE TABLE `verify_otp` (
  `id` int(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(15) NOT NULL,
  `otp` int(5) NOT NULL,
  `resetKey` varchar(24) NOT NULL,
  `expireAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `verify_otp`
--

INSERT INTO `verify_otp` (`id`, `email`, `phone`, `otp`, `resetKey`, `expireAt`) VALUES
(24, 'dishant.ackplus@gmail.com', 0, 9322, 'dDjvErf6QvsdopmvghQ9IZsl', '2024-07-23 17:21:39'),
(25, 'dishant.ackplus@gmail.com', 0, 1468, 'dDjvErf6QvsdopmvghQ9IZsl', '2024-07-23 17:21:58'),
(26, 'dishant.ackplus@gmail.com', 0, 9785, 'dDjvErf6QvsdopmvghQ9IZsl', '2024-07-23 17:29:09'),
(27, 'dishant.ackplus@gmail.com', 0, 5806, 'dDjvErf6QvsdopmvghQ9IZsl', '2024-07-24 08:16:15'),
(28, 'dishant.ackplus@gmail.com', 0, 8067, 'dDjvErf6QvsdopmvghQ9IZsl', '2024-07-24 08:28:26'),
(29, 'dishant.ackplus@gmail.com', 0, 6695, 'dDjvErf6QvsdopmvghQ9IZsl', '2024-07-24 08:49:21'),
(30, 'makwanadishant644@gmail.com', 0, 5441, '3c730fcb2b8f5b1b2efb2524', '2024-07-24 08:54:23'),
(31, 'makwanadishant644@gmail.com', 0, 8607, 'b634123c51c076a60ae0e9e5', '2024-07-24 09:00:27'),
(32, 'dishant.ackplus@gmail.com', 0, 3529, '0d611ab1f1cd598a8ab687e4', '2024-07-24 16:09:52'),
(33, 'dishant.ackplus@gmail.com', 0, 6647, '0054dfee719d3cb61696ae1c', '2024-07-24 16:24:14'),
(34, 'dishant.ackplus@gmail.com', 0, 6821, '27782dcbeebc996795685a78', '2024-07-24 16:15:53'),
(35, 'dishant.ackplus@gmail.com', 0, 5360, '02d7625bfd5701a94c511078', '2024-07-24 16:18:37'),
(36, 'dishant.ackplus@gmail.com', 0, 9658, 'd723775a21c2a2c575b6c3af', '2024-07-24 16:22:59'),
(37, 'dishant.ackplus@gmail.com', 0, 1144, 'e4d0c67c0ca27bb35356705e', '2024-07-25 16:26:43'),
(38, 'dishant.ackplus@gmail.com', 0, 5015, '2267330f231b97cfbf463070', '2024-07-25 16:32:32'),
(39, 'dishant.ackplus@gmail.com', 0, 4277, '8d8ff5e25931f31759b7ccf7', '2024-07-25 16:36:26'),
(42, 'dishant.ackplus@gmail.com', 0, 3099, '689c1f55ac4f74df29a1fc10', '2024-07-25 07:56:46'),
(43, 'dishant.ackplus@gmail.com', 0, 9386, 'ee4afb3c8a63ecbc5371d86d', '2024-07-25 08:02:43'),
(44, 'dishant.ackplus@gmail.com', 0, 4202, '7198a8a99c1bbbb5fa9f2982', '2024-07-25 08:04:48'),
(45, 'dishant.ackplus@gmail.com', 0, 7566, '42b4a93335a9f2b556c9036d', '2024-07-25 08:05:42'),
(46, 'dishant.ackplus@gmail.com', 0, 8952, 'b0e7e60a7ba59e3a64545eda', '2024-07-25 08:05:54'),
(47, 'dishant.ackplus@gmail.com', 0, 6998, 'b5a228fda602957d3c205b6c', '2024-07-25 08:09:06'),
(48, 'dishant.ackplus@gmail.com', 0, 6589, 'c064551d341a8960ceb112f4', '2024-07-25 08:10:02'),
(49, 'dishant.ackplus@gmail.com', 0, 9144, '05b78be51e99db9084c225af', '2024-07-25 08:10:17'),
(50, 'dishant.ackplus@gmail.com', 0, 9676, '8c41ae4908e4414ec3979f20', '2024-07-25 08:10:38'),
(51, 'dishant.ackplus@gmail.com', 0, 8289, '0bd5e900b76459ffb8004cd9', '2024-07-25 08:12:04'),
(52, 'dishant.ackplus@gmail.com', 0, 6074, 'd2bc0b7cc2d6b7d24ecc024e', '2024-07-25 08:12:11'),
(53, 'dishant.ackplus@gmail.com', 0, 5178, 'd02335886e2a3c995328ec2f', '2024-07-25 08:13:32'),
(54, 'dishant.ackplus@gmail.com', 0, 9001, '90e8ab3d544e1a9eec224d8e', '2024-07-25 08:14:00'),
(55, 'dishant.ackplus@gmail.com', 0, 4853, '2000b7d28a5f02cb69273bff', '2024-07-25 08:14:25'),
(56, 'dishant.ackplus@gmail.com', 0, 5854, '667c64ec49e9531448abb193', '2024-07-25 08:15:55'),
(57, 'dishant.ackplus@gmail.com', 0, 6838, 'd018bb2b2a877cbcd4bcb7ff', '2024-07-25 08:33:47'),
(59, 'dishant.ackplus@gmail.com', 0, 9996, 'be19342f2804a5c3ef2195dd', '2024-07-26 08:40:36'),
(60, 'dishant.ackplus@gmail.com', 0, 7372, '16668f1fe31f408ed6aa5ffb', '2024-07-26 08:40:47'),
(61, 'dishant.ackplus@gmail.com', 0, 9004, 'ee2c307a0f7feade2679b968', '2024-07-26 08:49:50'),
(62, 'dishant.ackplus@gmail.com', 0, 9231, '33fe42b0eecb5077af22177e', '2024-07-26 09:22:41'),
(63, 'dishant.ackplus@gmail.com', 0, 7377, 'c8130e3cbe9daa687f3b4610', '2024-07-27 06:37:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `aicte_eoa_approvals`
--
ALTER TABLE `aicte_eoa_approvals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `degreetype`
--
ALTER TABLE `degreetype`
  ADD PRIMARY KEY (`Degree`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`) KEY_BLOCK_SIZE=1024;

--
-- Indexes for table `dept_academiccalender`
--
ALTER TABLE `dept_academiccalender`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dept_magazine`
--
ALTER TABLE `dept_magazine`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`DesignationID`);

--
-- Indexes for table `disclosure`
--
ALTER TABLE `disclosure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eventphotos`
--
ALTER TABLE `eventphotos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`ID`,`DepartmentID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FacultyID`);

--
-- Indexes for table `facultyeducation`
--
ALTER TABLE `facultyeducation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `facultyexperience`
--
ALTER TABLE `facultyexperience`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `facultypubliation`
--
ALTER TABLE `facultypubliation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `importantlinks`
--
ALTER TABLE `importantlinks`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `importantnotice`
--
ALTER TABLE `importantnotice`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `laboratorydetails`
--
ALTER TABLE `laboratorydetails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `news_update`
--
ALTER TABLE `news_update`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjectunitdetails`
--
ALTER TABLE `subjectunitdetails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `subjectwisegtupapers`
--
ALTER TABLE `subjectwisegtupapers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trainingdetails`
--
ALTER TABLE `trainingdetails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `verify_otp`
--
ALTER TABLE `verify_otp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `aicte_eoa_approvals`
--
ALTER TABLE `aicte_eoa_approvals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dept_magazine`
--
ALTER TABLE `dept_magazine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `disclosure`
--
ALTER TABLE `disclosure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `FacultyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `facultyeducation`
--
ALTER TABLE `facultyeducation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facultyexperience`
--
ALTER TABLE `facultyexperience`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=597;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjectunitdetails`
--
ALTER TABLE `subjectunitdetails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `subjectwisegtupapers`
--
ALTER TABLE `subjectwisegtupapers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `trainingdetails`
--
ALTER TABLE `trainingdetails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `verify_otp`
--
ALTER TABLE `verify_otp`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
