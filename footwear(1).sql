-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 24, 2021 at 04:49 PM
-- Server version: 8.0.22-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `footwear`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210119145508', '2021-01-19 20:25:50', 46),
('DoctrineMigrations\\Version20210119165339', '2021-01-19 22:23:49', 244),
('DoctrineMigrations\\Version20210119170504', '2021-01-19 22:35:09', 75),
('DoctrineMigrations\\Version20210119170715', '2021-01-19 22:37:20', 61),
('DoctrineMigrations\\Version20210119170820', '2021-01-19 22:38:23', 184),
('DoctrineMigrations\\Version20210119183628', '2021-01-20 00:06:35', 98),
('DoctrineMigrations\\Version20210121064917', '2021-01-21 12:19:25', 328),
('DoctrineMigrations\\Version20210121094417', '2021-01-21 15:14:21', 113),
('DoctrineMigrations\\Version20210121094527', '2021-01-21 15:15:30', 28),
('DoctrineMigrations\\Version20210122071359', '2021-01-22 12:44:05', 141),
('DoctrineMigrations\\Version20210122072353', '2021-01-22 12:53:58', 60),
('DoctrineMigrations\\Version20210123075444', '2021-01-23 13:25:10', 117),
('DoctrineMigrations\\Version20210123080025', '2021-01-23 13:30:35', 195);

-- --------------------------------------------------------

--
-- Table structure for table `footwear_category`
--

CREATE TABLE `footwear_category` (
  `id` int NOT NULL,
  `managed_by_id` int NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footwear_category`
--

INSERT INTO `footwear_category` (`id`, `managed_by_id`, `category_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 'Shoes', '<div>some description</div>', '2021-01-01 00:10:02', '2021-01-20 23:43:29'),
(2, 6, 'Sandles', '<div>some description</div>', '2021-01-01 00:10:02', '2021-01-23 13:51:17'),
(4, 2, 'Heels', '<div>long heels</div>', '2021-01-20 14:27:54', '2021-01-20 14:27:54'),
(5, 2, 'Boots', '<div>some</div>', '2021-01-20 14:28:14', '2021-01-20 23:44:17'),
(6, 3, 'Flats', '<div>new</div>', '2021-01-20 15:42:08', '2021-01-20 23:44:57'),
(13, 6, 'vashu', '<div>some</div>', '2021-01-24 16:26:54', '2021-01-24 16:26:54');

-- --------------------------------------------------------

--
-- Table structure for table `footwear_product`
--

CREATE TABLE `footwear_product` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `manager_id` int NOT NULL,
  `footwear_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `colour` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `section` enum('male','female','kids') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `durability` enum('HIGH','MEDIUM','LOW') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ease_to_wear` enum('EASY','MEDIUM','DIFFICULT') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailed_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity_in_stock` int NOT NULL,
  `market_price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `selling_price` double NOT NULL,
  `weight` double NOT NULL,
  `occasion` enum('PARTY WEAR','CASUAL WEAR','OFFICE WEAR') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` enum('3 STAR','4 STAR','5 STAR') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sole_type` enum('','RUBBER','CAMP','CORK') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lace_type` enum('','COTTON','NYLON','ELASTIC') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `made_in` enum('INDIA','AMERICA','GEORGIA','OTHERS') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('NEW','REVIEW','PUBLISHED') COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footwear_product`
--

