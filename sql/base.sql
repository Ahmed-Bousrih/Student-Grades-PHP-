SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- table admin
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- creation utilisateur admin
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2022-01-01 10:30:57');

-- mot de passe not hashed Test@123

--
-- table des classe
--

CREATE TABLE `tblclasses` (
  `id` int(11) NOT NULL,
  `ClassName` varchar(80) DEFAULT NULL,
  `ClassNameNumeric` int(4) DEFAULT NULL,
  `Section` varchar(5) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- les classes avec dates aleatoires
--

INSERT INTO `tblclasses` (`id`, `ClassName`, `ClassNameNumeric`, `Section`, `CreationDate`, `UpdationDate`) VALUES
(1, 'First', 1, 'A', '2022-01-01 10:30:57', '2022-01-01 10:30:57'),
(2, 'First', 2, 'B', '2022-01-01 10:30:57', '2022-01-01 10:30:57'),
(3, 'Second', 3, 'A', '2022-01-01 10:30:57', '2022-01-01 10:30:57'),
(4, 'Second', 4, 'B', '2022-01-01 10:30:57', '2022-01-01 10:30:57'),
(5, 'Third', 5, 'A', '2022-01-01 10:30:57', '2022-01-01 10:30:57'),
(6, 'Third', 6, 'B', '2022-01-01 10:30:57', '2022-01-01 10:30:57'),
(7, 'Fourth', 7, 'A', '2022-01-01 10:30:57', '2022-01-01 10:30:57'),
(8, 'Fifth', 8, 'A', '2022-01-01 15:17:32', '2022-01-01 10:30:57');


--
-- Table de notices
--

CREATE TABLE `tblnotice` (
  `id` int(11) NOT NULL,
  `noticeTitle` varchar(255) DEFAULT NULL,
  `noticeDetails` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- des notices juste pour le test 
--

INSERT INTO `tblnotice` (`id`, `noticeTitle`, `noticeDetails`, `postingDate`) VALUES
(1, 'Notice regarding result Delearation', 'test', '2022-01-01 14:34:58'),
(2, 'Test Notice', 'test ', '2022-01-01 14:48:32');

--
-- Table students
--

CREATE TABLE `tblstudents` (
  `StudentId` int(11) NOT NULL,
  `StudentName` varchar(100) DEFAULT NULL,
  `RollId` varchar(100) DEFAULT NULL,
  `StudentEmail` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `BirthDate` varchar(100) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- etudiants de test
--

INSERT INTO `tblstudents` (`StudentId`, `StudentName`, `RollId`, `StudentEmail`, `Gender`, `BirthDate`, `ClassId`, `RegDate`, `UpdationDate`, `Status`) VALUES
(1, 'Lionel Messi', '46456', 'messi@gmail.com', 'Male', '1995-03-03', 1, '2022-01-01 10:30:57', NULL, 1),
(2, 'Cristiano Ronaldo', '10861', 'ronaldo@gmail.com', 'Male', '1995-02-02', 1, '2022-01-01 10:30:57', NULL, 2),
(3, 'Ons Jabeur', '2626', 'ons@gmail.com', 'Female', '2014-08-06', 2, '2022-01-01 10:30:57', NULL, 2),
(4, 'Serena Williams', '990', 'Serena@gmail.com', 'Female', '2001-02-03', 3, '2022-01-01 10:30:57', NULL, 3),
(5, 'Neymar', '122', 'neymar@gmail.com', 'Male', '2002-02-03', 5, '2022-01-01 10:30:57', NULL, 4),
(6, 'Ma l9itech esm', '12345', 'noname@gmail.com', 'Male', '2007-01-12', 4, '2022-01-01 15:19:40', NULL, 5);


--
-- Table subjects
--

CREATE TABLE `tblsubjects` (
  `id` int(11) NOT NULL,
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(100) DEFAULT NULL,
  `Creationdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- les matieres pour tester
--

INSERT INTO `tblsubjects` (`id`, `SubjectName`, `SubjectCode`, `Creationdate`, `UpdationDate`) VALUES
(1, 'Maths', 'MTH', '2022-01-01 10:30:57', NULL),
(2, 'English', 'ENG', '2022-01-01 10:30:57', NULL),
(3, 'Science', 'SC', '2022-01-01 10:30:57', NULL),
(4, 'Music', 'MS', '2022-01-01 10:30:57', NULL),
(5, 'Physics', 'PH', '2022-01-01 10:30:57', NULL),
(6, 'Chemistry', 'CH', '2022-01-01 10:30:57', NULL);

--
-- Table combinaisons : relation entre subjects et classes
--

CREATE TABLE `tblsubjectcombination` (
  `id` int(11) NOT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `Updationdate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- exemples pour combinaisons
--

INSERT INTO `tblsubjectcombination` (`id`, `ClassId`, `SubjectId`, `status`, `CreationDate`, `Updationdate`) VALUES
(1, 1, 1, 1, '2022-01-01 10:30:57', NULL),
(2, 1, 2, 1, '2022-01-01 10:30:57', NULL),

(3, 2, 1, 1, '2022-01-01 10:30:57', NULL),
(4, 2, 2, 1, '2022-01-01 10:30:57', NULL),

(5, 3, 3, 1, '2022-01-01 10:30:57', NULL),
(6, 3, 4, 1, '2022-01-01 10:30:57', NULL),

(7, 4, 3, 1, '2022-01-01 10:30:57', NULL),
(8, 4, 4, 1, '2022-01-01 10:30:57', NULL),

(9, 5, 6, 1, '2022-01-01 10:30:57', NULL),
(10, 5, 1, 1, '2022-01-01 10:30:57', NULL),

(11, 6, 6, 1, '2022-01-01 10:30:57', NULL),
(12, 6, 1, 1, '2022-01-01 10:30:57', NULL),

(13, 7, 5, 1, '2022-01-01 10:30:57', NULL),
(14, 7, 3, 1, '2022-01-01 10:30:57', NULL),

(15, 8, 2, 1, '2022-01-01 10:30:57', NULL),
(16, 8, 6, 1, '2022-01-01 10:30:57', NULL);

--
-- Table resultats
--

CREATE TABLE `tblresult` (
  `id` int(11) NOT NULL,
  `StudentId` int(11) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- resultats de test
--

INSERT INTO `tblresult` (`id`, `StudentId`, `ClassId`, `SubjectId`, `marks`, `PostingDate`, `UpdationDate`) VALUES
(1, 1, 1, 1, 15, '2022-01-01 10:30:57', NULL),
(2, 1, 1, 2, 12, '2022-01-01 10:30:57', NULL),

(3, 2, 1, 1, 10, '2022-01-01 10:30:57', NULL),
(4, 2, 1, 2, 7, '2022-01-01 10:30:57', NULL),

(5, 3, 2, 1, 14, '2022-01-01 10:30:57', NULL),
(6, 3, 2, 2, 14, '2022-01-01 10:30:57', NULL),

(7, 4, 3, 3, 2, '2022-01-01 10:30:57', NULL),
(8, 4, 3, 4, 9, '2022-01-01 10:30:57', NULL),

(9, 5, 5, 6, 10, '2022-01-01 10:30:57', NULL),
(10, 5, 5, 1, 12, '2022-01-01 10:30:57', NULL),

(11, 6, 4, 3, 19, '2022-01-01 15:20:18', NULL),
(12, 6, 4, 4, 20, '2022-01-01 15:20:18', NULL);


--
-- definitions des cles primaires
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblclasses`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblnotice`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblresult`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`StudentId`);


ALTER TABLE `tblsubjectcombination`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tblsubjects`
  ADD PRIMARY KEY (`id`);

--
-- Creation des incrementations automatiques
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `tblclasses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE `tblnotice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `tblresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;


ALTER TABLE `tblstudents`
  MODIFY `StudentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `tblsubjectcombination`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;


ALTER TABLE `tblsubjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

