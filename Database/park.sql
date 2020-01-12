-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 12, 2020 at 07:21 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `park`
--

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `Pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `Amount` varchar(10) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Tran_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pay_id`),
  KEY `User_id` (`User_id`),
  KEY `Tran_id` (`Tran_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Pay_id`, `Amount`, `Status`, `Tran_id`, `User_id`) VALUES
(2, '100', 'Approved', 5, 1),
(3, '100', 'Approved', 2, 2),
(4, '100', 'Approved', 5, 1),
(5, '100', 'Approved', 6, 1),
(6, '100', 'Approved', 7, 2),
(7, '20', 'Approved', 6, 1),
(8, '20', 'Approved', 8, 2),
(9, '20', 'Approved', 9, 3),
(10, '20', 'Approved', 6, 1),
(11, '20', 'Approved', 10, 1),
(12, '20', 'Approved', 11, 6);

-- --------------------------------------------------------

--
-- Table structure for table `transac`
--

DROP TABLE IF EXISTS `transac`;
CREATE TABLE IF NOT EXISTS `transac` (
  `Tran_id` int(11) NOT NULL AUTO_INCREMENT,
  `Time_in` datetime DEFAULT NULL,
  `Time_out` datetime DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tran_id`),
  KEY `User_id` (`User_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transac`
--

INSERT INTO `transac` (`Tran_id`, `Time_in`, `Time_out`, `User_id`) VALUES
(1, '2019-11-21 19:39:00', '2019-11-21 19:39:39', 1),
(2, '2019-11-21 19:46:45', '2019-11-21 19:46:49', 2),
(3, '2019-11-22 11:03:24', '2019-11-22 11:27:55', 4),
(4, '2019-11-22 11:10:05', '2019-11-22 11:28:35', 1),
(5, '2019-11-22 15:31:11', '2019-11-22 15:32:30', 1),
(6, '2019-12-15 17:56:45', '2019-12-15 17:57:09', 1),
(7, '2019-12-20 16:00:00', '2019-12-20 14:41:00', 2),
(8, '2019-12-23 17:26:46', '2019-12-23 17:27:18', 2),
(9, '2019-12-23 20:36:17', '2019-12-23 20:36:24', 3),
(10, '2019-12-24 10:05:59', '2019-12-24 10:06:11', 1),
(11, '2019-12-24 14:52:31', '2019-12-24 14:52:48', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(60) NOT NULL,
  `Password` text NOT NULL,
  `Licence_plate` varchar(20) NOT NULL,
  `Licence_add` varchar(30) NOT NULL,
  `F_name` varchar(50) NOT NULL,
  `L_name` varchar(50) NOT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_id`, `Username`, `Password`, `Licence_plate`, `Licence_add`, `F_name`, `L_name`) VALUES
(1, 'sakdinan01', '48cff193f93cf3734e669a157e8353fc', 'กก9999', 'กรุงเทพ', 'ศักดินันท์', 'คำนาง'),
(2, 'sakdinan02', 'dca3e4c3c52348c3ca2cbf6cfd58a20c', 'sakdinan02', 'sakdinan02', 'sakdinan02', 'sakdinan02'),
(3, 'sakdinan03', '11981d7cc495265eeeeb354e0f98aed9', 'sakdinan03', 'sakdinan03', 'sakdinan03', 'sakdinan03'),
(4, 'krit', 'e10adc3949ba59abbe56e057f20f883e', '234', 'bankok', 'krit', 'krit'),
(5, 'test01', '0e698a8ffc1a0af622c7b4db3cb750cc', 'test01', 'test01', 'test01', 'test01'),
(6, 'noo', '32651a703ec04fc83ad9ae7be5983237', '1234', 'bkk', 'noo', 'noo'),
(7, 'test11', 'f696282aa4cd4f614aa995190cf442fe', 'test11', 'test11', 'test11', 'test11');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