INSERT INTO `footwear_product` (`id`, `category_id`, `manager_id`, `footwear_type`, `colour`, `brand`, `size`, `product_image`, `created_at`, `updated_at`, `section`, `durability`, `ease_to_wear`, `material`, `short_description`, `detailed_description`, `quantity_in_stock`, `market_price`, `discount`, `selling_price`, `weight`, `occasion`, `rating`, `attribute1`, `sole_type`, `lace_type`, `made_in`, `status`) VALUES
(199, 2, 2, 'Wedges', 'white', 'Cobra King MIM', 5, 'whitewedges.jpeg', '2021-01-22 12:59:59', '2021-01-22 14:44:24', 'female', 'MEDIUM', 'MEDIUM', 'PU', '<div>excruciating heels</div>', '<div>more comfortable to wear</div>', 10, 6200, 200, 6000, 12, 'OFFICE WEAR', '5 STAR', 'new attribute5', '', '', 'AMERICA', 'PUBLISHED'),
(200, 2, 2, 'Sandals', 'Pink', 'Fourteen DJ-4', 4, 'pink.jpeg', '2021-01-22 12:59:59', '2021-01-22 12:59:59', 'female', 'HIGH', 'EASY', 'leathers', 'nice well-made', 'protective and comfortable', 20, 1200, 100, 1100, 10, 'PARTY WEAR', '4 STAR', 'new attribute6', '', '', 'INDIA', 'NEW'),
(202, 1, 2, 'Formal Shoes', 'black', 'redtape', 7, 'blackshoes.jpeg', '2021-01-22 12:59:59', '2021-01-23 01:47:43', 'kids', 'HIGH', 'EASY', 'canvas', '<div>Good choice Product</div>', '<div>very nice product for kids</div>', 10, 1000, 100, 900, 10, 'CASUAL WEAR', '3 STAR', 'new attribute8', 'RUBBER', 'COTTON', 'INDIA', 'PUBLISHED'),
(204, 2, 2, 'Gladiator Sandals', 'black', 'Ping Glide', 6, 'sandals.jpeg', '2021-01-22 12:59:59', '2021-01-22 14:44:52', 'female', 'HIGH', 'EASY', 'nubuck', '<div>strappy sandal</div>', '<div>Grecian glamour</div>', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute10', '', '', 'INDIA', 'PUBLISHED'),
(208, 1, 2, 'Boat Boots', 'Brown', 'U.S. Polo Assn.', 8, 'brownboots.jpeg', '2021-01-22 14:00:41', '2021-01-23 01:47:27', 'male', 'HIGH', 'DIFFICULT', 'canvas', '<div>nice product</div>', '<div>the stitching is highly durable</div>', 20, 1500, 300, 1200, 12, 'PARTY WEAR', '4 STAR', 'new attribute3', 'CAMP', 'ELASTIC', 'GEORGIA', 'PUBLISHED'),
(210, 2, 2, 'Wedges', 'white', 'Cobra King MIM', 5, 'whitewedges.jpeg', '2021-01-22 14:00:41', '2021-01-22 14:00:41', 'female', 'MEDIUM', 'MEDIUM', 'PU', 'excruciating heels', 'more comfortable to wear', 10, 6200, 200, 6000, 12, 'OFFICE WEAR', '5 STAR', 'new attribute5', '', '', 'AMERICA', 'NEW'),
(211, 2, 2, 'Sandals', 'Pink', 'Fourteen DJ-4', 4, 'pink.jpeg', '2021-01-22 14:00:41', '2021-01-22 14:00:41', 'female', 'HIGH', 'EASY', 'leathers', 'nice well-made', 'protective and comfortable', 20, 1200, 100, 1100, 10, 'PARTY WEAR', '4 STAR', 'new attribute6', '', '', 'INDIA', 'NEW'),
(212, 6, 2, 'Loafers', 'brown', 'Rockport', 5, 'brownloafers.jpeg', '2021-01-22 14:00:41', '2021-01-22 14:00:41', 'kids', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 30, 1000, 100, 900, 10, 'CASUAL WEAR', '4 STAR', 'new attribute7', 'RUBBER', '', 'GEORGIA', 'NEW'),
(213, 1, 2, 'Formal Shoes', 'black', 'redtape', 7, 'blackshoes.jpeg', '2021-01-22 14:00:41', '2021-01-22 14:45:10', 'kids', 'HIGH', 'EASY', 'canvas', '<div>Good choice Product</div>', '<div>very nice product for kids</div>', 10, 1000, 100, 900, 10, 'CASUAL WEAR', '3 STAR', 'new attribute8', 'RUBBER', 'COTTON', 'INDIA', 'PUBLISHED'),
(214, 5, 2, 'Ankle Boots', 'black', 'Callaway Jaws MD5', 5, 'ancle.jpeg', '2021-01-22 14:00:41', '2021-01-22 14:00:41', 'female', 'HIGH', 'MEDIUM', 'synthetics', 'versatile', 'Pixie boots have cute pointed toes', 20, 4000, 200, 3800, 10, 'OFFICE WEAR', '5 STAR', 'new attribute9', 'CAMP', '', 'AMERICA', 'NEW'),
(215, 2, 2, 'Gladiator Sandals', 'black', 'Ping Glide', 6, 'sandals.jpeg', '2021-01-22 14:00:41', '2021-01-22 14:00:41', 'female', 'HIGH', 'EASY', 'nubuck', 'strappy sandal', 'Grecian glamour', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute10', '', '', 'INDIA', 'NEW'),
(216, 4, 2, 'Stilettos', 'blue', 'Clarks', 6, 'blue.jpeg', '2021-01-22 14:00:41', '2021-01-22 14:45:35', 'female', 'LOW', 'DIFFICULT', 'polyester', '<div>stiletto heel</div>', '<div>Padded insole, textured outsole Upper &amp; Lining 1</div>', 20, 2500, 300, 2200, 15, 'PARTY WEAR', '4 STAR', 'new attribute10', 'RUBBER', 'COTTON', 'INDIA', 'PUBLISHED'),
(218, 1, 1, 'Formal', 'brown', 'Redtape', 8, 'brownshoes.jpeg', '2021-01-23 00:23:04', '2021-01-23 20:57:01', 'male', 'HIGH', 'EASY', 'genuine', '<div>nice product</div>', '<div>very nice product</div>', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'PUBLISHED'),
(219, 1, 2, 'Formal Shoes', 'brown', 'Redtape', 8, 'brownshoes.jpeg', '2021-01-23 00:24:33', '2021-01-24 00:17:15', 'male', 'HIGH', 'EASY', 'genuine', '<div>nice product</div>', '<div>very nice product</div>', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'PUBLISHED'),
(220, 1, 2, 'Sport Shoes', 'Grey', 'PUMA', 7, 'greyshoes.jpeg', '2021-01-23 00:24:33', '2021-01-23 00:24:33', 'male', 'MEDIUM', 'EASY', 'synthetics', 'High quality', 'maximum comfort and performance', 15, 2000, 500, 1500, 8, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', 'NYLON', 'AMERICA', 'NEW'),
(221, 1, 2, 'Boat Boots', 'Brown', 'U.S. Polo Assn.', 8, 'brownboots.jpeg', '2021-01-23 00:24:33', '2021-01-23 01:45:31', 'male', 'HIGH', 'DIFFICULT', 'canvas', '<div>nice product</div>', '<div>the stitching is highly durable</div>', 20, 1500, 300, 1200, 12, 'PARTY WEAR', '4 STAR', 'new attribute', 'CAMP', 'ELASTIC', 'GEORGIA', 'PUBLISHED'),
(222, 1, 2, 'Sport Shoes', 'Peach', 'Sparx', 5, 'peach.jpeg', '2021-01-23 00:24:33', '2021-01-23 00:24:33', 'female', 'HIGH', 'EASY', 'mesh fabric', 'comfortable', 'fabric portion encases your foot entirely', 20, 3000, 200, 2800, 7, 'CASUAL WEAR', '5 STAR', 'new attribute', 'RUBBER', 'COTTON', 'GEORGIA', 'NEW'),
(223, 2, 2, 'Wedges', 'white', 'Cobra King MIM', 5, 'whitewedges.jpeg', '2021-01-23 00:24:33', '2021-01-23 00:24:33', 'female', 'MEDIUM', 'MEDIUM', 'PU', 'excruciating heels', 'more comfortable to wear', 10, 6200, 200, 6000, 12, 'OFFICE WEAR', '5 STAR', 'new attribute', '', '', 'AMERICA', 'NEW'),
(224, 2, 2, 'Sandals', 'Pink', 'Fourteen DJ-4', 4, 'pink.jpeg', '2021-01-23 00:24:33', '2021-01-23 00:24:33', 'female', 'HIGH', 'EASY', 'leathers', 'nice well-made', 'protective and comfortable', 20, 1200, 100, 1100, 10, 'PARTY WEAR', '4 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(225, 6, 2, 'Loafers', 'brown', 'Rockport', 5, 'brownloafers.jpeg', '2021-01-23 00:24:33', '2021-01-23 00:24:33', 'kids', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 30, 1000, 100, 900, 10, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', '', 'GEORGIA', 'NEW'),
(226, 1, 2, 'Formal Shoes', 'black', 'redtape', 7, 'blackshoes.jpeg', '2021-01-23 00:24:33', '2021-01-23 00:24:33', 'kids', 'HIGH', 'EASY', 'canvas', 'Good choice Product', 'very nice product for kids', 10, 1000, 100, 900, 10, 'CASUAL WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(227, 5, 2, 'Ankle Boots', 'black', 'Callaway Jaws MD5', 5, 'ancle.jpeg', '2021-01-23 00:24:33', '2021-01-23 00:24:33', 'female', 'HIGH', 'MEDIUM', 'synthetics', 'versatile', 'Pixie boots have cute pointed toes', 20, 4000, 200, 3800, 10, 'OFFICE WEAR', '5 STAR', 'new attribute', 'CAMP', '', 'AMERICA', 'NEW'),
(228, 2, 2, 'Gladiator Sandals', 'black', 'Ping Glide', 6, 'sandals.jpeg', '2021-01-23 00:24:33', '2021-01-23 00:24:33', 'female', 'HIGH', 'EASY', 'nubuck', 'strappy sandal', 'Grecian glamour', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(229, 4, 2, 'Stilettos', 'blue', 'Clarks', 6, 'blue.jpeg', '2021-01-23 00:24:33', '2021-01-23 00:24:33', 'female', 'LOW', 'DIFFICULT', 'polyester', 'stiletto heel', 'Padded insole, textured outsole Upper & Lining 1', 20, 2500, 300, 2200, 15, 'PARTY WEAR', '4 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(230, 1, 2, 'Formal Shoes', 'brown', 'Redtape', 8, 'brownshoes.jpeg', '2021-01-23 01:43:52', '2021-01-24 15:22:14', 'male', 'HIGH', 'EASY', 'genuine', '<div>nice product</div>', '<div>very nice product</div>', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'PUBLISHED'),
(231, 1, 2, 'Sport Shoes', 'Grey', 'PUMA', 7, 'greyshoes.jpeg', '2021-01-23 01:43:53', '2021-01-23 01:47:11', 'male', 'MEDIUM', 'EASY', 'synthetics', '<div>High quality</div>', '<div>maximum comfort and performance</div>', 15, 2000, 500, 1500, 8, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', 'NYLON', 'AMERICA', 'PUBLISHED'),
(232, 1, 2, 'Boat Boots', 'Brown', 'U.S. Polo Assn.', 8, 'brownboots.jpeg', '2021-01-23 01:43:53', '2021-01-23 01:43:53', 'male', 'HIGH', 'DIFFICULT', 'canvas', 'nice product', 'the stitching is highly durable', 20, 1500, 300, 1200, 12, 'PARTY WEAR', '4 STAR', 'new attribute', 'CAMP', 'ELASTIC', 'GEORGIA', 'NEW'),
(233, 1, 2, 'Sport Shoes', 'Peach', 'Sparx', 5, 'peach.jpeg', '2021-01-23 01:43:53', '2021-01-23 01:43:53', 'female', 'HIGH', 'EASY', 'mesh fabric', 'comfortable', 'fabric portion encases your foot entirely', 20, 3000, 200, 2800, 7, 'CASUAL WEAR', '5 STAR', 'new attribute', 'RUBBER', 'COTTON', 'GEORGIA', 'NEW'),
(234, 2, 2, 'Wedges', 'white', 'Cobra King MIM', 5, 'whitewedges.jpeg', '2021-01-23 01:43:53', '2021-01-23 01:43:53', 'female', 'MEDIUM', 'MEDIUM', 'PU', 'excruciating heels', 'more comfortable to wear', 10, 6200, 200, 6000, 12, 'OFFICE WEAR', '5 STAR', 'new attribute', '', '', 'AMERICA', 'NEW'),
(235, 2, 2, 'Sandals', 'Pink', 'Fourteen DJ-4', 4, 'pink.jpeg', '2021-01-23 01:43:53', '2021-01-23 01:43:53', 'female', 'HIGH', 'EASY', 'leathers', 'nice well-made', 'protective and comfortable', 20, 1200, 100, 1100, 10, 'PARTY WEAR', '4 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(236, 6, 2, 'Loafers', 'brown', 'Rockport', 5, 'brownloafers.jpeg', '2021-01-23 01:43:53', '2021-01-23 01:43:53', 'kids', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 30, 1000, 100, 900, 10, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', '', 'GEORGIA', 'NEW'),
(237, 1, 2, 'Formal Shoes', 'black', 'redtape', 7, 'blackshoes.jpeg', '2021-01-23 01:43:53', '2021-01-23 01:43:53', 'kids', 'HIGH', 'EASY', 'canvas', 'Good choice Product', 'very nice product for kids', 10, 1000, 100, 900, 10, 'CASUAL WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(238, 5, 2, 'Ankle Boots', 'black', 'Callaway Jaws MD5', 5, 'ancle.jpeg', '2021-01-23 01:43:53', '2021-01-23 01:43:53', 'female', 'HIGH', 'MEDIUM', 'synthetics', 'versatile', 'Pixie boots have cute pointed toes', 20, 4000, 200, 3800, 10, 'OFFICE WEAR', '5 STAR', 'new attribute', 'CAMP', '', 'AMERICA', 'NEW'),
(239, 2, 2, 'Gladiator Sandals', 'black', 'Ping Glide', 6, 'sandals.jpeg', '2021-01-23 01:43:53', '2021-01-23 01:43:53', 'female', 'HIGH', 'EASY', 'nubuck', 'strappy sandal', 'Grecian glamour', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(240, 4, 2, 'Stilettos', 'blue', 'Clarks', 6, 'blue.jpeg', '2021-01-23 01:43:53', '2021-01-23 01:43:53', 'female', 'LOW', 'DIFFICULT', 'polyester', 'stiletto heel', 'Padded insole, textured outsole Upper & Lining 1', 20, 2500, 300, 2200, 15, 'PARTY WEAR', '4 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(241, 1, 2, 'Formal Shoes', 'brown', 'Redtape', 8, 'brownshoes.jpeg', '2021-01-23 13:40:25', '2021-01-23 13:40:25', 'male', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(242, 1, 2, 'Sport Shoes', 'Grey', 'PUMA', 7, 'greyshoes.jpeg', '2021-01-23 13:40:25', '2021-01-23 13:40:25', 'male', 'MEDIUM', 'EASY', 'synthetics', 'High quality', 'maximum comfort and performance', 15, 2000, 500, 1500, 8, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', 'NYLON', 'AMERICA', 'NEW'),
(243, 1, 2, 'Boat Boots', 'Brown', 'U.S. Polo Assn.', 8, 'brownboots.jpeg', '2021-01-23 13:40:25', '2021-01-23 13:40:25', 'male', 'HIGH', 'DIFFICULT', 'canvas', 'nice product', 'the stitching is highly durable', 20, 1500, 300, 1200, 12, 'PARTY WEAR', '4 STAR', 'new attribute', 'CAMP', 'ELASTIC', 'GEORGIA', 'NEW'),
(244, 1, 2, 'Sport Shoes', 'Peach', 'Sparx', 5, 'peach.jpeg', '2021-01-23 13:40:25', '2021-01-23 13:40:25', 'female', 'HIGH', 'EASY', 'mesh fabric', 'comfortable', 'fabric portion encases your foot entirely', 20, 3000, 200, 2800, 7, 'CASUAL WEAR', '5 STAR', 'new attribute', 'RUBBER', 'COTTON', 'GEORGIA', 'NEW'),
(245, 2, 2, 'Wedges', 'white', 'Cobra King MIM', 5, 'whitewedges.jpeg', '2021-01-23 13:40:25', '2021-01-23 13:40:25', 'female', 'MEDIUM', 'MEDIUM', 'PU', 'excruciating heels', 'more comfortable to wear', 10, 6200, 200, 6000, 12, 'OFFICE WEAR', '5 STAR', 'new attribute', '', '', 'AMERICA', 'NEW'),
(246, 2, 2, 'Sandals', 'Pink', 'Fourteen DJ-4', 4, 'pink.jpeg', '2021-01-23 13:40:25', '2021-01-23 13:40:25', 'female', 'HIGH', 'EASY', 'leathers', 'nice well-made', 'protective and comfortable', 20, 1200, 100, 1100, 10, 'PARTY WEAR', '4 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(247, 6, 2, 'Loafers', 'brown', 'Rockport', 5, 'brownloafers.jpeg', '2021-01-23 13:40:26', '2021-01-23 13:40:26', 'kids', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 30, 1000, 100, 900, 10, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', '', 'GEORGIA', 'NEW'),
(248, 1, 2, 'Formal Shoes', 'black', 'redtape', 7, 'blackshoes.jpeg', '2021-01-23 13:40:26', '2021-01-24 15:22:57', 'kids', 'HIGH', 'EASY', 'canvas', '<div>Good choice Product</div>', '<div>very nice product for kids</div>', 10, 1000, 100, 900, 10, 'CASUAL WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'PUBLISHED'),
(249, 5, 2, 'Ankle Boots', 'black', 'Callaway Jaws MD5', 5, 'ancle.jpeg', '2021-01-23 13:40:26', '2021-01-23 13:40:26', 'female', 'HIGH', 'MEDIUM', 'synthetics', 'versatile', 'Pixie boots have cute pointed toes', 20, 4000, 200, 3800, 10, 'OFFICE WEAR', '5 STAR', 'new attribute', 'CAMP', '', 'AMERICA', 'NEW'),
(250, 2, 2, 'Gladiator Sandals', 'black', 'Ping Glide', 6, 'sandals.jpeg', '2021-01-23 13:40:26', '2021-01-23 13:40:26', 'female', 'HIGH', 'EASY', 'nubuck', 'strappy sandal', 'Grecian glamour', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(251, 4, 2, 'Stilettos', 'blue', 'Clarks', 6, 'blue.jpeg', '2021-01-23 13:40:26', '2021-01-23 13:40:26', 'female', 'LOW', 'DIFFICULT', 'polyester', 'stiletto heel', 'Padded insole, textured outsole Upper & Lining 1', 20, 2500, 300, 2200, 15, 'PARTY WEAR', '4 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(252, 1, 2, 'Formal Shoes', 'brown', 'Redtape', 8, 'brownshoes.jpeg', '2021-01-23 17:48:18', '2021-01-23 17:48:18', 'male', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(253, 1, 2, 'Sport Shoes', 'Grey', 'PUMA', 7, 'greyshoes.jpeg', '2021-01-23 17:48:18', '2021-01-23 17:48:18', 'male', 'MEDIUM', 'EASY', 'synthetics', 'High quality', 'maximum comfort and performance', 15, 2000, 500, 1500, 8, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', 'NYLON', 'AMERICA', 'NEW'),
(254, 1, 2, 'Boat Boots', 'Brown', 'U.S. Polo Assn.', 8, 'brownboots.jpeg', '2021-01-23 17:48:18', '2021-01-23 17:48:18', 'male', 'HIGH', 'DIFFICULT', 'canvas', 'nice product', 'the stitching is highly durable', 20, 1500, 300, 1200, 12, 'PARTY WEAR', '4 STAR', 'new attribute', 'CAMP', 'ELASTIC', 'GEORGIA', 'NEW'),
(255, 1, 2, 'Sport Shoes', 'Peach', 'Sparx', 5, 'peach.jpeg', '2021-01-23 17:48:18', '2021-01-23 17:48:18', 'female', 'HIGH', 'EASY', 'mesh fabric', 'comfortable', 'fabric portion encases your foot entirely', 20, 3000, 200, 2800, 7, 'CASUAL WEAR', '5 STAR', 'new attribute', 'RUBBER', 'COTTON', 'GEORGIA', 'NEW'),
(256, 2, 2, 'Wedges', 'white', 'Cobra King MIM', 5, 'whitewedges.jpeg', '2021-01-23 17:48:18', '2021-01-23 17:48:18', 'female', 'MEDIUM', 'MEDIUM', 'PU', 'excruciating heels', 'more comfortable to wear', 10, 6200, 200, 6000, 12, 'OFFICE WEAR', '5 STAR', 'new attribute', '', '', 'AMERICA', 'NEW'),
(257, 2, 2, 'Sandals', 'Pink', 'Fourteen DJ-4', 4, 'pink.jpeg', '2021-01-23 17:48:18', '2021-01-23 17:48:18', 'female', 'HIGH', 'EASY', 'leathers', 'nice well-made', 'protective and comfortable', 20, 1200, 100, 1100, 10, 'PARTY WEAR', '4 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(258, 6, 2, 'Loafers', 'brown', 'Rockport', 5, 'brownloafers.jpeg', '2021-01-23 17:48:18', '2021-01-23 17:48:18', 'kids', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 30, 1000, 100, 900, 10, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', '', 'GEORGIA', 'NEW'),
(259, 1, 2, 'Formal Shoes', 'black', 'redtape', 7, 'blackshoes.jpeg', '2021-01-23 17:48:18', '2021-01-23 17:48:18', 'kids', 'HIGH', 'EASY', 'canvas', 'Good choice Product', 'very nice product for kids', 10, 1000, 100, 900, 10, 'CASUAL WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(260, 5, 2, 'Ankle Boots', 'black', 'Callaway Jaws MD5', 5, 'ancle.jpeg', '2021-01-23 17:48:18', '2021-01-23 17:48:18', 'female', 'HIGH', 'MEDIUM', 'synthetics', 'versatile', 'Pixie boots have cute pointed toes', 20, 4000, 200, 3800, 10, 'OFFICE WEAR', '5 STAR', 'new attribute', 'CAMP', '', 'AMERICA', 'NEW'),
(261, 2, 2, 'Gladiator Sandals', 'black', 'Ping Glide', 6, 'sandals.jpeg', '2021-01-23 17:48:19', '2021-01-23 17:48:19', 'female', 'HIGH', 'EASY', 'nubuck', 'strappy sandal', 'Grecian glamour', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(262, 4, 2, 'Stilettos', 'blue', 'Clarks', 6, 'blue.jpeg', '2021-01-23 17:48:19', '2021-01-23 17:48:19', 'female', 'LOW', 'DIFFICULT', 'polyester', 'stiletto heel', 'Padded insole, textured outsole Upper & Lining 1', 20, 2500, 300, 2200, 15, 'PARTY WEAR', '4 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(263, 1, 2, 'Formal Shoes', 'brown', 'Redtape', 8, 'brownshoes.jpeg', '2021-01-24 00:12:43', '2021-01-24 15:22:43', 'male', 'HIGH', 'EASY', 'genuine', '<div>nice product</div>', '<div>very nice product</div>', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'PUBLISHED'),
(264, 1, 2, 'Sport Shoes', 'Grey', 'PUMA', 7, 'greyshoes.jpeg', '2021-01-24 00:12:43', '2021-01-24 00:12:43', 'male', 'MEDIUM', 'EASY', 'synthetics', 'High quality', 'maximum comfort and performance', 15, 2000, 500, 1500, 8, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', 'NYLON', 'AMERICA', 'NEW'),
(265, 1, 2, 'Boat Boots', 'Brown', 'U.S. Polo Assn.', 8, 'brownboots.jpeg', '2021-01-24 00:12:43', '2021-01-24 00:12:43', 'male', 'HIGH', 'DIFFICULT', 'canvas', 'nice product', 'the stitching is highly durable', 20, 1500, 300, 1200, 12, 'PARTY WEAR', '4 STAR', 'new attribute', 'CAMP', 'ELASTIC', 'GEORGIA', 'NEW'),
(266, 1, 2, 'Sport Shoes', 'Peach', 'Sparx', 5, 'peach.jpeg', '2021-01-24 00:12:43', '2021-01-24 00:12:43', 'female', 'HIGH', 'EASY', 'mesh fabric', 'comfortable', 'fabric portion encases your foot entirely', 20, 3000, 200, 2800, 7, 'CASUAL WEAR', '5 STAR', 'new attribute', 'RUBBER', 'COTTON', 'GEORGIA', 'NEW'),
(267, 2, 2, 'Wedges', 'white', 'Cobra King MIM', 5, 'whitewedges.jpeg', '2021-01-24 00:12:43', '2021-01-24 00:12:43', 'female', 'MEDIUM', 'MEDIUM', 'PU', 'excruciating heels', 'more comfortable to wear', 10, 6200, 200, 6000, 12, 'OFFICE WEAR', '5 STAR', 'new attribute', '', '', 'AMERICA', 'NEW'),
(268, 2, 2, 'Sandals', 'Pink', 'Fourteen DJ-4', 4, 'pink.jpeg', '2021-01-24 00:12:43', '2021-01-24 00:12:43', 'female', 'HIGH', 'EASY', 'leathers', 'nice well-made', 'protective and comfortable', 20, 1200, 100, 1100, 10, 'PARTY WEAR', '4 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(269, 6, 2, 'Loafers', 'brown', 'Rockport', 5, 'brownloafers.jpeg', '2021-01-24 00:12:43', '2021-01-24 00:12:43', 'kids', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 30, 1000, 100, 900, 10, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', '', 'GEORGIA', 'NEW'),
(270, 1, 2, 'Formal Shoes', 'black', 'redtape', 7, 'blackshoes.jpeg', '2021-01-24 00:12:43', '2021-01-24 00:12:43', 'kids', 'HIGH', 'EASY', 'canvas', 'Good choice Product', 'very nice product for kids', 10, 1000, 100, 900, 10, 'CASUAL WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(271, 5, 2, 'Ankle Boots', 'black', 'Callaway Jaws MD5', 5, 'ancle.jpeg', '2021-01-24 00:12:43', '2021-01-24 00:12:43', 'female', 'HIGH', 'MEDIUM', 'synthetics', 'versatile', 'Pixie boots have cute pointed toes', 20, 4000, 200, 3800, 10, 'OFFICE WEAR', '5 STAR', 'new attribute', 'CAMP', '', 'AMERICA', 'NEW'),
(272, 2, 2, 'Gladiator Sandals', 'black', 'Ping Glide', 6, 'sandals.jpeg', '2021-01-24 00:12:43', '2021-01-24 00:12:43', 'female', 'HIGH', 'EASY', 'nubuck', 'strappy sandal', 'Grecian glamour', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(273, 4, 2, 'Stilettos', 'blue', 'Clarks', 6, 'blue.jpeg', '2021-01-24 00:12:43', '2021-01-24 00:12:43', 'female', 'LOW', 'DIFFICULT', 'polyester', 'stiletto heel', 'Padded insole, textured outsole Upper & Lining 1', 20, 2500, 300, 2200, 15, 'PARTY WEAR', '4 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(274, 1, 2, 'Formal Shoes', 'brown', 'Redtape', 8, 'brownshoes.jpeg', '2021-01-24 14:07:30', '2021-01-24 14:07:30', 'male', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(275, 1, 2, 'Sport Shoes', 'Grey', 'PUMA', 7, 'greyshoes.jpeg', '2021-01-24 14:07:30', '2021-01-24 14:07:30', 'male', 'MEDIUM', 'EASY', 'synthetics', 'High quality', 'maximum comfort and performance', 15, 2000, 500, 1500, 8, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', 'NYLON', 'AMERICA', 'NEW'),
(276, 1, 2, 'Boat Boots', 'Brown', 'U.S. Polo Assn.', 8, 'brownboots.jpeg', '2021-01-24 14:07:30', '2021-01-24 14:07:30', 'male', 'HIGH', 'DIFFICULT', 'canvas', 'nice product', 'the stitching is highly durable', 20, 1500, 300, 1200, 12, 'PARTY WEAR', '4 STAR', 'new attribute', 'CAMP', 'ELASTIC', 'GEORGIA', 'NEW'),
(277, 1, 2, 'Sport Shoes', 'Peach', 'Sparx', 5, 'peach.jpeg', '2021-01-24 14:07:30', '2021-01-24 14:07:30', 'female', 'HIGH', 'EASY', 'mesh fabric', 'comfortable', 'fabric portion encases your foot entirely', 20, 3000, 200, 2800, 7, 'CASUAL WEAR', '5 STAR', 'new attribute', 'RUBBER', 'COTTON', 'GEORGIA', 'NEW'),
(278, 2, 2, 'Wedges', 'white', 'Cobra King MIM', 5, 'whitewedges.jpeg', '2021-01-24 14:07:30', '2021-01-24 14:07:30', 'female', 'MEDIUM', 'MEDIUM', 'PU', 'excruciating heels', 'more comfortable to wear', 10, 6200, 200, 6000, 12, 'OFFICE WEAR', '5 STAR', 'new attribute', '', '', 'AMERICA', 'NEW'),
(279, 2, 2, 'Sandals', 'Pink', 'Fourteen DJ-4', 4, 'pink.jpeg', '2021-01-24 14:07:30', '2021-01-24 14:07:30', 'female', 'HIGH', 'EASY', 'leathers', 'nice well-made', 'protective and comfortable', 20, 1200, 100, 1100, 10, 'PARTY WEAR', '4 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(280, 6, 2, 'Loafers', 'brown', 'Rockport', 5, 'brownloafers.jpeg', '2021-01-24 14:07:30', '2021-01-24 14:07:30', 'kids', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 30, 1000, 100, 900, 10, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', '', 'GEORGIA', 'NEW'),
(281, 1, 2, 'Formal Shoes', 'black', 'redtape', 7, 'blackshoes.jpeg', '2021-01-24 14:07:30', '2021-01-24 14:07:30', 'kids', 'HIGH', 'EASY', 'canvas', 'Good choice Product', 'very nice product for kids', 10, 1000, 100, 900, 10, 'CASUAL WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(282, 5, 2, 'Ankle Boots', 'black', 'Callaway Jaws MD5', 5, 'ancle.jpeg', '2021-01-24 14:07:30', '2021-01-24 14:07:30', 'female', 'HIGH', 'MEDIUM', 'synthetics', 'versatile', 'Pixie boots have cute pointed toes', 20, 4000, 200, 3800, 10, 'OFFICE WEAR', '5 STAR', 'new attribute', 'CAMP', '', 'AMERICA', 'NEW'),
(283, 2, 2, 'Gladiator Sandals', 'black', 'Ping Glide', 6, 'sandals.jpeg', '2021-01-24 14:07:30', '2021-01-24 14:07:30', 'female', 'HIGH', 'EASY', 'nubuck', 'strappy sandal', 'Grecian glamour', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(284, 4, 2, 'Stilettos', 'blue', 'Clarks', 6, 'blue.jpeg', '2021-01-24 14:07:30', '2021-01-24 14:07:30', 'female', 'LOW', 'DIFFICULT', 'polyester', 'stiletto heel', 'Padded insole, textured outsole Upper & Lining 1', 20, 2500, 300, 2200, 15, 'PARTY WEAR', '4 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(285, 1, 2, 'Formal Shoes', 'brown', 'Redtape', 8, 'brownshoes.jpeg', '2021-01-24 15:21:37', '2021-01-24 15:21:37', 'male', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(286, 1, 2, 'Sport Shoes', 'Grey', 'PUMA', 7, 'greyshoes.jpeg', '2021-01-24 15:21:37', '2021-01-24 15:21:37', 'male', 'MEDIUM', 'EASY', 'synthetics', 'High quality', 'maximum comfort and performance', 15, 2000, 500, 1500, 8, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', 'NYLON', 'AMERICA', 'NEW'),
(287, 1, 2, 'Boat Boots', 'Brown', 'U.S. Polo Assn.', 8, 'brownboots.jpeg', '2021-01-24 15:21:37', '2021-01-24 15:21:37', 'male', 'HIGH', 'DIFFICULT', 'canvas', 'nice product', 'the stitching is highly durable', 20, 1500, 300, 1200, 12, 'PARTY WEAR', '4 STAR', 'new attribute', 'CAMP', 'ELASTIC', 'GEORGIA', 'NEW'),
(288, 1, 2, 'Sport Shoes', 'Peach', 'Sparx', 5, 'peach.jpeg', '2021-01-24 15:21:37', '2021-01-24 15:21:37', 'female', 'HIGH', 'EASY', 'mesh fabric', 'comfortable', 'fabric portion encases your foot entirely', 20, 3000, 200, 2800, 7, 'CASUAL WEAR', '5 STAR', 'new attribute', 'RUBBER', 'COTTON', 'GEORGIA', 'NEW'),
(289, 2, 2, 'Wedges', 'white', 'Cobra King MIM', 5, 'whitewedges.jpeg', '2021-01-24 15:21:37', '2021-01-24 15:21:37', 'female', 'MEDIUM', 'MEDIUM', 'PU', 'excruciating heels', 'more comfortable to wear', 10, 6200, 200, 6000, 12, 'OFFICE WEAR', '5 STAR', 'new attribute', '', '', 'AMERICA', 'NEW'),
(290, 2, 2, 'Sandals', 'Pink', 'Fourteen DJ-4', 4, 'pink.jpeg', '2021-01-24 15:21:37', '2021-01-24 15:21:37', 'female', 'HIGH', 'EASY', 'leathers', 'nice well-made', 'protective and comfortable', 20, 1200, 100, 1100, 10, 'PARTY WEAR', '4 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(291, 6, 2, 'Loafers', 'brown', 'Rockport', 5, 'brownloafers.jpeg', '2021-01-24 15:21:37', '2021-01-24 15:21:37', 'kids', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 30, 1000, 100, 900, 10, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', '', 'GEORGIA', 'NEW'),
(292, 1, 2, 'Formal Shoes', 'black', 'redtape', 7, 'blackshoes.jpeg', '2021-01-24 15:21:37', '2021-01-24 15:21:37', 'kids', 'HIGH', 'EASY', 'canvas', 'Good choice Product', 'very nice product for kids', 10, 1000, 100, 900, 10, 'CASUAL WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(293, 5, 2, 'Ankle Boots', 'black', 'Callaway Jaws MD5', 5, 'ancle.jpeg', '2021-01-24 15:21:37', '2021-01-24 15:21:37', 'female', 'HIGH', 'MEDIUM', 'synthetics', 'versatile', 'Pixie boots have cute pointed toes', 20, 4000, 200, 3800, 10, 'OFFICE WEAR', '5 STAR', 'new attribute', 'CAMP', '', 'AMERICA', 'NEW'),
(294, 2, 2, 'Gladiator Sandals', 'black', 'Ping Glide', 6, 'sandals.jpeg', '2021-01-24 15:21:37', '2021-01-24 15:21:37', 'female', 'HIGH', 'EASY', 'nubuck', 'strappy sandal', 'Grecian glamour', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(295, 4, 2, 'Stilettos', 'blue', 'Clarks', 6, 'blue.jpeg', '2021-01-24 15:21:37', '2021-01-24 15:21:37', 'female', 'LOW', 'DIFFICULT', 'polyester', 'stiletto heel', 'Padded insole, textured outsole Upper & Lining 1', 20, 2500, 300, 2200, 15, 'PARTY WEAR', '4 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(296, 1, 2, 'Formal Shoes', 'brown', 'Redtape', 8, 'brownshoes.jpeg', '2021-01-24 16:02:41', '2021-01-24 16:02:41', 'male', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(297, 1, 2, 'Sport Shoes', 'Grey', 'PUMA', 7, 'greyshoes.jpeg', '2021-01-24 16:02:41', '2021-01-24 16:02:41', 'male', 'MEDIUM', 'EASY', 'synthetics', 'High quality', 'maximum comfort and performance', 15, 2000, 500, 1500, 8, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', 'NYLON', 'AMERICA', 'NEW'),
(298, 1, 2, 'Boat Boots', 'Brown', 'U.S. Polo Assn.', 8, 'brownboots.jpeg', '2021-01-24 16:02:41', '2021-01-24 16:02:41', 'male', 'HIGH', 'DIFFICULT', 'canvas', 'nice product', 'the stitching is highly durable', 20, 1500, 300, 1200, 12, 'PARTY WEAR', '4 STAR', 'new attribute', 'CAMP', 'ELASTIC', 'GEORGIA', 'NEW'),
(299, 1, 2, 'Sport Shoes', 'Peach', 'Sparx', 5, 'peach.jpeg', '2021-01-24 16:02:41', '2021-01-24 16:02:41', 'female', 'HIGH', 'EASY', 'mesh fabric', 'comfortable', 'fabric portion encases your foot entirely', 20, 3000, 200, 2800, 7, 'CASUAL WEAR', '5 STAR', 'new attribute', 'RUBBER', 'COTTON', 'GEORGIA', 'NEW'),
(300, 2, 2, 'Wedges', 'white', 'Cobra King MIM', 5, 'whitewedges.jpeg', '2021-01-24 16:02:41', '2021-01-24 16:02:41', 'female', 'MEDIUM', 'MEDIUM', 'PU', 'excruciating heels', 'more comfortable to wear', 10, 6200, 200, 6000, 12, 'OFFICE WEAR', '5 STAR', 'new attribute', '', '', 'AMERICA', 'NEW'),
(301, 2, 2, 'Sandals', 'Pink', 'Fourteen DJ-4', 4, 'pink.jpeg', '2021-01-24 16:02:41', '2021-01-24 16:02:41', 'female', 'HIGH', 'EASY', 'leathers', 'nice well-made', 'protective and comfortable', 20, 1200, 100, 1100, 10, 'PARTY WEAR', '4 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(302, 6, 2, 'Loafers', 'brown', 'Rockport', 5, 'brownloafers.jpeg', '2021-01-24 16:02:41', '2021-01-24 16:02:41', 'kids', 'HIGH', 'EASY', 'genuine', 'nice product', 'very nice product', 30, 1000, 100, 900, 10, 'CASUAL WEAR', '4 STAR', 'new attribute', 'RUBBER', '', 'GEORGIA', 'NEW'),
(303, 1, 2, 'Formal Shoes', 'black', 'redtape', 7, 'blackshoes.jpeg', '2021-01-24 16:02:42', '2021-01-24 16:02:42', 'kids', 'HIGH', 'EASY', 'canvas', 'Good choice Product', 'very nice product for kids', 10, 1000, 100, 900, 10, 'CASUAL WEAR', '3 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW'),
(304, 5, 2, 'Ankle Boots', 'black', 'Callaway Jaws MD5', 5, 'ancle.jpeg', '2021-01-24 16:02:42', '2021-01-24 16:02:42', 'female', 'HIGH', 'MEDIUM', 'synthetics', 'versatile', 'Pixie boots have cute pointed toes', 20, 4000, 200, 3800, 10, 'OFFICE WEAR', '5 STAR', 'new attribute', 'CAMP', '', 'AMERICA', 'NEW'),
(305, 2, 2, 'Gladiator Sandals', 'black', 'Ping Glide', 6, 'sandals.jpeg', '2021-01-24 16:02:42', '2021-01-24 16:02:42', 'female', 'HIGH', 'EASY', 'nubuck', 'strappy sandal', 'Grecian glamour', 10, 1000, 100, 900, 10, 'PARTY WEAR', '3 STAR', 'new attribute', '', '', 'INDIA', 'NEW'),
(306, 4, 2, 'Stilettos', 'blue', 'Clarks', 6, 'blue.jpeg', '2021-01-24 16:02:42', '2021-01-24 16:02:42', 'female', 'LOW', 'DIFFICULT', 'polyester', 'stiletto heel', 'Padded insole, textured outsole Upper & Lining 1', 20, 2500, 300, 2200, 15, 'PARTY WEAR', '4 STAR', 'new attribute', 'RUBBER', 'COTTON', 'INDIA', 'NEW');

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(2, 1, 'rOtZautMnc1SkS9P9x14', 'DQzSai53cZIoAsi6k8Np1VUT/PE4x2e6ZMMv/xiTFQI=', '2021-01-21 12:25:03', '2021-01-21 13:25:03'),
(3, 2, 'djQlzRbEMJq0SwHvq0CX', '9gB/qSXqz6vx8r0XIHKjS8Da/p7uIucVS8anSRGx7Cc=', '2021-01-21 12:26:58', '2021-01-21 13:26:58'),
(4, 6, '0ZxFT3eGI1N6R8NRCEWY', 'd/5N0WAY6YdWq0jGFTMd/0DUdLw6mZY3za44QV+Pn+g=', '2021-01-23 18:20:56', '2021-01-23 19:20:56');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int NOT NULL,
  `review_by_id` int NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `review_by_id`, `comment`, `created_at`) VALUES
(1, 3, 'THIS IS A COMMENT BY NORMAL USER', '2021-01-01 00:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`) VALUES
(1, 'vashusharma1104@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$YCSrvraY/2PRjs4muOB5aQ$gibzmByiD1rIr9sLjD04GqmavVxxQjqfz3s7pS2+oJU', 1),
(2, 'raj116347@gmail.com', '[\"ROLE_MANAGER\"]', '$argon2id$v=19$m=65536,t=4,p=1$L975QIvLsbeW4FjyT9hnJQ$MWtfJCdmf5EjknoQW8fXBZjzRkCqJRBcW+OGC3/b7hg', 1),
(3, 'bhawanatanwar219@gmail.com', '{\"1\": \"ROLE_MANAGER\"}', '$argon2id$v=19$m=65536,t=4,p=1$G6iB8gd9H9OQky9F1g73GA$oq22oxG8u8aAucq21pGEDxxIIuQp3A3Goy2tLnr067Y', 1),
(5, 'arjunraute329@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$/tHkZss4tHwtluKHDAR1WQ$atc/A4OCNeeN7uGBbS85lcye9+6MizD8YrAkTww4uQ0', 1),
(6, 'gargmansi24@gmail.com', '[\"ROLE_MANAGER\"]', '$argon2id$v=19$m=65536,t=4,p=1$H3RImchimYzCsJFag7wTKQ$YS1W61pcmrWfFAbe1KM6D9qvJf2oZxXSk0MYLKokaCc', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `footwear_category`
--
ALTER TABLE `footwear_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_95F574B0873649CA` (`managed_by_id`);

--
-- Indexes for table `footwear_product`
--
ALTER TABLE `footwear_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_63D8E82012469DE2` (`category_id`),
  ADD KEY `IDX_63D8E820783E3463` (`manager_id`);

--
-- Indexes for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_794381C6B9690C1F` (`review_by_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `footwear_category`
--
ALTER TABLE `footwear_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `footwear_product`
--
ALTER TABLE `footwear_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `footwear_category`
--
ALTER TABLE `footwear_category`
  ADD CONSTRAINT `FK_95F574B0873649CA` FOREIGN KEY (`managed_by_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `footwear_product`
--
ALTER TABLE `footwear_product`
  ADD CONSTRAINT `FK_63D8E82012469DE2` FOREIGN KEY (`category_id`) REFERENCES `footwear_category` (`id`),
  ADD CONSTRAINT `FK_63D8E820783E3463` FOREIGN KEY (`manager_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK_794381C6B9690C1F` FOREIGN KEY (`review_by_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
