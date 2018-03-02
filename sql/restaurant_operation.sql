-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2018-03-02 12:52:34
-- 伺服器版本: 5.7.19
-- PHP 版本： 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `sihalive`
--

-- --------------------------------------------------------

--
-- 資料表結構 `restaurant_operation`
--

DROP TABLE IF EXISTS `restaurant_operation`;
CREATE TABLE IF NOT EXISTS `restaurant_operation` (
  `ro_open_id` int(11) NOT NULL AUTO_INCREMENT,
  `ro_open_day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') DEFAULT NULL,
  `ro_open_time_start` time DEFAULT NULL,
  `ro_open_time_end` time DEFAULT NULL,
  `r_id` int(11) NOT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ro_open_id`),
  UNIQUE KEY `ro_open_day` (`ro_open_day`,`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `restaurant_operation`
--

INSERT INTO `restaurant_operation` (`ro_open_id`, `ro_open_day`, `ro_open_time_start`, `ro_open_time_end`, `r_id`, `add_datetime`) VALUES
(4, 'Monday', '08:00:00', '22:00:00', 1, '2018-03-02 11:51:37'),
(5, 'Tuesday', '08:00:00', '22:00:00', 1, '2018-03-02 11:51:37');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
