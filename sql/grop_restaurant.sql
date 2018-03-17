-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2018 at 11:46 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sihalive`
--

-- --------------------------------------------------------

--
-- Table structure for table `grop_restaurant`
--

CREATE TABLE `grop_restaurant` (
  `g_r_id` int(11) NOT NULL,
  `g_r_name` varchar(200) NOT NULL,
  `g_r_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grop_restaurant`
--

INSERT INTO `grop_restaurant` (`g_r_id`, `g_r_name`, `g_r_img`) VALUES
(1, 'Khmer Food', ''),
(2, 'Chinese Food', ''),
(3, 'Japanese Food ', ''),
(4, 'Thailand Food ', ''),
(5, 'Vietnam food ', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `grop_restaurant`
--
ALTER TABLE `grop_restaurant`
  ADD PRIMARY KEY (`g_r_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `grop_restaurant`
--
ALTER TABLE `grop_restaurant`
  MODIFY `g_r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
