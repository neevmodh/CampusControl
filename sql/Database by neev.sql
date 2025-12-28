-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2024 at 07:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: gpa_admin_panel
--

-- --------------------------------------------------------

--
-- Table structure for table activity
--

CREATE TABLE activity (
  ID int(11) NOT NULL,
  DepartmentID int(11) NOT NULL,
  ActivityType varchar(200) NOT NULL,
  ActivityTitle varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  StartDate varchar(50) NOT NULL,
  EndDate varchar(50) NOT NULL,
  Description varchar(3000) NOT NULL,
  Venue varchar(100) NOT NULL,
  ActivityReportFileName varchar(200) DEFAULT NULL,
  Status varchar(25) DEFAULT 'Active',
  CreatedBy varchar(150) NOT NULL,
  CreatedDate datetime NOT NULL DEFAULT current_timestamp(),
  ModifiedBy varchar(150) DEFAULT NULL,
  ModfiedDate datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table activity
--

INSERT INTO activity (ID, DepartmentID, ActivityType, ActivityTitle, StartDate, EndDate, Description, Venue, ActivityReportFileName, Status, CreatedBy, CreatedDate, ModifiedBy, ModfiedDate) VALUES
(1, 2, 'Co-curricular', 'Test', '2024-07-24', '2024-07-26', 'dfdsfdsf', 'Test', 'uploads/activity/1722061709_gauzy-photo-1712999225-375.pdf', 'Active', 'MR. Dishant Makwana', '2024-07-26 17:14:51', '  Super Admin', '2024-07-27 08:28:29'),
(3, 1, 'Extra-Curricular', 'asdfasdf', '2024-07-10', '2024-07-18', 'asdasd', 'GPA', '', 'Active', ' Super Admin', '2024-07-27 12:00:02', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table admission
--

CREATE TABLE admission (
  ID int(30) NOT NULL,
  Programme varchar(50) NOT NULL,
  Level varchar(50) NOT NULL,
  Intake int(30) NOT NULL,
  CourseDuration int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table aicte_eoa_approvals
--

CREATE TABLE aicte_eoa_approvals (
  id int(11) NOT NULL,
  name varchar(255) NOT NULL,
  file varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table aicte_eoa_approvals
--

INSERT INTO aicte_eoa_approvals (id, name, file) VALUES
(3, 'AICTE Approvals EOA 2024-2025 Report', 'uploads/aicte_eoa_approvals/1721283029_SI.pdf'),
(4, 'test', 'uploads/aicte_eoa_approvals/1721630495_unit-1-software-process-models_updated.pdf');

-- --------------------------------------------------------

--
-- Table structure for table alumnus_feedback
--

CREATE TABLE alumnus_feedback (
  id int(11) NOT NULL,
  name varchar(255) NOT NULL,
  address text NOT NULL,
  pass_out_year int(11) NOT NULL,
  branch varchar(100) NOT NULL,
  mobile varchar(20) NOT NULL,
  email varchar(100) NOT NULL,
  higher_study_institute varchar(255) DEFAULT NULL,
  organization_and_designation varchar(255) NOT NULL,
  curriculum_meeting_needs int(11) NOT NULL,
  adequate_knowledge int(11) NOT NULL,
  faculty_cooperation int(11) NOT NULL,
  student_teacher_relationship int(11) NOT NULL,
  industry_academia_bridge int(11) NOT NULL,
  campus_placement_opportunities int(11) NOT NULL,
  career_counselling int(11) NOT NULL,
  extracurricular_activities int(11) NOT NULL,
  infrastructure int(11) NOT NULL,
  grievance_redressal int(11) NOT NULL,
  other_suggestions text DEFAULT NULL,
  submission_date timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table alumnus_feedback
--

INSERT INTO alumnus_feedback (id, name, address, pass_out_year, branch, mobile, email, higher_study_institute, organization_and_designation, curriculum_meeting_needs, adequate_knowledge, faculty_cooperation, student_teacher_relationship, industry_academia_bridge, campus_placement_opportunities, career_counselling, extracurricular_activities, infrastructure, grievance_redressal, other_suggestions, submission_date) VALUES
(1, 'kk', 'jdnwjd', 2016, 'Information Technology', '1111111111', 'jatinkevlani@gmail.com', '', '0', 4, 2, 2, 2, 1, 4, 2, 3, 1, 5, '', '2024-07-27 08:33:33'),
(2, 'kk', 'jdnwjd', 2016, 'Information Technology', '1111111111', 'jatinkevlani@gmail.com', '', '0', 4, 2, 2, 2, 1, 4, 2, 3, 1, 5, '', '2024-07-27 08:34:06'),
(3, 'kdklfjdklfj', 'nfjkenjn', 2015, 'Civil Engineering', '1111111111', 'jatinkevlani@gmail.com', 'nwjdnwjdnj', '0', 5, 3, 5, 3, 4, 2, 3, 1, 4, 2, '', '2024-07-27 08:37:23'),
(4, 'Dishant', 'dfnkgkd', 2017, 'Automation and Robotics', '9537049583', 'makwanadishant644@gmail.com', 'GPA', '0', 2, 4, 4, 3, 3, 4, 2, 5, 3, 4, 'No.', '2024-07-28 10:35:04');

-- --------------------------------------------------------

--
-- Table structure for table committe
--

CREATE TABLE committe (
  CommitteId int(11) NOT NULL,
  CommitteName varchar(200) DEFAULT NULL,
  CommitteConvener int(11) DEFAULT NULL,
  Description varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table committe
--

INSERT INTO committe (CommitteId, CommitteName, CommitteConvener, Description) VALUES
(9464, 'Health corner:', 1, 'jhff');

-- --------------------------------------------------------

--
-- Table structure for table committe_member
--

CREATE TABLE committe_member (
  CommitteID int(11) DEFAULT NULL,
  FacultyID int(11) DEFAULT NULL,
  DepartmentID int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table c_to_d_admission
--

CREATE TABLE c_to_d_admission (
  ID int(30) NOT NULL,
  Programme varchar(100) NOT NULL,
  Level varchar(50) NOT NULL,
  Intake int(30) NOT NULL,
  CourseDuration int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table degreetype
--

CREATE TABLE degreetype (
  Degree varchar(100) NOT NULL,
  Type varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table department
--

CREATE TABLE department (
  DepartmentID int(11) NOT NULL,
  DepartmentName varchar(100) NOT NULL,
  About text NOT NULL,
  LogoName varchar(200) NOT NULL,
  Facility1 varchar(100) DEFAULT NULL,
  Facility2 varchar(100) DEFAULT NULL,
  Facility3 varchar(100) DEFAULT NULL,
  Facility4 varchar(100) DEFAULT NULL,
  Facility5 varchar(100) DEFAULT NULL,
  Facility6 varchar(100) NOT NULL,
  Facility7 varchar(100) NOT NULL,
  Facility8 varchar(100) NOT NULL,
  Facility9 varchar(100) NOT NULL,
  Facility10 varchar(100) NOT NULL,
  FacilityLink1 varchar(200) NOT NULL,
  FacilityLink2 varchar(200) NOT NULL,
  FacilityLink3 varchar(200) NOT NULL,
  ImageName1 varchar(200) NOT NULL,
  ImageName2 varchar(200) NOT NULL,
  ImageName3 varchar(200) NOT NULL,
  ImageName4 varchar(200) NOT NULL,
  ImageName5 varchar(200) NOT NULL,
  ImageDesc1 varchar(100) NOT NULL,
  ImageDesc2 varchar(100) NOT NULL,
  ImageDesc3 varchar(100) NOT NULL,
  ImageDesc4 varchar(100) NOT NULL,
  ImageDesc5 varchar(100) NOT NULL,
  YearofStarting varchar(4) NOT NULL,
  Level varchar(50) NOT NULL,
  FirstYearofApprovalFromCouncil varchar(50) NOT NULL,
  Period int(11) NOT NULL,
  Intake varchar(10) NOT NULL,
  Vision varchar(500) NOT NULL,
  Mission1 varchar(300) NOT NULL,
  Mission2 varchar(300) DEFAULT NULL,
  Mission3 varchar(300) DEFAULT NULL,
  Mission4 varchar(300) DEFAULT NULL,
  Mission5 varchar(300) DEFAULT NULL,
  PEO1 varchar(500) NOT NULL,
  PEO2 varchar(500) NOT NULL,
  PEO3 varchar(500) DEFAULT NULL,
  PEO4 varchar(500) DEFAULT NULL,
  PEO5 varchar(500) DEFAULT NULL,
  PSO1 varchar(500) NOT NULL,
  PSO2 varchar(500) DEFAULT NULL,
  PSO3 varchar(500) DEFAULT NULL,
  PSO4 varchar(500) DEFAULT NULL,
  PSO5 varchar(500) DEFAULT '',
  UserName varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci KEY_BLOCK_SIZE=8 ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table department
--

INSERT INTO department (DepartmentID, DepartmentName, About, LogoName, Facility1, Facility2, Facility3, Facility4, Facility5, Facility6, Facility7, Facility8, Facility9, Facility10, FacilityLink1, FacilityLink2, FacilityLink3, ImageName1, ImageName2, ImageName3, ImageName4, ImageName5, ImageDesc1, ImageDesc2, ImageDesc3, ImageDesc4, ImageDesc5, YearofStarting, Level, FirstYearofApprovalFromCouncil, Period, Intake, Vision, Mission1, Mission2, Mission3, Mission4, Mission5, PEO1, PEO2, PEO3, PEO4, PEO5, PSO1, PSO2, PSO3, PSO4, PSO5, UserName) VALUES
(1, 'IT', 'THisdhisdaskfnasdsfds it dept', 'uploads/../../uploads/department_images/1/1721995634_Color Hunt Palette b4b4b8c7c8cce3e1d9f2efe5.png', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', 'uploads/../../uploads/department_images/1/1721713511_download.jpeg', '', '', '', '', 'Com', '', '', '', 'vsv', '', '', '', 0, '', '', 'dssdsdfs', 'ggt', 'ththtr', 'gtgthhthtgbd', 'thyhh', '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, '', ''),
(2, 'Com', 'Com', 'uploads/../../uploads/department_images/2/1721366289_Add a heading (1).png', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', '', '', '', '', '', 'Com', 'Com', 'Com', 'Com', 'Com', '2022', '1', '1', 1, '1', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com');

-- --------------------------------------------------------

--
-- Table structure for table dept_academiccalender
--

CREATE TABLE dept_academiccalender (
  ID int(11) NOT NULL,
  DepartmentID int(11) NOT NULL,
  TermType varchar(20) NOT NULL,
  TermYearFrom int(11) NOT NULL,
  TermYearTo int(11) NOT NULL,
  FileName varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table dept_academiccalender
--

INSERT INTO dept_academiccalender (ID, DepartmentID, TermType, TermYearFrom, TermYearTo, FileName) VALUES
(0, 1, 'Even', 2020, 2020, 'uploads/academic_calendar/1721282236_SI.pdf');

-- --------------------------------------------------------

--
-- Table structure for table dept_magazine
--

CREATE TABLE dept_magazine (
  ID int(11) NOT NULL,
  DepartmentID int(11) NOT NULL,
  Name varchar(150) NOT NULL,
  FileName varchar(150) NOT NULL,
  LaunchON varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table dept_magazine
--

INSERT INTO dept_magazine (ID, DepartmentID, Name, FileName, LaunchON) VALUES
(2, 1, 'Test999', 'uploads/magazine/1721284289_test.pdf', 'September 2024'),
(3, 2, 'Test99889', 'uploads/magazine/1721969261_test.pdf', 'June 2024');

-- --------------------------------------------------------

--
-- Table structure for table designation
--

CREATE TABLE designation (
  DesignationID int(11) NOT NULL,
  DesignationName varchar(100) NOT NULL,
  Class int(11) NOT NULL,
  ISHod tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table disclosure
--

CREATE TABLE disclosure (
  id int(11) NOT NULL,
  name varchar(255) NOT NULL,
  file varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table disclosure
--

INSERT INTO disclosure (id, name, file) VALUES
(2, 'Fire Safety Certificate', 'uploads/disclosure/1721277489_SI.pdf');

-- --------------------------------------------------------

--
-- Table structure for table eventphotos
--

CREATE TABLE eventphotos (
  ID int(11) NOT NULL,
  DepartmentID int(11) NOT NULL,
  EventID int(11) NOT NULL,
  PhotoDescription varchar(100) NOT NULL,
  PhotoPath varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table events
--

CREATE TABLE events (
  ID int(11) NOT NULL,
  DepartmentID int(11) NOT NULL,
  EventName varchar(200) NOT NULL,
  EventDate date NOT NULL,
  EventDescription varchar(500) NOT NULL,
  EventVenue varchar(500) NOT NULL,
  EventPhotoPath varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table facilities_feedback
--

CREATE TABLE facilities_feedback (
  id int(11) NOT NULL,
  name varchar(255) DEFAULT NULL,
  enrollmentNumber varchar(50) DEFAULT NULL,
  department varchar(100) NOT NULL,
  semester varchar(10) NOT NULL,
  admissionYear int(11) NOT NULL,
  libraryBooks int(11) NOT NULL,
  readingRooms int(11) NOT NULL,
  librarySpace int(11) NOT NULL,
  libraryStaff int(11) NOT NULL,
  photocopyFacility int(11) NOT NULL,
  internetFacilities int(11) NOT NULL,
  onlineResources int(11) NOT NULL,
  officeStaff int(11) NOT NULL,
  resultDisplay int(11) NOT NULL,
  washrooms int(11) NOT NULL,
  drinkingWater int(11) NOT NULL,
  grievanceRedressal int(11) NOT NULL,
  placementCell int(11) NOT NULL,
  labEquipment int(11) NOT NULL,
  ecofriendlyCampus int(11) NOT NULL,
  accessibility int(11) NOT NULL,
  classroomCleanliness int(11) NOT NULL,
  powerSupply int(11) NOT NULL,
  otherSuggestions text DEFAULT NULL,
  submissionDate timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table facilities_feedback
--

INSERT INTO facilities_feedback (id, name, enrollmentNumber, department, semester, admissionYear, libraryBooks, readingRooms, librarySpace, libraryStaff, photocopyFacility, internetFacilities, onlineResources, officeStaff, resultDisplay, washrooms, drinkingWater, grievanceRedressal, placementCell, labEquipment, ecofriendlyCampus, accessibility, classroomCleanliness, powerSupply, otherSuggestions, submissionDate) VALUES
(1, 'sdhbjfhsdf', '4562', 'Civil Engineering', 'sem 7', 2014, 1, 1, 3, 4, 5, 3, 3, 5, 5, 5, 5, 3, 1, 5, 3, 3, 5, 5, '', '2024-07-27 07:51:22');

-- --------------------------------------------------------

--
-- Table structure for table faculty
--

CREATE TABLE faculty (
  DepartmentID int(10) NOT NULL,
  FacultyID int(11) NOT NULL,
  FacultySeniortyIndex int(11) NOT NULL,
  Prefix varchar(100) NOT NULL,
  FirstName varchar(100) NOT NULL,
  LastName varchar(100) NOT NULL,
  DesignationID int(10) NOT NULL,
  JoiningDate varchar(10) NOT NULL,
  InstituteJoiningDate varchar(10) NOT NULL,
  ProfessionalEmail varchar(50) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  ContactNo varchar(15) DEFAULT NULL,
  MaxEducationQualification varchar(100) NOT NULL,
  AreaofIntrest varchar(200) DEFAULT NULL,
  TeachingExp varchar(20) NOT NULL,
  IndustrialExp varchar(20) NOT NULL,
  TotalExp varchar(20) NOT NULL,
  GTUStaffID varchar(20) DEFAULT NULL,
  UserName varchar(191) DEFAULT NULL,
  Password varchar(100) NOT NULL,
  Password_hash varchar(1000) NOT NULL,
  Photo varchar(255) DEFAULT NULL,
  FacultyStatus varchar(15) DEFAULT 'Active',
  isAdmin varchar(10) NOT NULL,
  isDAdmin varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table faculty
--

INSERT INTO faculty (DepartmentID, FacultyID, FacultySeniortyIndex, Prefix, FirstName, LastName, DesignationID, JoiningDate, InstituteJoiningDate, ProfessionalEmail, Email, ContactNo, MaxEducationQualification, AreaofIntrest, TeachingExp, IndustrialExp, TotalExp, GTUStaffID, UserName, Password, Password_hash, Photo, FacultyStatus, isAdmin, isDAdmin) VALUES
(1, 1, 0, ' ', 'Super', 'Admin', 0, '2024-07-11', '2024-06-26', 'superadmin@gpa.com', 'superadmin@gpa.com', '787787878', 'Diploma', 'Coding', '2', '7', '9', '0001', 'superadmin@gpa.com', '1234', '', 'uploads/faculty_profile/1721989657_Final.jpg', 'Active', 'Yes', 'Yes'),
(2, 4, 0, ' ', 'Department', 'Admin', 0, '2024-07-10', '2024-07-26', 'admin@gpa.com', 'admin@gpa.com', '9999', 'Diploma', 'Testing', '2', '2', '4', '0002', 'admin@gpa.com', '123', '', 'uploads/faculty_profile/1721991144_Miduam Lofo.png', 'Active', 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table facultyeducation
--

CREATE TABLE facultyeducation (
  ID int(11) NOT NULL,
  DepartmentID int(11) NOT NULL,
  FacultyID int(11) NOT NULL,
  Degree varchar(100) NOT NULL,
  University varchar(100) NOT NULL,
  PassingYear varchar(10) NOT NULL,
  Specialization varchar(150) NOT NULL,
  Percentage varchar(10) NOT NULL,
  UserName varchar(50) NOT NULL,
  status varchar(15) NOT NULL DEFAULT 'Active',
  CreatedDate datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table facultyeducation
--

INSERT INTO facultyeducation (ID, DepartmentID, FacultyID, Degree, University, PassingYear, Specialization, Percentage, UserName, status, CreatedDate) VALUES
(1, 1, 1, 'Test', 'GPA', '2024', 'sdfsfd', '100', '', 'Active', '2024-07-23 11:12:50'),
(2, 1, 1, 'dfgsfgsf', 'xfd', '2024', 'dfg', '45', '', 'Active', '2024-07-27 11:32:32'),
(3, 1, 1, '', '', '', '', '', '', 'Active', '2024-07-27 11:51:35');

-- --------------------------------------------------------

--
-- Table structure for table facultyexperience
--

CREATE TABLE facultyexperience (
  ID int(11) NOT NULL,
  DepartmentID int(11) NOT NULL,
  FacultyID int(11) NOT NULL,
  InstituteorCompany varchar(150) NOT NULL,
  Designation varchar(90) NOT NULL,
  StartDate varchar(15) NOT NULL,
  EndDate varchar(30) DEFAULT NULL,
  UserName varchar(50) NOT NULL,
  Status varchar(15) NOT NULL DEFAULT 'Active',
  CreatedDate datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table facultyexperience
--

INSERT INTO facultyexperience (ID, DepartmentID, FacultyID, InstituteorCompany, Designation, StartDate, EndDate, UserName, Status, CreatedDate) VALUES
(5, 1, 1, 'Test', 'sdjfsdf', '2024-07-21', '2024-07-27', '', 'active', '2024-07-27 11:51:16');

-- --------------------------------------------------------

--
-- Table structure for table facultypubliation
--

CREATE TABLE facultypubliation (
  ID int(11) NOT NULL,
  DepartmentID int(11) NOT NULL,
  FacultyID int(11) NOT NULL,
  Type varchar(100) NOT NULL,
  PublicationDate date NOT NULL,
  Title varchar(500) NOT NULL,
  Author varchar(200) NOT NULL,
  ConferenceJournal varchar(500) NOT NULL,
  Details varchar(500) NOT NULL,
  CreatedDate datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table facultypubliation
--

INSERT INTO facultypubliation (ID, DepartmentID, FacultyID, Type, PublicationDate, Title, Author, ConferenceJournal, Details, CreatedDate) VALUES
(0, 1, 1, 'Research Paper', '2024-07-24', 'Test', 'dfgdj', 'jdfg', 'sdgjksd', '2024-07-27 11:37:10');

-- --------------------------------------------------------

--
-- Table structure for table importantlinks
--

CREATE TABLE importantlinks (
  ID int(11) NOT NULL,
  DepartmentID int(11) NOT NULL,
  Title varchar(200) NOT NULL,
  URL varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table importantlinks
--

INSERT INTO importantlinks (ID, DepartmentID, Title, URL) VALUES
(1, 1, 'Test', 'http://localhost/admin-panel/add_edit_link.php');

-- --------------------------------------------------------

--
-- Table structure for table importantnotice
--

CREATE TABLE importantnotice (
  ID int(11) NOT NULL,
  Title varchar(100) NOT NULL,
  URL varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table industry_feedback
--

CREATE TABLE industry_feedback (
  id int(11) NOT NULL,
  industryName varchar(255) NOT NULL,
  contactPerson varchar(255) NOT NULL,
  organizationAddress text NOT NULL,
  email varchar(255) NOT NULL,
  phoneNumber varchar(20) NOT NULL,
  graduatePerformance int(11) NOT NULL,
  technologyAdoption int(11) NOT NULL,
  communicationSkills int(11) NOT NULL,
  problemSolving int(11) NOT NULL,
  leadershipSkills int(11) NOT NULL,
  professionalAttitude int(11) NOT NULL,
  ethics int(11) NOT NULL,
  societalProblemIdentification int(11) NOT NULL,
  curriculumSuggestions text DEFAULT NULL,
  otherSuggestions text DEFAULT NULL,
  submissionDate timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table industry_feedback
--

INSERT INTO industry_feedback (id, industryName, contactPerson, organizationAddress, email, phoneNumber, graduatePerformance, technologyAdoption, communicationSkills, problemSolving, leadershipSkills, professionalAttitude, ethics, societalProblemIdentification, curriculumSuggestions, otherSuggestions, submissionDate) VALUES
(1, 'rishabh', 'hello', 'oojifjeifjeio', 'jatinkevlani@gmail.com', '9999999999999', 5, 1, 3, 5, 5, 2, 4, 2, 'safas', 'no', '2024-07-27 06:15:28'),
(2, 'rishabh', 'hello', 'ijafdf', 'jatinkevlani@gmail.com', '12', 3, 5, 4, 3, 3, 2, 2, 1, 'asdas', 'sdfsdf', '2024-07-27 06:23:12');

-- --------------------------------------------------------

--
-- Table structure for table laboratorydetails
--

CREATE TABLE laboratorydetails (
  DepartmentID int(11) DEFAULT NULL,
  LaboratoryName varchar(255) DEFAULT NULL,
  PhotoURL1 varchar(200) DEFAULT NULL,
  PhotoURL2 varchar(200) DEFAULT NULL,
  Description text DEFAULT NULL,
  status varchar(50) DEFAULT NULL,
  ID int(11) NOT NULL,
  PhotoURL3 varchar(255) DEFAULT NULL,
  PhotoURL4 varchar(255) DEFAULT NULL,
  PhotoURL5 varchar(255) DEFAULT NULL,
  Subjects varchar(255) DEFAULT NULL,
  Location varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table log
--

CREATE TABLE log (
  id int(11) NOT NULL,
  DepartmentID int(11) NOT NULL,
  FacultyID int(11) NOT NULL,
  time timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  new_data longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(new_data)),
  old_data longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(old_data)),
  TransDetails longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(TransDetails)),
  log_title varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table log
--

INSERT INTO log (id, DepartmentID, FacultyID, time, new_data, old_data, TransDetails, log_title) VALUES
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
(522, 1, 1, '2024-07-26 08:35:16', '{\"DepartmentID\":\"1\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"Email\":\"makwanadishant644@gmail.com\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"UserName\":\"makwanadishant644@gmail.com\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"GTUStaffID\":\"0001\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":9,\"FacultyStatus\":\"Active\",\"isDAdmin\":\"Yes\",\"isAdmin\":\"Yes\"}', '{\"DepartmentID\":\"1\",\"FacultyID\":\"1\",\"FacultySeniortyIndex\":\"0\",\"Prefix\":\"MR.\",\"FirstName\":\"Dishant\",\"LastName\":\"Makwana\",\"DesignationID\":\"0\",\"JoiningDate\":\"2024-07-10\",\"InstituteJoiningDate\":\"2024-06-26\",\"ProfessionalEmail\":\"makwanadishant644@gmail.com\",\"Email\":\"makwanadishant644@gmail.com\",\"ContactNo\":\"9537049583\",\"MaxEducationQualification\":\"Diploma\",\"AreaofIntrest\":\"React Js.\",\"TeachingExp\":\"2\",\"IndustrialExp\":\"7\",\"TotalExp\":\"9\",\"GTUStaffID\