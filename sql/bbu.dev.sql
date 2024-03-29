-- phpMyAdmin SQL Dump
-- version 4.7.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 02, 2018 at 12:21 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bbu_db`
--
CREATE DATABASE IF NOT EXISTS `bbu_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bbu_db`;

-- --------------------------------------------------------

--
-- Table structure for table `client_liked`
--

CREATE TABLE `client_liked` (
  `like_id` int(11) NOT NULL,
  `liked_pid` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_client`
--

CREATE TABLE `tbl_client` (
  `client_id` int(11) NOT NULL,
  `client_fname` varchar(200) NOT NULL,
  `client_lname` varchar(200) NOT NULL,
  `client_sex` varchar(250) NOT NULL,
  `client_address` text NOT NULL,
  `client_img` text NOT NULL,
  `client_created_date` varchar(222) NOT NULL,
  `client_phone` varchar(222) NOT NULL,
  `client_email` varchar(222) NOT NULL,
  `client_password` varchar(200) NOT NULL,
  `client_note` text NOT NULL,
  `client_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `cont_id` int(11) NOT NULL,
  `cont_name` varchar(250) NOT NULL,
  `cont_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dealer`
--

CREATE TABLE `tbl_dealer` (
  `dealer_id` int(11) NOT NULL,
  `dealer_fname` varchar(200) NOT NULL,
  `dealer_lname` varchar(200) NOT NULL,
  `dealer_sex` varchar(50) NOT NULL,
  `dealer_add` text NOT NULL,
  `phone` varchar(100) NOT NULL,
  `dealer_email` varchar(111) NOT NULL,
  `password` varchar(100) NOT NULL,
  `img` text NOT NULL,
  `dearler_note` text NOT NULL,
  `dealer_join_date` varchar(100) NOT NULL,
  `dealer_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_dealer`
--

INSERT INTO `tbl_dealer` (`dealer_id`, `dealer_fname`, `dealer_lname`, `dealer_sex`, `dealer_add`, `phone`, `dealer_email`, `password`, `img`, `dearler_note`, `dealer_join_date`, `dealer_remark`) VALUES
(27, 'phearun', 'um', 'Male', 'Sihanoukville , Cambodia', '016504488', 'phearunum@gmail.com', '123', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dealer_account`
--

CREATE TABLE `tbl_dealer_account` (
  `acc_id` int(11) NOT NULL,
  `acc_username` varchar(200) NOT NULL,
  `acc_password` varchar(250) NOT NULL,
  `acc_active` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `dealer_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_dealer_account`
--

INSERT INTO `tbl_dealer_account` (`acc_id`, `acc_username`, `acc_password`, `acc_active`, `dealer_id`, `dealer_code`) VALUES
(1, '123', '123', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dealer_address`
--

CREATE TABLE `tbl_dealer_address` (
  `add_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `add_country` int(11) NOT NULL,
  `add_provine` int(11) NOT NULL,
  `add_district` varchar(222) NOT NULL,
  `add_commune` varchar(222) NOT NULL,
  `add_village` varchar(222) NOT NULL,
  `add_note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_golden_store`
--

CREATE TABLE `tbl_golden_store` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `logo` text NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `p_id` int(11) NOT NULL,
  `pcat_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `p_date` varchar(100) NOT NULL,
  `p_name` varchar(200) NOT NULL,
  `p_price` double NOT NULL,
  `p_description` text NOT NULL,
  `p_view` int(11) NOT NULL,
  `img1` text NOT NULL,
  `img2` text NOT NULL,
  `img3` text NOT NULL,
  `img4` text NOT NULL,
  `img5` text NOT NULL,
  `img6` text NOT NULL,
  `img7` text NOT NULL,
  `img8` text NOT NULL,
  `p_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category`
--

CREATE TABLE `tbl_product_category` (
  `pcat_id` int(11) NOT NULL,
  `pcat_name` varchar(250) NOT NULL,
  `pcat_note` text NOT NULL,
  `pcat_remark` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_update_stock`
--

CREATE TABLE `tbl_product_update_stock` (
  `pupdate_id` int(11) NOT NULL,
  `pupdate_date` varchar(250) NOT NULL,
  `pupdate_proid` varchar(250) NOT NULL,
  `p_qty` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_province`
--

CREATE TABLE `tbl_province` (
  `prov_id` int(11) NOT NULL,
  `prov_name` varchar(250) NOT NULL,
  `prov_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pro_img`
--

CREATE TABLE `tbl_pro_img` (
  `imgID` int(11) NOT NULL,
  `imgName` text NOT NULL,
  `imgUrl` text NOT NULL,
  `p_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_pro_img`
--

INSERT INTO `tbl_pro_img` (`imgID`, `imgName`, `imgUrl`, `p_id`) VALUES
(53, 'hello', 'g', 0),
(54, 'hello', 'c', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_detial`
--

CREATE TABLE `tbl_sale_detial` (
  `id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `price` double NOT NULL,
  `discount` double NOT NULL,
  `AMT` double NOT NULL,
  `inv_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sale_inv`
--

CREATE TABLE `tbl_sale_inv` (
  `inv_id` int(11) NOT NULL,
  `inv_date` varchar(250) NOT NULL,
  `inv_client_id` int(11) NOT NULL,
  `inv_payTotal` double NOT NULL,
  `inv_payDiscount` double NOT NULL,
  `inv_AMT` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock_dealer`
--

CREATE TABLE `tbl_stock_dealer` (
  `stock_id` int(11) NOT NULL,
  `stock_name` varchar(250) NOT NULL,
  `stock_created` varchar(200) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `stock_note` text NOT NULL,
  `stock_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store`
--

CREATE TABLE `tbl_store` (
  `store_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `store_name` varchar(250) NOT NULL,
  `banner` text NOT NULL,
  `store_number` varchar(200) NOT NULL,
  `store_note` text NOT NULL,
  `store_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_store`
--

INSERT INTO `tbl_store` (`store_id`, `dealer_id`, `store_name`, `banner`, `store_number`, `store_note`, `store_remark`) VALUES
(17, 17, 'Phearun Phone Shop', '27_12_2017_04_23_42_17_1.jpg', '001', '            hELLO             ', 1),
(18, 18, 'Dara Phone Shop', '29_12_2017_10_31_48_18_HTB1NZ2ri8fH8KJjy1Xbq6zLdXXaB.jpg', '1002', '   Phone Shop ', 1),
(19, 19, 'Dek kok', '02_01_2018_12_14_59_19_backgrounds-for-gt-kali-linux-wallpaper-linux-wallpaper-1366x768-changer-1920x1080-wallpapers-for-windows-7-free-download-pack-2013-1920x1200-tux.jpg', '1111', '  ', 1),
(20, 20, '', '', '', '', 0),
(21, 21, '', '', '', '', 0),
(22, 25, '', '', '', '', 0),
(23, 26, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store_category`
--

CREATE TABLE `tbl_store_category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(250) NOT NULL,
  `kh_cat_name` varchar(250) NOT NULL,
  `icon` varchar(222) NOT NULL,
  `cat_note` text NOT NULL,
  `cat_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_store_category`
--

INSERT INTO `tbl_store_category` (`cat_id`, `cat_name`, `kh_cat_name`, `icon`, `cat_note`, `cat_remark`) VALUES
(1, 'Fashion ', 'សំលៀកបំពាក់', 'shopping-icon.png', 'Women’s Clothing', 0),
(2, ' Cars and Vehicles', 'ឡាន និង​ គ្រឿងបន្លះ', 'car-icon.png', 'Men’s Clothing', 0),
(3, 'Phones & Accessories', 'ទូរស័ព្ទ', 'Mobile-Smartphone-icon.png', '', 0),
(4, 'Health & Beauty, Hair', 'គ្រឿងសំអាង', 'Makeup-icon.png', 'Health & Beauty, Hair', 0),
(5, 'Bags & Shoes', 'កាតាប​និងស្បែកជើង', '809246_sports_512x512.png', 'Bags & Shoes', 0),
(6, 'Consumer Electronics', 'គ្រឿងអេឡិចត្រូនិច', 'microwave_oven.png', 'Consumer Electronics', 0),
(7, 'Toys, Kids & Baby', 'សំភារះក្មេង', 'Baby-boy-icon.png', 'Toys, Kids & Baby', 0),
(8, 'Jewelry & Watches', 'នាឡិការដៃ', 'Desk-clock-icon.png', 'Jewelry & Watches', 0),
(10, 'Computer & Office', 'កុំព្យូទ័រ', 'HellLess-Computer-icon.png', 'Computer & Office', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_category`
--

CREATE TABLE `tbl_sub_category` (
  `sub_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sub_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sub_category`
--

INSERT INTO `tbl_sub_category` (`sub_id`, `cat_id`, `sub_name`) VALUES
(1, 1, 'អាវយឺត T-Shirt '),
(2, 1, 'អាវក្រៅ Jacket '),
(3, 1, 'រ៉ូប​ Dress '),
(4, 1, 'អាវក្រៅ Jacket '),
(5, 1, 'សំពត់ Skirt '),
(6, 1, 'ឈុតគូស្នេហ៍ Lover'),
(7, 1, 'ខូវប៊យ Jeans '),
(8, 1, 'ខោជើងខ្លី Shorts '),
(9, 1, 'ខោអាវធ្វើការ Working '),
(10, 1, 'ខោអាវក្នុង​ Bra & Panties '),
(11, 2, 'Cars for Sale'),
(12, 2, 'Car Parts & Accessories'),
(13, 2, 'Motorcycles For Sale'),
(14, 2, 'Motor Parts & Accessories'),
(15, 3, 'Apple'),
(16, 3, 'Samsung'),
(17, 3, 'Samsung'),
(18, 3, 'Huawei'),
(19, 3, 'Oppo'),
(20, 3, 'Oppo'),
(21, 3, 'HTC'),
(22, 3, 'Camfone');

-- --------------------------------------------------------

--
-- Table structure for table `tb_floor`
--

CREATE TABLE `tb_floor` (
  `floor_id` int(11) NOT NULL,
  `floor_number` varchar(250) NOT NULL,
  `floor_name` varchar(200) NOT NULL,
  `floor_note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_floor`
--

INSERT INTO `tb_floor` (`floor_id`, `floor_number`, `floor_name`, `floor_note`) VALUES
(1, '001', ' Floor 1', ''),
(2, '002', 'Floor 2', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_liked`
--
ALTER TABLE `client_liked`
  ADD PRIMARY KEY (`like_id`),
  ADD KEY `liked_pid` (`liked_pid`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `tbl_client`
--
ALTER TABLE `tbl_client`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`cont_id`);

--
-- Indexes for table `tbl_dealer`
--
ALTER TABLE `tbl_dealer`
  ADD PRIMARY KEY (`dealer_id`);

--
-- Indexes for table `tbl_dealer_account`
--
ALTER TABLE `tbl_dealer_account`
  ADD PRIMARY KEY (`acc_id`),
  ADD KEY `dealer_id` (`dealer_id`);

--
-- Indexes for table `tbl_dealer_address`
--
ALTER TABLE `tbl_dealer_address`
  ADD PRIMARY KEY (`add_id`),
  ADD KEY `dealer_id` (`dealer_id`),
  ADD KEY `add_country` (`add_country`),
  ADD KEY `add_provine` (`add_provine`);

--
-- Indexes for table `tbl_golden_store`
--
ALTER TABLE `tbl_golden_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `pcat_id` (`pcat_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  ADD PRIMARY KEY (`pcat_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Indexes for table `tbl_product_update_stock`
--
ALTER TABLE `tbl_product_update_stock`
  ADD PRIMARY KEY (`pupdate_id`);

--
-- Indexes for table `tbl_province`
--
ALTER TABLE `tbl_province`
  ADD PRIMARY KEY (`prov_id`);

--
-- Indexes for table `tbl_pro_img`
--
ALTER TABLE `tbl_pro_img`
  ADD PRIMARY KEY (`imgID`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `tbl_sale_detial`
--
ALTER TABLE `tbl_sale_detial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inv_id` (`inv_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `tbl_sale_inv`
--
ALTER TABLE `tbl_sale_inv`
  ADD PRIMARY KEY (`inv_id`),
  ADD KEY `inv_client_id` (`inv_client_id`);

--
-- Indexes for table `tbl_stock_dealer`
--
ALTER TABLE `tbl_stock_dealer`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `dealer_id` (`dealer_id`);

--
-- Indexes for table `tbl_store`
--
ALTER TABLE `tbl_store`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `dealer_id` (`dealer_id`);

--
-- Indexes for table `tbl_store_category`
--
ALTER TABLE `tbl_store_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  ADD PRIMARY KEY (`sub_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `tb_floor`
--
ALTER TABLE `tb_floor`
  ADD PRIMARY KEY (`floor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_liked`
--
ALTER TABLE `client_liked`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_client`
--
ALTER TABLE `tbl_client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `cont_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_dealer`
--
ALTER TABLE `tbl_dealer`
  MODIFY `dealer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_dealer_account`
--
ALTER TABLE `tbl_dealer_account`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_dealer_address`
--
ALTER TABLE `tbl_dealer_address`
  MODIFY `add_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_golden_store`
--
ALTER TABLE `tbl_golden_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product_category`
--
ALTER TABLE `tbl_product_category`
  MODIFY `pcat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product_update_stock`
--
ALTER TABLE `tbl_product_update_stock`
  MODIFY `pupdate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_province`
--
ALTER TABLE `tbl_province`
  MODIFY `prov_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pro_img`
--
ALTER TABLE `tbl_pro_img`
  MODIFY `imgID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `tbl_sale_detial`
--
ALTER TABLE `tbl_sale_detial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sale_inv`
--
ALTER TABLE `tbl_sale_inv`
  MODIFY `inv_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_stock_dealer`
--
ALTER TABLE `tbl_stock_dealer`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_store`
--
ALTER TABLE `tbl_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_store_category`
--
ALTER TABLE `tbl_store_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tb_floor`
--
ALTER TABLE `tb_floor`
  MODIFY `floor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_liked`
--
ALTER TABLE `client_liked`
  ADD CONSTRAINT `client_liked_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `tbl_client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_liked_ibfk_2` FOREIGN KEY (`liked_pid`) REFERENCES `tbl_product` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_dealer_address`
--
ALTER TABLE `tbl_dealer_address`
  ADD CONSTRAINT `tbl_dealer_address_ibfk_3` FOREIGN KEY (`add_provine`) REFERENCES `tbl_province` (`prov_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`pcat_id`) REFERENCES `tbl_sub_category` (`sub_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `tbl_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_sale_detial`
--
ALTER TABLE `tbl_sale_detial`
  ADD CONSTRAINT `tbl_sale_detial_ibfk_1` FOREIGN KEY (`inv_id`) REFERENCES `tbl_sale_inv` (`inv_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_sale_detial_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `tbl_product` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_sale_inv`
--
ALTER TABLE `tbl_sale_inv`
  ADD CONSTRAINT `tbl_sale_inv_ibfk_1` FOREIGN KEY (`inv_client_id`) REFERENCES `tbl_client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  ADD CONSTRAINT `tbl_sub_category_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `tbl_store_category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `golden`
--
CREATE DATABASE IF NOT EXISTS `golden` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `golden`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `a_id` int(11) NOT NULL,
  `a_fname` varchar(200) NOT NULL,
  `a_lname` varchar(200) NOT NULL,
  `a_sex` varchar(50) NOT NULL,
  `a_dob` varchar(100) NOT NULL,
  `photo` text NOT NULL,
  `addess` varchar(250) NOT NULL,
  `about` varchar(250) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `date_created` varchar(200) NOT NULL,
  `a_emial` varchar(100) NOT NULL,
  `a_pwd` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dealer`
--

CREATE TABLE `tbl_dealer` (
  `dealer_id` int(11) NOT NULL,
  `dealer_fname` varchar(200) NOT NULL,
  `dealer_lname` varchar(200) NOT NULL,
  `dealer_sex` varchar(50) NOT NULL,
  `dealer_add` text NOT NULL,
  `phone` varchar(100) NOT NULL,
  `dealer_email` varchar(111) NOT NULL,
  `password` varchar(100) NOT NULL,
  `img` text NOT NULL,
  `dearler_note` text NOT NULL,
  `dealer_join_date` varchar(100) NOT NULL,
  `dealer_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_dealer`
--

INSERT INTO `tbl_dealer` (`dealer_id`, `dealer_fname`, `dealer_lname`, `dealer_sex`, `dealer_add`, `phone`, `dealer_email`, `password`, `img`, `dearler_note`, `dealer_join_date`, `dealer_remark`) VALUES
(17, 'UM', 'Phearun', 'Male', 'Sihanoukville , Cambodia', '123', 'phearunum.dev@gmail.com', '123', '17_profile_c207cd_c6d386c1e2994958a481e9cc1e7559c7.jpg', '123', '', 0),
(18, 'Yary', 'Muth', 'Female', 'Sihanoukville , Cambodia', '1234', 'phearun@gmail.com', '1234', '18_profile_12.jpg', '', '', 0),
(30, 'admin', 'admin', 'Male', 'Sihanoukville , Cambodia', '1234', 'admin@gmail.com', '123', '30_profile_22528465_2403049123253041_8909797791269604239_n.jpg', 'www', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dealer_account`
--

CREATE TABLE `tbl_dealer_account` (
  `acc_id` int(11) NOT NULL,
  `acc_username` varchar(200) NOT NULL,
  `acc_password` varchar(250) NOT NULL,
  `acc_active` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `dealer_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `p_id` int(11) NOT NULL,
  `pcat_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `p_date` varchar(100) NOT NULL,
  `p_name` varchar(200) NOT NULL,
  `p_price` double NOT NULL,
  `p_description` text NOT NULL,
  `p_view` int(11) NOT NULL,
  `img1` text NOT NULL,
  `img2` text NOT NULL,
  `img3` text NOT NULL,
  `img4` text NOT NULL,
  `img5` text NOT NULL,
  `img6` text NOT NULL,
  `img7` text NOT NULL,
  `img8` text NOT NULL,
  `p_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`p_id`, `pcat_id`, `store_id`, `p_date`, `p_name`, `p_price`, `p_description`, `p_view`, `img1`, `img2`, `img3`, `img4`, `img5`, `img6`, `img7`, `img8`, `p_remark`) VALUES
(126, 6, 17, '', 'អាវឈុតគូរស្នេហ៍ ម៉ូតថ្មី', 18, 'មកដល់ហើយផលិតផលថៃ\r\nស្អាតដូចក្នុងរូប \r\nធានាគុណភាពនឹងតម្លៃ \r\nរាល់ការកម្ម៉ង់មិនអាចលុបវិញបានទេ\r\n016 50 44 88', 10, '17_26169346_1985831805009050_1255370609335351305_n.jpg', '17_26113897_1985831835009047_7451878709927342192_n.jpg', '17_26165673_1985831808342383_1839841290447670217_n.jpg', '', '', '', '', '', 1),
(138, 15, 18, '', 'Iphone 7+ 256g', 680, 'Full accessories \r\nអន់សំបកតិច\r\nCan talk', 21, '18_s320171227-8-1g5zwz920171227-8-1h85jfj.jpg', '18_s320171227-8-16ytsjt20171227-8-1op4s3p.jpg', '18_s320171227-8-c26o9z20171227-8-352nl0.jpg', '18_s320171227-8-r4a93k20171227-8-1jvgs7w.jpg', '', '', '', '', 1),
(139, 1, 17, '03/01/2018', 'ខោអាវទើបមកដល់ពីប្រទេសថៃ', 12, 'good price can order ban ', 25, '17_Screen Shot 2018-02-28 at 11.13.39 AM.png', '17_Screen Shot 2018-02-27 at 12.04.08 PM.png', '', '', '', '', '', '', 1),
(140, 16, 17, '03/01/2018', 'លក់ iPhone 6plus 128G ពណ៌ស កំពុងតែប្រើ Need to sell ', 300, 'good all inbox', 0, '17_Screen Shot 2018-02-27 at 11.56.34 AM.png', '17_Screen Shot 2018-02-27 at 12.04.08 PM.png', '', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_slide_ads`
--

CREATE TABLE `tbl_slide_ads` (
  `ads_id` int(11) NOT NULL,
  `ads_name` varchar(250) NOT NULL,
  `ads_photo` text NOT NULL,
  `ads_date` varchar(250) NOT NULL,
  `ads_level` int(11) NOT NULL,
  `ads_url` text NOT NULL,
  `ads_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store`
--

CREATE TABLE `tbl_store` (
  `store_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `store_name` varchar(250) NOT NULL,
  `banner` text NOT NULL,
  `store_number` varchar(200) NOT NULL,
  `store_note` text NOT NULL,
  `store_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_store`
--

INSERT INTO `tbl_store` (`store_id`, `dealer_id`, `store_name`, `banner`, `store_number`, `store_note`, `store_remark`) VALUES
(17, 17, 'Phearun Phone Shop', '27_12_2017_04_23_42_17_1.jpg', '001', '            hELLO             ', 1),
(18, 18, 'Dara Phone Shop', '03_01_2018_09_31_37_18_computer_shop_banner_by_w3soul-d5pdkj3.jpg', '1002', '    Phone Shop  ', 1),
(20, 30, 'Admin', '24_02_2018_18_19_31_30_Screen Shot 2018-02-23 at 5.47.54 PM.png', '10202', ' sell all', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store_category`
--

CREATE TABLE `tbl_store_category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(250) NOT NULL,
  `kh_cat_name` varchar(250) NOT NULL,
  `icon` varchar(222) NOT NULL,
  `cat_note` text NOT NULL,
  `cat_remark` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_store_category`
--

INSERT INTO `tbl_store_category` (`cat_id`, `cat_name`, `kh_cat_name`, `icon`, `cat_note`, `cat_remark`) VALUES
(1, 'Fashion ', 'សំលៀកបំពាក់', 'shopping-icon.png', 'Women’s Clothing', 0),
(2, ' Cars and Vehicles', 'ឡាន និង​ គ្រឿងបន្លះ', 'car-icon.png', 'Men’s Clothing', 0),
(3, 'Phones & Accessories', 'ទូរស័ព្ទ', 'Mobile-Smartphone-icon.png', '', 0),
(4, 'Health & Beauty, Hair', 'គ្រឿងសំអាង', 'Makeup-icon.png', 'Health & Beauty, Hair', 0),
(5, 'Bags & Shoes', 'កាតាប​និងស្បែកជើង', '809246_sports_512x512.png', 'Bags & Shoes', 0),
(6, 'Consumer Electronics', 'គ្រឿងអេឡិចត្រូនិច', 'microwave_oven.png', 'Consumer Electronics', 0),
(7, 'Toys, Kids & Baby', 'សំភារះក្មេង', 'Baby-boy-icon.png', 'Toys, Kids & Baby', 0),
(8, 'Jewelry & Watches', 'នាឡិការដៃ', 'Desk-clock-icon.png', 'Jewelry & Watches', 0),
(10, 'Computer & Office', 'កុំព្យូទ័រ', 'HellLess-Computer-icon.png', 'Computer & Office', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_category`
--

CREATE TABLE `tbl_sub_category` (
  `sub_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sub_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_sub_category`
--

INSERT INTO `tbl_sub_category` (`sub_id`, `cat_id`, `sub_name`) VALUES
(1, 1, 'អាវយឺត T-Shirt '),
(2, 1, 'អាវក្រៅ Jacket '),
(3, 1, 'រ៉ូប​ Dress '),
(4, 1, 'អាវក្រៅ Jacket '),
(5, 1, 'សំពត់ Skirt '),
(6, 1, 'ឈុតគូស្នេហ៍ Lover'),
(7, 1, 'ខូវប៊យ Jeans '),
(8, 1, 'ខោជើងខ្លី Shorts '),
(9, 1, 'ខោអាវធ្វើការ Working '),
(10, 1, 'ខោអាវក្នុង​ Bra & Panties '),
(11, 2, 'Cars for Sale'),
(12, 2, 'Car Parts & Accessories'),
(13, 2, 'Motorcycles For Sale'),
(14, 2, 'Motor Parts & Accessories'),
(15, 3, 'Apple'),
(16, 3, 'Samsung'),
(17, 3, 'Samsung'),
(18, 3, 'Huawei'),
(19, 3, 'Oppo'),
(20, 3, 'Oppo'),
(21, 3, 'HTC'),
(22, 3, 'Camfone');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_chat`
--

CREATE TABLE `tbl_user_chat` (
  `p_id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `dealer_id` int(11) NOT NULL,
  `chat_comment` text NOT NULL,
  `chat_date_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user_chat`
--

INSERT INTO `tbl_user_chat` (`p_id`, `chat_id`, `dealer_id`, `chat_comment`, `chat_date_time`) VALUES
(139, 11, 17, 'hhh', '2018-03-01 19:55:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `tbl_dealer`
--
ALTER TABLE `tbl_dealer`
  ADD PRIMARY KEY (`dealer_id`);

--
-- Indexes for table `tbl_dealer_account`
--
ALTER TABLE `tbl_dealer_account`
  ADD PRIMARY KEY (`acc_id`),
  ADD KEY `dealer_id` (`dealer_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `pcat_id` (`pcat_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `tbl_slide_ads`
--
ALTER TABLE `tbl_slide_ads`
  ADD PRIMARY KEY (`ads_id`);

--
-- Indexes for table `tbl_store`
--
ALTER TABLE `tbl_store`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `dealer_id` (`dealer_id`);

--
-- Indexes for table `tbl_store_category`
--
ALTER TABLE `tbl_store_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  ADD PRIMARY KEY (`sub_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `tbl_user_chat`
--
ALTER TABLE `tbl_user_chat`
  ADD PRIMARY KEY (`chat_id`),
  ADD UNIQUE KEY `p_id` (`p_id`),
  ADD KEY `dealer_id` (`dealer_id`),
  ADD KEY `p_id_2` (`p_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `a_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_dealer`
--
ALTER TABLE `tbl_dealer`
  MODIFY `dealer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_dealer_account`
--
ALTER TABLE `tbl_dealer_account`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `tbl_slide_ads`
--
ALTER TABLE `tbl_slide_ads`
  MODIFY `ads_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_store`
--
ALTER TABLE `tbl_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_store_category`
--
ALTER TABLE `tbl_store_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  MODIFY `sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_user_chat`
--
ALTER TABLE `tbl_user_chat`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_dealer_account`
--
ALTER TABLE `tbl_dealer_account`
  ADD CONSTRAINT `tbl_dealer_account_ibfk_1` FOREIGN KEY (`dealer_id`) REFERENCES `tbl_dealer` (`dealer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `tbl_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`pcat_id`) REFERENCES `tbl_sub_category` (`sub_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_store`
--
ALTER TABLE `tbl_store`
  ADD CONSTRAINT `tbl_store_ibfk_1` FOREIGN KEY (`dealer_id`) REFERENCES `tbl_dealer` (`dealer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_sub_category`
--
ALTER TABLE `tbl_sub_category`
  ADD CONSTRAINT `tbl_sub_category_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `tbl_store_category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_user_chat`
--
ALTER TABLE `tbl_user_chat`
  ADD CONSTRAINT `tbl_user_chat_ibfk_1` FOREIGN KEY (`dealer_id`) REFERENCES `tbl_dealer` (`dealer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_user_chat_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `tbl_product` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Dumping data for table `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('golden', 1, 'bbb'),
('golden', 2, 'nnn');

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"sihalive\",\"table\":\"position\"},{\"db\":\"sihalive\",\"table\":\"food_category_link\"},{\"db\":\"sihalive\",\"table\":\"food\"},{\"db\":\"sihalive\",\"table\":\"restaurant\"},{\"db\":\"sihalive\",\"table\":\"restaurant_category_link\"},{\"db\":\"sihalive\",\"table\":\"category\"},{\"db\":\"sihalive\",\"table\":\"food_set\"},{\"db\":\"sihalive\",\"table\":\"order_list\"},{\"db\":\"sihalive\",\"table\":\"user\"},{\"db\":\"golden\",\"table\":\"tbl_product\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Dumping data for table `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('golden', 'tbl_admin', 1, 74, 337),
('golden', 'tbl_dealer', 1, 73, 79),
('golden', 'tbl_dealer', 2, 54, 15),
('golden', 'tbl_dealer_account', 1, 400, 14),
('golden', 'tbl_dealer_account', 2, 55, 256),
('golden', 'tbl_product', 1, 721, 52),
('golden', 'tbl_product', 2, 872, 36),
('golden', 'tbl_store', 1, 400, 191),
('golden', 'tbl_store', 2, 307, 20),
('golden', 'tbl_store_category', 1, 957, 187),
('golden', 'tbl_store_category', 2, 527, 21),
('golden', 'tbl_sub_category', 1, 957, 23),
('golden', 'tbl_sub_category', 2, 529, 286),
('golden', 'tbl_user_chat', 1, 399, 422);

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'golden', 'tbl_dealer', '{\"sorted_col\":\"`tbl_dealer`.`dealer_email`  DESC\"}', '2018-02-28 18:20:08'),
('root', 'sihalive', 'food', '{\"sorted_col\":\"`food`.`f_large_price` ASC\"}', '2018-03-01 03:38:05'),
('root', 'sihalive', 'restaurant', '{\"sorted_col\":\"`restaurant`.`ca_id` ASC\"}', '2018-02-28 07:16:08'),
('root', 'sihalive', 'restaurant_operation', '{\"sorted_col\":\"`restaurant_operation`.`open_day` ASC\"}', '2018-02-28 04:12:23'),
('root', 'sihalive', 'user', '{\"sorted_col\":\"`user`.`u_email` ASC\"}', '2018-02-27 09:35:54');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2018-02-14 03:59:50', '{\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `sihalive`
--
CREATE DATABASE IF NOT EXISTS `sihalive` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sihalive`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `ar_id` int(2) NOT NULL,
  `ar_name` varchar(30) NOT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`ar_id`, `ar_name`, `add_datetime`) VALUES
(1, 'system', '2018-02-24 13:55:20');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions_link`
--

CREATE TABLE `admin_role_permissions_link` (
  `apl_id` int(10) NOT NULL,
  `ar_id` int(2) DEFAULT NULL COMMENT 'admin_role_id',
  `pe_id` int(5) DEFAULT NULL COMMENT 'permissions_id',
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_role_permissions_link`
--

INSERT INTO `admin_role_permissions_link` (`apl_id`, `ar_id`, `pe_id`, `add_datetime`) VALUES
(1, 1, 1, '2018-02-25 11:36:31'),
(2, 1, 3, '2018-02-25 11:36:42');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `ad_id` int(11) NOT NULL,
  `ad_account` varchar(16) NOT NULL,
  `ad_passwd` char(32) NOT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ad_status` enum('unlock','onlock') NOT NULL DEFAULT 'unlock',
  `ar_id` int(2) DEFAULT NULL COMMENT 'admin_role_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`ad_id`, `ad_account`, `ad_passwd`, `add_datetime`, `ad_status`, `ar_id`) VALUES
(1, 'tryion', '25d55ad283aa400af464c76d713c07ad', '2018-02-24 13:59:35', 'unlock', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ca_id` int(11) NOT NULL,
  `ca_parents_id` int(11) DEFAULT NULL COMMENT '父分類ID',
  `ca_name` varchar(20) NOT NULL,
  `ca_name_en` varchar(20) NOT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ca_id`, `ca_parents_id`, `ca_name`, `ca_name_en`, `add_datetime`) VALUES
(1, 0, '中国食品', 'Chinese Food', '2018-02-16 00:00:00'),
(2, 0, '当地食物', 'Local Food', '2018-02-16 00:00:00'),
(3, 0, '日本食品', 'Japanese Food', '2018-02-16 00:00:00'),
(4, 0, '西方食物\r\n', 'Western Food', '2018-02-16 00:00:00'),
(5, 0, '套餐', 'Set', '2018-02-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('r4uk9qdgjjnt637emeclunjds4cohis6', '127.0.0.1', 1519107726, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393130373530383b),
('jdhvhg7crjhdsnfm2u11e6cjern912gm', '127.0.0.1', 1519108818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393130383831383b),
('fc16amqbld7rk5cc3p99p10vnhbl6dgh', '127.0.0.1', 1519109129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393130383835313b656e63727970745f757365725f646174617c733a3134343a2252465275646d52694d307732596b396f59304e5965556c7664464e5964466c72616c4a71516c7030616a4e4859584669556b464f5a314651646e4275513151794e6d705862573948524535544e4668484e564a4f4f546c445632524e5a544e57516c42695a314e6d4c7938774e3251784b325a325557686a53484e57526b746c565774734e6d70544d58525961465539223b),
('iaahr47gusjo3garop3sfv73nd9lr4ru', '127.0.0.1', 1519115992, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393130393233333b656e63727970745f757365725f646174617c733a3134343a2253487071556d46574e5570566447737a5355703251324a4864585a504d3263775a304a4b636e7051646e677262444176636c5269536b645362576868546a52484e545276566b4a785448704a646b6877624752614d7a525063556c4a576a4d33556b38794f464a5a595851784e574d335630354e636b7050537a5a4f65577035655663724e6a464451565a4b56553039223b),
('8i1mj2e7e924etj01oh6lclc2jpttot3', '127.0.0.1', 1519110274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131303132313b656e63727970745f757365725f646174617c733a3134343a2264445a595431524c4e47683362554979576b745a51544e69614846514f57517752316c4b646a684961324a46643238354e6a51324d4868565a6c6461617a644e546e68434e454e4a5747524c576b493064544d7657466b76526d70494d5746524e555a51656e706c645445774d6a52764d575a4b5469747a4e6b3150537a645557553973636d5674536d463556326339223b),
('g8clj1bbi8p4aqid84dp5f5sej13hnsr', '127.0.0.1', 1519110551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131303237363b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('k4636bac5pj31sf3gh5ir3nk11upejm0', '127.0.0.1', 1519111303, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131313032363b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('nqh7tms0cnoobd6scvu110iu4ct9p9cn', '127.0.0.1', 1519111426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131313336333b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('mcs4q3e75c36ocso971rd5nih4lgor1j', '127.0.0.1', 1519114108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343130383b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('bi2rurjahu3nipb31cvaogmdhae87rln', '127.0.0.1', 1519114205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343139393b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('ju7pmf84orng5p4l9e5m6s028ol1iqv8', '127.0.0.1', 1519114305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343230363b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('noopjrjgh9igqcohpd4oh4komomn63r8', '127.0.0.1', 1519114318, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343330353b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('ji50bqkrkudrcp84hqaf5srf0o97n8dq', '127.0.0.1', 1519114330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343331383b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('nus6udr91mqd01re4oe5hevldtjo7f6d', '127.0.0.1', 1519114372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343333303b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('4aldc5qgqs0sq9i37arh88ttebgoctt5', '127.0.0.1', 1519114383, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343337343b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('p3661hrpitp8ub53l4u96gco5fpvq28s', '127.0.0.1', 1519114389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343338333b),
('kekggqbk7i6lks0htce7tmpblb2dugn2', '127.0.0.1', 1519114400, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343339303b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('eofs3t35ojjf86snrd86dccja8bd57p4', '127.0.0.1', 1519114415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343430303b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('66uuecgtper4bqcgkojfukec0kr8rds7', '127.0.0.1', 1519114443, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343431363b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('i3o1i4lre34vfq2g691n92tklajeo7vr', '127.0.0.1', 1519114460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343436303b656e63727970745f757365725f646174617c733a3134343a224d306b786344466852564a68646b733263574e4452475a4f526e5a4b55335a36636c6730546e4d7861557070576c4a314d6e7031546c5631626e643654454d33576e686c4d3363335545356e556d397257465a5456475a6965456c73596d5636536a6c4561584675626d466c4d6d73346130316c5647744f65556b31565456684c3068734c7a46685a6e705665545139223b),
('b9ggsnvm4eaia2j638r733cv7mpbcgkc', '127.0.0.1', 1519114460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343436303b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('lo45bnj3vrug4681jf7dhojsoaqnqu23', '127.0.0.1', 1519114498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343439383b656e63727970745f757365725f646174617c733a3134343a224d54426d636d73794b305a47616e63775a557854566e464c616b7035636b6c78555531794c3346685a304a546145527053306c43576c6c43656b6c795248687055554673544731695a6e424c54454a57647a633352577047596d744c55574e7761326b3557484a534d466379616c646f62574d345354567256335649554530774e7a524564446c595446517961473839223b),
('4aprbtvq7807js1tqdbk5vaomi87b0bo', '127.0.0.1', 1519114498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343439383b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('mgcsr9umisjkv1jipqjcuk2uooi8c3jb', '127.0.0.1', 1519114683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343532343b656e63727970745f757365725f646174617c733a3134343a22564552474d56564954455a43595841324e545642574755785a454a444e454e54526a4676517a4250526e564f4d58427663555579574756596344566e556e463664304e344e55703656456848525739434e335654614659724e326c55575338785445466c576e563055486b355456704d4f546772626e56474e4752464c7a4e51623370784e456c4d4c7a686154484d39223b),
('tum0ia725co4h584d7olfuh4bujhqdac', '127.0.0.1', 1519114554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343532353b656e63727970745f757365725f646174617c733a3134343a22654559355133553154325632516a6832526b706b53456c4b4e324530526d70724b323153626a684a61466c574d5764685430316c5179747163464e454b3056765a326874596d5a794e316b7a52464e475a6d31364e5870436256424b4d793930516e5231526c4e736233637652307732624735615a334234525339344d7974795257706a57584a4b4e573173576b3039223b),
('ugt3hc1e87u97205q78dgstrks0p14i5', '127.0.0.1', 1519114628, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343631393b656e63727970745f757365725f646174617c733a3134343a224b3278305747303455586f7863464a5655575273636a4a6f6132557a596e4e6b5a585a4952325645616b4e5a555531364e6d5532563146304d306c4e4e6b6852553256455657357a5556646b6355315361446c4562576b345547393057465630646d56455932646a56577077636d6c5a4c335278556e464a6556684254446b775557744465556c6d53314d324d324d39223b),
('5euu2rgl303qiiehfoi12b188od376fc', '127.0.0.1', 1519114998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131343939383b),
('ihsvfjeagn7fpj19dpegah8osku74qj8', '127.0.0.1', 1519117658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353031363b656e63727970745f757365725f646174617c733a3134343a22526a4a595330525057573556654656615179743357476c5a56316842616d737959574669516a46304e6d51304e48684a635564425a7a42494e556834517a5a44563074494e6d4a49536d52484d335a336448565363445a56626b4e4753465644626b4a314b325678564442774b3074424d6b354a5957314454336458627a564263564233616b3531556c70534d304539223b),
('3jp9q1snp4j9sfpnnfi0nc20r9hpqvgq', '127.0.0.1', 1519115116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353131323b),
('826qcak90jgds2hvi6lk0b2leen33429', '127.0.0.1', 1519115127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353132373b),
('7j1u97u60tquj1vrbtgea5fofuc024h6', '127.0.0.1', 1519115179, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353137393b656e63727970745f757365725f646174617c733a3134343a22564552474d56564954455a43595841324e545642574755785a454a444e454e54526a4676517a4250526e564f4d58427663555579574756596344566e556e463664304e344e55703656456848525739434e335654614659724e326c55575338785445466c576e563055486b355456704d4f546772626e56474e4752464c7a4e51623370784e456c4d4c7a686154484d39223b),
('dg78uav3uj8u5aarqk8l3e2ehb013tnc', '127.0.0.1', 1519115307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353237313b656e63727970745f757365725f646174617c733a3134343a22564552474d56564954455a43595841324e545642574755785a454a444e454e54526a4676517a4250526e564f4d58427663555579574756596344566e556e463664304e344e55703656456848525739434e335654614659724e326c55575338785445466c576e563055486b355456704d4f546772626e56474e4752464c7a4e51623370784e456c4d4c7a686154484d39223b),
('6ucj2fnl0e9n9bntev50v2b4ce45tpdk', '127.0.0.1', 1519115335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353333353b656e63727970745f757365725f646174617c733a3134343a225454424d5a466833556e67724d6d396a576e6c58635868356445637952545634546d31315243397a56485a3152485a45564739304b7a52704e584e59596e56524e3046554b33424c655574565154566a643278464e6b786c4d7a4e714e47316d61565535596b7074556a457754484a736156673155445244636d6378636c465a64564e6b4d466447635463334e456b39223b),
('i68uc9jn82h4kbo2uvk1soubvdqjrdng', '127.0.0.1', 1519115596, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353539343b),
('vng0hstrjd3l4o95ntunrakfbvbqcgvm', '127.0.0.1', 1519115701, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353730313b656e63727970745f757365725f646174617c733a3134343a225957464e635567325531705763453142617a6c4d536e4a6b596b3558616e525663316c48536a466a544564306244526e64587052557a5a4d553245786379396b63484e46634564434e575a5a6232315557566372636e427a527a52775746566c5479746c53474a755548645057546849616b5178545852454e69387a645559786432686d533074545a55705864306b39223b),
('c62rccqmtdromd9fu3fp0iu5rq2jqpf8', '127.0.0.1', 1519115715, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353731353b656e63727970745f757365725f646174617c733a3134343a22656d78425933463257486c5a556d5a6b4e55564a52453076626a686e4d314a51574867784e56566a59574a6b4e575a6e595570475469745a555573764e3363305a3231595a3349764f454e7a563246534e6d783051556c7462325a6d5431646b516e526853555677526b784e4e4442566257396c615868615a57787751325a5655336c4c4c326b7255465269596c6b39223b),
('hntmueibsuhaf24l646l2c82flaane5t', '127.0.0.1', 1519115740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353734303b656e63727970745f757365725f646174617c733a3134343a22656d78425933463257486c5a556d5a6b4e55564a52453076626a686e4d314a51574867784e56566a59574a6b4e575a6e595570475469745a555573764e3363305a3231595a3349764f454e7a563246534e6d783051556c7462325a6d5431646b516e526853555677526b784e4e4442566257396c615868615a57787751325a5655336c4c4c326b7255465269596c6b39223b),
('4c71kcvenoq85q07c862te5js0uuur1i', '127.0.0.1', 1519115772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353737323b656e63727970745f757365725f646174617c733a3134343a2253305674525763325331673051574e726547314e5158564d4d545a78545739785430464955334a306133465152576b7756323133516b4e5051544d345346703163486b7a4b334a4552453179626e464f5345463165455a3152576c59575552305a586b7a646d74795169387a54564e6956486854536c465463474d335245313564584e4e576a4e346446417959324d39223b),
('q0q5t0b7iop30ic1vkqn50i0m4lvqbqg', '127.0.0.1', 1519115833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353833333b656e63727970745f757365725f646174617c733a3134343a2251584177656a5a4b536e4e4c5a546c7962456c485557394961576c7a4e314653576a4e614f474658515670366358465253454a36646e52535a7a644c65545a48526b706e59584273576d78694b30684f55474a3461554a59646b356d526d64785a555a554f476c7a545646304e6e4e57634568314e304d7a5757673559324a6e5a6e4e3054556b776448647154555539223b),
('o9gttidhtfseekaqastng8us2haqlbf6', '127.0.0.1', 1519115864, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353836343b656e63727970745f757365725f646174617c733a3134343a224e33707955325232655735614d335a316354426959545630556a5a735a456c72516e566c59574a595655647465556c45546d5a575348464652445249546d687161314258576d51765a7a6c774e5870755a476c524d6d35716256513552466c304e486f325645383452476434646a4e6f5154467855454e794f5756545931524d64545a7054474e68626e70755a473839223b),
('435nnkt583jf9p8ofgi3f4ti1or6pp3r', '127.0.0.1', 1519115915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353931353b656e63727970745f757365725f646174617c733a3134343a22526a6b35553039765644426153486852517a6c4d6458707153317054556e5a69634738784b3364546147593463306876564467356432564e4f573578533256586279743359303151553152614d485a365a7a677259544644515456465a6b4a444d4645794e58527a556d64534d6d6c30656b5248563068465454597254315656576d684e556b35545243395764486339223b),
('1runuso0ftvhn5ifd3oarc26jbdspqfg', '127.0.0.1', 1519115992, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353936353b),
('cbhp551ngruo01ofuav3pqjenrgcauto', '127.0.0.1', 1519115994, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131353939333b656e63727970745f757365725f646174617c733a3134343a2253487071556d46574e5570566447737a5355703251324a4864585a504d3263775a304a4b636e7051646e677262444176636c5269536b645362576868546a52484e545276566b4a785448704a646b6877624752614d7a525063556c4a576a4d33556b38794f464a5a595851784e574d335630354e636b7050537a5a4f65577035655663724e6a464451565a4b56553039223b),
('c0nf48910kmgjfh058ejk9pb8ua7gm9e', '127.0.0.1', 1519116559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363439303b656e63727970745f757365725f646174617c733a3134343a2253487071556d46574e5570566447737a5355703251324a4864585a504d3263775a304a4b636e7051646e677262444176636c5269536b645362576868546a52484e545276566b4a785448704a646b6877624752614d7a525063556c4a576a4d33556b38794f464a5a595851784e574d335630354e636b7050537a5a4f65577035655663724e6a464451565a4b56553039223b),
('ai84an8qmnq95rhmaeqjqh9qoe4tmhr6', '127.0.0.1', 1519116729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363632343b656e63727970745f757365725f646174617c733a3134343a2263545a724d6c707465477472643142594e7a646e6269383152475245654730335a54527454554a765a6d5a44544539534c30745a546c644d535752584e57524d613064424f464e44535563764e4564524e44684365566c554d3270445744633351575a4d63485934533167765957565662444d765655524d4d7a637964454e445a6d3549596e5a544f5578505a6a4139223b),
('gotc9u5iafodstveub91cadlf3edmfl4', '127.0.0.1', 1519116731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363733313b656e63727970745f757365725f646174617c733a3134343a2263545a724d6c707465477472643142594e7a646e6269383152475245654730335a54527454554a765a6d5a44544539534c30745a546c644d535752584e57524d613064424f464e44535563764e4564524e44684365566c554d3270445744633351575a4d63485934533167765957565662444d765655524d4d7a637964454e445a6d3549596e5a544f5578505a6a4139223b),
('t627g0nf2o04ns85i174l8fs9tkrbg59', '127.0.0.1', 1519116764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363736333b656e63727970745f757365725f646174617c733a3134343a2263545a724d6c707465477472643142594e7a646e6269383152475245654730335a54527454554a765a6d5a44544539534c30745a546c644d535752584e57524d613064424f464e44535563764e4564524e44684365566c554d3270445744633351575a4d63485934533167765957565662444d765655524d4d7a637964454e445a6d3549596e5a544f5578505a6a4139223b),
('2226rdcl1rqv10pjg8tp3nh53bb0ua45', '127.0.0.1', 1519116766, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363736363b656e63727970745f757365725f646174617c733a3134343a2263545a724d6c707465477472643142594e7a646e6269383152475245654730335a54527454554a765a6d5a44544539534c30745a546c644d535752584e57524d613064424f464e44535563764e4564524e44684365566c554d3270445744633351575a4d63485934533167765957565662444d765655524d4d7a637964454e445a6d3549596e5a544f5578505a6a4139223b),
('9qqmgk2saal2aj8h70kg4g9i6s2hjq90', '127.0.0.1', 1519116793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363737363b656e63727970745f757365725f646174617c733a3134343a225457684853587057515663784d464e454f55566a647a424261537455646d4e584e6c427053317078525778774e316378545734346246453562475a72523155725555397562445a73614868305658643565545a574e7a6c795957467161304d3154487051576b5978576a644462797372545549354d46453254475a77526e5a74556b6f344f455269655652304d454539223b),
('58428lcf0fr0eh0psgg0th0aim1bs0fd', '127.0.0.1', 1519116799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363739393b656e63727970745f757365725f646174617c733a3134343a2264477047635446584d6e566854464e3551585934527a5a6a61305a766247526d4d484e5a4d6d73316145524d4d56644d55454d32523142615557686956315252624859765a6c55346447396a593231306356417853574d774e336f34614770454d6e5a76636a56324e6c41335258465553797377525535755a485a324d544274595764476155396c6154646f536d4d39223b),
('m4ai0vldl4lnqdrcctdvu8ffr2atn19m', '127.0.0.1', 1519116810, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363830353b656e63727970745f757365725f646174617c733a3134343a2264477047635446584d6e566854464e3551585934527a5a6a61305a766247526d4d484e5a4d6d73316145524d4d56644d55454d32523142615557686956315252624859765a6c55346447396a593231306356417853574d774e336f34614770454d6e5a76636a56324e6c41335258465553797377525535755a485a324d544274595764476155396c6154646f536d4d39223b),
('enjdidp1r8uetqitc87li8hutd345o75', '127.0.0.1', 1519116818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363831383b656e63727970745f757365725f646174617c733a3134343a2264477047635446584d6e566854464e3551585934527a5a6a61305a766247526d4d484e5a4d6d73316145524d4d56644d55454d32523142615557686956315252624859765a6c55346447396a593231306356417853574d774e336f34614770454d6e5a76636a56324e6c41335258465553797377525535755a485a324d544274595764476155396c6154646f536d4d39223b),
('6acblrk1f50brmicgmj5oevale0pm75d', '127.0.0.1', 1519116881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363832303b656e63727970745f757365725f646174617c733a3134343a2255457049616e6872645767764f545931527a5a614d324e6c523164434f4731544f47387756586c73566b3532646b4a535a455a71576e646a5556564c526b4e335a557031614446335a6a55795348566b556a4642626d645661584e79546a64684f575a5964456c6b4e4855724d6d466c4d7a4656516b7848646b564c634645725a6c4930576b643464324e4e54455539223b),
('0a8t3lp34teto63clh73fcqk6tg4i8ea', '127.0.0.1', 1519116889, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363838393b656e63727970745f757365725f646174617c733a3134343a2255457049616e6872645767764f545931527a5a614d324e6c523164434f4731544f47387756586c73566b3532646b4a535a455a71576e646a5556564c526b4e335a557031614446335a6a55795348566b556a4642626d645661584e79546a64684f575a5964456c6b4e4855724d6d466c4d7a4656516b7848646b564c634645725a6c4930576b643464324e4e54455539223b),
('qa981rm3ttt7vi8ek4ensje8kuuekrbf', '127.0.0.1', 1519116924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363839313b656e63727970745f757365725f646174617c733a3134343a22526a4a595330525057573556654656615179743357476c5a56316842616d737959574669516a46304e6d51304e48684a635564425a7a42494e556834517a5a44563074494e6d4a49536d52484d335a336448565363445a56626b4e4753465644626b4a314b325678564442774b3074424d6b354a5957314454336458627a564263564233616b3531556c70534d304539223b),
('5n749jrmp9fh1f4a323ghss9cm7jvapd', '127.0.0.1', 1519116955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363933333b656e63727970745f757365725f646174617c733a3134343a22526a4a595330525057573556654656615179743357476c5a56316842616d737959574669516a46304e6d51304e48684a635564425a7a42494e556834517a5a44563074494e6d4a49536d52484d335a336448565363445a56626b4e4753465644626b4a314b325678564442774b3074424d6b354a5957314454336458627a564263564233616b3531556c70534d304539223b),
('mup3ib1nvhamfhqs327q1en98id9kl22', '127.0.0.1', 1519116964, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363936343b656e63727970745f757365725f646174617c733a3134343a22526a4a595330525057573556654656615179743357476c5a56316842616d737959574669516a46304e6d51304e48684a635564425a7a42494e556834517a5a44563074494e6d4a49536d52484d335a336448565363445a56626b4e4753465644626b4a314b325678564442774b3074424d6b354a5957314454336458627a564263564233616b3531556c70534d304539223b),
('t4ll3fpe43b6gto8gb7rugm1578f8lbb', '127.0.0.1', 1519117010, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131363937363b656e63727970745f757365725f646174617c733a3134343a22526a4a595330525057573556654656615179743357476c5a56316842616d737959574669516a46304e6d51304e48684a635564425a7a42494e556834517a5a44563074494e6d4a49536d52484d335a336448565363445a56626b4e4753465644626b4a314b325678564442774b3074424d6b354a5957314454336458627a564263564233616b3531556c70534d304539223b),
('84spmqaskgctgch57kk3dnclfh5out79', '127.0.0.1', 1519117043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131373031373b656e63727970745f757365725f646174617c733a3134343a22526a4a595330525057573556654656615179743357476c5a56316842616d737959574669516a46304e6d51304e48684a635564425a7a42494e556834517a5a44563074494e6d4a49536d52484d335a336448565363445a56626b4e4753465644626b4a314b325678564442774b3074424d6b354a5957314454336458627a564263564233616b3531556c70534d304539223b),
('ceq376q32oap489ne4e4p6a6dpteosmk', '127.0.0.1', 1519117096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131373035313b656e63727970745f757365725f646174617c733a3134343a22525574745344457665555a35626d394c59555a72526b3574615746746546706d51584a4e53585a705648707a63453178516c647363565a5354325a785553394d63454a305657743454584930536c4a4d4f4570735a554a614e7a42746557784751545a45646a5a764b7a4a705748643057573170535746566147567a54585634544568545355784b6445396952305539223b),
('i8166k6l7pm24sk8hjni0e7he4j6b92j', '127.0.0.1', 1519117103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131373130333b656e63727970745f757365725f646174617c733a3134343a226347637857575a6d526b394965464643546a52354d6d644a556a5a4d4d32356a56454935555851335655566e616e706b51585a4f4d5339336143746e546a56494f475a544e4459725445564f646d686e646d56594d6a4e785a4846595a3278775a57646c5a445a496433597a62584a75556d52706154553452557470656a5253635756525344557262444e7962573839223b),
('u6t09b2a22o30gal5ddapmbnn9mt2v9j', '127.0.0.1', 1519117653, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131373635313b656e63727970745f757365725f646174617c733a3134343a226347637857575a6d526b394965464643546a52354d6d644a556a5a4d4d32356a56454935555851335655566e616e706b51585a4f4d5339336143746e546a56494f475a544e4459725445564f646d686e646d56594d6a4e785a4846595a3278775a57646c5a445a496433597a62584a75556d52706154553452557470656a5253635756525344557262444e7962573839223b),
('2q7j1f18mhdhdjpeh8gb1v2q30cmiadn', '127.0.0.1', 1519117932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131373636333b656e63727970745f757365725f646174617c733a3134343a22527a6b72516a6c42595642425646417a54314a454d6c4634624535734b7a527954584a50595864614d7a526a6245785656564275626d466f535535525a314e366146413152444651526d3570555373315257646d626b4a5a63556451575768365745355a646d5652575556745a6a5a30526d4a73516e41345455394f62476c795a5849356556426861584e704e6b5539223b),
('fkfrc0jnuk0ti88p15i0a25r9ulhlv9l', '127.0.0.1', 1519118074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393131383037343b656e63727970745f757365725f646174617c733a3134343a22527a6b72516a6c42595642425646417a54314a454d6c4634624535734b7a527954584a50595864614d7a526a6245785656564275626d466f535535525a314e366146413152444651526d3570555373315257646d626b4a5a63556451575768365745355a646d5652575556745a6a5a30526d4a73516e41345455394f62476c795a5849356556426861584e704e6b5539223b),
('0okdpakc0fca9ai9o1268bv3iviiikck', '127.0.0.1', 1519123096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333039363b656e63727970745f757365725f646174617c733a3134343a22527a6b72516a6c42595642425646417a54314a454d6c4634624535734b7a527954584a50595864614d7a526a6245785656564275626d466f535535525a314e366146413152444651526d3570555373315257646d626b4a5a63556451575768365745355a646d5652575556745a6a5a30526d4a73516e41345455394f62476c795a5849356556426861584e704e6b5539223b),
('a8lecut05g470jqqh6qgbh88nsgv0vdv', '127.0.0.1', 1519123105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333039363b656e63727970745f757365725f646174617c733a3137323a225231704d5a315a53555446704e4774564e464577543052365433706c55484132537a684c55305a7864456c71656b7779613356755157564a546e517964316c5863486b79534863324d4646496347564d546e64694d6a567555575631515739355a6d35684d7a677254556c585445746f4f554e78567a453555584e764f475a445957303255474e4b635755794d557843556b3575516b4a45547a6855547a52714e5452456330355a4e6a4d3d223b),
('s7555niruecqjlvl50o2con1j5qeqrgu', '127.0.0.1', 1519123110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333130363b656e63727970745f757365725f646174617c733a3134343a22527a6b72516a6c42595642425646417a54314a454d6c4634624535734b7a527954584a50595864614d7a526a6245785656564275626d466f535535525a314e366146413152444651526d3570555373315257646d626b4a5a63556451575768365745355a646d5652575556745a6a5a30526d4a73516e41345455394f62476c795a5849356556426861584e704e6b5539223b),
('pis92u6bv5i61mghg4uoi467kuknspp0', '127.0.0.1', 1519124529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333131303b656e63727970745f757365725f646174617c733a3137323a22525731485957706b55564a565a573872643064715a444e42595564424d565976635864786132524f595534795257633553533878536d64504c7a6b3554445a42656a527764323573656a45775a3278576333466a5657353452584a7364574a4b61554e6f5a553555626d5a4c5644526c596c59776155564b64555a4956473569616b67724d6e684864475a68526a6453525552616433645361465a696131647a4d6d35534e3342555a6a493d223b61617c733a313a2231223b),
('blugdhpf5stvb1u73ujg8ce99n45ncff', '127.0.0.1', 1519123252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333235323b656e63727970745f757365725f646174617c733a3134343a22527a6b72516a6c42595642425646417a54314a454d6c4634624535734b7a527954584a50595864614d7a526a6245785656564275626d466f535535525a314e366146413152444651526d3570555373315257646d626b4a5a63556451575768365745355a646d5652575556745a6a5a30526d4a73516e41345455394f62476c795a5849356556426861584e704e6b5539223b),
('k2imk87qoaur6krbgpu8licbebbh6kmc', '127.0.0.1', 1519123405, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333430353b656e63727970745f757365725f646174617c733a3134343a22526a4a595330525057573556654656615179743357476c5a56316842616d737959574669516a46304e6d51304e48684a635564425a7a42494e556834517a5a44563074494e6d4a49536d52484d335a336448565363445a56626b4e4753465644626b4a314b325678564442774b3074424d6b354a5957314454336458627a564263564233616b3531556c70534d304539223b),
('5ts20llahutlvjhedk76p19uha2c2h46', '127.0.0.1', 1519123457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333434313b656e63727970745f757365725f646174617c733a3137323a2255445a30633255785432645a4c32314b59316c33575738305a484e364d43747963554a7663326c555a6c673263324e584d5746714c7a4d765548704e6545786b576d74505a323536616c7034546e4a314f557068517a647a546e4e46526a59344d544e6b5a304e5161474a6d55314258596c4e694e7a4a4d5a5546326146557753564d32646b31524e476776566c563065474e424c3070725a544636536b356f4c324a6a6257737a59556f3d223b),
('f5o10erm5g1i3nv05nbdd13a72ms5ru1', '127.0.0.1', 1519123460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333435373b656e63727970745f757365725f646174617c733a3134343a22527a6b72516a6c42595642425646417a54314a454d6c4634624535734b7a527954584a50595864614d7a526a6245785656564275626d466f535535525a314e366146413152444651526d3570555373315257646d626b4a5a63556451575768365745355a646d5652575556745a6a5a30526d4a73516e41345455394f62476c795a5849356556426861584e704e6b5539223b),
('5d79fhct3c309c6d9sr1nvf2r9bbj29c', '127.0.0.1', 1519123460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333436303b656e63727970745f757365725f646174617c733a3134343a22527a6b72516a6c42595642425646417a54314a454d6c4634624535734b7a527954584a50595864614d7a526a6245785656564275626d466f535535525a314e366146413152444651526d3570555373315257646d626b4a5a63556451575768365745355a646d5652575556745a6a5a30526d4a73516e41345455394f62476c795a5849356556426861584e704e6b5539223b),
('nec3le0kdol3lclev1gosthn0fih002s', '127.0.0.1', 1519123476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333437363b656e63727970745f757365725f646174617c733a3137323a226445314d57474654645463324f5535345a47497653444a45527a56735279396e5347356d6431646d565373345954644b535535305532524b6154686f645577335758424d4e6a4e6e5569745653304a75597a457a6231706b5a6a4258534870434d6d3171536d3958536a6c34516b524361466c33616c5a6f5557525a52324e5a4e466c6b55574a485458684f556b316f6248465452585a5a6144527a5932395959574669545656725531453d223b),
('hnrjoun652cqvij0ag88rha18h1h9v0j', '127.0.0.1', 1519123477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333437373b656e63727970745f757365725f646174617c733a3134343a22527a6b72516a6c42595642425646417a54314a454d6c4634624535734b7a527954584a50595864614d7a526a6245785656564275626d466f535535525a314e366146413152444651526d3570555373315257646d626b4a5a63556451575768365745355a646d5652575556745a6a5a30526d4a73516e41345455394f62476c795a5849356556426861584e704e6b5539223b),
('9crlumc630fc134oj88na75d9vru7qkd', '127.0.0.1', 1519123521, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333532313b656e63727970745f757365725f646174617c733a3137323a226445314d57474654645463324f5535345a47497653444a45527a56735279396e5347356d6431646d565373345954644b535535305532524b6154686f645577335758424d4e6a4e6e5569745653304a75597a457a6231706b5a6a4258534870434d6d3171536d3958536a6c34516b524361466c33616c5a6f5557525a52324e5a4e466c6b55574a485458684f556b316f6248465452585a5a6144527a5932395959574669545656725531453d223b),
('qq8e60m15fjno32g0jip4j2csa4vnfgf', '127.0.0.1', 1519123577, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333537333b),
('84ginac7a0p8c7t9pijoobfelk4tculk', '127.0.0.1', 1519123594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333539343b656e63727970745f757365725f646174617c733a3137323a224d555a6e51586f3059584e466357303357474657593364685230777753575a785346526a56576c6d5a303944656e5676646c4e734d6b56335153396e6554686d575556685632684d5555457662306831636a42346248493052456c465256647659324a6d537939555a6e63315458466f536a526c565659764b30687a6545314a5a4841725254527052465a755545457761324a55556c684d5a3064465748426161305674513342715354673d223b),
('k63p0lguqp1kpl6ecavg6tabooor1kpo', '127.0.0.1', 1519123605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333630353b656e63727970745f757365725f646174617c733a3134343a22527a6b72516a6c42595642425646417a54314a454d6c4634624535734b7a527954584a50595864614d7a526a6245785656564275626d466f535535525a314e366146413152444651526d3570555373315257646d626b4a5a63556451575768365745355a646d5652575556745a6a5a30526d4a73516e41345455394f62476c795a5849356556426861584e704e6b5539223b),
('d6gg8blp8teplnccrrgu9v78keobtqgl', '127.0.0.1', 1519123711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132333731313b656e63727970745f757365725f646174617c733a3134343a22527a6b72516a6c42595642425646417a54314a454d6c4634624535734b7a527954584a50595864614d7a526a6245785656564275626d466f535535525a314e366146413152444651526d3570555373315257646d626b4a5a63556451575768365745355a646d5652575556745a6a5a30526d4a73516e41345455394f62476c795a5849356556426861584e704e6b5539223b),
('bp1835aos6c9od2a1juedhn70v4r2ilj', '127.0.0.1', 1519124299, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343038353b),
('udv5nslcccn24f9h8s59873pn139ct1b', '127.0.0.1', 1519124267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343236373b656e63727970745f757365725f646174617c733a3134343a22527a6b72516a6c42595642425646417a54314a454d6c4634624535734b7a527954584a50595864614d7a526a6245785656564275626d466f535535525a314e366146413152444651526d3570555373315257646d626b4a5a63556451575768365745355a646d5652575556745a6a5a30526d4a73516e41345455394f62476c795a5849356556426861584e704e6b5539223b),
('csomb28cc2j7d5ktj6am8ro54a66p39b', '127.0.0.1', 1519124443, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343434333b),
('7qvcpkspdj5e65mi1tm8hid2v2p8uh4f', '127.0.0.1', 1519124444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343434343b),
('vhef8v5v77hd46mv0s47ooa751io1dnv', '127.0.0.1', 1519124452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343435323b),
('2rogplt3la7c3jaifvfddvnle3fig986', '127.0.0.1', 1519124463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343436333b),
('up8hukfu3d9jr4tdgublrk2sme9fsldc', '127.0.0.1', 1519124479, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343437393b),
('c9rrbpb239i63u9d0vbn9u85rqhtbo3s', '127.0.0.1', 1519124485, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343438353b),
('uvmtujno8b7rgrmtl305q9t8fv06vomf', '127.0.0.1', 1519124493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343439333b),
('t7eqnaeks3nmbv4hi3ot088vlenoi1kf', '127.0.0.1', 1519124497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343439373b),
('9vj9cro23aeuki1i8gu92i28tqqnb9gh', '127.0.0.1', 1519124513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343531333b),
('qqj1014ths9r794cnnkf6j9dsrt86itb', '127.0.0.1', 1519124537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343533373b),
('6gf8g41i02mrhvsclid7v5jf1verpjpn', '127.0.0.1', 1519124554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343535343b),
('bmid3385c95npujqun6k1c2qqhpqb8os', '127.0.0.1', 1519124559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531393132343535393b);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `cp_id` char(20) NOT NULL,
  `cp_title` varchar(50) NOT NULL,
  `cp_value` decimal(4,2) NOT NULL DEFAULT '0.00',
  `u_id` int(11) DEFAULT NULL,
  `cp_status` enum('print','stamp','used','destroy') NOT NULL DEFAULT 'print',
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `o_id` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_process`
--

CREATE TABLE `delivery_process` (
  `dp_id` int(11) NOT NULL,
  `o_id` char(20) NOT NULL,
  `dr_id` int(11) NOT NULL,
  `dr_time_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dr_time_arrival_restaurant` datetime NOT NULL,
  `dr_time_to_user` datetime NOT NULL,
  `dr_time_arrival_user` datetime NOT NULL,
  `spend_time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `dr_id` int(11) NOT NULL,
  `dr_name` varchar(20) NOT NULL,
  `dr_phone` varchar(50) NOT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dr_work_time_start` time NOT NULL DEFAULT '09:00:00',
  `dr_work_time_end` time NOT NULL DEFAULT '21:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `error_log`
--

CREATE TABLE `error_log` (
  `el_id` int(11) NOT NULL,
  `el_message` text NOT NULL,
  `el_class` varchar(100) NOT NULL,
  `el_function` varchar(200) NOT NULL,
  `el_add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `error_log`
--

INSERT INTO `error_log` (`el_id`, `el_message`, `el_class`, `el_function`, `el_add_datetime`) VALUES
(1, 'reponse 必传参数为空', 'AdminApi', '__construct', '2018-02-24 18:19:42'),
(2, 'reponse 必传参数为空', 'AdminApi', '__construct', '2018-02-24 18:20:04'),
(3, 'sess is empty', 'AdminApi', '__construct', '2018-02-24 18:21:22'),
(4, 'required is empty', 'AdminApi', '__construct', '2018-02-24 21:36:05'),
(5, 'required is empty', 'AdminApi', '__construct', '2018-02-24 21:36:32'),
(6, 'account onlock', 'AdminApi', 'getUser', '2018-02-24 22:03:48'),
(7, 'login is empty', 'AdminApi', 'getUser', '2018-02-24 22:04:19'),
(8, 'login is empty', 'AdminApi', 'getUser', '2018-02-24 22:04:43'),
(9, 'required is empty', 'AdminApi', 'login', '2018-02-24 22:05:35'),
(10, 'required is empty', 'AdminApi', 'login', '2018-02-24 22:05:41'),
(11, 'required is empty', 'AdminApi', 'login', '2018-02-24 22:05:44'),
(12, 'required is empty', 'AdminApi', 'login', '2018-02-24 22:05:46'),
(13, 'required is empty', 'AdminApi', 'login', '2018-02-24 22:06:17'),
(14, 'required is empty', 'AdminApi', 'login', '2018-02-24 22:06:41'),
(15, 'required is empty', 'AdminApi', 'login', '2018-02-24 22:06:51'),
(16, 'required is empty', 'AdminApi', 'login', '2018-02-24 22:06:55'),
(17, 'account does not exist', 'AdminApi', 'login', '2018-02-24 22:06:59'),
(18, 'passwd is error', 'AdminApi', 'login', '2018-02-24 22:07:04'),
(19, 'login is empty', 'AdminApi', 'getUser', '2018-02-24 23:54:58'),
(20, 'login is empty', 'AdminApi', 'getUser', '2018-02-24 23:54:59'),
(21, 'login is empty', 'AdminApi', 'getUser', '2018-02-24 23:54:59'),
(22, 'login is empty', 'AdminApi', 'getUser', '2018-02-24 23:55:00'),
(23, 'login is empty', 'AdminApi', 'getUser', '2018-02-24 23:55:00'),
(24, 'login is empty', 'AdminApi', 'getUser', '2018-02-24 23:55:00'),
(25, 'login is empty', 'AdminApi', 'getUser', '2018-02-24 23:55:00'),
(26, 'login is empty', 'AdminApi', 'getUser', '2018-02-25 01:25:29'),
(27, 'login is empty', 'AdminApi', 'getUser', '2018-02-25 01:25:29'),
(28, 'login is empty', 'AdminApi', 'getUser', '2018-02-25 01:25:29'),
(29, 'login is empty', 'AdminApi', 'getUser', '2018-02-25 01:25:30'),
(30, 'login is empty', 'AdminApi', 'getUser', '2018-02-25 01:25:30'),
(31, 'login is empty', 'AdminApi', 'getUser', '2018-02-25 01:25:30'),
(32, 'login is empty', 'AdminApi', 'getUser', '2018-02-25 01:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `f_id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `f_name_en` varchar(50) NOT NULL,
  `f_image` text,
  `f_description` text NOT NULL,
  `f_status` enum('sale_out','sale_on','sale_off') NOT NULL DEFAULT 'sale_on',
  `f_large_price` decimal(7,2) UNSIGNED NOT NULL DEFAULT '1.00',
  `f_medium_price` decimal(7,2) UNSIGNED DEFAULT '1.00',
  `f_small_price` decimal(7,2) UNSIGNED DEFAULT '1.00',
  `f_discount_price` decimal(7,2) UNSIGNED NOT NULL DEFAULT '1.00',
  `f_order` int(11) UNSIGNED DEFAULT '0',
  `f_label` varchar(20) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL COMMENT 'restaurant_id',
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`f_id`, `f_name`, `f_name_en`, `f_image`, `f_description`, `f_status`, `f_large_price`, `f_medium_price`, `f_small_price`, `f_discount_price`, `f_order`, `f_label`, `r_id`, `add_datetime`) VALUES
(2, '炸虾寿司卷', 'Ebi-ten Sushi', NULL, 'Tempura shrimp, vege, egg, Mayonese,sauce,', 'sale_on', '3.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(3, '照烧鸡肉寿司卷', 'TERIYAKI Sushi ', NULL, 'TERIYAKI chicken, Egg, Vege, Mayonese', 'sale_on', '3.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(4, '虾沙拉寿司卷', 'Ebi salad Sushi', NULL, 'Shrimp . Salad. Egg. Mayonese .', 'sale_on', '3.50', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(5, '铁火（金枪鱼）卷', 'Tuna Sushi', NULL, 'Tuna, Vege, Egg, Mayonese,', 'sale_on', '3.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(6, '沙拉寿司卷', 'Salad sushi', NULL, 'Salad , egg, crabmeat , mayonese,', 'sale_on', '2.75', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(7, '照烧鸡肉盒饭', 'TERIYAKI  BENTO', NULL, 'Teriyaki chicken', 'sale_on', '3.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(8, '日式炸猪排盒饭', 'Tonkatu BENTO', NULL, 'Breadcrumbs pork ', 'sale_on', '3.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(9, '猪肋排盒饭', 'Pork sparerib BENTO', NULL, 'Pork Sparerib ', 'sale_on', '3.50', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(10, '日式炸虾盒饭', 'EBI BENTO', NULL, 'Breadcrumbs shrimp ', 'sale_on', '3.90', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(11, 'Fried chicken BENTO', 'Fried chicken BENTO', NULL, 'Fried chicken', 'sale_off', '3.50', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(12, 'Fried Chicken', 'Fried Chicken', NULL, 'Fried Chicke', 'sale_off', '3.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(13, '照烧鸡肉', 'Teriyaki chicken', NULL, 'Teriyaki chicken', 'sale_on', '2.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(14, '日式鸡翅', 'Chicken wing', NULL, 'Fried Chicken wing  x 4pc', 'sale_on', '3.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(15, '日式炸猪排', 'Tonkatsu ', NULL, 'Pork breadcrumbs ', 'sale_on', '2.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(16, '日式炸虾', 'EBI ten', NULL, 'Fried shrimp', 'sale_on', '2.50', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(17, 'Fish ball', 'Fish ball', NULL, 'Fish ball', 'sale_off', '2.50', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(18, 'Fried potato', 'Fried potato', NULL, 'Potato', 'sale_off', '2.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(19, '猪肋排', 'Pork Sparerib ', NULL, 'Pork spareribs bbq', 'sale_on', '2.50', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(20, 'Pumpkin soup', 'Pumpkin soup', NULL, 'Pumpkin ', 'sale_off', '1.50', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(21, '起士蛋糕', 'Cheese cake', NULL, 'Chocolate cake', 'sale_on', '3.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(22, '巧克力蛋糕', 'Chocolate cake', NULL, 'NY cheese cake', 'sale_on', '3.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(23, '提拉米苏', 'Tiramisu ', NULL, 'Fruit cake', 'sale_on', '3.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(24, 'Ebi Sandwich', 'Ebi Sandwich', NULL, 'Breadcrumbs Shrimp', 'sale_off', '3.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(25, 'TERIYAKI Sandwich', 'TERIYAKI Sandwich', NULL, 'Teriyaki chicken & egg', 'sale_off', '2.50', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00'),
(26, 'Tonkatsu sandwich ', 'Tonkatsu sandwich ', NULL, 'Pork breadcrumbs ', 'sale_off', '2.00', '1.00', '1.00', '1.00', 0, '', 1, '2018-02-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `food_category_link`
--

CREATE TABLE `food_category_link` (
  `fc_id` int(10) NOT NULL,
  `f_id` int(11) DEFAULT NULL,
  `ca_id` int(11) DEFAULT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `food_set`
--

CREATE TABLE `food_set` (
  `fs_id` int(11) NOT NULL,
  `fs_group_id` int(11) DEFAULT '1',
  `fs_parent_f_id` int(11) DEFAULT NULL,
  `fs_child_f_id` int(11) DEFAULT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `o_id` char(20) NOT NULL,
  `od_item_index` int(11) NOT NULL,
  `f_id` int(11) DEFAULT NULL,
  `od_num` int(11) NOT NULL,
  `od_price` decimal(7,2) NOT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_datetime` datetime DEFAULT NULL,
  `od_is_set` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `o_id` char(20) NOT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `up_datetime` datetime DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `o_status` enum('processing','restaurant','delivery','complete') DEFAULT 'processing',
  `o_messge` text NOT NULL,
  `o_total` double UNSIGNED NOT NULL DEFAULT '0',
  `o_discount` decimal(3,2) UNSIGNED NOT NULL DEFAULT '1.00',
  `p_id` int(11) DEFAULT NULL COMMENT 'position_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`o_id`, `add_datetime`, `up_datetime`, `u_id`, `o_status`, `o_messge`, `o_total`, `o_discount`, `p_id`) VALUES
('100', '2018-03-02 15:37:18', '2018-03-02 00:00:00', 27, 'processing', 'Success', 1, '1.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `pe_id` int(5) NOT NULL,
  `pe_name` varchar(50) NOT NULL,
  `pe_control` varchar(100) NOT NULL,
  `pe_func` varchar(100) NOT NULL,
  `pe_type` enum('menu','action') NOT NULL DEFAULT 'menu',
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pe_parents_id` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`pe_id`, `pe_name`, `pe_control`, `pe_func`, `pe_type`, `add_datetime`, `pe_parents_id`) VALUES
(1, 'Manage Restaurant ', 'AdminRestaurant', '', 'menu', '2018-02-24 13:53:55', 0),
(2, 'list', 'AdminRestaurant', 'list', 'menu', '2018-02-24 13:54:25', 1),
(3, 'Manage User', 'AdminUser', '', 'menu', '2018-02-25 11:34:17', 0),
(5, 'list', 'AdminUser', 'list', 'menu', '2018-02-25 11:36:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `p_id` int(11) NOT NULL,
  `p_title` varchar(50) DEFAULT NULL,
  `p_description` text,
  `p_lat` double DEFAULT NULL,
  `p_lng` double DEFAULT NULL,
  `p_status` enum('open','close') DEFAULT 'open',
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_datetime` datetime DEFAULT NULL,
  `p_open_time` time DEFAULT '00:00:00',
  `p_close_time` time DEFAULT '24:00:00',
  `p_address` text,
  `p_type` enum('system','user','restaurant') NOT NULL,
  `u_id` int(11) DEFAULT NULL COMMENT 'user_id',
  `r_id` int(11) DEFAULT NULL COMMENT 'restaurant_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`p_id`, `p_title`, `p_description`, `p_lat`, `p_lng`, `p_status`, `add_datetime`, `upd_datetime`, `p_open_time`, `p_close_time`, `p_address`, `p_type`, `u_id`, `r_id`) VALUES
(1, '金獅', '金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅金獅', 10.6105995, 103.523685, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(4, '金貝賭場', '', 10.611906419053163, 103.52514982222147, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(24, '333 Apartments', '333 Apartments. Big building close to football field.', 10.616248, 103.523762, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(25, '360 Resort', '360 Resort', 10.633302, 103.517312, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(26, '7 Jan Boutique', '7 Jan Boutique', 10.604387, 103.534692, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(27, 'Adidas Gym', 'Adidas Gym', 10.613765, 103.530819, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(28, 'Aqua Resort', 'Aqua Resort', 10.608961, 103.525618, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(29, 'Aristocrat Residence and Hotel', 'Aristocrat Residence and Hotel', 10.607372, 103.521362, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(30, 'Backpacker Heaven', 'Backpacker Heaven', 10.634437, 103.504662, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(31, 'Bamboo Shack Bar & Restaurant', 'Bamboo Shack Bar & Restaurant, Otres 1', 10.5802, 103.545946, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(32, 'Bao Mai Resort & Casino', 'Bao Mai Resort & Casino', 10.60621, 103.525464, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(33, 'Beach Club Resort', 'Beach Club Resort', 10.607195, 103.525964, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(34, 'Beach Road Hotel', 'Beach Road Hotel, Serendipity Beach Road', 10.609736, 103.522925, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(35, 'Blue Coconuts Residence', 'Blue Coconuts Residence. Blue building.', 10.615223, 103.523124, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(36, 'BOHO Hostel, Kitchen & Bar', 'BOHO Hostel, Kitchen & Bar', 10.568904, 103.558023, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(37, 'Bower Bar & Resort', 'Bower Bar & Resort', 10.576818, 103.550112, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(38, 'BS Holiday Villa & Condominium', 'BS Holiday Villa & Condominium. On the hill at Sihanoukvilleâ€™s O2 area behind the market on the way to Otres beach.', 10.606354, 103.548787, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(39, 'Chandara Guest House', 'Chandara Guest House', 10.622904, 103.517934, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(40, 'Chhea Bun Yi Apartments', 'Chhea Bun Yi Apartments', 10.615878, 103.548659, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(41, 'Chochi Garden', 'Chochi Garden', 10.607842, 103.521699, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(42, 'Cider Shack', 'Cider Shack', 10.618266, 103.525127, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(43, 'Cloud 9', 'Cloud 9', 10.606075, 103.518471, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(44, 'Coconut Sand Residence', 'Coconut Sand Residence. Next to Happy World.', 10.615186, 103.523022, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(45, 'Coolabah Resort', 'Coolabah Resort', 10.608931, 103.522382, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(46, 'Cozy Resort', 'Cozy Resort', 10.61315, 103.522051, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(47, 'CT Polyclinic', 'CT Polyclinic', 10.627272, 103.522464, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(48, 'Days Inn', 'Days Inn', 10.627946, 103.521206, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(49, 'Deluxx Boutique Hotel', 'Deluxx Boutique Hotel, down the small street opposite Golden Lion Gym.', 10.614195, 103.522798, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(50, 'Deluxx Boutique Residence', 'Deluxx Boutique Residence, white building.', 10.615053, 103.52401, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(51, 'Diamond Sea Hotel And Casino', 'Diamond Sea Hotel And Casino', 10.630072, 103.50496, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(52, 'Don Bosco Guesthouse', 'Don Bosco Guesthouse', 10.626579, 103.529172, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(53, 'Don Bosco Hotel School', 'Don Bosco Hotel School', 10.611109, 103.547393, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(54, 'Downtown Suites', 'Downtown Suites. Go down small alley to reach building.\r\nGates are locked after 8 PM', 10.625499, 103.523395, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(55, 'Eolia Beach Bungalows Resort', 'Eolia Beach Bungalows Resor', 10.579724, 103.546856, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(56, 'Family Bungalow', 'Family Bungalow, Serendipity Beach Road. Opposite Holiday Villa Nataya.', 10.60802, 103.521452, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(57, 'Fitness Resort Sihanoukville', 'Fitness Resort Sihanoukville', 10.632223, 103.514063, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(58, 'Footprints Hostel', 'Footprints Hostel, Otres 2', 10.561858, 103.557794, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(59, 'Germes Nonalcoholspace Guesthouse', 'Germes Nonalcoholspace Guesthouse, above Peace Food Cafe', 10.614554, 103.522876, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(60, 'Golden Lion Gym', 'Golden Lion Gym, 300 meters from Sunday Guesthouse', 10.615601, 103.525125, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(61, 'Golden River Bungalow', 'Golden River Bungalow, Otres II', 10.557645, 103.560969, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(62, 'Golden Sand Hotel', 'Golden Sand Hotel', 10.608528, 103.525064, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(63, 'Golden Sea Hotel & Casino', 'Golden Sea Hotel & Casino', 10.636770967856684, 103.50278735261656, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(64, 'Golden Star Inn', 'Golden Star Inn', 10.615083, 103.525198, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(65, 'Grand Seagull Hotel', 'Grand Seagull Hotel', 10.602512, 103.530386, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(66, 'Hacienda', 'Hacienda, opposite Otres Market', 10.568562, 103.560663, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(67, 'Hilton Park Villa', 'Hilton Park Villa', 10.617403, 103.551939, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(68, 'Holiday Palace Casino & Resort', 'Holiday Palace Casino & Resort', 10.610458, 103.503013, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(69, 'Holiday Villa Nataya', 'Holiday Villa Nataya', 10.607914, 103.521812, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(70, 'Idea Source School', 'Idea Source School', 10.615366, 103.528794, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(71, 'Jully Anna Guesthouse', 'Jully Anna Guesthouse', 10.559033, 103.560406, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(72, 'Kim Chi Bungalows', 'Kim Chi Bungalows', 10.631782, 103.512904, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(73, 'Kim Hour GuestHouse', 'Kim Hour GuestHouse. Small blue building on the right side of the road, no visible name outside.', 10.617126, 103.54314, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(74, 'King Gold Hotel & Apartment Sihanoukville', 'King Gold Hotel & Apartment Sihanoukville', 10.626632, 103.522357, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(75, 'Landscape Boutique Hotel', 'Landscape Boutique Hotel', 10.607815, 103.526685, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(76, 'Life University', 'Life University', 10.632173, 103.521641, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(77, 'Lion City Casino', 'Lion City Casino, Occheuteal Street #500', 10.60841, 103.522475, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(78, 'Magic Tree Bungalows', 'Magic Tree Bungalows', 10.577882, 103.549547, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(79, 'Mangrove River Resort', 'Mangrove River Resort. Otres 2', 10.56243, 103.558863, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(80, 'Miiya Hotel', 'Miiya Hotel', 10.608402, 103.524272, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(81, 'Mila Residences', 'Mila Residences, above Sovady Gold restaurant.', 10.618682, 103.548679, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(82, 'Milk and Honey School', 'Milk and Honey School. Street 212', 10.621075, 103.528695, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(83, 'Mlou Boutique Apartment', 'Mlou Boutique Apartment - No 78, Street 206, Sangkat 04', 10.617575, 103.527785, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(84, 'Mongkul Apartment', 'Mongkul Apartment', 10.620763, 103.540974, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(85, 'Mony Apartments', 'Mony Apartments. Small 4-floor building close to the fields', 10.608938, 103.530932, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(86, 'Moon Julie Hotel', 'Moon Julie Hotel', 10.609023, 103.524612, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(87, 'NA Boutique Hotel', 'NA Boutique Hotel', 10.635898, 103.515142, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(88, 'Naia Resort', 'Naia Resort, Otres 2', 10.558815, 103.560024, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(89, 'Nest Apartments', 'Nest Apartments', 10.626186, 103.499957, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(90, 'Nevada Home', 'Nevada Home', 10.63568, 103.512736, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(91, 'New Papa Pippo Resort', 'New Papa Pippo Resort', 10.567425, 103.559205, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(92, 'Nice Beach Hotel', 'Nice Beach Hotel', 10.607882, 103.523016, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(93, 'OC Boutique Hotel', 'OC Boutique Hotel', 10.607556, 103.525897, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(94, 'Ocean View', 'Ocean View. Building behind the fields.', 10.613425, 103.521482, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(95, 'OGA Bar', 'OGA Bar', 10.624937, 103.518183, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(96, 'OmHome', 'OmHome', 10.566609, 103.560772, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(97, 'One Stop Hostel Sihanoukville', 'One Stop Hostel Sihanoukville', 10.611274, 103.523827, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(98, 'Orchidee Guest House', 'Orchidee Guest House', 10.606122, 103.526992, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(99, 'Oriental Pearl Casino', 'Oriental Pearl Casino', 10.609417, 103.524055, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(100, 'Otres Corner Last Hippie Standing', 'Otres Corner Last Hippie Standing, Otres 1', 10.581144, 103.54541, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(101, 'Otres Lodge', 'Otres Lodge', 10.578659, 103.547654, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(102, 'Out of the Blue Retreat', 'Out of the Blue Retreat, Victory Hill', 10.632771, 103.50238, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(103, 'Palm Boutique', 'Palm Boutique. Otres Village.', 10.570151, 103.557405, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(104, 'Paradise New Life on the Beach', 'Serendipity Beach', 10.6060456, 103.5197973, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(105, 'Patchouly Chill House', 'Patchouly Chill House', 10.614463, 103.522925, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(106, 'Phun Om Net Apartment', 'Phun Om Net Apartment', 10.620197, 103.520329, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(107, 'Power House 2 Apartments', 'Power House 2 Apartments, down small alley opposite Chamka Spey Restaurant', 10.617629, 103.523593, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(108, 'Power House Guesthouse', 'Power House Guesthouse', 10.615758, 103.527646, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(109, 'Queenco Hotel & Casino', 'Queenco Hotel & Casino, Victory Beach', 10.637425, 103.501019, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(110, 'Reaksmey Mean Rith Guesthouse', 'Reaksmey Mean Rith Guesthouse', 10.614575, 103.524559, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(111, 'Reef Resort', 'Reef Resort', 10.610073, 103.522132, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(112, 'Ren Resort', 'Ren Resort', 10.558141, 103.56025, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(113, 'Sakal Guesthouse', 'Sakal Guesthouse', 10.609618, 103.522014, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(114, 'Sandy Clay Bungalows', 'Sandy Clay Bungalows', 10.568864, 103.558602, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(115, 'Santepheap Guesthouse', 'Santepheap Guesthouse', 10.606335, 103.526748, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(116, 'Sarang Guesthouse', 'Sarang Guesthouse', 10.622436, 103.525825, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(117, 'Seaside Bar', 'Seaside Bar', 10.606566, 103.521249, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(118, 'Seng Seng Beauty Salon', 'Seng Seng Beauty Salon', 10.608916, 103.521973, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(119, 'Sihanoukville Duty Free Store', 'Sihanoukville Duty Free Store', 10.608165, 103.524964, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(120, 'Sihanoukville Plaza Hotel', 'Sihanoukville Plaza Hotel', 10.602269, 103.530686, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(121, 'Sinan Guesthouse', 'Sinan Guesthouse', 10.611871, 103.531798, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(122, 'Sky Home Rent', 'Sky Home Rent', 10.617913, 103.53029, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(123, 'Sky Park Villas', 'Sky Park Villas', 10.627797, 103.52778, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(124, 'Sokunthea Apartments', 'Sokunthea Apartments', 10.620007, 103.524315, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(125, 'Spicy Society Sihanoukville', 'Spicy Society Sihanoukville', 10.609333, 103.52148, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(126, 'Stray Cats Guesthouse', 'Stray Cats Guesthouse', 10.570049, 103.558828, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(127, 'Sunday Guesthouse', 'Sunday Guesthouse', 10.612609, 103.525136, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(128, 'Sunset Lounge', 'Sunset Lounge', 10.586759, 103.542264, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(129, 'SV World Casino & Hotel', 'SV World Casino & Hotel', 10.632586, 103.508104, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(130, 'Ta Kloy Tip Bungalow', 'Ta Kloy Tip Bungalow ', 10.568721, 103.558336, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(131, 'The Beach Apartment', 'The Beach Apartment', 10.609552, 103.531637, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(132, 'The Black Bar', 'The Black Bar, Pub Square.', 10.60923, 103.523078, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(133, 'The Harbor Lights Palace', 'The Harbor Lights Palace', 10.633351, 103.501674, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(134, 'The Harbour Boutique Hotel', 'The Harbour Boutique Hotel, Victory Hill', 10.63249, 103.50344, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(135, 'The Rich Resort & Casino', 'The Rich Resort & Casino', 10.6359, 103.500856, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(136, 'The Tamarind', 'The Tamarind, 23 Tola Street', 10.604089, 103.528901, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(137, 'The Terrace Restaurant and Bar', 'The Terrace Restaurant and Bar', 10.610753, 103.525296, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(138, 'Top Cat Cinema', 'Top Cat Cinema', 10.609773, 103.522754, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(139, 'Two Season Guest House', 'Two Season Guest House, opposite Fortuna Casino.', 10.610932, 103.522624, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(140, 'V Lounge Bar & Club', 'V Lounge Bar & Club', 10.632475, 103.504537, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(141, 'Van Nasea', 'Van Nasea, pink building', 10.610337, 103.505912, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(142, 'Victory Paradise Resort & Casino', 'Victory Paradise Resort & Casino', 10.641052, 103.508094, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(143, 'Villa Ta Ek', 'Villa Ta Ek. Chocolate color building', 10.624415, 103.514498, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(144, 'Visethana Boutique', 'Visethana Boutique', 10.616219, 103.546848, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(145, 'White Beach Hotel', 'White Beach Hotel', 10.604404, 103.527153, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(146, 'White Boutique Hotel', 'White Boutique Hotel, Otres 2', 10.561437, 103.558182, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(147, 'White Sand Palace Hotel', 'White Sand Palace Hotel', 10.605777, 103.527563, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(148, 'White Sea Boutique', 'White Sea Boutique', 10.563232, 103.558697, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(149, 'Wish You Were Here... Guesthouse & Bar', 'Wish You Were Here... Guesthouse & Bar', 10.57787, 103.548148, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(150, 'Yaduoli Casino', 'Yaduoli Casino', 10.608811, 103.524755, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL),
(151, 'Zana Beach Guesthouse', 'Zana Beach Guesthouse', 10.608388, 103.526109, 'open', '2018-02-17 00:00:00', NULL, '00:00:00', '24:00:00', NULL, 'system', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `r_id` int(11) NOT NULL,
  `ca_id` int(11) NOT NULL,
  `r_name` varchar(50) NOT NULL,
  `r_name_en` varchar(50) DEFAULT NULL,
  `r_description` varchar(200) DEFAULT NULL,
  `r_description_en` varchar(200) DEFAULT NULL,
  `r_open_start` time DEFAULT NULL,
  `r_open_end` time DEFAULT NULL,
  `r_open_day` varchar(100) NOT NULL,
  `r_lat` double NOT NULL DEFAULT '0',
  `r_lng` double NOT NULL DEFAULT '0',
  `r_address` varchar(200) DEFAULT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`r_id`, `ca_id`, `r_name`, `r_name_en`, `r_description`, `r_description_en`, `r_open_start`, `r_open_end`, `r_open_day`, `r_lat`, `r_lng`, `r_address`, `add_datetime`) VALUES
(1, 2, 'happy cafe', NULL, 'Sushi & Bento ( lunch box) shop #Happy cafe\r\nSushi from 2.75$. Bento box from 3.5$. Very good And tasty food � please come and try our �', NULL, '09:00:00', '21:00:00', '', 10.616227, 103.533933, '111', '2018-02-16 23:29:47'),
(2, 1, '4 Seasion', '4 Seasion', '4 Seasion', '4 Seasion', '09:00:00', '21:00:00', '', 10.6082844, 103.5215186, NULL, '2018-02-27 20:33:34');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_category_link`
--

CREATE TABLE `restaurant_category_link` (
  `rcl_id` int(10) NOT NULL COMMENT 'auto_id',
  `rcl_r_id` int(11) DEFAULT NULL COMMENT 'restaurant_id',
  `rcl_ca_id` int(11) DEFAULT NULL COMMENT 'category_id',
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='restaurant classification';

--
-- Dumping data for table `restaurant_category_link`
--

INSERT INTO `restaurant_category_link` (`rcl_id`, `rcl_r_id`, `rcl_ca_id`, `add_datetime`) VALUES
(1, 1, 1, '2018-02-28 15:10:27');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_operation`
--

CREATE TABLE `restaurant_operation` (
  `open_id` int(11) NOT NULL,
  `open_day` varchar(200) DEFAULT NULL,
  `open_time_start` time DEFAULT NULL,
  `open_time_end` time DEFAULT NULL,
  `r_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restaurant_operation`
--

INSERT INTO `restaurant_operation` (`open_id`, `open_day`, `open_time_start`, `open_time_end`, `r_id`) VALUES
(1, 'Monday', '08:00:00', '22:00:00', 1),
(2, 'Tuesday\r\n', '08:00:00', '22:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `serial_number`
--

CREATE TABLE `serial_number` (
  `sn_number` char(20) NOT NULL,
  `sn_type` enum('order','coupons') NOT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `serial_number`
--

INSERT INTO `serial_number` (`sn_number`, `sn_type`, `add_datetime`) VALUES
('O2018021800000000001', 'order', '2018-02-18 22:49:54');

-- --------------------------------------------------------

--
-- Table structure for table `sms_log`
--

CREATE TABLE `sms_log` (
  `sl_id` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL,
  `dr_id` int(11) DEFAULT NULL,
  `ad_id` int(11) DEFAULT NULL,
  `sl_phone` varchar(20) NOT NULL,
  `sl_type` enum('phone_certification') NOT NULL,
  `sl_smstext` text NOT NULL,
  `sl_ip` varchar(50) NOT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `fb_u_id` bigint(20) DEFAULT NULL,
  `u_first_name` varchar(100) DEFAULT NULL,
  `u_last_name` varchar(100) DEFAULT NULL,
  `fb_name` varchar(50) DEFAULT NULL,
  `u_account` varchar(20) DEFAULT NULL,
  `u_email` varchar(100) DEFAULT NULL,
  `u_passwd` char(32) DEFAULT NULL,
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_fb_token` varchar(255) DEFAULT NULL,
  `u_status` enum('unlock','lock') NOT NULL DEFAULT 'unlock',
  `u_phone` varchar(12) DEFAULT NULL,
  `u_phone_verification` tinyint(1) NOT NULL DEFAULT '0',
  `u_phone_verification_code` char(6) DEFAULT NULL,
  `u_phone_verification_code_add_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `fb_u_id`, `u_first_name`, `u_last_name`, `fb_name`, `u_account`, `u_email`, `u_passwd`, `add_datetime`, `u_fb_token`, `u_status`, `u_phone`, `u_phone_verification`, `u_phone_verification_code`, `u_phone_verification_code_add_datetime`) VALUES
(1, 1833396450005501, NULL, NULL, '蔡政哲', NULL, NULL, 'd41d8cd98f00b204e9800998ecf8427e', '2018-02-20 20:58:07', NULL, 'unlock', NULL, 0, '742205', '2018-02-21 20:00:26'),
(13, NULL, NULL, NULL, NULL, 'rrrr1ww', NULL, '1c63129ae9db9c60c3e8aa94d3e00495', '2018-02-20 21:11:47', NULL, 'unlock', NULL, 0, NULL, '2018-02-21 18:10:31'),
(26, NULL, NULL, NULL, NULL, 'tryion', NULL, '1c63129ae9db9c60c3e8aa94d3e00495', '2018-02-20 22:04:57', NULL, 'unlock', NULL, 0, NULL, '2018-02-21 18:10:31'),
(27, NULL, 'phearun', 'Um', NULL, 'phearun', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2018-02-27 09:58:57', NULL, 'unlock', '016504488', 0, '165044', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_points`
--

CREATE TABLE `user_points` (
  `up_id` int(11) NOT NULL,
  `up_type` enum('login','quota-100','first','quota-300','quota-1000','phone_certification') NOT NULL,
  `u_id` int(11) NOT NULL,
  `up_score` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `add_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`ar_id`);

--
-- Indexes for table `admin_role_permissions_link`
--
ALTER TABLE `admin_role_permissions_link`
  ADD PRIMARY KEY (`apl_id`),
  ADD KEY `fk_pemissions_id` (`pe_id`),
  ADD KEY `fk_admin_role_id` (`ar_id`);

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `fk_pemissions_id_admin_user` (`ar_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ca_id`),
  ADD KEY `ca_parents_id` (`ca_parents_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`cp_id`),
  ADD KEY `fk_user_coupons` (`u_id`),
  ADD KEY `fk_order_coupons` (`o_id`);

--
-- Indexes for table `delivery_process`
--
ALTER TABLE `delivery_process`
  ADD PRIMARY KEY (`dp_id`),
  ADD KEY `fk_driver_id` (`dr_id`),
  ADD KEY `fk_order_id` (`o_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`dr_id`);

--
-- Indexes for table `error_log`
--
ALTER TABLE `error_log`
  ADD PRIMARY KEY (`el_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `f_r_id` (`r_id`);

--
-- Indexes for table `food_category_link`
--
ALTER TABLE `food_category_link`
  ADD PRIMARY KEY (`fc_id`),
  ADD UNIQUE KEY `f_id` (`f_id`,`ca_id`),
  ADD UNIQUE KEY `f_id_2` (`f_id`,`ca_id`),
  ADD KEY `fk_category1` (`ca_id`);

--
-- Indexes for table `food_set`
--
ALTER TABLE `food_set`
  ADD PRIMARY KEY (`fs_id`),
  ADD UNIQUE KEY `fs_parent_f_id` (`fs_parent_f_id`,`fs_child_f_id`,`fs_group_id`) USING BTREE,
  ADD UNIQUE KEY `fs_group_id` (`fs_group_id`,`fs_parent_f_id`,`fs_child_f_id`),
  ADD KEY `fk_food_id1` (`fs_child_f_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`o_id`,`od_item_index`),
  ADD KEY `od_f_id` (`f_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`o_id`),
  ADD KEY `fk_u_id` (`u_id`),
  ADD KEY `fk_status` (`o_status`),
  ADD KEY `fk_position` (`p_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`pe_id`),
  ADD UNIQUE KEY `pe_control` (`pe_control`,`pe_func`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `fk_user_position` (`u_id`),
  ADD KEY `fk_restauranterd_position` (`r_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`r_id`),
  ADD UNIQUE KEY `r_name` (`r_name`);

--
-- Indexes for table `restaurant_category_link`
--
ALTER TABLE `restaurant_category_link`
  ADD PRIMARY KEY (`rcl_id`),
  ADD KEY `fk_restaurant` (`rcl_r_id`),
  ADD KEY `fk_category` (`rcl_ca_id`);

--
-- Indexes for table `restaurant_operation`
--
ALTER TABLE `restaurant_operation`
  ADD PRIMARY KEY (`open_id`);

--
-- Indexes for table `serial_number`
--
ALTER TABLE `serial_number`
  ADD PRIMARY KEY (`sn_number`);

--
-- Indexes for table `sms_log`
--
ALTER TABLE `sms_log`
  ADD PRIMARY KEY (`sl_id`),
  ADD KEY `user_sms_log_u_id` (`u_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `fb_u_id` (`fb_u_id`),
  ADD UNIQUE KEY `u_name` (`u_account`),
  ADD UNIQUE KEY `u_email` (`u_email`),
  ADD KEY `fb_u_id_2` (`fb_u_id`),
  ADD KEY `u_account` (`u_account`);

--
-- Indexes for table `user_points`
--
ALTER TABLE `user_points`
  ADD PRIMARY KEY (`up_id`),
  ADD KEY `fk_user_id` (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `ar_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_role_permissions_link`
--
ALTER TABLE `admin_role_permissions_link`
  MODIFY `apl_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `delivery_process`
--
ALTER TABLE `delivery_process`
  MODIFY `dp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `dr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `error_log`
--
ALTER TABLE `error_log`
  MODIFY `el_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `food_category_link`
--
ALTER TABLE `food_category_link`
  MODIFY `fc_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_set`
--
ALTER TABLE `food_set`
  MODIFY `fs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `pe_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restaurant_category_link`
--
ALTER TABLE `restaurant_category_link`
  MODIFY `rcl_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'auto_id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `restaurant_operation`
--
ALTER TABLE `restaurant_operation`
  MODIFY `open_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sms_log`
--
ALTER TABLE `sms_log`
  MODIFY `sl_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_points`
--
ALTER TABLE `user_points`
  MODIFY `up_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_role_permissions_link`
--
ALTER TABLE `admin_role_permissions_link`
  ADD CONSTRAINT `fk_admin_role_id` FOREIGN KEY (`ar_id`) REFERENCES `admin_role` (`ar_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pemissions_id` FOREIGN KEY (`pe_id`) REFERENCES `permissions` (`pe_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD CONSTRAINT `fk_pemissions_id_admin_user` FOREIGN KEY (`ar_id`) REFERENCES `admin_role` (`ar_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `sms_log`
--
ALTER TABLE `sms_log`
  ADD CONSTRAINT `user_sms_log_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
