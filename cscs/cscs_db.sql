-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2024 at 04:15 AM
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
-- Database: `cscs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Hot', 'Hot Coffee', 1, 0, '2022-04-22 09:59:46', '2022-04-22 09:59:46'),
(2, 'Cold', 'Cold Coffee', 1, 0, '2022-04-22 10:01:06', '2022-04-22 10:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` float(15,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `name`, `description`, `price`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 1, 'Arabica', 'Arabica is the most popular type of bean used for coffee. Arabica beans are considered higher quality than Robusta, and they\'re also more expensive.', 150.00, 1, 1, '2022-04-22 10:16:50', '2022-04-22 10:22:07'),
(2, 1, 'Robusta', 'Robusta beans are typically cheaper to produce because the Robusta plant is easier to grow.', 145.00, 1, 1, '2022-04-22 10:17:20', '2022-04-22 10:22:11'),
(3, 1, 'Black Coffee', 'Black coffee is made from plain ground coffee beans that are brewed hot. It\'s served without added sugar, milk, or flavorings.', 75.00, 1, 0, '2022-04-22 10:17:54', '2022-04-22 10:17:54'),
(4, 1, 'Decaf', 'Coffee beans naturally contain caffeine, but roasters can use several different processes to remove almost all of it. Decaf coffee is brewed with these decaffeinated beans.', 100.00, 1, 0, '2022-04-22 10:18:15', '2022-04-22 10:18:15'),
(5, 1, 'Espresso', 'Most people know that a shot of espresso is stronger than the same amount of coffee, but what\'s the difference, exactly? There isn\'t anything inherently different about the beans themselves, but when beans are used to make espresso they\'re more finely ground, and they\'re brewed with a higher grounds-to-water ratio than what\'s used for coffee.', 125.00, 1, 0, '2022-04-22 10:19:18', '2022-04-22 10:19:18'),
(6, 1, 'Latte', 'This classic drink is typically 1/3 espresso and 2/3 steamed milk, topped with a thin layer of foam, but coffee shops have come up with seemingly endless customizations. You can experiment with flavored syrups like vanilla and pumpkin spice or create a nondairy version by using oat milk. Skilled baristas often swirl the foam into latte art!', 125.00, 1, 0, '2022-04-22 10:19:47', '2022-04-22 10:19:47'),
(7, 1, 'Cappuccino', 'This espresso-based drink is similar to a latte, but the frothy top layer is thicker. The standard ratio is equal parts espresso, steamed milk, and foam. It\'s often served in a 6-ounce cup (smaller than a latte cup) and can be topped with a sprinkling of cinnamon.', 100.00, 1, 0, '2022-04-22 10:20:06', '2022-04-22 10:20:06'),
(8, 1, 'Macchiato', 'A macchiato is a shot of espresso with just a touch of steamed milk or foam. In Italian, macchiato means \"stained\" or \"spotted,\" so a caffè macchiato refers to coffee that\'s been stained with milk.', 150.00, 1, 0, '2022-04-22 10:20:26', '2022-04-22 10:20:26'),
(9, 2, 'Iced Coffee', 'Is there anything better than a glass of iced coffee on a hot day (or any day, for that matter)? The simplest way to make it: Brew a regular cup of hot coffee, then cool it over ice. Add whatever milk and sweeteners you like.', 150.00, 1, 0, '2022-04-22 10:20:53', '2022-04-22 10:20:53'),
(10, 2, 'Iced Latte', 'The chilled version of a latte is simply espresso and milk over ice.', 145.00, 1, 0, '2022-04-22 10:21:17', '2022-04-22 10:21:17'),
(11, 2, 'Cold Brew', 'Cold brew is one of the biggest coffee trends of the last decade, and for good reason: It\'s made by slowly steeping coffee grounds over cool or room-temperature water, so it tastes smoother and less bitter than regular iced coffee, which is brewed hot.', 140.00, 1, 0, '2022-04-22 10:21:42', '2022-04-22 10:21:42');

-- --------------------------------------------------------

--
-- Table structure for table `sale_list`
--

