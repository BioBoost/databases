-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2014 at 08:59 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `webshop`
--
CREATE DATABASE IF NOT EXISTS `webshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `webshop`;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `street` varchar(128) NOT NULL,
  `number` varchar(32) NOT NULL,
  `extension` varchar(32) DEFAULT NULL,
  `city` varchar(128) NOT NULL,
  `zipcode` varchar(32) NOT NULL,
  `country` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `street`, `number`, `extension`, `city`, `zipcode`, `country`) VALUES
(1, 'Zeedijk', '101', NULL, 'OOSTENDE', '8400', 'belgium'),
(2, 'Langestraat', '43', NULL, 'OOSTENDE', '8400', 'belgium'),
(3, 'Stationslaan', '13', 'b4', 'BRUGGE', '8545', 'belgium'),
(4, 'Bergsesteenweg', '202', NULL, 'ROESELARE', '5634', 'belgium'),
(5, 'Hogeweg', '123', NULL, 'EREMBODEGEM', '8454', 'belgium'),
(6, 'Laagdeurlaan', '654', NULL, 'AALST', '4543', 'belgium'),
(7, 'Luikersteenweg', '151', NULL, 'TONGEREN', '3700', 'belgium'),
(8, 'Mechelsesteenweg', '152', NULL, 'EDEGEM', '2650', 'belgium'),
(9, 'Fakestreet', '101', 'O23', 'DILBEEK', '4324', 'belgium'),
(10, 'Industriepark', '12', 'P19', 'ANTWERPEN', '9872', 'belgium'),
(11, 'Genelaan', '980', NULL, 'BRUSSEL', '3432', 'belgium'),
(12, 'Markelaan', '527', NULL, 'POPERINGE', '7432', 'belgium');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE IF NOT EXISTS `articles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `image` varchar(256) DEFAULT NULL,
  `unit_price` decimal(9,2) DEFAULT NULL,
  `brands_id` bigint(20) NOT NULL,
  `categories_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_articles_brands_idx` (`brands_id`),
  KEY `fk_articles_categories1_idx` (`categories_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `description`, `image`, `unit_price`, `brands_id`, `categories_id`) VALUES
(1, 'TriCool 80mm', NULL, '3.99', 1, 5),
(2, '1150 i7-4770K', NULL, '313.27', 2, 2),
(3, 'Scorpio BLUE 750GB SATA3', NULL, '50.65', 3, 6),
(4, 'DDR1 400 1GB', NULL, '28.50', 4, 1),
(5, '1155 i3-3220', NULL, '111.96', 2, 2),
(6, '2011 i7-3970X', NULL, '930.35', 2, 2),
(7, 'FM2 5400K Blk Ed 1MB 3.6Mhz 65W', NULL, '50.88', 5, 2),
(8, 'SickleFlow 120 Green LED', NULL, '5.20', 6, 5),
(9, 'Blizzard T2', NULL, '13.81', 6, 5),
(10, 'SoDimm DDR1 400 1GB', NULL, '26.76', 4, 1),
(11, '3,5" sata3 3TB caviar green', NULL, '110.39', 3, 6),
(12, 'GTX 770 4GB WINDFORCE', NULL, '383.45', 7, 4),
(13, '3,5" 1TB Barracuda', NULL, '107.25', 8, 6),
(14, 'DDR3. 2133MHz 16GB 4x240 Dimm.', NULL, '173.51', 4, 1),
(15, 'GTX 750 1GB', NULL, '121.43', 7, 4),
(16, 'Scorpio BLACK 500GB SATA2', NULL, '69.95', 3, 6),
(17, 'GT630 2GB', NULL, '69.99', 9, 4),
(18, '1155 i5-3570', NULL, '187.02', 2, 2),
(19, 'SSD 840 EVO 250GB SATA Basic', NULL, '150.27', 10, 6),
(20, 'Nvidia 210', NULL, '21.09', 9, 4),
(21, 'DDR1 400 1GB', NULL, '28.50', 4, 1),
(22, 'SoDimm DDR1 333 1GB', NULL, '31.56', 4, 1),
(23, 'DDR2 2GB 667MHz CL5', NULL, '33.39', 4, 1),
(24, 'GT 610 1GB', NULL, '37.81', 7, 4),
(25, 'GT610 2GB', NULL, '44.54', 7, 4),
(26, 'GT610 2GB low profile', NULL, '46.37', 9, 4),
(27, 'DDR3 1600 2x2GB XMS', NULL, '45.10', 4, 1),
(28, 'Scorpio BLUE 250GB SATA3', NULL, '44.11', 3, 6),
(29, 'Scorpio BLUE 320GB SATA3', NULL, '44.38', 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `articles_suppliers`
--

CREATE TABLE IF NOT EXISTS `articles_suppliers` (
  `suppliers_id` bigint(20) NOT NULL,
  `articles_id` bigint(20) NOT NULL,
  PRIMARY KEY (`suppliers_id`,`articles_id`),
  KEY `fk_articles_suppliers_suppliers1_idx` (`suppliers_id`),
  KEY `fk_articles_suppliers_articles1_idx` (`articles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles_suppliers`
--

INSERT INTO `articles_suppliers` (`suppliers_id`, `articles_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 12),
(1, 16),
(1, 20),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 28),
(1, 29),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 7),
(2, 8),
(2, 10),
(2, 11),
(2, 13),
(2, 17),
(2, 19),
(2, 21),
(2, 23),
(2, 24),
(2, 25),
(2, 27),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 6),
(3, 9),
(3, 10),
(3, 11),
(3, 13),
(3, 15),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 23),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(4, 1),
(4, 5),
(4, 6),
(4, 9),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(4, 22),
(4, 29);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `logo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `url`, `logo`) VALUES
(1, 'Antec', NULL, NULL),
(2, 'Intel', NULL, NULL),
(3, 'Western Digital', NULL, NULL),
(4, 'Corsair', NULL, NULL),
(5, 'AMD', NULL, NULL),
(6, 'Coolermaster', NULL, NULL),
(7, 'Gigabyte', NULL, NULL),
(8, 'Seagate', NULL, NULL),
(9, 'Asus', NULL, NULL),
(10, 'Samsung', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'memory', 'Description of memory'),
(2, 'cpu', 'Description of cpu'),
(3, 'case', 'Description of case'),
(4, 'graphics card', 'Description of graphics card'),
(5, 'cooling', 'Description of cooling'),
(6, 'storage', 'Description of storage');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `score` int(11) NOT NULL,
  `articles_id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_articles1_idx` (`articles_id`),
  KEY `fk_reviews_users1_idx` (`users_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `message`, `score`, `articles_id`, `users_id`, `date`) VALUES
