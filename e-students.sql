-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2019 at 08:01 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-students`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosije`
--

CREATE TABLE `dosije` (
  `indeks` int(11) NOT NULL,
  `ime` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `datum_upisa` date DEFAULT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  `mesto_rodjenja` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dosije`
--

INSERT INTO `dosije` (`indeks`, `ime`, `prezime`, `datum_upisa`, `datum_rodjenja`, `mesto_rodjenja`) VALUES
(20121002, 'Milica', 'Milic', '2012-10-02', '1993-03-03', 'Kraljevo'),
(20130023, 'Sanja', 'Terzic', '2013-07-04', '1994-11-09', 'Beograd'),
(20130024, 'Nikola', 'Vukovic', '2013-07-04', '1994-09-17', NULL),
(20130027, 'Milena', 'Stankovic', NULL, NULL, NULL),
(20130140, 'Jelena', 'Smiljkovic', '2013-10-01', '1994-05-21', 'Pancevo'),
(20140021, 'Milos', 'Peric', '2014-07-06', '1995-01-20', 'Beograd'),
(20140022, 'Marijana', 'Savkovic', '2014-07-05', '1995-03-11', 'Kraljevo'),
(20140025, 'Marijana', 'Savkovic', '2014-07-06', '1995-02-04', 'Kraljevo'),
(20140026, 'Zorica', 'Miladinovic', '2014-07-06', '1995-10-08', 'Vranje'),
(20140342, 'Irena', 'Peric', '2014-10-05', '1995-10-10', 'Valjevo'),
(20160049, 'Zorana', 'Smiljkovic', '0000-00-00', '1997-10-22', 'Pancevo');

-- --------------------------------------------------------

--
-- Table structure for table `ispit`
--

CREATE TABLE `ispit` (
  `indeks` int(11) NOT NULL,
  `id_predmeta` int(11) NOT NULL,
  `godina_roka` smallint(6) NOT NULL,
  `oznaka_roka` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `ocena` smallint(6) NOT NULL DEFAULT '5',
  `datum_ispita` date DEFAULT NULL,
  `bodovi` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ispit`
--

INSERT INTO `ispit` (`indeks`, `id_predmeta`, `godina_roka`, `oznaka_roka`, `ocena`, `datum_ispita`, `bodovi`) VALUES
(20130023, 1001, 2015, 'jan', 8, '2015-01-20', 76),
(20130023, 1021, 2015, 'apr', 10, '2015-04-02', 95),
(20130023, 2001, 2015, 'jan', 8, '2015-01-25', 72),
(20130023, 3001, 2015, 'jan', 5, '2015-01-27', 30),
(20130024, 1001, 2015, 'jan', 10, '2015-01-20', 100),
(20130024, 1021, 2015, 'apr', 6, NULL, NULL),
(20130024, 2001, 2015, 'jan', 7, '2015-01-25', 63),
(20130024, 3001, 2015, 'jan', 6, '2015-01-28', 59),
(20130027, 1001, 2015, 'jan', 8, '2015-01-20', 76),
(20130027, 1021, 2015, 'apr', 8, NULL, NULL),
(20130027, 1021, 2015, 'feb', 7, NULL, NULL),
(20130027, 1021, 2015, 'jan', 7, NULL, NULL),
(20130140, 1001, 2017, 'jan', 8, '0000-00-00', 78),
(20130140, 2002, 2017, 'feb', 10, '2017-02-22', 99),
(20140021, 1001, 2015, 'jan', 9, '2015-01-20', 81),
(20140021, 1002, 2015, 'okt', 5, '2015-10-03', 35),
(20140021, 1021, 2015, 'apr', 7, '2015-04-03', 63),
(20140021, 2001, 2015, 'jan', 10, '2015-01-25', 98),
(20140021, 3001, 2015, 'jan', 7, '2015-01-27', 67),
(20140022, 1001, 2015, 'jan', 8, '2015-01-20', 75),
(20140022, 1021, 2015, 'apr', 5, '2015-04-03', NULL),
(20140022, 2001, 2015, 'jan', 9, '2015-01-25', 86),
(20140025, 1001, 2015, 'jan', 6, '2015-01-20', 55),
(20140025, 2001, 2015, 'feb', 6, '2015-01-25', 55),
(20140025, 2001, 2015, 'jan', 5, '2015-01-25', 0),
(20140026, 1001, 2015, 'feb', 7, '2015-01-20', 68),
(20140026, 1001, 2015, 'jan', 5, '2015-01-20', 25),
(20140026, 1021, 2015, 'apr', 8, NULL, NULL),
(20140026, 1021, 2015, 'feb', 7, NULL, NULL),
(20140026, 1021, 2015, 'jan', 7, NULL, NULL),
(20140026, 2001, 2015, 'feb', 7, '0000-00-00', 65),
(20140026, 2001, 2015, 'jan', -7, NULL, NULL),
(20140026, 3001, 2015, 'jan', 6, '0000-00-00', 52);

-- --------------------------------------------------------

--
-- Table structure for table `ispitni_rok`
--

CREATE TABLE `ispitni_rok` (
  `godina_roka` smallint(6) NOT NULL,
  `oznaka_roka` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `naziv` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ispitni_rok`
--

INSERT INTO `ispitni_rok` (`godina_roka`, `oznaka_roka`, `naziv`) VALUES
(2015, 'apr', 'April 2015'),
(2015, 'feb', 'Februar 2015'),
(2015, 'jan', 'Januar 2015'),
(2015, 'jun', 'Jun 2015'),
(2015, 'okt', 'Oktobar 2015'),
(2015, 'sep', 'Septembar 2015'),
(2017, 'feb', 'Februar 2017'),
(2017, 'jan', 'Januar 2017');

-- --------------------------------------------------------

--
-- Table structure for table `logovanje`
--

CREATE TABLE `logovanje` (
  `indeks` int(11) NOT NULL,
  `lozinka` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `logovanje`
--

INSERT INTO `logovanje` (`indeks`, `lozinka`) VALUES
(20121002, 'milica1002'),
(20130023, 'sanja23'),
(20130024, 'nikola24'),
(20130027, 'milena27'),
(20130140, 'jecas123'),
(20140021, 'milos21'),
(20140022, 'marijana22'),
(20140025, 'marijana25'),
(20140026, 'zorica26'),
(20140342, 'irena342'),
(20160049, 'itakecareofzou');

-- --------------------------------------------------------

--
-- Table structure for table `predmet`
--

CREATE TABLE `predmet` (
  `id_predmeta` int(11) NOT NULL,
  `sifra` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `naziv` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `bodovi` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `predmet`
--

INSERT INTO `predmet` (`id_predmeta`, `sifra`, `naziv`, `bodovi`) VALUES
(1001, 'M111', 'Analiza 1', 6),
(1002, 'M112', 'Analiza 2', 6),
(1003, 'M113', 'Analiza 3', 6),
(1021, 'M131', 'Geometrija', 6),
(1101, 'M105', 'Diskretne strukture 1', 6),
(1102, 'M106', 'Diskretne strukture 2', 6),
(2001, 'P101', 'Programiranje 1', 8),
(2002, 'P102', 'Programiranje 2', 8),
(2003, 'P103', 'Objektno orijentisano programiranje', 6),
(2004, 'P104', 'Algoritmi i strukture podataka', 6),
(3001, 'S1', 'Engleski jezik 1', 5),
(3002, 'S2', 'Engleski jezik 2', 5),
(4001, 'R101', 'Uvod u organizaciju racunara', 5),
(4002, 'R102', 'Uvod u Veb i Internet tehnologije', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosije`
--
ALTER TABLE `dosije`
  ADD PRIMARY KEY (`indeks`);

--
-- Indexes for table `ispit`
--
ALTER TABLE `ispit`
  ADD PRIMARY KEY (`indeks`,`id_predmeta`,`godina_roka`,`oznaka_roka`),
  ADD KEY `id_predmeta` (`id_predmeta`),
  ADD KEY `ispit_ibfk_3` (`godina_roka`,`oznaka_roka`);

--
-- Indexes for table `ispitni_rok`
--
ALTER TABLE `ispitni_rok`
  ADD PRIMARY KEY (`godina_roka`,`oznaka_roka`);

--
-- Indexes for table `logovanje`
--
ALTER TABLE `logovanje`
  ADD PRIMARY KEY (`indeks`);

--
-- Indexes for table `predmet`
--
ALTER TABLE `predmet`
  ADD PRIMARY KEY (`id_predmeta`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ispit`
--
ALTER TABLE `ispit`
  ADD CONSTRAINT `ispit_ibfk_1` FOREIGN KEY (`indeks`) REFERENCES `dosije` (`indeks`),
  ADD CONSTRAINT `ispit_ibfk_2` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id_predmeta`),
  ADD CONSTRAINT `ispit_ibfk_3` FOREIGN KEY (`godina_roka`,`oznaka_roka`) REFERENCES `ispitni_rok` (`godina_roka`, `oznaka_roka`);

--
-- Constraints for table `logovanje`
--
ALTER TABLE `logovanje`
  ADD CONSTRAINT `logovanje_ibfk_1` FOREIGN KEY (`indeks`) REFERENCES `dosije` (`indeks`);
COMMIT;

