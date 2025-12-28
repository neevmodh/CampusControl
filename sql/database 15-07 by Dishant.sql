-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2024 at 10:57 AM
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
  `Logo` longblob NOT NULL,
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
  `Image1` longblob NOT NULL,
  `Image2` longblob NOT NULL,
  `Image3` longblob NOT NULL,
  `Image4` longblob NOT NULL,
  `Image5` longblob NOT NULL,
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

INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `About`, `Logo`, `Facility1`, `Facility2`, `Facility3`, `Facility4`, `Facility5`, `Facility6`, `Facility7`, `Facility8`, `Facility9`, `Facility10`, `FacilityLink1`, `FacilityLink2`, `FacilityLink3`, `Image1`, `Image2`, `Image3`, `Image4`, `Image5`, `ImageDesc1`, `ImageDesc2`, `ImageDesc3`, `ImageDesc4`, `ImageDesc5`, `YearofStarting`, `Level`, `FirstYearofApprovalFromCouncil`, `Period`, `Intake`, `Vision`, `Mission1`, `Mission2`, `Mission3`, `Mission4`, `Mission5`, `PEO1`, `PEO2`, `PEO3`, `PEO4`, `PEO5`, `PSO1`, `PSO2`, `PSO3`, `PSO4`, `PSO5`, `UserName`) VALUES
(1, 'Test', 'test', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', 'tgthvyjyhjyffu', 'ggt', 'ththtr', 'gtgthhthtgbd', 'thyhh', '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, '', ''),
(2, 'Com', 'Com', '', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', '', '', '', '', '', 'Com', 'Com', 'Com', 'Com', 'Com', '2022', '1', '1', 1, '1', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com', 'Com');

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
  `Photo` blob DEFAULT NULL,
  `FacultyStatus` varchar(15) DEFAULT 'Active',
  `isAdmin` varchar(10) NOT NULL,
  `isDAdmin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`DepartmentID`, `FacultyID`, `FacultySeniortyIndex`, `Prefix`, `FirstName`, `LastName`, `DesignationID`, `JoiningDate`, `InstituteJoiningDate`, `ProfessionalEmail`, `Email`, `ContactNo`, `MaxEducationQualification`, `AreaofIntrest`, `TeachingExp`, `IndustrialExp`, `TotalExp`, `GTUStaffID`, `UserName`, `Password`, `Password_hash`, `Photo`, `FacultyStatus`, `isAdmin`, `isDAdmin`) VALUES
(2, 1, 0, 'MR.', 'Dishant', 'Makawana', 0, '', '2024-06-26', 'makwanadishant644@gmail.com', 'makwanadishant644@gmail.com', '9537049583', 'Diploma', 'React Js.', '2', '2', '4', '0001', 'makwanadishant644@gmail.com', '123', '', 0x89504e470d0a1a0a0000000d49484452000001830000011a0806000000f30d3b99000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa86400000c0149444154785eeddd3d9214471a06e03d8d4eb017d81370813d812ea013700169bd75584b38d25a2b0759c2421672c0c2c3c342110bcc0c035ba9e8094db0df4c7757e5cf5755cf1bf14410d03f394155bfd35559957ff9ef3fbefa0cc0be290300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c588977fffcebe7f7fffe7bf86f6b72f5f2c7f0ef613465407ad76f5f7fbe49f4ef6b71f1f337879fe2f31f7f8e1e03a32803d2ba7afee8f0d1f9672e9f7d1b3e760da2bcfbd7dfc2c7426fca8074cae1a0fb123d27bb7278e8ae7cfafd75f81ce849199046392f704aaedfbc089f9fd929b97cf65df85ce8411990c2f5eb67878fc4d3528a237a9d8c6e9ff33825efbf7f10be0eb4a40c18aafc363c37d1eb6553ce09cc4df47ad08a32608863e7054ec91aa69a2ecd1a0f89b14eca80ee3e7d787bf8a85b9ee8f5b3b8f8e5e16194cbe37c02ad2903ba39f7bcc029b97cfe287caf0c5ac454545a51063457f337e428d17b8e76fde6e56174f5632a2a2d28039a5972f2f49c64fc70ec11b7b6a02665401335cf0b9c924c874f7ac7ad2da8411950d57d57dab64e349edede3d7e70184dff389fc012ca802a3efcf4f5e123695c32fc863c3ace2730973260b18f0d6609cd4d34be5e965c40573bd1f8e03eca802ab2a4145334be1eb2e4eae50fe1f8e03eca802a2e9eb69d3e7a4ea2f1b576eefd875a261a1f1ca30ca8264bca4ca6687cadf49a427b4acc2c622e654035993e14df3fee77e7cf4c89c607a7500654d5fbfa82fb128dafb6f29b7896985aca12ca80eab2a4c7129959624a294b2903aabb7af5e4f011353ed1f86a197981dd9789c607e750063491252da79a66c9e5afedbf01b17dca8026521d4b6fb044a6a9a46c8d32a0992ca93dd534d3ac29278da94519d04cf98d3c4b6a2e919925bdafa760db94014d6ded704aa6c35fd1f8602e654073595263aa69967c7cf5241c1fcca50c68eeeab747878fb0f189c6772a5349d93265401759b2e4e2ac2c71ff215a500674514ee066c99ca9a6a692b275ca806e32251adf5d4c25650f9401dd8c9e6a5a4eba96e539a3b11df3eef1833f4e408fbc119ffb0fd19232a0ab9e4b645e4fef55f3fa822f5d3def7b623c1a03d4a20ce8ae65ca6fee2d0be02e65a9c996b19425ad2903ba2b875b6aa77c0b88deabb75617a545ef0535290386a895acc7d16b9682a9a4f4a00c18a2c654d3167723adadc6e1a3e875a13665c0307367e6acf1fefd73632a29bd2803863a376bf8367097736fcb612a293d2903863a75aae9563e18cfb9802d7a3eb4a20c18ee58b638adf2584c25a53765c070174f1f1e3e02ff3f5b5edff7be448f879694012944d9c394ca28736f99014b280352f8f258fa96bf117ce9cb448f81d6940169dc4c352db36ea27fdfb29bac79b614eba60c4865afd3294b09984aca48ca0000650080320060a20c0050060028030026ca0000650080320060a20c00500645b915c0f5098bac5cfcf2307c7e76222d126d6b996d7d3f5f6ad765307751f6b5dd4346a445a26d2da3bdece74bedb60ce62ec67e3b6bb9dfbe488b44db5a367bdacf97da5d1994af8a3573fde645f83e9988b448b4ad65b1c7fd7ca95d95c1398b919f93ec5f27455a24dad632d8eb7ebed4aecaa0652e9fe75d9045a445a26d2d8396c9bc9f2fb59b32b87efbfaf0dfd92ee53792e8bd47136991685b1b6dcffbf952bb2883b2c078af44ef3f9a488b44dbda487bdfcf97da4519f44c99c6168d6124911689b6b5917a26e37ebed4e6cba0d5c9a4fb128d6324911689b6b551ece7cb6dbe0c4eb9e2b076a2718c24d222d1b6368afd7cb9cd97c1887cf8cfd7e15846116991685b1b6544b2ede74b298306b97af943389651445a24dad64619916cfbf952caa041b25d9c22d222d1b636ca886ced223465d028d15846116991685b1b6554a2b1ac95326894682ca388b448b4ad8d322ad158d64a19344899d9108d6514911689b6b5514624db7ebe94326890cb67df86631945a445a26d6d9411c9b69f2fa50c1aa4dc3e371acb28222d126d6ba38c48b6fd7ca9cd974169efde89c63192488b44dbda28f6f3e5365f0645cf643c8e28d222d1b63652cf6ced7c41b18b32f8d8f152f5e8fd47136991685b1b69effbf952bb2883a247b25e9128d222d1b6365a8f6cedcae31bbb29838ba70f0fff95ed12bd6f06222d126d6ba3ed793f5f6a3765505cbf7979f8efac9fe8fdb2106991685bcb60affbf952bb2a83a2c5b278d997c1136991685bcb628ffbf952bb2b83e2eab74787ffdee559c35c63911689b6b54cf6b69f2fb5cb322896ae8cb4a6a965222d126d6bd9ec693f5f6ab76570a3ac657a4ed6b87188b448b4ad65b587fd7ca9dd97c16d6583f9f8eac9e74fb78e3796935117bf3c5cf5d744911689b6b535d8ea7ebe943200401900a00c0098280300940100ca0080893200401900a00c009828035279fff841f8f77b50ae8c8dfe1e7a5006a471f1f3377fdc1a20fab7adbb7ef362b73f3b392803d2b89de8dfb7eaf2d977879ffaf3f4e76fc3c7406bca8014ae5efe78f838fc33d1e3b6e67611dc247a1cb4a60c48e1ae448fdd8a7297cc28e59051f47868491930dcb1250aa3e7ac5df48de076f67c2b65c650060c75ea4a545b5a7fb62c9c724aa2e7422bca80a1ce4939ac12bdc69a7cfaf0f6f0d31c8fa9a6f4a40c18e6d8a192289f7e7f1dbe5676ef1e3f38fc04e7257a2d68411930cc92ace9b0d1cd35047372f9fc51f89a509b326088b2e6ecd264ff9670d76ca17313bd36d4a60c18a266b2954239d65f336b3d34c6ba2803ba6b95f2a139f2f0d19c7320a7664bb3a9c84919d0d5dc13a9e7a6d7cca3f221fde9c87512b512bd3fd4a20ce86a443ebe7a52f56ea8a568ce99225a2b5b985a4b5eca806e5a1e463937d1f8ee72f5fcd1e159e3138d0f6a5006749325572f7f08c7779f2cf9f8fa59383e584a19d0c5b1fb0ff54c34be632e9ed699265a23d1f86029654073e5246b96940574a2319e224bcaf98a687cb08432a0b94c89c677aa4ca5b6e7e541694319d0d4cd5296195263aefe88594477251a1fcca50c682a4b6a5ec59b2596c8a426654033d15296a3128d6faeab574f0eaf3a3ed1f8600e6540335972f96bfddfa0b3c454536a510634b1f6a9a4c7a43a1762894c2a5006549769d64d8d93c677c912534da94119505d96b4bef573f98d3c4b2c91c952ca80aa321d3e89c657dbd60f87b11fca80aab2a4dca9341a5f0b5962aa294b2803aad9ea54d263ae7e735753d64f19504d962cb9ffd05c5962894ce6520654b1f763e7b5d73d5e12534d994319b0d85ea6921ee3be45ac993260b12c6530fa104996a9a6d7ae4a6606654035e5b60f23138da9b7727b885129df4c1c22622e65407523ce1fcc59cab2951171d1194b29039ae87de8281ac32865be7fafb4b8091ffba40c68eae2a7af0f1f5bed32622ae931ad73fde645f8be309732a08b7218a755a2f71bade55453e705684119d055edf30923a7921e537baaa9f302b4a40ce8aed6f984355c6d5b23e57617d16b434dca806196dee1347acd6c964c35756b097a52060c37e77c42a6a9a4c7cc49e6c35f6c9332208d73ce2744cfcfeae2e9c3c3a88fa73c367a0d684d1990ca29e713d67822f558dc4282d1940129dd773e217a7c7677959cf58bc94219905a59b1ec76d63cc7fecba9a6ef1e3f081f0723280356a17c906e61764d895b4890913200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c0098280300940100ca0080893200401900a00c00982803009401005f7dfe1f3e70c4cea2a3ef810000000049454e44ae426082, 'Active', 'Yes', 'Yes'),
(2, 2, 1, 'MR', 'Kunj', 'Bhalala', 0, '2022', '2024-06-27', 'bhalalakunj@gmail.com', 'bhalalakunj@gmail.com', '8989', 'Diploma', 'Gamming', '56', '56', '112', '56', 'bhalalakunj@gmail.com', '1234', '', 0x89504e470d0a1a0a0000000d49484452000001c2000001c208060000007c18c9450000191a49444154789ceddddb761b39b20540faacf9ff5ff67998d66a8f4d4ba088aadcc88c78547350b8552561927b7efcfcf9f3e7030086fabfea0e004025851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046530801184d21046034851080d114420046fb4f7507def1e3c78fea2e5ceae7cf9fd55d0036f1bccaf5e3e781bdefbea17e97ba44bfafc3dffa59f5ba55c691d5bfddaac6fbb776bb4b7d5e7de6a842386d43fd2e69a9feb616bff7b1ea75ab8c23ab7fbb558df7b336a7487a5e7de598cf08a76faa47d01c7cd68f5fff5bd5eb56194756ff76ab1aef3bffbb4e4e9a83630a21005ce1884278d23b8bab990bc8e61efdd729737144210480abc417c253de51dca97a4e3efb10fcd7ff56f5ba55c691d5bfdd2ac65b7d6f263a614ee20b21999e3d2092feb62aa9cf278e6377ff76ab1a2f6789fff9c409ef262a842f1b8ce479f55cfaf3eae8649955698be06601fec6f3ea7ead0b61da86faf0d1afd40dd625a1a43a51e42be9fde35ea9eb9afebcdaa1e567843f7ffe8cdd54bf4aece7b3cd7ec7dfbaf46f557affb84fe273e09953faf91ded0ae1890b95d2e72e09259589222bd2fbc77d52eefd579cd8e7afb42b8400f08a5685f0e4772a27f71d78ddc9f7fcc97d7fa65521048057b529841ddea1548fa14b424955ff56a5f78feb7558bf0e63f8d0a610b247978492f44491f4fec124ad7f47c8f7ac3e6877bf6e557aff56a5f70fa650087ff1ee57d23db080bb785eeda3106efc4dd6473ba91bac2ae1a58b2e0939e9894055d2fbf761caf3ea4ea33f23fcf1e3c7253f4cbeaadd775425bc74d12521273d11a84a7aff1ec39e57771b5b08ab62b42a5425bc74d12521273d11a84a7aff1ec39e5715c6164200784c2d8477bef399fc2e0b789fe7d5f546164200f830ae1056bce3a97e975595f0d24597849cf444a02ac9fd9bf8bcaa30ae104e5595f0d24597849cf444a02ae9fde35a7e47384855c24b175d1272d21381aaa4f78feb381102309a13e12055c919e949261259ee619e49e54438445572467a928944967b986792298403542567a427994864b98779269d4208c0680a2100a32984008ca6100e50959c919e642291e51ee699740ae11055c919e949261259ee619e49e677848354ddd8e949261259ee619e49e54408c0684e84837449ce484fc8d9dd5e55d2caaaf4fead4aef1fd771221ca24b72467a42ceeef6aa925656a5f76f557affb8d6b84258f12eaffa9d6597e48cf4849cdded5525adac4aefdfaae4fe4d7c5e5518570801e057230be19def7826bebb02f6f1bcbadec84208001fc616c2aa1f9357e8929c919e90b3bbbdaaa49555e9fd5b95debfc7b0e75585b185f0f1cfc25fb1f857b5fb8e2ec919e90939bbdbab4a5a5995debf55e9fd7b0c7b5eddedc7cff01958fdd6d68e61bcfb0db13bfb10be6c3092e7d575d7ba921fd4ff227db1003e785eeda3100e2279e43d55c9325ddaabd265ff719dd19f114e2279e43d55c9325ddaabd265ff71ad3685b0c3a6bd6a0c9247de53952cd3a5bd2ac9fbefa479fc9b0e63f8d0a61002c077b42a8427bf4339b9efc0eb4ebee74feefb33ad0a2100bcaa5d213cf19dcad57d963cf29eaa64992eed553961ff795e656857081fff2cd4098b75673f258fbca72a59a64b7b554ed87f9e57f5da24cb7c266d881dc704f4bcb73b8ee977237e50dff55d0cd08fe7d5fd461442fe2b3d79447bdaebd41ee768f919217f4a4f1ed19ef63ab5c759e20ba177657f7a754ed29347b4a7bd2eed795efde98439892f840070a5230ae109ef28ee622e209b7bf45fa7ccc511851000ae724c213ce59dc595be3b07e9c923dad35ea7f6def9df7572d21cc4ffa0fe9969dfe6dab544e95f37d79ef63ab5f7b776bb3bb0a49c59083f74df60072f0df01bcfab5c471742007897649941d2ff29695a7be9d75d655e38dd315f96e13de9491cd3da4bbfee2af342070ae100c9491c13db4bbfee2af342170a2100a32984008ca61002309a4238407a12c7b4f6d2afbbcabcd0854238c4b307c43b0f0dedddf3d0adbaee2af342077e500fc0684e84008c7654b24c555248faebaa74194715fb396b1f588facf5b8d33127c2aaa490f4bf55e9328e2af673d63eb01e59eb71b7230a61555248faebaa74194715fbf9f9ebaa588fe7af9be48842080057510801184d210460b4230a61555248faebaa74194715fbf9f9ebaa588fe7af9be48842f8284c0a49ff5b952ee3a8623f67ed03eb91b51e77932c03c068c79c0801e00a4725cba44b4f74484f92a89abff4759b263d41257dbf548df7644e849ba4273aa4274954cd5ffaba4d939ea092be5faac67b3a857083f44487f42489aaf94b5fb769d21354d2f74bd5783b500801184d21046034851080d114c20dd2131dd29324aae62f7ddda6494f5049df2f55e3ed4021dc243dd1213d49a26afed2d76d9af40495f4fd5235ded34996016034274200463b2a59263d7162b769e35d953edef4c493ddeda58fb74bffaa7419c7678e3911a6274eec366dbcabd2c79b9e78b2bbbdf4f176e95f952ee3f8ca1185303d7162b769e35d953edef4c493ddeda58fb74bffaa7419c78a230a21005c4521046034851080d18e2884e98913bb4d1befaaf4f1a6279eec6e2f7dbc5dfa57a5cb38561c51081f07244eec366dbcabd2c79b9e78b2bbbdf4f176e95f952ee3f88a641900463be64408005768992c53253dc162777b925bb2dadb7dddf47db0aacbbaad4adf57898e3911a62717a42758ec6e4f724b567bbbaf9bbe0f567559b755e9fb2ad51185303db9203dc162777b925bb2dadb7dddf47db0aacbbaad4adf57c98e2884007015851080d1144200463ba210a62717a42758ec6e4f724b567bbbaf9bbe0f567559b755e9fb2ad91185f0714072417a82c5eef624b764b5b7fbbae9fb605597755b95beaf5249960160b4634e84007085a392655649c4c86a6fda7a7449f6a85adff47d957eddddd2f7fd0eed4e841231b2da9bb61e5d923daad6377d5fa55f77b7f47dbf4bab42281123abbd69ebd125d9a36a7dd3f755fa75774bdff73bb52a8400f02a851080d1144200466b5508256264b5376d3dba247b54ad6ffabe4abfee6ee9fb7ea75685f0211123aebd69ebd125d9a36a7dd3f755fa75774bdff7bb48960160b47627420078c551c932e9490d131218ae64fece243126eb3954e5e4711c73224c4f6a9892c07015f377a6a4749813efdf2efbf9f4711c5108d3931a2625305cc1fc9d4962cc3dd74dd7611c47144200b88a4208c0680a2100a31d5108d3931a2625305cc1fc9d4962cc3dd74dd7611c4714c2c701490d531218ae62fece94940e73e2fddb653f9f3e0ec932008c76cc891000aed03259a64b42497a824597648f34d5bfbdaa9ecff4a49af47d9f7e9f273ae644989e4cb15b7a824597640fb224a5d22425cba4f7ef744714c2f4648addd2132cba247b90253da9267ddfa7dfe7c98e2884007095a33e23848ed2de5d4ff84c087ee54408c0684714c2f4648addd2132cba247b90253da9267ddfa7dfe7c98e28848f039229764b4fb0e892ec4196a4549aa46499f4fe9d4eb20c14fbea33c2df6fd1bb3f53f488a0bb634e8400708596df1a4d4f28914c91b51e6499b60fdc1ff5da9d08d3134a245364ad0759a6ed03f74786569f11ae7ed6f2ea6732bbecbeeeeef1a6f7afabf4075ad5bf9454f5e32eee8f1ced4e8400f00a851080d1144200466b5508d3134a2453dc735dce346d1fb83f72b42a848f03124a245364ad0759a6ed03f7478656df1a8513f9d628d46a77220480578c4e96a9929e04b3aacb38784f97fdb7fbbae9dc97ff6a77224c4f60484f8259d5651cbca7cbfedb7ddd74eecbffd5aa107eb640098bb7dabfddafdbadcb38784f97fdb7fbbae9dc977f6a550801e0552d3f2384c93a7e86035772220460b45685303d81213d0966559771f09e2efb6ff775d3b92fffd4aa103e0e4860484f8259d5651cbca7cbfedb7ddd74eecbff2559068a557f03cf2380e9da9d0801e015be35baa04bb242972489f4fef19c049aace4a52ecf831d9c08bfd02559a14b92447aff784e024d56f25297e7c12e3e23fcc4570b7ecad4ad8e237dbcdfed5fda3bdadd0f92eaf17ca56a5f55edfbddd74def5f074e84008ca61002309a4208c0683e23fcc2dffe9dfcb4695b1d47fa78bfd3bfbb3f23bcfbcb04296bf399aa7d55b5ef775f37bd7fa77322fc429764852e4912e9fde339093459c94b5d9e07bb3811d29e1321f01927420046932cb3a04ba2437ad2c55dae9ed7bb4dfabdd7afd2f75f97fbb7fbf3e0e144f8b52e890ee94917f08af4fdd7e5fe9df23c50083ff1d9427e679157db4bbfeeeefec12bd2f75f97fb77d2f340210460349f1132deab9f6da4bdcb5dfded17f09c132100a329849ff8ec64f09d6f44adb6977eddddfd8357a4efbf2ef7efa4e78142f8852e890ee94917f08af4fdd7e5fe9df23c902c437bdd3f33730bc37b9c080118eda86f8d562517542544a49360c12bd2efa3f4e74bfa784fbe2f8f3911562517542544a44b4aab3871fea649bf8fd29f2fe9e33dfdbe3ca210562517542544a49360c12bd2efa3f4e74bfa783bdc9747144200b88a4208c0680a2100a31df33bc2bffd5b73d5ffdbf877af5b358edd56c751f5bacf9cf2b9c5df9cb6571e07dc47e9cf97f4f19efe5c3be64458955c509510912e29ade2c4f99b26fd3e4a7fbea48ff7f4fbf2981321ece24408fcea981321005ce1a864997455490de9d74d4bb0f0ffdf57237d5fad4adff72727bc547122dca42aa921fdba122c781cb0af56a5ef7bf7c7f728841b542535a45f5782058f03f6d5aaf47deffef83e851080d17c46c878e99f19fa8c07aee54408c0680ae1069fbd63ffcebbf9d5f6d2af5bd53fb2a4efab55e9fbdefdf17d0ae12655490de9d79560c1e3807db52a7ddfbb3fbe47b20c7ce1eecf0cdd92702f27420046f3add105d3121dd2c7db659ebbe8b20fbaec2b8936af7322fcc2b44487f4f17699e72ebaec832efb4aa2cdf7f88cf0135f2de4c7d4adbe2e5dfa7853e6f9d51bfcd5df2976db2fe9d7b51eefb5d761fe9c0801184d21046034851080d17c46f885bffdfbf7eae73ea74d6ffa7813e6f9eacf624eda335df641c2bedaa16a5e4e9f3f27c22f4c4b74481f6f9779eea2cb3ee8b2af24da7c8f1321bcc889107a7122046034c9321b754974486f2f4db7f174937e1f55bd6eb793ef7327c24dba243aa4b707af48bf8faafeb6dbe9f7b942b8c1670bfe9dcdb0da5ed575abda8357a4df4755afdbadc37dae1002309acf08e14d3e5385b3391102309a42b8c167efd8bff36e7eb5bdaaeb56b507af48bf8faa5eb75b87fb5c21dca44ba2437a7bf08af4fba8ea6fbb9d7e9f4b96016034274200463bea5ba3e9490de9890ee9df6e4c9f679eb3ef3d5f5e795da2634e8449a90c27263aa427c6a4cf33cfd9f7597fdb2dbd7fbb1c5108d3931ad2131dd21363d2e799e7ecfbf7ae9bbeefd3fbb7d311851000aea21002309a4208c0684714c2f4a486f44487f4c498f479e639fbfebdeba6effbf4feed7444217c84a5329c98e8909e18933ecf3c67df67fd6db7f4feed22590680d18e391102c0158e4a96d92d3d31c175b3d663b7698927d3f6559779a96aef4e634f84e98909ae9bb51ebb4d4b3c99b6afbacc4b557b771b5908d313135cf7f97feb9060f1189878326d5f759997aaf62a8c2c8400f04121046034851080d14616c2f4c404d77dfedf3a24583c06269e4cdb575de6a5aabd0a230be1e380c404d7cd5a8fdda6259e4cdb575de6a5aabdbb49960160b4b1274200789c962c939e887172b2c2afa6254e58dfdee3901873e6fadee998136152fa455242c46ed31227ac6fef71488c39737def7644214c4fc4e890acf0189838617dd7fe5b1a8931afb77dd2fa5638a21002c0551442004653080118ed8842989e88d12159e1313071c2faaefdb73412635e6ffba4f5ad7044217c84a55f242544ec362d71c2faf61e87c49833d7f76e92650018ed981321005ca165b24c175d922924f83c973ecf55d7d5bfacfd3ce1be3ce644382d31a14b3285049fe7d2e7b9eabafa97b59fa7dc974714c26989095d922924f83c973ecf55d7d5bff7dadb6dd27d7944210480ab2884008ca6100230da1185705a624297640a093ecfa5cf73d575f5efbdf6769b745f1e51081f031313ba245348f0792e7d9eabaeab7f59fb79ca7d29590680d18e391102c0154627cba4274eacea9274316d9eabd82f59cf8dddbaacef9d8e39114e4b9c58d525e962da3c57b15fb29e1bbb7559dfbb1d5108a7254eacea9274316d9eabd82f6b6da45d775597f5ad7044210480ab2884008ca6100230da1185705ae2c4aa2e4917d3e6b98afdb2d646da75577559df0a4714c2c7c0c489555d922ea6cd7315fb25ebb9b15b97f5bd9b641900463be644080057902cb3d05e978488ddd79db61eabd2fbb7aa2a79297d5fa5bf6eb7f4feed70cc89504244d675a7adc7aaf4feadaa4a5e4adf57e97fdb2dbd7fbb1c51082544645d77da7aac4aefdfaaaae4a5f47d95febaddd2fbb7d311851000aea21002309a4208c068471442091159d79db61eabd2fbb7aa2a79297d5fa5bf6eb7f4feed7444217c488888bbeeb4f55895debf5555c94be9fb2afd6fbba5f76f17c932008c76cc891000ae7054b20cefa94aeca8929e64b2bbbdf4d7ad4a9fbf2ae9e3489fbfcf38110e5195d851253dc964777be97f5b953e7f55d2c7913e7f5f510807a84aeca8929e64b2bbbdf4d7ad4a9fbf2ae9e3489fbf150a2100a32984008ca61002309a42384055624795f42493ddeda5bf6e55fafc55491f47fafcad500887a84aeca8929e64b2bbbdf4bfad4a9fbf2ae9e3489fbfaf48960160b4a37f507fca5773bfcb7b1480eb1d5908bb17c00f1fe34c2d881245debbee6ee9c923abbaac5b97f6d2f7cb0e47fdd3e89402f837494bf5b7b5f86e1fabda4b1fc7eeeb56f56f559775ebd25efa7ed9e5982fcb4c2f828fa0399028f2de75774b4f1e59d565ddbab497be5f763aa61002c0158e2884ddde7dbcc35c00ec7544210480abc4174227a03f55cf894491f7aebb5b7af2c8aa2eebd6a5bdf4fdb2537c2124934491f7aebb5b7af2c8aa2eebd6a5bdf4fdb24bfccf27aa4f3fa9c2970de01847fea0fe556945437107c8d1ba10a615c00f1ffdbabb20a62744a42767785dd6eb76eb727fa48f2351cbcf087ffefc79c4e2dfd9cf674537e964babb7fabedf9db997fdbadcbfd913e8e54ed0ae10905f07755f15b5ffdb7bba42767785dd6eb76eb727fa48f2359bb420800af6855084f3c0d7e38b9ef00276b550801e0556d0a618713d55563484f88484fcef0baacd7edd6e5fe481f47b2368590cfa52744a42767f85bd6df76eb727fa48f23559b6499f0612c9b365e806aad7f50ffaa77bf62ac38019c4721dcf81b9b8f76520b625532457a224697fe55b557253df9263d71277ddfdf69f467843f7efcb8e487a657b5fb8eaa648af4448c2efdab6aaf4a52ca4dd2df56a5effbbb8d2d84550fb10a55c914e989185dfa57d55e95f4e49bf4c49df47d5f616c210480c7d44278e7bb996eef9c00ba19590801e0c3b842587142ab3e15562553a4276274e95f557b55d2936fd21377d2f77d85718570aaaa648af4448c2efdab6aaf4a52ca4dd2df56a5effbbb8d4b96a93a9dedee5ff8b2011cc3891080d124cb0cd225a1c438de6b6f5a9249fa75bbb4773227c221ba249418c77bed4d4b3249bf6e97f64ea7100ed025a1c438de6b6f5a9249fa75bbb4d7814208c0680a2100a32984008ca6100ed025a1c438de6b6f5a9249fa75bbb4d781423844978412e378afbd694926e9d7edd2dee924cbdc44b20c402627420046932c334897648af4e4912e092f55cccb7bccdfeb9c0887e8924c919e3cd225e1a58a79798ff9fb9e7185b0e25d4af53ba32ec914e9c9235d125eaa9897f798bfef1b570801e057230be19d27b4ead320009f1b590801e0c3d84258f5a3e90a5d9229d29347ba24bc54312fef317fdf37b6103efe59a42b16eaaa76dfd12599223d79a44bc24b15f3f21ef3f73de39265765c2ba10fe1cb06700c3fa8ff85e202308f42c81fba24a354f56f5597a49a555dae6b1cf7b477a7d19f11f2a72ec92855fd5b95944a9334def4eb1ac73dedddad4d213c69d2ffa67a0c5d9251aafab7aa4b52cdaa2ed7358e7bdaabd0a61002c077b42a84a7bcfb78e6e4be039cac5521048057b52b84279eac52fadc2519a5aa7fabba24d5acea725de3b8a7bd0aed0ae1e39fc292525c3e93d8cf2ec92855fd5b95944a9334def4eb1ac73dedddad4db2cc67d286d8714c00a71af183fab453170039461442feab4b9289f6cefcd78069fb6ab7f479499fbfcfb4fc8c903f25a5962425584c6bafcab47db55bfabca4cfdf57e20be149ef2aeef2ea9c744932d1de7bed5599b6af764b9f97f4f95b115f0801e04a471442a7c27f990b80bd8e2884007095630aa193d0f7e7a04b9289f6de6bafcab47db55bfabca4cfdf8af81fd43f73ca07b0bbec5a223f9fd05ea569fb6ab7f479499fbfcf1c59083f742f88072f0dc0318efe41bd4201c0bb8ef98c1000aea01002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c0680a2100a32984008ca61002309a4208c068ff0f44c4adb8de79488b0000000049454e44ae426082, 'Active', 'no', 'yes');

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
(1, 1, 1, '2024-07-07 01:28:40', '{\"DepartmentID\":\"1\",\"Semester\":\"6\",\"SubjectCode\":\"77\",\"SubjectName\":\"77\",\"Theory\":\"77\",\"Tutorial\":\"77\",\"Practical\":\"77\",\"TotalHours\":\"231\",\"GTUTheory\":\"5\",\"MID\":\"5\",\"ESE\":\"5\",\"PA\":\"5\",\"Total\":\"15\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720328320_GYM MANAGEMENT SYSTEM.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720328320_app.pdf\",\"Status\":\"active\"}', '[]', '[]', ''),
(2, 1, 1, '2024-07-07 01:32:23', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"78\",\"SubjectName\":\"78\",\"Theory\":\"78\",\"Tutorial\":\"78\",\"Practical\":\"78\",\"TotalHours\":\"234\",\"GTUTheory\":\"8\",\"MID\":\"8\",\"ESE\":\"8\",\"PA\":\"8\",\"Total\":\"24\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720328543_iwd.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720328543_GYM MANAGEMENT SYSTEM.pdf\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row intosubjectdetails'),
(3, 1, 1, '2024-07-07 01:38:45', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"78\",\"SubjectName\":\"78\",\"Theory\":\"78\",\"Tutorial\":\"78\",\"Practical\":\"78\",\"TotalHours\":\"234\",\"GTUTheory\":\"8\",\"MID\":\"8\",\"ESE\":\"8\",\"PA\":\"8\",\"Total\":\"24\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720328925_GYM MANAGEMENT SYSTEM.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720328925_GYM MANAGEMENT SYSTEM.docx\",\"Status\":\"active\"}', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"78\",\"SubjectName\":\"78\",\"Theory\":\"78\",\"Tutorial\":\"78\",\"Practical\":\"78\",\"TotalHours\":\"234\",\"GTUTheory\":\"8\",\"MID\":\"8\",\"ESE\":\"8\",\"PA\":\"8\",\"Total\":\"24\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720328543_iwd.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720328543_GYM MANAGEMENT SYSTEM.pdf\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(4, 1, 1, '2024-07-07 01:39:31', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"78\",\"SubjectName\":\"78\",\"Theory\":\"78\",\"Tutorial\":\"78\",\"Practical\":\"78\",\"TotalHours\":\"234\",\"GTUTheory\":\"8\",\"MID\":\"8\",\"ESE\":\"8\",\"PA\":\"8\",\"Total\":\"24\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720328925_GYM MANAGEMENT SYSTEM.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720328925_GYM MANAGEMENT SYSTEM.docx\",\"Status\":\"inactive\"}', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"78\",\"SubjectName\":\"78\",\"Theory\":\"78\",\"Tutorial\":\"78\",\"Practical\":\"78\",\"TotalHours\":\"234\",\"GTUTheory\":\"8\",\"MID\":\"8\",\"ESE\":\"8\",\"PA\":\"8\",\"Total\":\"24\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720328925_GYM MANAGEMENT SYSTEM.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720328925_GYM MANAGEMENT SYSTEM.docx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(5, 1, 1, '2024-07-07 01:44:21', '[]', '{\"DepartmentID\":\"1\",\"Semester\":\"6\",\"SubjectCode\":\"77\",\"SubjectName\":\"77\",\"Theory\":\"77\",\"Tutorial\":\"77\",\"Practical\":\"77\",\"TotalHours\":\"231\",\"GTUTheory\":\"5\",\"MID\":\"5\",\"ESE\":\"5\",\"PA\":\"5\",\"Total\":\"15\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720328252_GYM MANAGEMENT SYSTEM.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720328252_app.pdf\",\"Status\":\"active\"}', '[]', 'Deleted row in subjectdetails'),
(6, 1, 1, '2024-07-07 01:48:26', '[]', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"78\",\"SubjectName\":\"78\",\"Theory\":\"78\",\"Tutorial\":\"78\",\"Practical\":\"78\",\"TotalHours\":\"234\",\"GTUTheory\":\"8\",\"MID\":\"8\",\"ESE\":\"8\",\"PA\":\"8\",\"Total\":\"24\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720328925_GYM MANAGEMENT SYSTEM.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720328925_GYM MANAGEMENT SYSTEM.docx\",\"Status\":\"inactive\"}', '[]', 'Deleted row in subjectdetails'),
(7, 1, 1, '2024-07-07 01:48:45', '{\"SubjectCode\":\"654\",\"Unit\":\"7\",\"DepartmentID\":\"1\",\"Title\":\"dhbf\",\"UnitFile\":\"uploads/Clap switchdf circuit.pdf\",\"AssignmentFile\":\"uploads/Dishant.pdf\"}', '{\"ID\":\"10\",\"DepartmentID\":\"1\",\"SubjectCode\":\"654\",\"Unit\":\"1\",\"Title\":\"dhbf\",\"UnitFile\":\"uploads/Clap switchdf circuit.pdf\",\"AssignmentFile\":\"uploads/Dishant.pdf\"}', '[]', 'Updated row in subjectunitdetails'),
(8, 1, 1, '2024-07-07 01:49:41', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"45\",\"SubjectName\":\"45\",\"Theory\":\"45\",\"Tutorial\":\"45\",\"Practical\":\"45\",\"TotalHours\":\"135\",\"GTUTheory\":\"45\",\"MID\":\"45\",\"ESE\":\"45\",\"PA\":\"45\",\"Total\":\"135\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720329581_iwd.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720329581_Live Deals  Badacup.pdf\",\"Status\":\"active\"}', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"45\",\"SubjectName\":\"45\",\"Theory\":\"45\",\"Tutorial\":\"45\",\"Practical\":\"45\",\"TotalHours\":\"135\",\"GTUTheory\":\"45\",\"MID\":\"45\",\"ESE\":\"45\",\"PA\":\"45\",\"Total\":\"135\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720328035_Live Deals  Badacup.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720328035_Clap switchdf circuit.pptx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(9, 1, 1, '2024-07-07 01:54:40', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"45\",\"SubjectName\":\"45\",\"Theory\":\"45\",\"Tutorial\":\"45\",\"Practical\":\"45\",\"TotalHours\":\"135\",\"GTUTheory\":\"45\",\"MID\":\"45\",\"ESE\":\"45\",\"PA\":\"45\",\"Total\":\"135\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720329581_iwd.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720329581_Live Deals  Badacup.pdf\",\"Status\":\"active\"}', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"45\",\"SubjectName\":\"45\",\"Theory\":\"45\",\"Tutorial\":\"45\",\"Practical\":\"45\",\"TotalHours\":\"135\",\"GTUTheory\":\"45\",\"MID\":\"45\",\"ESE\":\"45\",\"PA\":\"45\",\"Total\":\"135\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720329581_iwd.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720329581_Live Deals  Badacup.pdf\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(10, 1, 1, '2024-07-07 01:55:56', '{\"SubjectCode\":\"45\",\"GTUPaperFileName\":\"uploads/gtu_papers/1719839122_mpt_format.pdf\"}', '{\"ID\":\"5\",\"DepartmentID\":\"1\",\"SubjectCode\":\"5666\",\"GTUPaperFileName\":\"uploads/gtu_papers/1719839122_mpt_format.pdf\"}', '[]', 'Updated row in subjectwisegtupapers'),
(11, 1, 1, '2024-07-07 01:59:12', '{\"SubjectCode\":\"45\",\"Unit\":\"9\",\"DepartmentID\":\"1\",\"Title\":\"89\",\"UnitFile\":\"uploads/unit_materials/1720330152_iwd.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1720330152_Dishant.pdf\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(12, 1, 1, '2024-07-07 02:00:17', '[]', '{\"ID\":\"13\",\"DepartmentID\":\"1\",\"SubjectCode\":\"45\",\"Unit\":\"9\",\"Title\":\"89\",\"UnitFile\":\"uploads/unit_materials/1720330152_iwd.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1720330152_Dishant.pdf\"}', '[]', 'Deleted row in subjectunitdetails'),
(13, 1, 1, '2024-07-07 02:01:56', '{\"SubjectCode\":\"45\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720330316_GYM MANAGEMENT SYSTEM.pdf\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(14, 1, 1, '2024-07-07 02:02:36', '{\"SubjectCode\":\"654\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720330356_Dishant Pan card.pdf\",\"DepartmentID\":\"1\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(15, 1, 1, '2024-07-07 02:02:39', '[]', '{\"ID\":\"9\",\"DepartmentID\":\"1\",\"SubjectCode\":\"654\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720330356_Dishant Pan card.pdf\"}', '[]', 'Deleted row in subjectwisegtupapers'),
(16, 1, 1, '2024-07-07 04:07:01', '{\"SubjectCode\":\"654\",\"Unit\":\"9\",\"DepartmentID\":null,\"Title\":\"9\",\"UnitFile\":\"uploads/unit_materials/1720337821_iwd.pdf\",\"AssignmentFile\":null}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(17, 1, 1, '2024-07-07 04:08:34', '{\"SubjectCode\":\"45\",\"Unit\":\"7\",\"DepartmentID\":\"1\",\"Title\":\"7\",\"UnitFile\":\"uploads/unit_materials/1720337914_GYM MANAGEMENT SYSTEM.docx\",\"AssignmentFile\":\"uploads/assignment_materials/1720337914_GYM MANAGEMENT SYSTEM.pdf\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(18, 1, 1, '2024-07-07 04:09:40', '{\"SubjectCode\":\"654\",\"Unit\":\"99\",\"DepartmentID\":null,\"Title\":\"99\",\"UnitFile\":\"uploads/unit_materials/1720337980_iwd.pdf\",\"AssignmentFile\":null}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(19, 1, 1, '2024-07-07 04:10:21', '{\"SubjectCode\":\"654\",\"Unit\":\"88\",\"DepartmentID\":\"1\",\"Title\":\"88\",\"UnitFile\":\"uploads/unit_materials/1720338021_GYM MANAGEMENT SYSTEM.docx\",\"AssignmentFile\":null}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(20, 1, 1, '2024-07-07 04:21:54', '{\"SubjectCode\":\"654\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720338714_Dishant Pan card.pdf\",\"DepartmentID\":\"1\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(21, 1, 1, '2024-07-07 04:22:14', '{\"SubjectCode\":\"654\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720338734_app.pdf\",\"DepartmentID\":\"1\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(22, 1, 1, '2024-07-07 11:51:25', '{\"SubjectCode\":\"89\",\"SubjectName\":\"sdfh\",\"Theory\":\"644\",\"Tutorial\":\"65\",\"Practical\":\"65\",\"TotalHours\":\"65\",\"GTUTheory\":\"65\",\"MID\":\"65\",\"ESE\":\"65\",\"PA\":\"65\",\"Total\":\"6\",\"SyllabusFile\":\"65\",\"Assignments\":\"98\",\"Status\":\"Active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(23, 1, 1, '2024-07-07 11:56:03', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"sdfh\",\"SubjectName\":\"644\",\"Theory\":\"65\",\"Tutorial\":\"65\",\"Practical\":\"65\",\"TotalHours\":\"65\",\"GTUTheory\":\"65\",\"MID\":\"65\",\"ESE\":\"65\",\"PA\":\"6\",\"Total\":\"65\",\"SyllabusFile\":\"98\",\"Assignments\":\"Active\",\"Status\":null}', '[]', '[]', 'Inserted new row into subjectdetails'),
(24, 1, 1, '2024-07-07 11:58:27', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"89\",\"Semester\":\"sdfh\",\"Theory\":\"644\",\"Tutorial\":\"65\",\"Practical\":\"65\",\"TotalHours\":\"65\",\"GTUTheory\":\"65\",\"MID\":\"65\",\"ESE\":\"65\",\"PA\":\"65\",\"Total\":\"6\",\"SyllabusFile\":\"65\",\"Assignments\":\"98\",\"Status\":\"Active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(25, 1, 1, '2024-07-08 03:29:09', '[]', '{\"DepartmentID\":\"1\",\"Semester\":\"4\",\"SubjectCode\":\"654\",\"SubjectName\":\"465465\",\"Theory\":\"554\",\"Tutorial\":\"65\",\"Practical\":\"645\",\"TotalHours\":\"465\",\"GTUTheory\":\"4655\",\"MID\":\"65\",\"ESE\":\"654\",\"PA\":\"4654\",\"Total\":\"65\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720253388_Live Deals  Badacup.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720253388_iwd.pdf\",\"Status\":\"Active\"}', '[]', 'Deleted row in subjectdetails'),
(26, 1, 1, '2024-07-08 04:21:02', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"444\",\"Semester\":\"4\",\"SubjectName\":\"Test\",\"Theory\":\"23\",\"Tutorial\":\"23\",\"Practical\":\"76\",\"TotalHours\":\"23\",\"GTUTheory\":\"23\",\"MID\":\"23\",\"ESE\":\"23\",\"PA\":\"23\",\"Total\":\"23\",\"SyllabusFile\":\"23\",\"Assignments\":\"23\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(27, 1, 1, '2024-07-08 04:24:30', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"777\",\"Semester\":\"4\",\"SubjectName\":\"Test\",\"Theory\":\"23\",\"Tutorial\":\"23\",\"Practical\":\"76\",\"TotalHours\":\"23\",\"GTUTheory\":\"23\",\"MID\":\"23\",\"ESE\":\"23\",\"PA\":\"23\",\"Total\":\"23\",\"SyllabusFile\":\"23\",\"Assignments\":\"999\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(28, 1, 1, '2024-07-08 04:24:30', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"555\",\"Semester\":\"2\",\"SubjectName\":\"iwd\",\"Theory\":\"45\",\"Tutorial\":\"18\",\"Practical\":\"7\",\"TotalHours\":\"33\",\"GTUTheory\":\"32\",\"MID\":\"55\",\"ESE\":\"66\",\"PA\":\"88\",\"Total\":\"77\",\"SyllabusFile\":\"9\",\"Assignments\":\"9\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(29, 1, 1, '2024-07-08 04:24:31', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"999\",\"Semester\":\"1\",\"SubjectName\":\"bcp\",\"Theory\":\"65\",\"Tutorial\":\"56\",\"Practical\":\"45\",\"TotalHours\":\"451\",\"GTUTheory\":\"12\",\"MID\":\"21\",\"ESE\":\"22\",\"PA\":\"45\",\"Total\":\"65\",\"SyllabusFile\":\"65\",\"Assignments\":\"87\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(30, 1, 1, '2024-07-08 04:28:08', '[]', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"45\",\"SubjectName\":\"45\",\"Theory\":\"45\",\"Tutorial\":\"45\",\"Practical\":\"45\",\"TotalHours\":\"135\",\"GTUTheory\":\"45\",\"MID\":\"45\",\"ESE\":\"45\",\"PA\":\"45\",\"Total\":\"135\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720329581_iwd.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720329581_Live Deals  Badacup.pdf\",\"Status\":\"active\"}', '[]', 'Deleted row in subjectdetails'),
(31, 1, 1, '2024-07-10 02:24:41', '[]', '{\"DepartmentID\":\"0\",\"Semester\":\"0\",\"SubjectCode\":\"89\",\"SubjectName\":\"sdfh\",\"Theory\":\"644\",\"Tutorial\":\"65\",\"Practical\":\"65\",\"TotalHours\":\"65\",\"GTUTheory\":\"65\",\"MID\":\"65\",\"ESE\":\"65\",\"PA\":\"65\",\"Total\":\"6\",\"SyllabusFile\":\"65\",\"Assignments\":\"98\",\"Status\":\"Active\"}', '[]', 'Deleted row in subjectdetails'),
(32, 1, 1, '2024-07-10 02:25:38', '{\"DepartmentID\":\"1\",\"Semester\":\"4\",\"SubjectCode\":\"12\",\"SubjectName\":\"12\",\"Theory\":\"1\",\"Tutorial\":\"6\",\"Practical\":\"6\",\"TotalHours\":\"13\",\"GTUTheory\":\"6\",\"MID\":\"6\",\"ESE\":\"6\",\"PA\":\"6\",\"Total\":\"6\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720590938_unit-1-software-process-models_updated.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720590938_unit-2-software-requirement-analysis-and-design.pdf\",\"Status\":\"inactive\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(33, 1, 1, '2024-07-10 02:31:27', '{\"DepartmentID\":\"1\",\"Semester\":\"1\",\"SubjectCode\":\"4330701\",\"SubjectName\":\"2\",\"Theory\":\"3\",\"Tutorial\":\"3\",\"Practical\":\"3\",\"TotalHours\":\"9\",\"GTUTheory\":\"3\",\"MID\":\"123\",\"ESE\":\"123\",\"PA\":\"4\",\"Total\":\"250\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720591287_parantConstant.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720591287_parantConstant.pdf\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(34, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(35, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(36, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(37, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(38, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(39, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(40, 2, 2, '0000-00-00 00:00:00', '{\"DepartmentID\":\"2\",\"Semester\":\"1\",\"SubjectCode\":\"9191919191919191919191\",\"SubjectName\":\"es\",\"Theory\":\"5\",\"Tutorial\":\"45\",\"Practical\":\"45\",\"TotalHours\":\"95\",\"GTUTheory\":\"4\",\"MID\":\"5\",\"ESE\":\"45\",\"PA\":\"45\",\"Total\":\"95\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720779008_unit-1-software-process-models_updated.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720779008_unit-2-software-requirement-analysis-and-design.pdf\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(41, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(42, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(43, 2, 2, '0000-00-00 00:00:00', '{\"DepartmentID\":\"2\",\"Semester\":\"1\",\"SubjectCode\":\"818181\",\"SubjectName\":\"es\",\"Theory\":\"5\",\"Tutorial\":\"45\",\"Practical\":\"45\",\"TotalHours\":\"95\",\"GTUTheory\":\"4\",\"MID\":\"5\",\"ESE\":\"4545\",\"PA\":\"45\",\"Total\":\"4595\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720779008_unit-1-software-process-models_updated.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720779008_unit-2-software-requirement-analysis-and-design.pdf\",\"Status\":\"active\"}', '{\"DepartmentID\":\"2\",\"Semester\":\"1\",\"SubjectCode\":\"9191919191\",\"SubjectName\":\"es\",\"Theory\":\"5\",\"Tutorial\":\"45\",\"Practical\":\"45\",\"TotalHours\":\"95\",\"GTUTheory\":\"4\",\"MID\":\"5\",\"ESE\":\"45\",\"PA\":\"45\",\"Total\":\"95\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720779008_unit-1-software-process-models_updated.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720779008_unit-2-software-requirement-analysis-and-design.pdf\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(44, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(45, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(46, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(47, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(48, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(49, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(50, 2, 2, '0000-00-00 00:00:00', '{\"SubjectCode\":\"818181\",\"Unit\":\"1\",\"DepartmentID\":\"2\",\"Title\":\"Introduction\",\"UnitFile\":\"uploads/unit_materials/1720780075_unit-2-software-requirement-analysis-and-design.pdf\",\"AssignmentFile\":null}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(51, 2, 2, '0000-00-00 00:00:00', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"818181\",\"Unit\":\"1\",\"Title\":\"Introduction\",\"UnitFile\":\"uploads/unit_materials/1720780075_unit-2-software-requirement-analysis-and-design.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1720780138_unit-2-software-requirement-analysis-and-design.pdf\"}', '{\"ID\":\"18\",\"DepartmentID\":\"2\",\"SubjectCode\":\"818181\",\"Unit\":\"1\",\"Title\":\"Introduction\",\"UnitFile\":\"uploads/unit_materials/1720780075_unit-2-software-requirement-analysis-and-design.pdf\",\"AssignmentFile\":\"\"}', '[]', 'Updated row in subjectunitdetails'),
(52, 2, 2, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(53, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(54, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"777\",\"Semester\":\"4\",\"SubjectName\":\"Test\",\"Theory\":\"23\",\"Tutorial\":\"23\",\"Practical\":\"76\",\"TotalHours\":\"23\",\"GTUTheory\":\"23\",\"MID\":\"23\",\"ESE\":\"23\",\"PA\":\"23\",\"Total\":\"23\",\"SyllabusFile\":\"23\",\"Assignments\":\"999\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(55, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"555\",\"Semester\":\"2\",\"SubjectName\":\"iwd\",\"Theory\":\"45\",\"Tutorial\":\"18\",\"Practical\":\"7\",\"TotalHours\":\"33\",\"GTUTheory\":\"32\",\"MID\":\"55\",\"ESE\":\"66\",\"PA\":\"88\",\"Total\":\"77\",\"SyllabusFile\":\"9\",\"Assignments\":\"9\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(56, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"999\",\"Semester\":\"1\",\"SubjectName\":\"bcp\",\"Theory\":\"65\",\"Tutorial\":\"56\",\"Practical\":\"45\",\"TotalHours\":\"451\",\"GTUTheory\":\"12\",\"MID\":\"21\",\"ESE\":\"22\",\"PA\":\"45\",\"Total\":\"65\",\"SyllabusFile\":\"65\",\"Assignments\":\"87\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(57, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"sdfh\",\"Unit\":\"1\",\"Title\":\"222\",\"UnitFile\":\"uploads/unit_materials/1720786802_ISE unit 2 ppt.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1720786802_ISE unit 2 ppt.pdf\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(58, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(59, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(60, 1, 1, '0000-00-00 00:00:00', '{\"SubjectCode\":\"4330701\",\"GTUPaperFileName\":null,\"DepartmentID\":\"1\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(61, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"4330701\",\"SubjectName\":\"g\",\"Theory\":\"67\",\"Tutorial\":\"67\",\"Practical\":\"67\",\"TotalHours\":\"201\",\"GTUTheory\":\"67\",\"MID\":\"67\",\"ESE\":\"76\",\"PA\":\"989866578787\",\"Total\":\"989866578930\",\"SyllabusFile\":\"uploads/syllabus_subjects/1720958571_unit-1-software-process-models_updated.pdf\",\"Assignments\":\"uploads/assignments_subjects/1720958571_unit-2-software-requirement-analysis-and-design.pdf\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(62, 1, 1, '0000-00-00 00:00:00', '{\"Title\":\"hello ji  kya hal chal\",\"SubjectCode\":\"999\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720960431_unit-2-software-requirement-analysis-and-design.pdf\",\"DepartmentID\":\"2\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(63, 1, 1, '0000-00-00 00:00:00', '[]', '{\"ID\":\"13\",\"DepartmentID\":\"0\",\"SubjectCode\":\"\",\"GTUPaperFileName\":\"\",\"title\":null}', '[]', 'Deleted row in subjectwisegtupapers'),
(64, 1, 1, '0000-00-00 00:00:00', '[]', '{\"ID\":\"8\",\"DepartmentID\":\"0\",\"SubjectCode\":\"45\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720330316_GYM MANAGEMENT SYSTEM.pdf\",\"title\":null}', '[]', 'Deleted row in subjectwisegtupapers'),
(65, 1, 1, '0000-00-00 00:00:00', '{\"Title\":\"ffgfbghgbgnhhnhgnhg\",\"SubjectCode\":\"444\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720960981_unit-2-software-requirement-analysis-and-design.pdf\",\"DepartmentID\":\"2\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(66, 1, 1, '0000-00-00 00:00:00', '{\"Title\":\"hhelloooooooooooooo\",\"SubjectCode\":\"555\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720961049_unit-1-software-process-models_updated.pdf\",\"DepartmentID\":\"2\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(67, 1, 1, '0000-00-00 00:00:00', '{\"Title\":\"dtetsffs\",\"SubjectCode\":\"777\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720961292_unit-2-software-requirement-analysis-and-design.pdf\",\"DepartmentID\":\"1\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(68, 1, 1, '0000-00-00 00:00:00', '{\"Title\":\"hfhjf\",\"SubjectCode\":\"4330701\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720961317_unit-2-software-requirement-analysis-and-design.pdf\",\"DepartmentID\":\"2\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(69, 1, 1, '0000-00-00 00:00:00', '[]', '{\"ID\":\"18\",\"DepartmentID\":\"2\",\"SubjectCode\":\"4330701\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720961317_unit-2-software-requirement-analysis-and-design.pdf\",\"title\":\"hfhjf\"}', '[]', 'Deleted row in subjectwisegtupapers'),
(70, 1, 1, '0000-00-00 00:00:00', '[]', '{\"ID\":\"10\",\"DepartmentID\":\"1\",\"SubjectCode\":\"654\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720338714_Dishant Pan card.pdf\",\"title\":null}', '[]', 'Deleted row in subjectwisegtupapers'),
(71, 1, 1, '0000-00-00 00:00:00', '[]', '{\"ID\":\"11\",\"DepartmentID\":\"1\",\"SubjectCode\":\"654\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720338734_app.pdf\",\"title\":null}', '[]', 'Deleted row in subjectwisegtupapers'),
(72, 1, 1, '0000-00-00 00:00:00', '{\"SubjectCode\":\"sdfh\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720961820_unit-1-software-process-models_updated.pdf\",\"DepartmentID\":\"1\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(73, 1, 1, '0000-00-00 00:00:00', '{\"SubjectCode\":\"sdfh\",\"Title\":\"YEH INDIVIDUAL Subject SE KIYA GAYA HAIN\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720962216_unit-2-software-requirement-analysis-and-design.pdf\",\"DepartmentID\":\"1\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(74, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(75, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(76, 1, 1, '0000-00-00 00:00:00', '[]', '{\"ID\":\"12\",\"DepartmentID\":\"1\",\"SubjectCode\":\"4330701\",\"GTUPaperFileName\":\"\",\"title\":null}', '[]', 'Deleted row in subjectwisegtupapers'),
(77, 1, 1, '0000-00-00 00:00:00', '[]', '{\"ID\":\"14\",\"DepartmentID\":\"2\",\"SubjectCode\":\"999\",\"GTUPaperFileName\":\"uploads/gtu_papers/1720960431_unit-2-software-requirement-analysis-and-design.pdf\",\"title\":\"hello ji  kya hal chal\"}', '[]', 'Deleted row in subjectwisegtupapers'),
(78, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019582_sem 1 IT  Hall ticket.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019582_sem 1 IT  Hall ticket.pdf\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(79, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019582_sem 1 IT  Hall ticket.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019582_sem 1 IT  Hall ticket.pdf\",\"Status\":\"active\"}', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019582_sem 1 IT  Hall ticket.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019582_sem 1 IT  Hall ticket.pdf\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(80, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019582_sem 1 IT  Hall ticket.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019582_sem 1 IT  Hall ticket.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019582_sem 1 IT  Hall ticket.pdf\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(81, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019582_sem 1 IT  Hall ticket.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(82, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"2\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '{\"DepartmentID\":\"1\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(83, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"2\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '{\"DepartmentID\":\"2\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(84, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"2\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '{\"DepartmentID\":\"2\",\"Semester\":\"2\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(85, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(86, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(87, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(88, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(89, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"2\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '{\"DepartmentID\":\"2\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(90, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"2\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '{\"DepartmentID\":\"2\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(91, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '{\"DepartmentID\":\"2\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(92, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"2\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(93, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(94, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(95, 1, 1, '0000-00-00 00:00:00', '{\"DepartmentID\":\"1\",\"Semester\":\"4\",\"SubjectCode\":\"Test2\",\"SubjectName\":\"Test2\",\"Theory\":\"7\",\"Tutorial\":\"7\",\"Practical\":\"7\",\"TotalHours\":\"21\",\"GTUTheory\":\"7\",\"MID\":\"7\",\"ESE\":\"7\",\"PA\":\"7\",\"Total\":\"21\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721020489_Inheritance.docx\",\"Assignments\":\"uploads/assignments_subjects/1721020489_Inheritance.pdf\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(96, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(97, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(98, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(99, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(100, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(101, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(102, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged Out'),
(103, 1, 1, '0000-00-00 00:00:00', '[]', '[]', '[]', 'Logged In'),
(104, 1, 1, '2024-07-15 05:19:11', '{\"DepartmentID\":\"2\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '{\"DepartmentID\":\"2\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(105, 1, 1, '2024-07-15 05:20:01', '{\"SubjectCode\":\"Test1\",\"Unit\":\"2\",\"DepartmentID\":\"1\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":null}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(106, 1, 1, '2024-07-15 05:26:26', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"Test2\",\"Unit\":\"2\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"\"}', '{\"ID\":\"20\",\"DepartmentID\":\"1\",\"SubjectCode\":\"Test1\",\"Unit\":\"2\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"\"}', '[]', 'Updated row in subjectunitdetails'),
(107, 1, 1, '2024-07-15 05:27:29', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"Test2\",\"Unit\":\"2\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"\"}', '{\"ID\":\"20\",\"DepartmentID\":\"1\",\"SubjectCode\":\"Test2\",\"Unit\":\"2\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"\"}', '[]', 'Updated row in subjectunitdetails'),
(108, 1, 1, '2024-07-15 05:29:12', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"Test2\",\"Unit\":\"2\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"uploads/assignment_materials/1721021352_Inheritance.pdf\"}', '{\"ID\":\"20\",\"DepartmentID\":\"2\",\"SubjectCode\":\"Test2\",\"Unit\":\"2\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"\"}', '[]', 'Updated row in subjectunitdetails'),
(109, 1, 1, '2024-07-15 05:29:25', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"Test2\",\"Unit\":\"8\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"uploads/assignment_materials/1721021352_Inheritance.pdf\"}', '{\"ID\":\"20\",\"DepartmentID\":\"2\",\"SubjectCode\":\"Test2\",\"Unit\":\"2\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"uploads/assignment_materials/1721021352_Inheritance.pdf\"}', '[]', 'Updated row in subjectunitdetails'),
(110, 1, 1, '2024-07-15 05:32:29', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"Test2\",\"Unit\":\"10\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"uploads/assignment_materials/1721021352_Inheritance.pdf\"}', '{\"ID\":\"20\",\"DepartmentID\":\"2\",\"SubjectCode\":\"Test2\",\"Unit\":\"8\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"uploads/assignment_materials/1721021352_Inheritance.pdf\"}', '[]', 'Updated row in subjectunitdetails'),
(111, 1, 1, '2024-07-15 05:33:24', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"Test2\",\"Unit\":\"0\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"uploads/assignment_materials/1721021352_Inheritance.pdf\"}', '{\"ID\":\"20\",\"DepartmentID\":\"2\",\"SubjectCode\":\"Test2\",\"Unit\":\"10\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"uploads/assignment_materials/1721021352_Inheritance.pdf\"}', '[]', 'Updated row in subjectunitdetails'),
(112, 1, 1, '2024-07-15 05:36:13', '{\"DepartmentID\":\"1\",\"Semester\":null,\"SubjectCode\":null,\"SubjectName\":null,\"Theory\":null,\"Tutorial\":null,\"Practical\":null,\"TotalHours\":null,\"GTUTheory\":null,\"MID\":null,\"ESE\":null,\"PA\":null,\"Total\":null,\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":null}', '{\"DepartmentID\":\"2\",\"Semester\":\"3\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721019634_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721019623_Inheritance.docx\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(113, 1, 1, '2024-07-15 05:36:16', '[]', '[]', '[]', 'Logged Out'),
(114, 1, 1, '2024-07-15 05:36:18', '[]', '[]', '[]', 'Logged In'),
(115, 1, 1, '2024-07-15 05:39:23', '[]', '{\"ID\":\"20\",\"DepartmentID\":\"2\",\"SubjectCode\":\"Test2\",\"Unit\":\"0\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721020801_Inheritance.docx\",\"AssignmentFile\":\"uploads/assignment_materials/1721021352_Inheritance.pdf\"}', '[]', 'Deleted row in subjectunitdetails'),
(116, 1, 1, '2024-07-15 05:41:37', '{\"DepartmentID\":\"2\",\"Semester\":\"1\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"77\",\"Tutorial\":\"77\",\"Practical\":\"77\",\"TotalHours\":\"231\",\"GTUTheory\":\"77\",\"MID\":\"77\",\"ESE\":\"77\",\"PA\":\"7\",\"Total\":\"161\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721022097_Inheritance.docx\",\"Assignments\":\"uploads/assignments_subjects/1721022097_Inheritance.pdf\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(117, 1, 1, '2024-07-15 05:42:17', '{\"SubjectCode\":\"Test1\",\"Unit\":\"1\",\"DepartmentID\":\"1\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721022137_Inheritance.pdf\",\"AssignmentFile\":null}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(118, 1, 1, '2024-07-15 05:42:58', '{\"DepartmentID\":\"2\",\"Semester\":\"1\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"77\",\"Tutorial\":\"77\",\"Practical\":\"77\",\"TotalHours\":\"231\",\"GTUTheory\":\"77\",\"MID\":\"77\",\"ESE\":\"77\",\"PA\":\"7\",\"Total\":\"161\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721022097_Inheritance.docx\",\"Assignments\":\"uploads/assignments_subjects/1721022097_Inheritance.pdf\",\"Status\":\"active\"}', '{\"DepartmentID\":\"2\",\"Semester\":\"1\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"77\",\"Tutorial\":\"77\",\"Practical\":\"77\",\"TotalHours\":\"231\",\"GTUTheory\":\"77\",\"MID\":\"77\",\"ESE\":\"77\",\"PA\":\"7\",\"Total\":\"161\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721022097_Inheritance.docx\",\"Assignments\":\"uploads/assignments_subjects/1721022097_Inheritance.pdf\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(119, 1, 1, '2024-07-15 05:43:15', '{\"SubjectCode\":\"Test1\",\"Unit\":\"2\",\"DepartmentID\":\"1\",\"Title\":\"Test2\",\"UnitFile\":\"uploads/unit_materials/1721022195_Inheritance.pdf\",\"AssignmentFile\":null}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(120, 1, 1, '2024-07-15 05:43:49', '{\"DepartmentID\":\"2\",\"Semester\":\"1\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"77\",\"Tutorial\":\"77\",\"Practical\":\"77\",\"TotalHours\":\"231\",\"GTUTheory\":\"77\",\"MID\":\"77\",\"ESE\":\"77\",\"PA\":\"7\",\"Total\":\"161\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721022097_Inheritance.docx\",\"Assignments\":\"uploads/assignments_subjects/1721022097_Inheritance.pdf\",\"Status\":\"active\"}', '{\"DepartmentID\":\"2\",\"Semester\":\"1\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"77\",\"Tutorial\":\"77\",\"Practical\":\"77\",\"TotalHours\":\"231\",\"GTUTheory\":\"77\",\"MID\":\"77\",\"ESE\":\"77\",\"PA\":\"7\",\"Total\":\"161\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721022097_Inheritance.docx\",\"Assignments\":\"uploads/assignments_subjects/1721022097_Inheritance.pdf\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(121, 1, 1, '2024-07-15 05:56:05', '{\"SubjectCode\":\"Test1\",\"Unit\":\"3\",\"DepartmentID\":\"2\",\"Title\":\"Test3\",\"UnitFile\":\"uploads/unit_materials/1721022965_Inheritance.pdf\",\"AssignmentFile\":null}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(122, 1, 1, '2024-07-15 06:30:09', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"Test0\",\"SubjectName\":\"Test0\",\"Theory\":\"0\",\"Tutorial\":\"0\",\"Practical\":\"0\",\"TotalHours\":\"0\",\"GTUTheory\":\"0\",\"MID\":\"0\",\"ESE\":\"0\",\"PA\":\"00\",\"Total\":\"0\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721025009_Inheritance.docx\",\"Assignments\":\"uploads/assignments_subjects/1721025009_Inheritance.pdf\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(123, 1, 1, '2024-07-15 06:30:47', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"Test9\",\"SubjectName\":\"Test9\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721025047_sealAllotementLetter.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721025047_Inheritance.docx\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(124, 1, 1, '2024-07-15 06:32:51', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"Test9\",\"Unit\":\"1\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721022137_Inheritance.pdf\",\"AssignmentFile\":\"\"}', '{\"ID\":\"21\",\"DepartmentID\":\"1\",\"SubjectCode\":\"Test1\",\"Unit\":\"1\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721022137_Inheritance.pdf\",\"AssignmentFile\":\"\"}', '[]', 'Updated row in subjectunitdetails'),
(125, 1, 1, '2024-07-15 06:33:09', '[]', '{\"ID\":\"22\",\"DepartmentID\":\"1\",\"SubjectCode\":\"Test1\",\"Unit\":\"2\",\"Title\":\"Test2\",\"UnitFile\":\"uploads/unit_materials/1721022195_Inheritance.pdf\",\"AssignmentFile\":\"\"}', '[]', 'Deleted row in subjectunitdetails'),
(126, 1, 1, '2024-07-15 06:33:12', '[]', '{\"ID\":\"21\",\"DepartmentID\":\"1\",\"SubjectCode\":\"Test9\",\"Unit\":\"1\",\"Title\":\"Test1\",\"UnitFile\":\"uploads/unit_materials/1721022137_Inheritance.pdf\",\"AssignmentFile\":\"\"}', '[]', 'Deleted row in subjectunitdetails'),
(127, 1, 1, '2024-07-15 06:33:15', '[]', '{\"ID\":\"23\",\"DepartmentID\":\"2\",\"SubjectCode\":\"Test1\",\"Unit\":\"3\",\"Title\":\"Test3\",\"UnitFile\":\"uploads/unit_materials/1721022965_Inheritance.pdf\",\"AssignmentFile\":\"\"}', '[]', 'Deleted row in subjectunitdetails'),
(128, 1, 1, '2024-07-15 06:33:41', '{\"DepartmentID\":\"2\",\"Semester\":\"1\",\"SubjectCode\":\"FEECODE\",\"SubjectName\":\"FEE\",\"Theory\":\"77\",\"Tutorial\":\"77\",\"Practical\":\"77\",\"TotalHours\":\"231\",\"GTUTheory\":\"77\",\"MID\":\"77\",\"ESE\":\"77\",\"PA\":\"7\",\"Total\":\"161\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721022097_Inheritance.docx\",\"Assignments\":\"uploads/assignments_subjects/1721022097_Inheritance.pdf\",\"Status\":\"active\"}', '{\"DepartmentID\":\"2\",\"Semester\":\"1\",\"SubjectCode\":\"Test1\",\"SubjectName\":\"Test1\",\"Theory\":\"77\",\"Tutorial\":\"77\",\"Practical\":\"77\",\"TotalHours\":\"231\",\"GTUTheory\":\"77\",\"MID\":\"77\",\"ESE\":\"77\",\"PA\":\"7\",\"Total\":\"161\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721022097_Inheritance.docx\",\"Assignments\":\"uploads/assignments_subjects/1721022097_Inheritance.pdf\",\"Status\":\"active\"}', '[]', 'Updated row in subjectdetails'),
(129, 1, 1, '2024-07-15 06:34:07', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"1\",\"Title\":\"Commm ch 1\",\"UnitFile\":\"uploads/unit_materials/1721025247_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721025247_Inheritance.docx\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(130, 1, 1, '2024-07-15 06:52:01', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"1\",\"Title\":\"Commm ch 1\",\"UnitFile\":\"uploads/unit_materials/1721025247_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721025247_Inheritance.docx\"}', '{\"ID\":\"24\",\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"1\",\"Title\":\"Commm ch 1\",\"UnitFile\":\"uploads/unit_materials/1721025247_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721025247_Inheritance.docx\"}', '[]', 'Updated row in subjectunitdetails'),
(131, 1, 1, '2024-07-15 07:02:26', '{\"DepartmentID\":\"1\",\"SubjectCode\":null,\"Unit\":null,\"Title\":null,\"UnitFile\":\"uploads/unit_materials/1721025247_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721025247_Inheritance.docx\"}', '{\"ID\":\"24\",\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"1\",\"Title\":\"Commm ch 1\",\"UnitFile\":\"uploads/unit_materials/1721025247_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721025247_Inheritance.docx\"}', '[]', 'Updated row in subjectunitdetails'),
(132, 1, 1, '2024-07-15 07:02:34', '[]', '{\"ID\":\"24\",\"DepartmentID\":\"1\",\"SubjectCode\":\"\",\"Unit\":\"0\",\"Title\":\"\",\"UnitFile\":\"uploads/unit_materials/1721025247_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721025247_Inheritance.docx\"}', '[]', 'Deleted row in subjectunitdetails');
INSERT INTO `log` (`id`, `DepartmentID`, `FacultyID`, `time`, `new_data`, `old_data`, `TransDetails`, `log_title`) VALUES
(133, 1, 1, '2024-07-15 07:03:23', '{\"SubjectCode\":\"FEECODE\",\"Unit\":\"1\",\"DepartmentID\":\"2\",\"Title\":\"Test1Unit1\",\"UnitFile\":\"uploads/unit_materials/1721027003_Inheritance.docx\",\"AssignmentFile\":null}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(134, 1, 1, '2024-07-15 07:04:41', '{\"DepartmentID\":\"1\",\"SubjectCode\":\"Test0\",\"Unit\":\"1\",\"Title\":\"Test1Unit1\",\"UnitFile\":\"uploads/unit_materials/1721027003_Inheritance.docx\",\"AssignmentFile\":\"\"}', '{\"ID\":\"25\",\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"1\",\"Title\":\"Test1Unit1\",\"UnitFile\":\"uploads/unit_materials/1721027003_Inheritance.docx\",\"AssignmentFile\":\"\"}', '[]', 'Updated row in subjectunitdetails'),
(135, 1, 1, '2024-07-15 07:04:47', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"1\",\"Title\":\"Test1Unit1\",\"UnitFile\":\"uploads/unit_materials/1721027003_Inheritance.docx\",\"AssignmentFile\":\"\"}', '{\"ID\":\"25\",\"DepartmentID\":\"1\",\"SubjectCode\":\"Test0\",\"Unit\":\"1\",\"Title\":\"Test1Unit1\",\"UnitFile\":\"uploads/unit_materials/1721027003_Inheritance.docx\",\"AssignmentFile\":\"\"}', '[]', 'Updated row in subjectunitdetails'),
(136, 1, 1, '2024-07-15 07:06:34', '{\"SubjectCode\":\"FEECODE\",\"Unit\":\"899\",\"DepartmentID\":\"2\",\"Title\":\"95\",\"UnitFile\":\"uploads/unit_materials/1721027194_Aug-2022.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721027194_BooASSDASk1.pdf\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(137, 1, 1, '2024-07-15 07:09:14', '{\"SubjectCode\":\"FEECODE\",\"Unit\":\"3\",\"DepartmentID\":\"2\",\"Title\":\"Unit 3\",\"UnitFile\":\"uploads/unit_materials/1721027354_BooASSDASk1.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721027354_Aug-2022.pdf\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(138, 1, 1, '2024-07-15 07:09:46', '[]', '[]', '[]', 'Logged Out'),
(139, 1, 1, '2024-07-15 07:09:47', '[]', '[]', '[]', 'Logged In'),
(140, 1, 1, '2024-07-15 07:10:24', '[]', '[]', '[]', 'Logged Out'),
(141, 2, 1, '2024-07-15 07:10:25', '[]', '[]', '[]', 'Logged In'),
(142, 2, 1, '2024-07-15 07:25:14', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"9\",\"Title\":\"Unit 9\",\"UnitFile\":\"uploads/unit_materials/1721028314_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721028314_Inheritance.docx\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(143, 2, 1, '2024-07-15 07:27:14', '{\"DepartmentID\":\"2\",\"Semester\":\"3\",\"SubjectCode\":\"PHYCODE\",\"SubjectName\":\"PHY\",\"Theory\":\"8\",\"Tutorial\":\"8\",\"Practical\":\"8\",\"TotalHours\":\"24\",\"GTUTheory\":\"8\",\"MID\":\"8\",\"ESE\":\"8\",\"PA\":\"8\",\"Total\":\"24\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721028434_admissionLetter.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721028434_Inheritance.pdf\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(144, 2, 1, '2024-07-15 07:27:28', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"PHYCODE\",\"Unit\":\"9\",\"Title\":\"Unit 9\",\"UnitFile\":\"uploads/unit_materials/1721028314_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721028314_Inheritance.docx\"}', '{\"ID\":\"28\",\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"9\",\"Title\":\"Unit 9\",\"UnitFile\":\"uploads/unit_materials/1721028314_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721028314_Inheritance.docx\"}', '[]', 'Updated row in subjectunitdetails'),
(145, 2, 1, '2024-07-15 07:27:50', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"PHYCODE\",\"Unit\":\"5\",\"Title\":\"5\",\"UnitFile\":\"uploads/unit_materials/1721028470_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721028470_admissionLetter.pdf\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(146, 2, 1, '2024-07-15 08:04:07', '[]', '[]', '[]', 'Logged In'),
(147, 2, 1, '2024-07-15 08:09:05', '{\"SubjectCode\":\"FEECODE\",\"Unit\":\"7\",\"DepartmentID\":\"2\",\"Title\":\"Unit 7\",\"UnitFile\":\"uploads/unit_materials/1721030945_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721030945_admissionLetter.pdf\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(148, 2, 1, '2024-07-15 08:09:33', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"PHYCODE\",\"Unit\":\"7\",\"Title\":\"Unit 7\",\"UnitFile\":\"uploads/unit_materials/1721030945_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721030945_admissionLetter.pdf\"}', '{\"ID\":\"30\",\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"7\",\"Title\":\"Unit 7\",\"UnitFile\":\"uploads/unit_materials/1721030945_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721030945_admissionLetter.pdf\"}', '[]', 'Updated row in subjectunitdetails'),
(149, 2, 1, '2024-07-15 08:19:37', '{\"SubjectCode\":\"PHYCODE\",\"Title\":\"Winter 2024\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721031577_admissionLetter.pdf\",\"DepartmentID\":\"2\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(150, 2, 1, '2024-07-15 08:23:13', '{\"Title\":\"Winter 2020\",\"SubjectCode\":\"PHYCODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721031577_admissionLetter.pdf\",\"DepartmentID\":\"2\"}', '{\"ID\":\"21\",\"DepartmentID\":\"2\",\"SubjectCode\":\"PHYCODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721031577_admissionLetter.pdf\",\"title\":\"Winter 2024\"}', '[]', 'Updated row in subjectwisegtupapers'),
(151, 2, 1, '2024-07-15 08:26:28', '{\"Title\":\"Winter 2020\",\"SubjectCode\":\"FEECODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721031577_admissionLetter.pdf\",\"DepartmentID\":\"2\"}', '{\"ID\":\"21\",\"DepartmentID\":\"2\",\"SubjectCode\":\"PHYCODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721031577_admissionLetter.pdf\",\"Title\":\"Winter 2020\"}', '[]', 'Updated row in subjectwisegtupapers'),
(152, 2, 1, '2024-07-15 08:26:33', '{\"Title\":\"Winter 2020\",\"SubjectCode\":\"PHYCODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721031577_admissionLetter.pdf\",\"DepartmentID\":\"2\"}', '{\"ID\":\"21\",\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721031577_admissionLetter.pdf\",\"Title\":\"Winter 2020\"}', '[]', 'Updated row in subjectwisegtupapers'),
(153, 2, 1, '2024-07-15 08:26:45', '{\"Title\":\"Summer 2023\",\"SubjectCode\":\"PHYCODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721032005_admissionLetter.pdf\",\"DepartmentID\":\"2\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(154, 2, 1, '2024-07-15 08:28:25', '[]', '[]', '[]', 'Logged Out'),
(155, 2, 1, '2024-07-15 08:28:34', '[]', '[]', '[]', 'Logged In'),
(156, 2, 1, '2024-07-15 08:30:38', '{\"DepartmentID\":\"2\",\"Semester\":null,\"SubjectCode\":null,\"SubjectName\":null,\"Theory\":null,\"Tutorial\":null,\"Practical\":null,\"TotalHours\":null,\"GTUTheory\":null,\"MID\":null,\"ESE\":null,\"PA\":null,\"Total\":null,\"SyllabusFile\":null,\"Assignments\":null,\"Status\":null}', '[]', '[]', 'Inserted new row into subjectdetails'),
(157, 2, 1, '2024-07-15 08:30:49', '[]', '[]', '[]', 'Logged Out'),
(158, 2, 2, '2024-07-15 08:30:53', '[]', '[]', '[]', 'Logged In'),
(159, 2, 2, '2024-07-15 08:31:54', '{\"DepartmentID\":\"2\",\"Semester\":null,\"SubjectCode\":null,\"SubjectName\":null,\"Theory\":null,\"Tutorial\":null,\"Practical\":null,\"TotalHours\":null,\"GTUTheory\":null,\"MID\":null,\"ESE\":null,\"PA\":null,\"Total\":null,\"SyllabusFile\":null,\"Assignments\":null,\"Status\":null}', '[]', '[]', 'Inserted new row into subjectdetails'),
(160, 2, 2, '2024-07-15 08:31:57', '[]', '[]', '[]', 'Logged Out'),
(161, 2, 1, '2024-07-15 08:31:59', '[]', '[]', '[]', 'Logged In'),
(162, 2, 1, '2024-07-15 08:32:11', '[]', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"Test0\",\"SubjectName\":\"Test0\",\"Theory\":\"0\",\"Tutorial\":\"0\",\"Practical\":\"0\",\"TotalHours\":\"0\",\"GTUTheory\":\"0\",\"MID\":\"0\",\"ESE\":\"0\",\"PA\":\"0\",\"Total\":\"0\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721025009_Inheritance.docx\",\"Assignments\":\"uploads/assignments_subjects/1721025009_Inheritance.pdf\",\"Status\":\"active\"}', '[]', 'Deleted row in subjectdetails'),
(163, 2, 1, '2024-07-15 08:32:14', '[]', '{\"DepartmentID\":\"1\",\"Semester\":\"3\",\"SubjectCode\":\"Test9\",\"SubjectName\":\"Test9\",\"Theory\":\"9\",\"Tutorial\":\"9\",\"Practical\":\"9\",\"TotalHours\":\"27\",\"GTUTheory\":\"9\",\"MID\":\"9\",\"ESE\":\"9\",\"PA\":\"9\",\"Total\":\"27\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721025047_sealAllotementLetter.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721025047_Inheritance.docx\",\"Status\":\"active\"}', '[]', 'Deleted row in subjectdetails'),
(164, 2, 1, '2024-07-15 08:34:23', '{\"DepartmentID\":\"2\",\"Semester\":\"1\",\"SubjectCode\":\"FEECODE\",\"SubjectName\":\"FEE\",\"Theory\":\"50\",\"Tutorial\":\"50\",\"Practical\":\"50\",\"TotalHours\":\"150\",\"GTUTheory\":\"50\",\"MID\":\"50\",\"ESE\":\"50\",\"PA\":\"50\",\"Total\":\"150\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721032463_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721032463_Inheritance.docx\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(165, 2, 1, '2024-07-15 08:34:36', '[]', '{\"ID\":\"25\",\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"1\",\"Title\":\"Test1Unit1\",\"UnitFile\":\"uploads/unit_materials/1721027003_Inheritance.docx\",\"AssignmentFile\":\"\"}', '[]', 'Deleted row in subjectunitdetails'),
(166, 2, 1, '2024-07-15 08:34:38', '[]', '{\"ID\":\"26\",\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"899\",\"Title\":\"95\",\"UnitFile\":\"uploads/unit_materials/1721027194_Aug-2022.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721027194_BooASSDASk1.pdf\"}', '[]', 'Deleted row in subjectunitdetails'),
(167, 2, 1, '2024-07-15 08:34:41', '[]', '{\"ID\":\"27\",\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"3\",\"Title\":\"Unit 3\",\"UnitFile\":\"uploads/unit_materials/1721027354_BooASSDASk1.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721027354_Aug-2022.pdf\"}', '[]', 'Deleted row in subjectunitdetails'),
(168, 2, 1, '2024-07-15 08:34:44', '[]', '{\"ID\":\"28\",\"DepartmentID\":\"2\",\"SubjectCode\":\"PHYCODE\",\"Unit\":\"9\",\"Title\":\"Unit 9\",\"UnitFile\":\"uploads/unit_materials/1721028314_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721028314_Inheritance.docx\"}', '[]', 'Deleted row in subjectunitdetails'),
(169, 2, 1, '2024-07-15 08:34:48', '[]', '{\"ID\":\"29\",\"DepartmentID\":\"2\",\"SubjectCode\":\"PHYCODE\",\"Unit\":\"5\",\"Title\":\"5\",\"UnitFile\":\"uploads/unit_materials/1721028470_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721028470_admissionLetter.pdf\"}', '[]', 'Deleted row in subjectunitdetails'),
(170, 2, 1, '2024-07-15 08:34:50', '[]', '{\"ID\":\"30\",\"DepartmentID\":\"2\",\"SubjectCode\":\"PHYCODE\",\"Unit\":\"7\",\"Title\":\"Unit 7\",\"UnitFile\":\"uploads/unit_materials/1721030945_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721030945_admissionLetter.pdf\"}', '[]', 'Deleted row in subjectunitdetails'),
(171, 2, 1, '2024-07-15 08:35:17', '{\"SubjectCode\":\"FEECODE\",\"Unit\":\"1\",\"DepartmentID\":\"2\",\"Title\":\"Unit 1\",\"UnitFile\":\"uploads/unit_materials/1721032517_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721032517_admissionLetter.pdf\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(172, 2, 1, '2024-07-15 08:35:35', '[]', '{\"ID\":\"21\",\"DepartmentID\":\"2\",\"SubjectCode\":\"PHYCODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721031577_admissionLetter.pdf\",\"Title\":\"Winter 2020\"}', '[]', 'Deleted row in subjectwisegtupapers'),
(173, 2, 1, '2024-07-15 08:35:37', '[]', '{\"ID\":\"22\",\"DepartmentID\":\"2\",\"SubjectCode\":\"PHYCODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721032005_admissionLetter.pdf\",\"Title\":\"Summer 2023\"}', '[]', 'Deleted row in subjectwisegtupapers'),
(174, 2, 1, '2024-07-15 08:36:14', '{\"DepartmentID\":\"2\",\"Semester\":\"2\",\"SubjectCode\":\"BEDCODE\",\"SubjectName\":\"BDE\",\"Theory\":\"50\",\"Tutorial\":\"50\",\"Practical\":\"50\",\"TotalHours\":\"150\",\"GTUTheory\":\"50\",\"MID\":\"50\",\"ESE\":\"50\",\"PA\":\"50\",\"Total\":\"150\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721032574_Inheritance.pdf\",\"Assignments\":\"uploads/assignments_subjects/1721032574_Inheritance.pdf\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(175, 2, 1, '2024-07-15 08:36:43', '{\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"2\",\"Title\":\"Unit 2\",\"UnitFile\":\"uploads/unit_materials/1721032603_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721032603_admissionLetter.pdf\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(176, 2, 1, '2024-07-15 08:37:09', '{\"Title\":\"Paper 1\",\"SubjectCode\":\"BEDCODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721032629_Inheritance.pdf\",\"DepartmentID\":\"2\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(177, 2, 1, '2024-07-15 08:37:32', '{\"SubjectCode\":\"BEDCODE\",\"Title\":\"Paper 2\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721032652_sealAllotementLetter.pdf\",\"DepartmentID\":\"2\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(178, 2, 1, '2024-07-15 08:38:23', '{\"DepartmentID\":\"1\",\"Semester\":\"1\",\"SubjectCode\":\"BBECODE\",\"SubjectName\":\"BBE\",\"Theory\":\"50\",\"Tutorial\":\"50\",\"Practical\":\"50\",\"TotalHours\":\"150\",\"GTUTheory\":\"50\",\"MID\":\"50\",\"ESE\":\"50\",\"PA\":\"50\",\"Total\":\"150\",\"SyllabusFile\":\"uploads/syllabus_subjects/1721032703_Inheritance.docx\",\"Assignments\":\"uploads/assignments_subjects/1721032703_Inheritance.pdf\",\"Status\":\"active\"}', '[]', '[]', 'Inserted new row into subjectdetails'),
(179, 2, 1, '2024-07-15 08:38:45', '{\"SubjectCode\":\"FEECODE\",\"Unit\":\"1\",\"DepartmentID\":\"2\",\"Title\":\"Unit 1\",\"UnitFile\":\"uploads/unit_materials/1721032725_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721032725_admissionLetter.pdf\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(180, 2, 1, '2024-07-15 08:38:59', '{\"SubjectCode\":\"FEECODE\",\"Title\":\"Paper 1\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721032739_Inheritance.pdf\",\"DepartmentID\":\"2\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(181, 2, 1, '2024-07-15 08:40:02', '[]', '{\"ID\":\"33\",\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"Unit\":\"1\",\"Title\":\"Unit 1\",\"UnitFile\":\"uploads/unit_materials/1721032725_Inheritance.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721032725_admissionLetter.pdf\"}', '[]', 'Deleted row in subjectunitdetails'),
(182, 2, 1, '2024-07-15 08:40:13', '[]', '{\"ID\":\"25\",\"DepartmentID\":\"2\",\"SubjectCode\":\"FEECODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721032739_Inheritance.pdf\",\"Title\":\"Paper 1\"}', '[]', 'Deleted row in subjectwisegtupapers'),
(183, 2, 1, '2024-07-15 08:41:05', '{\"SubjectCode\":\"BBECODE\",\"Unit\":\"1\",\"DepartmentID\":\"1\",\"Title\":\"Unit 1-\",\"UnitFile\":\"uploads/unit_materials/1721032865_admissionLetter.pdf\",\"AssignmentFile\":\"uploads/assignment_materials/1721032865_Inheritance.pdf\"}', '[]', '[]', 'Inserted new row into subjectunitdetails'),
(184, 2, 1, '2024-07-15 08:41:38', '{\"SubjectCode\":\"BBECODE\",\"Title\":\"Paper 1-\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721032898_Inheritance.pdf\",\"DepartmentID\":\"1\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(185, 2, 1, '2024-07-15 08:42:39', '{\"Title\":\"Paper 2-\",\"SubjectCode\":\"BBECODE\",\"GTUPaperFileName\":\"uploads/gtu_papers/1721032959_Inheritance.pdf\",\"DepartmentID\":\"1\"}', '[]', '[]', 'Inserted new row into subjectwisegtupapers'),
(186, 2, 1, '2024-07-15 08:52:38', '[]', '[]', '[]', 'Logged Out'),
(187, 2, 1, '2024-07-15 08:52:39', '[]', '[]', '[]', 'Logged In');

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
(2, 1, 'FEECODE', 'FEE', 50, 50, 50, 150, 50, 50, 50, 50, 150, 'uploads/syllabus_subjects/1721032463_Inheritance.pdf', 'uploads/assignments_subjects/1721032463_Inheritance.docx', 'active'),
(2, 2, 'BEDCODE', 'BDE', 50, 50, 50, 150, 50, 50, 50, 50, 150, 'uploads/syllabus_subjects/1721032574_Inheritance.pdf', 'uploads/assignments_subjects/1721032574_Inheritance.pdf', 'active'),
(1, 1, 'BBECODE', 'BBE', 50, 50, 50, 150, 50, 50, 50, 50, 150, 'uploads/syllabus_subjects/1721032703_Inheritance.docx', 'uploads/assignments_subjects/1721032703_Inheritance.pdf', 'active');

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
(31, 2, 'FEECODE', 1, 'Unit 1', 'uploads/unit_materials/1721032517_Inheritance.pdf', 'uploads/assignment_materials/1721032517_admissionLetter.pdf'),
(32, 2, 'FEECODE', 2, 'Unit 2', 'uploads/unit_materials/1721032603_Inheritance.pdf', 'uploads/assignment_materials/1721032603_admissionLetter.pdf'),
(34, 1, 'BBECODE', 1, 'Unit 1-', 'uploads/unit_materials/1721032865_admissionLetter.pdf', 'uploads/assignment_materials/1721032865_Inheritance.pdf');

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
(23, 2, 'BEDCODE', 'uploads/gtu_papers/1721032629_Inheritance.pdf', 'Paper 1'),
(24, 2, 'BEDCODE', 'uploads/gtu_papers/1721032652_sealAllotementLetter.pdf', 'Paper 2'),
(26, 1, 'BBECODE', 'uploads/gtu_papers/1721032898_Inheritance.pdf', 'Paper 1-'),
(27, 1, 'BBECODE', 'uploads/gtu_papers/1721032959_Inheritance.pdf', 'Paper 2-');

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
(0, 'DepartmentID : 1 and FacultyID : 1 Logged In', '2024-07-12 15:26:43', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`ID`);

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
  ADD PRIMARY KEY (`DepartmentID`,`FacultyID`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `subjectunitdetails`
--
ALTER TABLE `subjectunitdetails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `subjectwisegtupapers`
--
ALTER TABLE `subjectwisegtupapers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
