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
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `r_id` int(11) NOT NULL,
  `g_r_id` int(11) NOT NULL COMMENT 'group_restaurant',
  `r_name` varchar(50) NOT NULL,
  `r_name_en` varchar(50) NOT NULL,
  `r_description` varchar(200) DEFAULT NULL,
  `r_description_en` varchar(200) DEFAULT NULL,
  `r_lat` double DEFAULT '0',
  `r_lng` double DEFAULT '0',
  `r_address` varchar(200) DEFAULT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `r_phone` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`r_id`, `g_r_id`, `r_name`, `r_name_en`, `r_description`, `r_description_en`, `r_lat`, `r_lng`, `r_address`, `add_datetime`, `r_phone`) VALUES
(1, 2, 'happy cafe', 'in you heart', '111', '44', 0, 0, '111', '2018-02-16 23:29:47', NULL),
(2, 0, 'pizza company', 'pizza company', 'pizza company pizza company pizza company', 'pizza company pizza company pizza company', 0, 0, 'address', '2018-02-26 20:26:38', NULL),
(3, 0, '白樓餐廳', 'white house', '我是白樓', 'white house', 0, 0, NULL, '2018-02-26 20:27:53', NULL),
(21, 0, '我愛阿利', '阿妹我不喜歡', 'dgswg', 'sdgdsg', 10.6268305, 103.5230393, '＿', '2018-03-07 20:22:23', NULL),
(23, 0, '測試', '測試', 'ddsf', 'sdfds', 10.621853301161671, 103.50737519935296, 'ddd', '2018-03-09 16:12:28', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`r_id`),
  ADD UNIQUE KEY `r_name` (`r_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