(1, 'This is a review of 3,5" 1TB Barracudadone by Mark', 5, 13, 2, '2014-03-20 20:25:40'),
(2, 'This is a review of SoDimm DDR1 400 1GBdone by Jenny', 0, 10, 5, '2014-03-20 20:25:40'),
(3, 'This is a review of GT610 2GBdone by Jenny', 1, 25, 5, '2014-03-20 20:25:40'),
(4, 'This is a review of GTX 750 1GBdone by Leroy', 2, 15, 3, '2014-03-20 20:25:40'),
(5, 'This is a review of Scorpio BLUE 250GB SATA3done by Mark', 1, 28, 2, '2014-03-20 20:25:40'),
(6, 'This is a review of SickleFlow 120 Green LEDdone by Jenny', 10, 8, 5, '2014-03-20 20:25:40'),
(7, 'This is a review of GT610 2GB low profiledone by Sandra', 2, 26, 6, '2014-03-20 20:25:40'),
(8, 'This is a review of SickleFlow 120 Green LEDdone by Laura', 9, 8, 4, '2014-03-20 20:25:40'),
(9, 'This is a review of Nvidia 210done by Leroy', 1, 20, 3, '2014-03-20 20:25:40'),
(10, 'This is a review of 3,5" 1TB Barracudadone by Mark', 9, 13, 3, '2014-03-20 20:25:40'),
(11, 'This is a review of SoDimm DDR1 333 1GBdone by Sandra', 3, 22, 6, '2014-03-20 20:25:40'),
(12, 'This is a review of TriCool 80mmdone by Leroy', 0, 1, 3, '2014-03-20 20:25:40'),
(13, 'This is a review of DDR3 1600 2x2GB XMSdone by Nico', 0, 27, 1, '2014-03-20 20:25:40'),
(14, 'This is a review of DDR1 400 1GBdone by Jenny', 8, 4, 5, '2014-03-20 20:25:40'),
(15, 'This is a review of Nvidia 210done by Laura', 9, 20, 4, '2014-03-20 20:25:40'),
(16, 'This is a review of SoDimm DDR1 333 1GBdone by Laura', 0, 22, 4, '2014-03-20 20:25:40'),
(17, 'This is a review of GT630 2GBdone by Laura', 4, 17, 4, '2014-03-20 20:25:40'),
(18, 'This is a review of 1155 i5-3570done by Mark', 4, 18, 2, '2014-03-20 20:25:40'),
(19, 'This is a review of GT630 2GBdone by Laura', 8, 17, 1, '2014-03-20 20:25:40'),
(20, 'This is a review of SickleFlow 120 Green LEDdone by Mark', 8, 8, 2, '2014-03-20 20:25:40'),
(21, 'This is a review of SSD 840 EVO 250GB SATA Basicdone by Nico', 3, 19, 1, '2014-03-20 20:25:40'),
(22, 'This is a review of GTX 750 1GBdone by Jenny', 8, 15, 5, '2014-03-20 20:25:40'),
(23, 'This is a review of GTX 750 1GBdone by Laura', 4, 15, 4, '2014-03-20 20:25:40'),
(24, 'This is a review of GT 610 1GBdone by Sandra', 0, 24, 6, '2014-03-20 20:25:40'),
(25, 'This is a review of GT610 2GB low profiledone by Leroy', 7, 26, 3, '2014-03-20 20:25:40'),
(26, 'This is a review of SoDimm DDR1 400 1GBdone by Leroy', 8, 10, 3, '2014-03-20 20:25:40'),
(27, 'This is a review of Scorpio BLUE 320GB SATA3done by Laura', 2, 29, 4, '2014-03-20 20:25:40'),
(28, 'This is a review of 3,5" sata3 3TB caviar greendone by Nico', 7, 11, 1, '2014-03-20 20:25:40'),
(29, 'This is a review of GT610 2GB low profiledone by Leroy', 5, 26, 4, '2014-03-20 20:25:40'),
(30, 'This is a review of 1155 i5-3570done by Nico', 9, 18, 1, '2014-03-20 20:25:40'),
(31, 'This is a review of DDR1 400 1GBdone by Sandra', 9, 21, 6, '2014-03-20 20:25:40'),
(32, 'This is a review of 1150 i7-4770Kdone by Leroy', 1, 2, 3, '2014-03-20 20:25:40'),
(33, 'This is a review of DDR3. 2133MHz 16GB 4x240 Dimm. done by Jenny', 4, 14, 5, '2014-03-20 20:25:40'),
(34, 'This is a review of DDR2 2GB 667MHz CL5done by Mark', 4, 23, 2, '2014-03-20 20:25:40'),
(35, 'This is a review of SoDimm DDR1 400 1GBdone by Laura', 7, 10, 4, '2014-03-20 20:25:40'),
(36, 'This is a review of GT610 2GB low profiledone by Leroy', 0, 26, 3, '2014-03-20 20:25:40'),
(37, 'This is a review of GT610 2GB low profiledone by Nico', 0, 26, 1, '2014-03-20 20:25:40'),
(38, 'This is a review of 1155 i5-3570done by Laura', 9, 18, 4, '2014-03-20 20:25:40'),
(39, 'This is a review of DDR1 400 1GBdone by Mark', 10, 4, 2, '2014-03-20 20:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE IF NOT EXISTS `stores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `addresses_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stores_addresses1_idx` (`addresses_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `addresses_id`) VALUES
(1, 'EuroSys Tongeren', 7),
(2, 'ForCom Edegem', 8);

-- --------------------------------------------------------

--
-- Table structure for table `stores_articles`
--

CREATE TABLE IF NOT EXISTS `stores_articles` (
  `stores_id` bigint(20) NOT NULL,
  `articles_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`stores_id`,`articles_id`),
  KEY `fk_stores_articles_stores1_idx` (`stores_id`),
  KEY `fk_stores_articles_articles1` (`articles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stores_articles`
--

INSERT INTO `stores_articles` (`stores_id`, `articles_id`, `quantity`) VALUES
(1, 1, 41),
(1, 2, 47),
(1, 4, 21),
(1, 5, 36),
(1, 6, 43),
(1, 7, 22),
(1, 9, 25),
(1, 10, 2),
(1, 12, 23),
(1, 13, 9),
(1, 14, 49),
(1, 16, 7),
(1, 17, 10),
(1, 18, 8),
(1, 19, 9),
(1, 21, 12),
(1, 22, 20),
(1, 24, 0),
(1, 25, 31),
(1, 26, 39),
(1, 28, 15),
(1, 29, 48),
(2, 1, 42),
(2, 2, 44),
(2, 3, 34),
(2, 4, 32),
(2, 7, 35),
(2, 8, 22),
(2, 9, 42),
(2, 10, 18),
(2, 11, 33),
(2, 12, 28),
(2, 15, 22),
(2, 16, 44),
(2, 17, 40),
(2, 18, 18),
(2, 20, 34),
(2, 21, 47),
(2, 23, 49),
(2, 24, 30),
(2, 26, 20),
(2, 27, 27),
(2, 28, 33),
(2, 29, 48);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `url` varchar(256) DEFAULT NULL,
  `addresses_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_suppliers_addresses1_idx` (`addresses_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `url`, `addresses_id`) VALUES
(1, 'FakeGen', 'http://www.FakeGen.com', 9),
(2, 'CorpSync', 'http://www.CorpSync.com', 10),
(3, 'GenoMaker', 'http://www.GenoMaker.com', 11),
(4, 'MakeItFast', 'http://www.MakeItFast.com', 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(128) NOT NULL,
  `lastname` varchar(128) NOT NULL,
  `username` varchar(64) NOT NULL,
  `passhash` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `passhash`, `salt`, `email`, `active`, `created`) VALUES
(1, 'Nico', 'De Witte', 'nicodw', '4379ece6c89a40ab2b66c72c23c0fc67', '882650bbead76a585e68160ad5fba02c', 'nico@example.com', 1, '2014-03-20 20:25:12'),
(2, 'Mark', 'Testmans', 'markt', '7934ed89b1a1d87ec81c16c15edc0136', 'd41d8cd98f00b204e9800998ecf8427e', 'mark@example.com', 1, '2014-03-20 20:25:12'),
(3, 'Leroy', 'Jenkins', 'leroy', 'd41d8cd98f00b204e9800998ecf8427e', 'd83f7ffb06fca19fa8a39b314a152ccc', 'leroy@example.com', 1, '2014-03-20 20:25:12'),
(4, 'Laura', 'Hody', 'laudy', 'ce933b72253890bb2bbec1223e58a5fd', 'c77bc09ed4c7a36957f88f54600b02e9', 'laura@example.com', 1, '2014-03-20 20:25:12'),
(5, 'Jenny', 'Morki', 'jenjen', '11257a9b387f55366958d3c47c24aa74', 'c2e12b7a0fbd36bf137efacd2e56ed93', 'jenny@example.com', 1, '2014-03-20 20:25:12'),
(6, 'Sandra', 'Testings', 'sandra', '314787ed5cce38ce8cac1692d4b61a46', '6fe4e4b6a030538a233dd89dfd8eb178', 'sandra@example.com', 1, '2014-03-20 20:25:12');

-- --------------------------------------------------------

--
-- Table structure for table `users_addresses`
--

CREATE TABLE IF NOT EXISTS `users_addresses` (
  `users_id` bigint(20) NOT NULL,
  `addresses_id` bigint(20) NOT NULL,
  PRIMARY KEY (`users_id`,`addresses_id`),
  KEY `fk_users_addresses_users1_idx` (`users_id`),
  KEY `fk_users_addresses_addresses1_idx` (`addresses_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_addresses`
--

INSERT INTO `users_addresses` (`users_id`, `addresses_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `users_articles`
--

CREATE TABLE IF NOT EXISTS `users_articles` (
  `articles_id` bigint(20) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`articles_id`,`users_id`),
  KEY `fk_users_articles_users1_idx` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_articles`
--

INSERT INTO `users_articles` (`articles_id`, `users_id`, `quantity`) VALUES
(3, 1, 2),
(3, 5, 1),
(4, 1, 1),
(4, 5, 1),
(7, 1, 2),
(11, 2, 1),
(12, 1, 2),
(15, 1, 2),
(16, 1, 2),
(18, 2, 3),
(20, 1, 1),
(23, 1, 2),
(25, 5, 2),
(27, 2, 3),
(28, 2, 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `fk_articles_brands` FOREIGN KEY (`brands_id`) REFERENCES `brands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_articles_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `articles_suppliers`
--
ALTER TABLE `articles_suppliers`
  ADD CONSTRAINT `fk_articles_suppliers_articles1` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_articles_suppliers_suppliers1` FOREIGN KEY (`suppliers_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_articles1` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reviews_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `fk_stores_addresses1` FOREIGN KEY (`addresses_id`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stores_articles`
--
ALTER TABLE `stores_articles`
  ADD CONSTRAINT `fk_stores_articles_articles1` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stores_articles_stores1` FOREIGN KEY (`stores_id`) REFERENCES `stores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `fk_suppliers_addresses1` FOREIGN KEY (`addresses_id`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users_addresses`
--
ALTER TABLE `users_addresses`
  ADD CONSTRAINT `fk_users_addresses_addresses1` FOREIGN KEY (`addresses_id`) REFERENCES `addresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_addresses_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users_articles`
--
ALTER TABLE `users_articles`
  ADD CONSTRAINT `fk_users_articles_articles1` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_articles_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