CREATE TABLE `sale_list` (
  `id` int(30) NOT NULL,
  `user_id` int(30) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `client_name` text NOT NULL,
  `amount` float(15,2) NOT NULL DEFAULT 0.00,
  `tendered` float(15,2) NOT NULL DEFAULT 0.00,
  `payment_type` tinyint(1) NOT NULL COMMENT '1 = Cash,\r\n2 = Online',
  `payment_code` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_list`
--

INSERT INTO `sale_list` (`id`, `user_id`, `code`, `client_name`, `amount`, `tendered`, `payment_type`, `payment_code`, `date_created`, `date_updated`) VALUES
(1, 1, '202204220001', 'Guest', 710.00, 1000.00, 1, '', '2022-04-22 13:54:44', '2022-04-22 13:54:44'),
(2, 2, '202204220002', 'Guest', 675.00, 700.00, 2, '123121ABcdF', '2022-04-22 15:27:02', '2022-04-22 15:27:02'),
(3, 4, '202407160001', 'Guest', 375.00, 1000.00, 1, '', '2024-07-16 09:04:50', '2024-07-16 09:04:50'),
(4, 4, '202407170001', 'Guest', 0.00, 0.00, 1, '', '2024-07-17 08:17:51', '2024-07-17 08:17:51'),
(5, 4, '202407170002', 'Guest', 140.00, 1000.00, 1, '', '2024-07-17 08:36:07', '2024-07-17 08:36:07'),
(6, 4, '202407170003', 'Guest', 295.00, 0.00, 1, '', '2024-07-17 09:28:05', '2024-07-17 09:28:05'),
(7, 4, '202407170004', 'Guest', 1110.00, 0.00, 1, '', '2024-07-17 11:13:16', '2024-07-17 11:13:16'),
(8, 4, '202407170005', 'Guest', 640.00, 1000.00, 1, '', '2024-07-17 14:31:16', '2024-07-17 14:31:16'),
(9, 4, '202407170006', 'ram bahadur', 150.00, 150.00, 1, '', '2024-07-17 14:32:57', '2024-07-17 14:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `sale_products`
--

CREATE TABLE `sale_products` (
  `sale_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(10) NOT NULL,
  `price` float(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_products`
--

INSERT INTO `sale_products` (`sale_id`, `product_id`, `qty`, `price`) VALUES
(1, 11, 3, 140.00),
(1, 10, 2, 145.00),
(2, 9, 1, 150.00),
(2, 3, 3, 75.00),
(2, 8, 2, 150.00),
(3, 7, 1, 100.00),
(3, 5, 1, 125.00),
(3, 9, 1, 150.00),
(5, 11, 1, 140.00),
(6, 10, 1, 145.00),
(6, 9, 1, 150.00),
(7, 10, 1, 145.00),
(7, 9, 1, 150.00),
(7, 11, 1, 140.00),
(7, 3, 1, 75.00),
(7, 7, 1, 100.00),
(7, 4, 1, 100.00),
(7, 5, 1, 125.00),
(7, 8, 1, 150.00),
(7, 6, 1, 125.00),
(8, 3, 2, 75.00),
(8, 7, 1, 100.00),
(8, 4, 1, 100.00),
(8, 11, 1, 140.00),
(8, 9, 1, 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Jabez Café System'),
(6, 'short_name', 'Jabez Café'),
(11, 'logo', 'uploads/logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1649834664', NULL, 1, '2021-01-20 14:02:37', '2022-04-13 15:24:24'),
(2, 'Raju', 'B.K', 'raju', '202cb962ac59075b964b07152d234b70', 'uploads/avatars/2.png?v=1650520142', NULL, 3, '2022-04-21 13:49:02', '2024-07-16 09:29:55'),
(4, 'Josh', 'Pariyar', 'josh', '202cb962ac59075b964b07152d234b70', 'uploads/avatars/4.png?v=1650531008', NULL, 3, '2022-04-21 16:50:08', '2024-07-16 08:24:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sale_list`
--
ALTER TABLE `sale_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sale_products`
--
ALTER TABLE `sale_products`
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sale_list`
--
ALTER TABLE `sale_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `category_id_fk_pl` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sale_list`
--
ALTER TABLE `sale_list`
  ADD CONSTRAINT `user_id_fk_sl` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `sale_products`
--
ALTER TABLE `sale_products`
  ADD CONSTRAINT `product_id_fk_sp` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `sale_id_fk_sp` FOREIGN KEY (`sale_id`) REFERENCES `sale_list` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
