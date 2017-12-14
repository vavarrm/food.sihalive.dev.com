-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2017 年 10 月 21 日 13:12
-- 伺服器版本: 5.5.56-log
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
CREATE DATABASE IF NOT EXISTS `sihalive` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sihalive`;

-- --------------------------------------------------------

--
-- 資料表結構 `category`
--

CREATE TABLE `category` (
  `ca_id` int(11) NOT NULL,
  `ca_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `category`
--

INSERT INTO `category` (`ca_id`, `ca_name`) VALUES
(4, 'Barbecues'),
(2, 'Burgers'),
(6, 'Mexican'),
(3, 'Pizzas'),
(5, 'Sandwiches'),
(1, 'Sushi');

-- --------------------------------------------------------

--
-- 資料表結構 `food`
--

CREATE TABLE `food` (
  `f_id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `f_description` text NOT NULL,
  `ca_id` int(11) NOT NULL,
  `f_status` enum('sale_out','sale_on','sale_off','') NOT NULL DEFAULT 'sale_on',
  `f_price` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `food`
--

INSERT INTO `food` (`f_id`, `f_name`, `f_description`, `ca_id`, `f_status`, `f_price`) VALUES
(1, 'Rolls with Red Caviar', 'These rolls  always look great on the table, and of course, the taste is just wonderful. It is anoth', 1, 'sale_on', '12.50'),
(2, 'California Roll', 'A California roll is a fresh take on traditional Japanese rice rolls. Filled with avocado, crab, and', 1, 'sale_on', '13.90'),
(3, 'Sushi with Sesame', 'This sushi is very flexible, and is a perfect snack option for vegans! It’s also wonderful for appet', 1, 'sale_on', '10.90'),
(4, 'Maki Roll', 'Maki Roll is one of the most popular types of sushi in America. To see evidence of this all you have', 1, 'sale_on', '9.50'),
(5, 'Tempura Roll', 'Tempura roll is a simple outside thin roll.  It is rolled plain, and is sometimes garninshed with te', 1, 'sale_on', '25.00'),
(6, 'Spicy Tuna Roll', 'Spicy tuna roll includes diced or shredded tuna with hot peppers. The spicy sauce that sushi chefs use is usually orange and very hot.', 1, 'sale_on', '7.97'),
(7, 'Mushroom Burger', 'Portobello mushroom caps are wrapped with turkey bacon, and cooked in a hot oven, then placed on buns with horseradish sauce.', 2, 'sale_on', '12.50'),
(8, 'Cowboy Burger', 'Meat rub goes rogue with this amped up burger, rubbed with a savory blend of Smoky Montreal Steak Seasoning, chili powder and brown sugar.', 2, 'sale_on', '13.90'),
(9, 'The Perfect Burger', 'One of our most popular snacks, the Perfect Burger includes amazing fresh ingredients like pimento cheese, sesame oil and serrano chiles.', 2, 'sale_on', '10.90'),
(10, 'Hawaiian Burger', 'Grilled turkey burgers are served on toasted buns with slices of Cheddar cheese, red onion, and grilled pineapple.', 2, 'sale_on', '9.50'),
(11, 'Blue Cheese Burger', 'These hamburger patties are made with ground beef combined with blue cheese, Worcestershire sauce, and dry mustard.', 2, 'sale_on', '25.00'),
(12, 'Classic Cheeseburger', 'Alfalfa sprouts crown these juicy burgers. A combination of regular ground turkey and ground turkey breast offers superior texture.', 2, 'sale_on', '17.97'),
(13, 'Pizza Capricciosa', 'Crispy and delectable, this all-time favourite pizza Capricciosa, is made with a twist! Order it at FoodDelviery today!', 3, 'sale_on', '12.50'),
(14, 'Four Seasons Pizza', 'This pizza is served with four sections representing each season,  and if you’re looking for variety in pizza, this is what you need.', 3, 'sale_on', '10.90'),
(15, 'Royal Pizza', 'The most varied pizza that we offer our clients has the freshest and most popular ingredients including pork sausage, pepperoni etc.', 3, 'sale_on', '13.90'),
(16, 'Pizza Pepperoni', 'Our robust, tasty Pepperoni Pizza starts with our savory sauce of vine-ripened tomatoes, extra virgin olive oil, garlic, and spices.', 3, 'sale_on', '17.97'),
(17, 'Pizza Margherita', 'Our Margherita Pizza has a crisp yet chewy crust, the perfect canvas for bright homemade tomato sauce, fresh mozzarella, and basil.', 3, 'sale_on', '25.00'),
(18, 'Pizza Regina', 'A perfect combination of melted cheese, fresh tomatoes, basil and sausage makes this pizza one of the most popular options.', 3, 'sale_on', '25.00'),
(19, 'Beef Steak', 'Our version of Beef Steak combines a mushroom, tomato, and hot pepper sauce with tender medallions of beef tenderloin.', 4, 'sale_on', '12.50'),
(20, 'Hot Chicken Legs', 'Roasted chicken legs are covered with melted butter and hot pepper sauce in this quick and easy recipe perfect for a budget-friendly dinner.', 4, 'sale_on', '10.90'),
(21, 'Grilled Sausages', 'Sweet and savory flavors join for a terrific taste sensation when plump sausages are stuffed with prunes and wrapped with bacon.', 4, 'sale_on', '13.90'),
(22, 'Grilled Salmon Steak', 'This steak is our experiment with fried salmon, which quickly became popular among our customers and clients.', 4, 'sale_on', '17.97'),
(23, 'Grilled T-bone Steak', 'Real meatlovers will enjoy this amazing steak, which is tasty and juicy, especially with red wine and fried vegetables.', 4, 'sale_on', '25.00'),
(24, 'BBQ Pork Spare Ribs', 'Country-style ribs are cut from the loin, one of the leanest areas of pork. These ribs are seasoned, boiled until tender, then baked.', 4, 'sale_on', '25.00'),
(25, 'Vegetable Sandwich', 'This delicious vegetarian sandwich is made with freshly grilled zucchini, eggplant, red bell pepper, fresh mozzarella, and plum tomato.', 5, 'sale_on', '12.50'),
(26, 'Sandwich with Beef', 'Seasoned beef brisket is slow-cooked, shredded, and coated in barbeque sauce in this easy recipe that will make tantalizing sandwiches.', 5, 'sale_on', '10.90'),
(27, 'Sandwich with Pork', 'A combination of roasting, then barbecuing with sauce makes this pork sandwich a delicious southern style recipe.', 5, 'sale_on', '13.90'),
(28, 'Cheese Sandwich', 'Mozzarella cheese and fresh basil leaves make a wonderful summer sandwich when combined with dark artisan bread and white truffle oil.', 5, 'sale_on', '17.97'),
(29, 'Fish Sandwich', 'A simple fish sandwich that can be made with any white fish fillets. Served on sliced bread with steak sauce and Ranch dressing.', 5, 'sale_on', '25.00'),
(30, 'Grilled Panini', 'Seasoned white meat chicken topped with fresh tomatoes, baby spinach, and red onions, drizzled with a creamy sundried tomato sauce.', 5, 'sale_on', '25.00'),
(31, 'Portion of Chili Con Carne', 'This is something the whole family can enjoy. The portion can be spiced up or down to suit your needs.', 6, 'sale_on', '12.50'),
(32, 'Tortilla Chips and Salsa', 'No. 1 on our list of Mexican dishes, Tortilla Chips and Salsa is definitely something that describes the Mexican cuisine at its best.', 6, 'sale_on', '10.90'),
(33, 'Mexican Tacos', 'A staple dish in Mexico, this dish has ground beef mixed with popular Mexican spices. It can turn into a great family dinner!', 6, 'sale_on', '13.90'),
(34, 'Guacamole Dip', 'This avocado-based salad can be both smooth and chunky depending on your tastes. It is a perfect snack in the afternoon', 6, 'sale_on', '17.97'),
(35, 'Chili with Cheese', 'There are no rules when it comes to topping nachos; just go for what you like. We like this cheese-chili combination.', 6, 'sale_on', '25.00'),
(36, 'Tamales', 'This is a traditional Mexican dish made of masa or dough (starchy, and usually corn-based), which is steamed in a corn husk or banana leaf.', 6, 'sale_on', '25.00');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ca_name`,`ca_id`);

--
-- 資料表索引 `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`f_id`),
  ADD UNIQUE KEY `f_name` (`f_name`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `food`
--
ALTER TABLE `food`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
