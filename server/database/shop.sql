-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 18-Maio-2018 às 20:08
-- Versão do servidor: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_1` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_country_id_index` (`country_id`),
  KEY `addresses_customer_id_index` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `addresses`
--

INSERT INTO `addresses` (`id`, `alias`, `address_1`, `address_2`, `zip`, `phone`, `city_id`, `province_id`, `country_id`, `customer_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'pç miguel braga', '139', 'casa 1', '02353050', '963612389', 1, 1, 1, 1, 0, NULL, '2018-05-07 03:00:00', '2018-05-09 21:06:43'),
(23, 'pç miguel braga', '139', 'casa 1', '01101-080', '963612389', 1, 1, 1, 1, 1, NULL, '2018-05-11 17:44:44', '2018-05-11 17:59:57'),
(24, 'travessa sol brilhante', '1', NULL, '04194440', '963612389', 1, 1, 1, 1, 1, NULL, '2018-05-15 20:36:58', '2018-05-15 20:36:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `attributes`
--

DROP TABLE IF EXISTS `attributes`;
CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_name_unique` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `attribute_values`
--

DROP TABLE IF EXISTS `attribute_values`;
CREATE TABLE IF NOT EXISTS `attribute_values` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_values_attribute_id_foreign` (`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `attribute_value_product_attribute`
--

DROP TABLE IF EXISTS `attribute_value_product_attribute`;
CREATE TABLE IF NOT EXISTS `attribute_value_product_attribute` (
  `attribute_value_id` int(10) UNSIGNED NOT NULL,
  `product_attribute_id` int(10) UNSIGNED NOT NULL,
  KEY `attribute_value_product_attribute_attribute_value_id_foreign` (`attribute_value_id`),
  KEY `attribute_value_product_attribute_product_attribute_id_foreign` (`product_attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `cover`, `status`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 'uncategorized', 'Ut dicta aut nesciunt dolorem quis at rerum amet. Reprehenderit dolorum dolores iusto veritatis non eos. Ut vel explicabo quae modi ea qui. Minima nihil quia est earum dolores aut voluptates ipsam.', 'categories/k0zrWhVV2F0m3xE1X3Sd8sZ9cn0Qae3VEiDxyEC0.png', 1, 0, '2018-05-02 22:39:34', '2018-05-02 22:39:34'),
(3, 'Perfumes', 'perfumes', NULL, 'mYjI7lRXAtiquD0UNV9Td9qmD.png', 1, 1, '2018-05-02 22:53:00', '2018-05-09 20:43:09'),
(8, 'Masculino', 'masculino', NULL, '2cuAn5N9Z6tn8KPhnEzcE9GXz.png', 1, 3, '2018-05-03 15:52:19', '2018-05-09 22:16:08'),
(9, 'Feminino', 'feminino', NULL, 'AHE5wUOWbQ9oAGbqZI6Y5sBA2.png', 1, 3, '2018-05-03 15:53:04', '2018-05-09 22:08:25'),
(11, 'Cremes', 'cremes', NULL, 'BNI3z8IYCqtASXcZme7L2UUII.png', 1, 4, '2018-05-02 22:58:06', '2018-05-09 20:47:49'),
(5, 'Make Up', 'make-up', NULL, '64rqoUg3HMnYCUaRlV9Mce4XD.png', 1, 1, '2018-05-02 23:00:04', '2018-05-09 21:54:31'),
(7, 'Bem estar', 'bem-estar', NULL, 'RiR0AU4IJ3N8UH17kRUC3kdwI.png', 1, 1, '2018-05-02 23:03:47', '2018-05-09 22:13:28'),
(2, 'Novidades', 'novidades', NULL, 'LDNMAVzUGcAIJNhFtt8LWVVfh.jpg', 1, 1, '2018-05-02 22:44:53', '2018-05-09 20:48:37'),
(12, 'Lançamentos', 'lancamentos', NULL, 'oYlmy4lXMTYWJSj3q2FhK8w3a.png', 1, 2, '2018-05-10 22:37:05', '2018-05-10 23:20:44'),
(10, 'Destaques', 'destaques', NULL, 'WkDFPPbbsgz1DwQ2XoivrkOsO.png', 1, 2, '2018-05-09 16:46:14', '2018-05-10 19:07:44'),
(4, 'Beleza', 'beleza', NULL, '6N1V39wNmM9ZOA4pptphhgeY0.png', 1, 1, '2018-05-16 16:05:22', '2018-05-16 17:05:00'),
(21, 'Cabelos', 'cabelos', NULL, '3MGx4ZW6envYRaASX9fqdMaxf.png', 1, 4, '2018-05-16 16:18:57', '2018-05-16 17:05:23'),
(22, 'Corpo', 'corpo', NULL, '14rgkW7Bm3rdezIwUtlLlKTVH.png', 1, 4, '2018-05-16 18:06:56', '2018-05-16 18:07:11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `category_product`
--

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE IF NOT EXISTS `category_product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_category_id_index` (`category_id`),
  KEY `category_product_product_id_index` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `category_product`
--

INSERT INTO `category_product` (`id`, `category_id`, `product_id`) VALUES
(1, 8, 1),
(2, 3, 1),
(3, 3, 2),
(4, 8, 2),
(5, 3, 3),
(6, 8, 3),
(12, 3, 6),
(8, 3, 5),
(9, 8, 5),
(10, 3, 4),
(11, 8, 4),
(13, 8, 6),
(14, 3, 7),
(15, 8, 7),
(16, 3, 8),
(17, 8, 8),
(18, 3, 9),
(19, 8, 9),
(20, 3, 10),
(21, 8, 10),
(22, 3, 11),
(23, 8, 11),
(24, 3, 12),
(25, 8, 12),
(26, 3, 13),
(27, 8, 13),
(28, 3, 14),
(29, 8, 14),
(30, 3, 15),
(31, 8, 15),
(32, 3, 16),
(33, 8, 16),
(34, 10, 1),
(35, 10, 2),
(70, 3, 31),
(71, 9, 31),
(38, 10, 9),
(73, 9, 32),
(72, 3, 32),
(41, 10, 18),
(42, 3, 18),
(43, 8, 18),
(44, 3, 19),
(45, 8, 19),
(46, 3, 20),
(47, 8, 20),
(48, 3, 17),
(49, 8, 17),
(50, 3, 21),
(51, 9, 21),
(52, 3, 22),
(53, 9, 22),
(54, 3, 23),
(55, 9, 23),
(56, 3, 24),
(57, 9, 24),
(58, 3, 25),
(59, 9, 25),
(60, 3, 26),
(61, 9, 26),
(62, 3, 27),
(63, 9, 27),
(64, 3, 28),
(65, 9, 28),
(66, 3, 29),
(67, 9, 29),
(68, 3, 30),
(69, 9, 30),
(74, 3, 33),
(75, 9, 33),
(76, 3, 34),
(77, 9, 34),
(78, 3, 35),
(79, 9, 35),
(80, 3, 36),
(81, 9, 36),
(82, 3, 37),
(83, 9, 37),
(84, 3, 38),
(85, 9, 38),
(86, 10, 33),
(87, 10, 34),
(88, 10, 23),
(89, 10, 27),
(90, 3, 39),
(91, 9, 39),
(92, 3, 40),
(93, 9, 40),
(94, 5, 41),
(95, 5, 42),
(96, 5, 43),
(97, 5, 44),
(98, 5, 45),
(99, 5, 46),
(100, 5, 47),
(101, 5, 48),
(102, 5, 49),
(103, 5, 50),
(104, 5, 51),
(105, 5, 52),
(106, 5, 53),
(107, 5, 54),
(108, 5, 55),
(109, 5, 56),
(110, 11, 57),
(111, 11, 58),
(112, 11, 59),
(113, 11, 60),
(114, 11, 61),
(115, 11, 62),
(116, 11, 63),
(169, 12, 84),
(134, 12, 72),
(133, 2, 72),
(128, 12, 69),
(127, 2, 69),
(130, 12, 70),
(129, 2, 70),
(132, 11, 71),
(131, 2, 71),
(135, 2, 73),
(136, 11, 73),
(137, 2, 74),
(138, 11, 74),
(181, 12, 89),
(180, 2, 89),
(170, 2, 85),
(179, 12, 88),
(165, 11, 64),
(178, 2, 88),
(168, 2, 84),
(177, 12, 87),
(166, 2, 83),
(176, 2, 87),
(171, 12, 85),
(175, 12, 82),
(172, 2, 86),
(174, 2, 82),
(173, 12, 86),
(167, 12, 83),
(182, 2, 1),
(183, 4, 90),
(184, 21, 90),
(185, 4, 91),
(186, 21, 91),
(187, 4, 92),
(188, 21, 92),
(189, 4, 93),
(190, 21, 93),
(191, 4, 94),
(192, 21, 94),
(193, 4, 95),
(194, 21, 95),
(195, 4, 96),
(196, 21, 96),
(197, 4, 97),
(198, 21, 97),
(199, 4, 98),
(200, 21, 98),
(201, 4, 99),
(202, 21, 99),
(203, 4, 100),
(204, 21, 100),
(205, 4, 101),
(206, 21, 101),
(207, 4, 102),
(208, 21, 102),
(209, 4, 103),
(210, 21, 103),
(211, 4, 104),
(212, 21, 104),
(213, 4, 105),
(214, 21, 105),
(215, 4, 106),
(216, 21, 106),
(217, 4, 107),
(218, 21, 107),
(219, 4, 108),
(220, 21, 108),
(221, 4, 109),
(222, 21, 109),
(223, 4, 57),
(224, 4, 58),
(225, 4, 60),
(226, 4, 61),
(227, 4, 62),
(228, 4, 63),
(229, 4, 64),
(230, 4, 59),
(231, 4, 110),
(232, 22, 110),
(233, 4, 111),
(234, 22, 111),
(235, 4, 112),
(236, 22, 112),
(237, 4, 113),
(238, 22, 113),
(239, 4, 114),
(240, 22, 114),
(241, 4, 115),
(242, 22, 115),
(243, 4, 116),
(244, 22, 116),
(245, 4, 117),
(246, 22, 117),
(247, 2, 118),
(248, 12, 118),
(249, 2, 119),
(250, 12, 119),
(251, 2, 120),
(252, 12, 120),
(253, 2, 121),
(254, 12, 121),
(255, 7, 122),
(256, 7, 123),
(257, 7, 124),
(258, 7, 125),
(259, 7, 126),
(260, 7, 127),
(261, 7, 128),
(262, 7, 129),
(263, 7, 130),
(264, 7, 131),
(265, 7, 132),
(266, 7, 133),
(267, 7, 134),
(268, 7, 135),
(269, 7, 136),
(270, 7, 137),
(271, 7, 138),
(272, 7, 139),
(273, 7, 140),
(274, 7, 141),
(275, 7, 142),
(276, 7, 143),
(277, 7, 144),
(278, 5, 121),
(279, 5, 120),
(280, 5, 145),
(281, 5, 146);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_province_id_index` (`province_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `cities`
--

INSERT INTO `cities` (`id`, `name`, `province_id`, `created_at`, `updated_at`) VALUES
(1, 'sao paulo', 1, '2018-05-07 03:00:00', '2018-05-07 03:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numcode` int(11) DEFAULT NULL,
  `phonecode` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countries_name_unique` (`name`),
  UNIQUE KEY `countries_iso_unique` (`iso`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso`, `iso3`, `numcode`, `phonecode`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BRAZIL', 'BR', 'BRA', 1, 55, 1, '2018-05-07 22:39:35', '2018-05-07 22:39:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `couriers`
--

DROP TABLE IF EXISTS `couriers`;
CREATE TABLE IF NOT EXISTS `couriers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_free` int(11) NOT NULL,
  `cost` decimal(8,2) DEFAULT '0.00',
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `couriers`
--

INSERT INTO `couriers` (`id`, `name`, `description`, `url`, `is_free`, `cost`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pronta entrega', 'Entrega direto com o cliente', 'https://i9infinity.com.br', 1, '0.00', 1, '2018-05-02 22:39:35', '2018-05-03 17:48:10'),
(2, 'Entrega Via Correio', 'Este método pode demorar de 15 a 20 dias, pois o produto é adquirido via catalogo. Não possuímos produtos de pronta entrega.', NULL, 0, '15.00', 1, '2018-05-15 18:42:16', '2018-05-15 18:42:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `adm_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `status`, `adm_id`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Danilo Candido', 'new_dan08@hotmail.com', '$2y$10$fWRlwTSBix3JnMncGKhGquK2Bp61u0RoeHgG86QJipeKCqBLGNmxO', 1, 1, NULL, 'dyCmKR5meZFGo56dEJDvZv5tjHSrHZUD3LbZxgLCCVQGhd956p7dsVzjAnfq', '2018-05-03 15:23:48', '2018-05-03 15:23:48'),
(3, 'Patricia Santana', 'teste@teste.com', '$2y$10$3QcQhsKbFdD36fE0iwChs.SQM4YSKBbFkfjIa7dRY9X2HdJXKyqIy', 1, 1, NULL, NULL, '2018-05-18 22:55:20', '2018-05-18 22:55:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `password`, `foto`, `admin`, `status`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Danilo Candido', 'new_dan08@hotmail.com', '$2y$10$JFd8f5OnJ6tcxYGvJPAsE.1kwaZUGz3nCF/KsWVz1XZvg2Wi1Ztcm', '', 1, 1, NULL, 'QOAsCYPMQV', '2018-05-02 22:39:33', '2018-05-18 22:36:38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_customers_table', 1),
(2, '2014_10_12_000010_create_employees_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_05_26_020731_create_country_table', 1),
(5, '2016_05_26_035202_create_provinces_table', 1),
(6, '2016_05_26_051502_create_cities_table', 1),
(7, '2017_06_10_225235_create_products_table', 1),
(8, '2017_06_11_015526_create_categories_table', 1),
(9, '2017_06_11_033553_create_category_product_table', 1),
(10, '2017_06_11_073305_create_address_table', 1),
(11, '2017_06_12_225546_create_order_status_table', 1),
(12, '2017_06_13_005248_create_payment_methods', 1),
(13, '2017_06_13_044714_create_couriers_table', 1),
(14, '2017_06_13_053346_create_orders_table', 1),
(15, '2017_06_13_091740_create_order_products_table', 1),
(16, '2017_06_17_011245_create_shoppingcart_table', 1),
(17, '2018_01_18_163143_create_product_images_table', 1),
(18, '2018_02_19_151228_create_cost_column', 1),
(19, '2018_03_05_141628_add_columns_to_payment_methods', 1),
(20, '2018_03_10_024148_laratrust_setup_tables', 1),
(21, '2018_03_10_110530_create_attributes_table', 1),
(22, '2018_03_10_150920_create_attribute_values_table', 1),
(23, '2018_03_11_014046_create_product_attributes_table', 1),
(24, '2018_03_11_090249_create_attribute_value_product_attribute_table', 1),
(25, '2018_03_15_232344_create_customer_subscription_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reference` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courier_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `adm_id` int(10) UNSIGNED NOT NULL,
  `address_id` int(10) UNSIGNED NOT NULL,
  `order_status_id` int(10) UNSIGNED NOT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discounts` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_products` decimal(8,2) NOT NULL,
  `tax` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total` decimal(8,2) NOT NULL,
  `total_paid` decimal(8,2) NOT NULL DEFAULT '0.00',
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_reference_unique` (`reference`),
  KEY `orders_courier_id_index` (`courier_id`),
  KEY `orders_customer_id_index` (`customer_id`),
  KEY `orders_address_id_index` (`address_id`),
  KEY `orders_order_status_id_index` (`order_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `order_product`
--

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE IF NOT EXISTS `order_product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_index` (`order_id`),
  KEY `order_product_product_id_index` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 1),
(2, 2, 124, 1),
(3, 3, 84, 1),
(4, 4, 122, 1),
(5, 4, 18, 1),
(6, 4, 43, 1),
(7, 5, 124, 1),
(8, 6, 124, 1),
(9, 6, 18, 1),
(10, 6, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(2, 'Pendente', 'yellow', '2018-05-02 22:39:35', '2018-05-03 18:27:17'),
(4, 'Entregue', 'blue', '2018-05-02 22:39:35', '2018-05-03 18:27:43');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagseguro`
--

DROP TABLE IF EXISTS `pagseguro`;
CREATE TABLE IF NOT EXISTS `pagseguro` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `data_compra` datetime NOT NULL,
  `tipo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `quantidade` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('pendente','creditado','resgatado','cancelado') COLLATE utf8_unicode_ci NOT NULL,
  `codigo` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE IF NOT EXISTS `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `account_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sandbox',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_methods_name_unique` (`name`),
  UNIQUE KEY `payment_methods_account_id_unique` (`account_id`),
  UNIQUE KEY `payment_methods_client_id_unique` (`client_id`),
  UNIQUE KEY `payment_methods_client_secret_unique` (`client_secret`),
  UNIQUE KEY `payment_methods_api_url_unique` (`api_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE IF NOT EXISTS `permission_user` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  KEY `permission_user_permission_id_foreign` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `slug`, `description`, `cover`, `quantity`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, '03', 'I9Vip-01 - Aerossol Fragance', 'i9vip-01-aerossol-fragance', '<p><strong>Notas Olfativas:&nbsp;</strong>toranja, hortel&atilde;, rosa, canela, &acirc;mbar, patchouli e madeira branca</p>\r\n\r\n<p><strong>Inspirado na fragancia:</strong>&nbsp;One Million</p>', 'products/otX0ZZfcSDja1AqDAO7ZM3alqGo6jkDLCN7I8pOm.jpeg', 10, '120.00', 1, '2018-05-03 16:06:49', '2018-05-17 23:33:46'),
(2, '01', 'I9Vip-03 - Aerossol Fragance', 'i9vip-03-aerossol-fragance', '<p><strong>Notas Olfativas:&nbsp;</strong>lim&atilde;o, ameixa, bergamota, ma&ccedil;&atilde;, almiscar e cedro.</p>\r\n\r\n<p><strong>Inspirado na fragancia:</strong>&nbsp;Ferrari Black&nbsp;</p>', 'products/kBQGlW96NKLrTwo89S8F4oRHBIBSkDqa72iWHgpY.jpeg', 12, '120.00', 1, '2018-05-08 23:11:03', '2018-05-15 23:47:13'),
(3, '05', 'I9Vip-05 - Aerossol Fragance', 'i9vip-05-aerossol-fragance', '<p><strong>Notas Olfativas:</strong> fr&eacute;sia, lim&atilde;o, n&eacute;roli, bagas de zimbo, junipero, lavanda, ger&acirc;nio, couro, musgo de cavalho e vetiver.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Animale&nbsp;</p>', 'products/AY21GWYtYxt7n7L0PZYxyMXnkvVC4iIBTlrkzWqz.jpeg', 14, '120.00', 1, '2018-05-08 23:18:11', '2018-05-09 21:15:56'),
(4, '07', 'I9Vip-07- Aerossol Fragance', 'i9vip-07-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Alcar&aacute;via, lavanda, anis, majeric&atilde;o, patchouli, s&aacute;lvia, s&acirc;ndalo, lim&atilde;o, bergamota, cedro, vetiver, cardamomo, couro, fava tonka, alm&iacute;scar, musgo de carvalho e &acirc;mbar.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Azzaro&nbsp;</p>', 'products/sET4OrGBeewTGxVGEnS2muIZiVRifaCtMcvfTBrM.jpeg', 14, '120.00', 1, '2018-05-09 15:28:14', '2018-05-09 21:17:33'),
(5, '09', 'I9Vip-09 - Aerossol Fragance', 'i9vip-09-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Artem&iacute;sia, alcar&aacute;via, coentro, bagas de zimbro ou jun&iacute;pero, manjeric&atilde;o, bergamota, cravo, cominho, tomilho, coriandro, couro, camomila, pimenta, jasmim, rosa, agulhas de pinheiro, ger&acirc;nio, &acirc;mbar, patchouli ou oriza, alm&iacute;scar, musgo de carvalho, vetiver, cedro e tabaco.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Polo Ralph Louren&nbsp;</p>', 'products/mU4KVc8y9USaOH3F5jhNpvmAkvRKePbnpxpmFuEm.jpeg', 14, '120.00', 1, '2018-05-09 15:32:03', '2018-05-09 21:18:04'),
(6, '11', 'I9VIp-11 - Aerossol Fragance', 'i9vip-11-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Especiarias, petitgrain, lavanda, notas verdes, toranja, bergamota, gengibre, pimenta verde, gard&ecirc;nia, violeta, s&aacute;lvia, l&aacute;dano, s&acirc;ndalo, alm&iacute;scar, madeira guaiac, vetiver e incenso.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>212 Men Carolina Herrera&nbsp;</p>', 'products/ULtJHsWJYTOscLQHCDPsScwlsl6VFoqQ3pjk7DFM.jpeg', 14, '120.00', 1, '2018-05-09 15:37:33', '2018-05-09 21:18:45'),
(7, '13', 'I9Vip-13 - Aerossol Fragance', 'i9vip-13-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Petitgrain, cardamomo, lim&atilde;o siciliano, laranja, abeto, jasmim, alecrim, rosa, l&iacute;rio-do-vale, vetiver, alm&iacute;scar, musgo de carvalho e Pau-Brasil.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Fierce Abercrombie</p>', 'products/gqp0415p0IJLXUuonhEE6hTxtdttp11XqBa3IcYB.png', 14, '120.00', 1, '2018-05-09 15:42:13', '2018-05-09 21:19:27'),
(8, '15', 'I9Vip-15 - Aerossol Fragance', 'i9vip-15-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Hortel&atilde;, lavanda, toranja, bergamota, oxicoco, rosa, ma&ccedil;&atilde;, &acirc;mbar, cactus e flor de algod&atilde;o.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Tommy Hilfenger</p>', 'products/BVoBJe61xd1e1wMCzcMpDSdricpiKftbL5cGMzgK.jpeg', 14, '120.00', 1, '2018-05-09 15:45:52', '2018-05-09 21:19:55'),
(9, '17', 'I9Vip-17 - Aerossol Fragance', 'i9vip-17-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Toranja, notas marinhas, tangerina, louro, jasmim, madeira guaiac, musgo de carvalho, patchuli e ambargris.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Invictus Paco Rabanne&nbsp;</p>', 'products/ZjQRUiecUuYBfzLeWaeVh4UV8DqObS7G0X7O3uAJ.jpeg', 14, '120.00', 1, '2018-05-09 15:52:53', '2018-05-09 21:20:50'),
(10, '19', 'I9Vip-19 - Aerossol Fragance', 'i9vip-19-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Lim&atilde;o, pimenta, gengibre, maracuj&aacute;, especiarias, vodka, gin, hortel&atilde;, menta, &acirc;mbar, fava tonka, couro e notas amadeiradas.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>212 Vip Men Carolina Herrera</p>', 'products/LWcIoVj9Kt9HNXV73xaU2Fa8oc5luIx7ZioYM1cI.jpeg', 14, '120.00', 1, '2018-05-09 16:05:06', '2018-05-09 21:21:22'),
(11, '21', 'I9Vip-21 - Aerossol Fragance', 'i9vip-21-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Artem&iacute;sia, lavanda, hortel&atilde;, bergamota, cardamomo, alcar&aacute;via, flor de laranjeira, canela, cominho, s&acirc;ndalo, fava tonka, &acirc;mbar, baunilha e cedro.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Le M&acirc;le Jean Paul</p>', 'products/RzvYUwVtRUOjt1hgWMuqx23bHtLx1eljpjTfZ2hj.jpeg', 14, '120.00', 1, '2018-05-09 16:06:33', '2018-05-09 21:24:30'),
(12, '23', 'I9Vip-23 - Aerossol Fragance', 'i9vip-23-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Bergamota, lim&atilde;o siciliano, anis, flor de oliveira, cidra, madeira guaiac, couro, tabaco e fava tonka.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Armani Giorgio Armani</p>', 'products/DPVpw93FyXrvEtLUc4Of3JsqdJp6xGPKLdC0qKR1.jpeg', 14, '120.00', 1, '2018-05-09 16:17:41', '2018-05-09 21:25:31'),
(13, '25', 'I9Vip-25 - Aerossol Fragance', 'i9vip-25-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Abacaxi, notas verdes, tangerina, mam&atilde;o papaia, bergamota, cardamomo, mandarina, &iacute;ris, lim&atilde;o siciliano, noz-moscada, violeta, ra&iacute;z de orris ou l&iacute;rio florentino, jasmim, l&iacute;rio-do-vale, rosa, s&acirc;ndalo, &acirc;mbar, alm&iacute;scar, cedro e musgo de carvalho.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>CK One Calvin Klein<strong>&nbsp;</strong></p>', 'products/bQUn1KpddkOKqLTl0grL4Z6zbqAitrvQitB7K9fz.jpeg', 14, '120.00', 1, '2018-05-09 16:20:45', '2018-05-09 21:26:03'),
(14, '27', 'I9Vip-27 - Aerossol Fragance', 'i9vip-27-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Abacaxi, lavanda, notas verdes, jun&iacute;pero ou zimbro, bergamota, lim&atilde;o siciliano, am&ecirc;ndoa, jasmim, l&iacute;rio do vale, rosa, Pau-Brasil, ger&acirc;nio, s&acirc;ndalo, fava tonka, &acirc;mbar e alm&iacute;scar.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Joop Night Flight&nbsp;</p>', 'products/GjBuVyp1yrVO2rvHtcobWq8Jg3ovX7y7TEQDNVRx.jpeg', 14, '120.00', 1, '2018-05-09 16:24:41', '2018-05-09 21:44:46'),
(15, '29', 'I9Vip-29 - Aerossol Fragance', 'i9vip-29-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Ameixa, musgo de carvalho, ma&ccedil;&atilde;, lim&atilde;o siciliano, bergamota, ger&acirc;nio, mogno, cravo, canela, s&acirc;ndalo, oliveira, baunilha, vetiver e cedro.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Hugo Boss</p>', 'products/OqHO465vRBOqZnO95G4SbYTFkc08JbXgolIZMaHU.jpeg', 14, '120.00', 1, '2018-05-09 16:28:50', '2018-05-09 21:46:24'),
(16, '31', 'I9Vip-31 - Aerossol Fragance', 'i9vip-31-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Toranja, lim&atilde;o siciliano, oxicoco, a&ccedil;afr&atilde;o, s&aacute;lvia, &acirc;mbar, caf&eacute; e notas amadeiradas.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Ferrari Red&nbsp;</p>', 'products/nzihOtgeSxoNLs7VOJvJpmzVmGOXCSjiV8QoAVvQ.jpeg', 14, '120.00', 1, '2018-05-09 16:35:08', '2018-05-09 21:49:06'),
(17, '33', 'I9Vip-33 - Aerossol Fragance', 'i9vip-33-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Flor de laranjeira, lim&atilde;o siciliano, alecrim, noz-moscada, coentro, lavanda, ger&acirc;nio, cardamomo, lichia, fava tonka, madeira e vetiver.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Silver Scent&nbsp;</p>', 'products/U6muGLFrGltKDC9aAs2L2IM6eottkRWSZRi7QVgo.jpeg', 14, '120.00', 1, '2018-05-09 16:52:38', '2018-05-09 21:50:38'),
(18, '35', 'I9Vip35 - Aerossol Fragance', 'i9vip35-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Alde&iacute;dos, laranja, tangerina, notas aqu&aacute;ticas, pimenta, n&eacute;roli, cedro, fava tonka, &acirc;mbar, baunilha, vetiver, alm&iacute;scar branco e resina de elemi.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Alure Sport Chanel&nbsp;</p>', 'products/NDNmvBYtTqz6slAsAdqFtLgep9xrlJLT9yRc5DTv.jpeg', 12, '120.00', 1, '2018-05-09 16:55:03', '2018-05-17 23:33:46'),
(19, '37', 'I9Vip37 - Aerossol Fragance', 'i9vip37-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Pimenta, bergamota da cal&aacute;bria, ger&acirc;nio, lavanda, pimenta de Szechuan, elemi, pimenta rosa, vetiver, patchouli, cedro, l&aacute;dano e ambroxan.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Sauvage Dior&nbsp;</p>', 'products/q4e59FtoUErCZ2cubLzzllsyY6HDAz1czQtZN5Rb.jpeg', 14, '120.00', 1, '2018-05-09 17:01:13', '2018-05-09 21:50:24'),
(20, '39', 'I9Vip-39 - Aerossol Fragance', 'i9vip-39-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Cardamomo, Bergamota, Cedro da Virg&iacute;nia, Lavanda, Vetiver e Alcar&aacute;via.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>La Nuit de L&#39;Homme&nbsp;</p>', 'products/BIRyjcAiQR7HsNIvdiz6cBCnoR7epmQiQ87OfjUA.png', 14, '120.00', 1, '2018-05-09 18:12:46', '2018-05-09 21:52:39'),
(21, '02', 'I9Vip-02 - Aerossol Fragance', 'i9vip-02-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Kiwi, lichia, marmelo, chocolate branco, jasmim, orqu&iacute;dea, alm&iacute;scar e l&iacute;rio.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Fantasy Britney</p>', 'products/Xl2j1ETdow8Yu8Q0D5fz7zYnW2XCGrGr4U82kJ9N.jpeg', 14, '120.00', 1, '2018-05-09 18:35:59', '2018-05-09 21:53:06'),
(22, '04', 'I9Vip-04 - Aerossol Fragance', 'i9vip-04-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Maracuj&aacute;, rum, gard&ecirc;nia, baunilha, musk, fava tonka, passiflora e notas amadeiradas.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>212 Vip Carolina Herrera&nbsp;</p>', 'products/FN2YdOBjuJO8l6pH3Iq4pyyVjORYvAbx3fAfWO1R.jpeg', 14, '120.00', 1, '2018-05-09 18:37:09', '2018-05-09 21:53:55'),
(23, '06', 'I9Vip-06 - Aerossol Fragance', 'i9vip-06-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Pimenta-rosa, bergamota, mandarina, gard&ecirc;nia, p&eacute;talas, baunilha, s&acirc;ndalo, musk e caramelo.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>212 Sexy Carolina Herrera&nbsp;</p>', 'products/sKqa3q0HaQTBGPLwRp4OWGtNYwqxybjE7bfiiKgT.jpeg', 14, '120.00', 1, '2018-05-09 18:39:13', '2018-05-09 22:26:09'),
(24, '08', 'I9Vip-08 - Aerossol Fragance', 'i9vip-08-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>N&eacute;roli, lim&atilde;o siciliano, amalfi, framboesa, jasmim, flor de laranjeira africana, gard&ecirc;nia, patchouli ou oriza, mel branco e &acirc;mbar.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Lady Million&nbsp;</p>', 'products/UxrFSxeu5smJwmopiodldPJDCnFWye3i5vMUfW7N.jpeg', 14, '120.00', 1, '2018-05-09 18:40:16', '2018-05-09 22:26:32'),
(25, '10', 'I9Vip-10 - Aerossol Fragance', 'i9vip-10-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Magn&oacute;lia, mel&atilde;o, p&ecirc;ssego, pera, bergamota, tangerina, tuberosa, ameixa, violeta, orqu&iacute;dea, fr&eacute;sia, jasmim, l&iacute;rio-do-vale, rosa, alm&iacute;scar, baunilha, cedro e amora.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>J&#39;adore dior&nbsp;</p>', 'products/A4yNewBAyn8bdXvgOx27O0ZVe7nomU21G33RcbIU.jpeg', 14, '120.00', 1, '2018-05-09 18:47:54', '2018-05-09 22:27:03'),
(26, '12', 'I9Vip-12 -  Aerossol Fragance', 'i9vip-12-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Alde&iacute;dos, c&iacute;tricos, tangerina, fr&eacute;sia, hera, manjeric&atilde;o, bergamota, coentro, flor de laranjeira, l&iacute;rio, cravo, jasmim, cravo franc&ecirc;s, l&iacute;rio-do-vale, rosa b&uacute;lgara, s&acirc;ndalo, fava tonka, alm&iacute;scar e baunilha.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Dolce &amp; Gabbana</p>', 'products/D2HAsxTtnOimC1V2KulwcIbpoalgHNvKNXZ1KoLP.jpeg', 14, '120.00', 1, '2018-05-09 18:50:47', '2018-05-09 22:27:29'),
(27, '14', 'I9Vip-14 - Aerossol FRagance', 'i9vip-14-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Mel&atilde;o, coco, tangerina, c&aacute;ssia, jasmim, mandarina, bergamota, algod&atilde;o-doce, mel, damasco, amora, ameixa, orqu&iacute;dea, p&ecirc;ssego, l&iacute;rio-do-vale, bagas vermelhas, rosa, fava tonka, &acirc;mbar, patchouli ou oriza, alm&iacute;scar, baunilha, chocolate amargo e caramelo.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Angel Thierry Mugle</p>', 'products/4NvC4qOpM7UThroXqQSO1u6tGnjnfafK0IiRv9Gi.jpeg', 14, '120.00', 1, '2018-05-09 18:51:54', '2018-05-09 22:27:46'),
(28, '16', 'I9Vip-16 - Aerossol Fragance', 'i9vip-16-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Alde&iacute;dos, notas frutadas, bergamota, lim&atilde;o siciliano, tangerina, madressilva, flor de laranjeira, jasmim, heliotr&oacute;pio, l&iacute;rio-do-vale, rosa, s&acirc;ndalo, fava tonka, &acirc;mbar, patchouli ou oriza, baunilha, musgo de carvalho e alm&iacute;scar.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Gabriela Sabatini</p>', 'products/TALmPO1HHioUaPoT1fF6vUeSt2ZLeOzOvvMFYlRP.jpeg', 14, '120.00', 1, '2018-05-09 18:53:26', '2018-05-09 22:28:19'),
(29, '18', 'I9Vip-18 - Aerossol Fragance', 'i9vip-18-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Champagne, flor de p&ecirc;ssego, alm&iacute;scar branco e &acirc;mbar.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>212 Vip Ros&eacute; Carolina Herrera</p>', 'products/8ND67VS0TXZfr0ar0wrVdsUbvVEWNpsPyPRTLro7.jpeg', 14, '120.00', 1, '2018-05-09 18:55:20', '2018-05-09 22:28:55'),
(30, '20', 'I9Vip-20 - Aerossol Fragance', 'i9vip-20-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Flor de passiflora, jasmim, gard&ecirc;nia, vetiver e baunilha.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Hypn&ocirc;se Lanc&ocirc;me&nbsp;</p>', 'products/BuJGi6ztkgUVIR00QT5tsp2NjmEzhogiACgc2TwT.jpeg', 14, '120.00', 1, '2018-05-09 18:57:17', '2018-05-09 22:29:11'),
(31, '22', 'I9Vip-22 - Aerossol Fragance', 'i9vip-22-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Ma&ccedil;&atilde;, cedro, lim&atilde;o siciliano, rosa branca, bambu, jasmim, &acirc;mbar e alm&iacute;scar.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Light Blue Dolce &amp; Gabbana</p>', 'products/7XwbpCjZIbDUxqkLzME0DM78DRE8dozPldzMK9mC.jpeg', 14, '120.00', 1, '2018-05-09 19:02:13', '2018-05-09 22:29:45'),
(32, '24', 'I9Vip-24 - Aerossol fragance', 'i9vip-24-aerossol-fragance', '<p><strong>Notas olfativas:</strong>&nbsp;Cassis ou groselha preta, laranja, tangerina, c&aacute;ssia, toranja, bergamota, damasco, l&iacute;rio, jasmim, l&iacute;rio-do-vale, rosa, &acirc;mbar, fava tonka, baunilha, musk, melati, cedro da Virg&iacute;nia e alm&iacute;scar.</p>\r\n\r\n<p><strong>Inspirado na fragancia: </strong>Amor Amor Cacharel</p>', 'products/uyVqkbYOIQWl55dOPC0oafU7HvTr8YjcfG0bDPkd.jpeg', 14, '120.00', 1, '2018-05-09 22:37:34', '2018-05-09 22:37:34'),
(33, '26', 'I9Vip-26 - Aerossol Fragance', 'i9vip-26-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Cassis ou groselha preta, laranja, tangerina, c&aacute;ssia, toranja, bergamota, damasco, l&iacute;rio, jasmim, l&iacute;rio-do-vale, rosa, &acirc;mbar, fava tonka, baunilha, musk, melati, cedro da Virg&iacute;nia e alm&iacute;scar.</p>\r\n\r\n<p><strong>Inspirado na fragancia: </strong>Jean Paul Gaultier</p>', 'products/OCOEgJmltzBfLr0b6oQ33KWMCjBL7Yc3mfnw9I8q.jpeg', 14, '120.00', 1, '2018-05-09 22:39:58', '2018-05-09 22:40:40'),
(34, '30', 'I9Vip-30 - Aerossol Fragance', 'i9vip-30-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Groselha preta, pera, jasmim, flor de laranjeira, magn&oacute;lia, patchouli, &iacute;ris, baunilha, pralin&ecirc; e fava tonka.</p>\r\n\r\n<p><strong>Inspirado na fragancia: </strong>La Vie Est Belle Lanc&ocirc;me</p>', 'products/It96kewYfFQkerW4wooq7H5V0qrm18IcZsH4Wmo2.jpeg', 14, '120.00', 1, '2018-05-09 22:44:21', '2018-05-09 22:44:21'),
(35, '32', 'I9Vip-32 - Aerossol Fragance', 'i9vip-32-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Caramelo, alm&iacute;scar, baunilha e benjoin.</p>\r\n\r\n<p><strong>Inspirado na fragancia: </strong>Prada Candy</p>', 'products/WgOp351PIAB4ghVCRiIlBNXGc30aKyIPmj74Q5nm.jpeg', 14, '120.00', 1, '2018-05-09 22:46:14', '2018-05-09 22:46:14'),
(36, '34', 'I9Vip-34 - Aerossol Fragance', 'i9vip-34-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Tangerina verde, jasmim, flor de gengibre, baunilha, sal, ambargris, cashmere e s&acirc;ndalo.</p>\r\n\r\n<p><strong>Inspirado na fragancia: </strong>Olympea Paco Rabanne</p>', 'products/V8xZwhP02a1dZflQ9ipmywL747WEsKN19qmmmITh.jpeg', 14, '120.00', 1, '2018-05-09 22:49:15', '2018-05-09 22:49:15'),
(37, '36', 'I9Vip36 - Aerossol Fragance', 'i9vip36-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Bergamota, laranja, jasmim, rosa, baunilha, patchouli, vetiver e musk.</p>\r\n\r\n<p><strong>Inspirado na fragancia: </strong>Coco Madeimoselle Chanel</p>', 'products/fd8ucRiNe4sz1pBCgOIo4nk4f9M5afAhhAcZQwnA.jpeg', 14, '120.00', 1, '2018-05-09 22:51:27', '2018-05-09 22:55:20'),
(38, '38', 'I9Vip-38 - Aerossol Fragance', 'i9vip-38-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Bergamota, pimenta rosa, fr&eacute;sia, cassis, jasmim, osmanthus, flor de laranjeira, mimosa, magn&oacute;lia, violeta, ir&iacute;s, madeira de &acirc;mbar, patchouli, musk e alm&iacute;scar.</p>\r\n\r\n<p><strong>Inspirado na fragancia: </strong>La Vie Est Belle Florale Lanc&ocirc;me</p>', 'products/hS2AlIcmuSUTw6XtXpRLaQOXIFR10DrKfXjaBW9R.jpeg', 14, '120.00', 1, '2018-05-09 23:02:26', '2018-05-09 23:02:26'),
(39, '40', 'I9Vip-40 - Aerossol Fragance', 'i9vip-40-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Rom&atilde;, l&oacute;tus, orqu&iacute;dea, violeta, &acirc;mbar, alm&iacute;scar e mogno.</p>\r\n\r\n<p><strong>Inspirado na fragancia: </strong>Euphoria Calvin Klein</p>', 'products/CSA9YvK5bGj5bAHoJF3fI5iLSPqv4HEe7XkQMP81.jpeg', 14, '120.00', 1, '2018-05-09 23:22:27', '2018-05-09 23:22:27'),
(40, '42', 'I9Vip-42 - Aerossol Fragance', 'i9vip-42-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Am&ecirc;ndoa, caf&eacute;, jasmin sabac, tuberosa, fava tonka e cacau</p>\r\n\r\n<p><strong>Inspirado na fragancia: </strong>Good Girl Carolina Herrera</p>', 'products/Cd8ntEQMQ5E4laV7jxRf8uAYWQLM6boGRFOJyWMh.png', 14, '120.00', 1, '2018-05-09 23:24:15', '2018-05-09 23:24:15'),
(41, '01', 'Base Matte Liquida', 'base-matte-liquida', '<p><strong>NOVA BASE &ndash; O segredo para uma pele perfeita!</strong></p>\r\n\r\n<ul>\r\n	<li>Toque seco;</li>\r\n	<li>Alta cobertura;</li>\r\n	<li>Acabamento matte natural;</li>\r\n	<li>Livre de &oacute;leo;</li>\r\n	<li>F&oacute;rmula hidratante.</li>\r\n	<li>6 tonalidades.</li>\r\n</ul>', 'products/vJUYxeWh6QTxu1vtsrCrcYVlMGlELzrEPiNkYR19.png', 14, '75.00', 1, '2018-05-10 15:07:29', '2018-05-10 15:07:29'),
(42, '02', 'Makeup Premier', 'makeup-premier', '<p><strong>O segredo da pele perfeita</strong></p>\r\n\r\n<ul>\r\n	<li>Toque seco;</li>\r\n	<li>Minimiza a apar&ecirc;ncia dos poros;</li>\r\n	<li>Disfar&ccedil;a imperfei&ccedil;&otilde;es;</li>\r\n	<li>Melhora a fixa&ccedil;&atilde;o da maquiagem.</li>\r\n</ul>', 'products/xNidXye4TQjR2fGrnS9vsuibL15Po0bbT9TBp1n1.png', 14, '84.00', 1, '2018-05-10 15:12:17', '2018-05-10 15:12:17'),
(43, '03', 'Battom Efeito Matte', 'battom-efeito-matte', '<p>Os batons com efeito matte da i9Life cont&eacute;m col&aacute;geno, vitamina E e aloe vera dando o efeito desejado sem ressecar os l&aacute;bios.</p>\r\n\r\n<ul>\r\n	<li>Toque Aveludado</li>\r\n	<li>Alta Cobertura</li>\r\n	<li>A&ccedil;&atilde;o Antioxidante</li>\r\n</ul>\r\n\r\n<p><strong>Tons de cores:&nbsp;</strong>Pink Candy, Chilli, Trendy Nude, Blueberry, Blackberry, Mocha Nede, Red Berry, Summer Brown, Terracota</p>', 'products/n8qJz1aBLi3rvSsyMIER5CUEdmoYApNE9KfQKlYw.png', 13, '49.00', 1, '2018-05-10 15:21:22', '2018-05-17 23:11:26'),
(44, '04', 'Battom Efeito Cremoso', 'battom-efeito-cremoso', '<p><strong>Novos batons, novas formas de ficar linda!</strong></p>\r\n\r\n<p>S&atilde;o 9 op&ccedil;&otilde;es de cores para inovar a make e o seu dia a dia.</p>\r\n\r\n<ul>\r\n	<li>Efeito cremoso;</li>\r\n	<li>Alta cobertura;</li>\r\n	<li>A&ccedil;&atilde;o antioxidante;</li>\r\n	<li>Cont&eacute;m col&aacute;geno, Aloe Vera e vitamina E.</li>\r\n</ul>\r\n\r\n<p><strong>Tons de Cores:&nbsp;</strong>Queen, Violet, Cooke, Sweet Pink, Pink Buble, Love, Sand Storm, Chic Nude, Wine.</p>', 'products/kOPJTqQAweBvnJ4Xz7hUMKu9Uz4ahwVa07mCiRg7.png', 14, '49.00', 1, '2018-05-10 15:40:06', '2018-05-10 15:40:06'),
(45, '05', 'Battom Liquido Matte Verniz', 'battom-liquido-matte-verniz', '<p><strong>Uma cobertura perfeita para voc&ecirc; arrasar</strong></p>\r\n\r\n<ul>\r\n	<li>Brilho intenso;</li>\r\n	<li>Alta cobertura;</li>\r\n	<li>L&aacute;bios hidratados por at&eacute; 8h;</li>\r\n	<li>Textura cremosa;</li>\r\n	<li>N&atilde;o escorre;</li>\r\n	<li>Acabamento luxuoso.</li>\r\n</ul>\r\n\r\n<p><strong>Tons de Cores: </strong>Flor de Liz, Ma&ccedil;&atilde; do Amor, Nude Glamour</p>', 'products/rQK6UTf4atHdiLsdgjBxbQsML8Gv4E0in3VVeVdS.jpeg', 14, '45.00', 1, '2018-05-10 15:47:17', '2018-05-10 15:47:17'),
(46, '06', 'Battom Efeito Matte Metalizado', 'battom-efeito-matte-metalizado', '<p><strong>EFEITO METALIZADO &ndash; Uma cobertura perfeita e cores incr&iacute;veis!</strong></p>\r\n\r\n<p>✓ N&atilde;o mancha;<br />\r\n✓ Alta cobertura;<br />\r\n✓ N&atilde;o transfere;<br />\r\n✓ Ultra fixa&ccedil;&atilde;o;<br />\r\n✓ F&aacute;cil de aplicar;<br />\r\n✓ N&atilde;o escorre;<br />\r\n✓ Acabamento luxuoso;<br />\r\n✓ N&atilde;o cont&eacute;m chumbo na composi&ccedil;&atilde;o.</p>\r\n\r\n<p><strong>Tons de Cores:</strong>&nbsp;Pink, Roxo, Rubystar</p>', 'products/s41PQX2AlelixeTeotP20TalSluVzRqXXfr1RrA1.jpeg', 14, '45.00', 1, '2018-05-10 15:56:44', '2018-05-10 15:56:44'),
(47, '07', 'Battom Efeito Matte Cremoso', 'battom-efeito-matte-cremoso', '<p><strong>Uma cobertura perfeita e cores incr&iacute;veis com efeito matte!</strong></p>\r\n\r\n<ul>\r\n	<li>Efeito matte;</li>\r\n	<li>N&atilde;o mancha;</li>\r\n	<li>Alta cobertura;</li>\r\n	<li>N&atilde;o craquela;</li>\r\n	<li>Dura&ccedil;&atilde;o de at&eacute; 12h;</li>\r\n	<li>F&aacute;cil de aplicar;</li>\r\n	<li>Acabamento aveludado;</li>\r\n	<li>N&atilde;o transfere.</li>\r\n</ul>\r\n\r\n<p><strong>Tons de Cores:</strong>&nbsp;Baby Pink, Vermelho Intenso, Vinho Absoluto, Capuccino, Amor Perfeito, Red Pink, Marsala, Vermelho Agito, Bombom, Red Kiss, Ameixa, Nude Ros&ecirc;, Pink, Diva, Vermelho Ruby Line, Uva Ruby</p>', 'products/3KBdTPbUEixcDbQiuJwgvBPZQ9U8t53pVXewv9EV.jpeg', 14, '45.00', 1, '2018-05-10 16:01:04', '2018-05-10 16:04:02'),
(48, '08', 'Mascara de Silios', 'mascara-de-silios', '<p><strong>Transforme o seu olhar</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com &Oacute;leo de Argan;</li>\r\n	<li>Resistente &agrave; &aacute;gua;</li>\r\n	<li>Secagem r&aacute;pida.</li>\r\n</ul>\r\n\r\n<p><em><strong>MODO DE USAR:</strong>&nbsp;Coloque a escova na base dos c&iacute;lios e varra at&eacute; a ponta. Se necess&aacute;rio, repita a aplica&ccedil;&atilde;o at&eacute; obter o resultado desejado.</em></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', 'products/5733h1ekZSy27ke39qp5cmhpLhJMMR88sOHOtGie.png', 14, '50.00', 1, '2018-05-10 16:23:29', '2018-05-10 16:26:45'),
(49, '09', 'Quarteto de Sombras', 'quarteto-de-sombras', '<p><strong>O segredo de um olhar poderoso</strong></p>\r\n\r\n<p>O quarteto de sombras i9Life vem com uma paleta de cores para diversas ocasi&otilde;es. E em todas voc&ecirc; vai arrasar.</p>\r\n\r\n<ul>\r\n	<li>Toque aveludado;</li>\r\n	<li>Cores matte, metallic e/ou com shimmer;</li>\r\n	<li>Livre de &oacute;leo;</li>\r\n	<li>Cont&eacute;m vitamina E</li>\r\n</ul>\r\n\r\n<p><strong>Tonalidades:&nbsp;</strong>Romantic, Urban Girl, Friday Night</p>', 'products/ByMwS1AP5VCC24oaTFkdE40h8j3FmNZg0j0PPTre.png', 14, '50.00', 1, '2018-05-10 16:46:20', '2018-05-10 16:46:20'),
(50, '10', 'Delineador', 'delineador', '<p><strong>O segredo de um olhar poderoso</strong></p>\r\n\r\n<p>Para refor&ccedil;ar ainda mais o olhar, a i9 Life tem o delineador perfeito para diversos estilos de make.</p>\r\n\r\n<ul>\r\n	<li>&Agrave; prova d&rsquo;&aacute;gua;</li>\r\n	<li>Longa dura&ccedil;&atilde;o;</li>\r\n	<li>Alta pigmenta&ccedil;&atilde;o.</li>\r\n</ul>', 'products/4P5kxYytgZrhMMTfIxkUN9ZNbYLVzuABT9c96Efb.png', 14, '54.00', 1, '2018-05-10 16:56:45', '2018-05-10 16:59:15'),
(51, '11', 'Lenço Demaquilante', 'lenco-demaquilante', '<p><strong>Para uma pele saud&aacute;vel, sem resqu&iacute;cios de maquiagem e bem limpinha.</strong></p>\r\n\r\n<ul>\r\n	<li>Limpa, demaquila, hidrata e tonifica a pele;</li>\r\n	<li>Cont&eacute;m Aloe Vera;</li>\r\n	<li>Remove maquiagem &agrave; prova d&rsquo;&aacute;gua.</li>\r\n</ul>', 'products/5p8DVl9yMEAImAgF2sMjZotNyhXj2rSoOgRlMGE6.jpeg', 14, '45.00', 1, '2018-05-10 16:58:48', '2018-05-10 16:58:48'),
(52, '12', 'Blush Compacto', 'blush-compacto', '<p><strong>O segredo da pele perfeita</strong></p>\r\n\r\n<p>O blush compacto da i9 Life tem em tr&ecirc;s tons para voc&ecirc; arrasar e transparecer aquela pele saud&aacute;vel que todos queremos na make.</p>\r\n\r\n<ul>\r\n	<li>Efeito natural;</li>\r\n	<li>Acabamento matte ou brilho;</li>\r\n	<li>Livre de &oacute;leo;</li>\r\n	<li>Cont&eacute;m vitamina E.</li>\r\n</ul>\r\n\r\n<p><strong>Tons de Cores: </strong>Hot Pink, Rosa Shimmer, Ruby Matte.</p>', 'products/rGEAeE5LETZcySDLervY7DItTGu591L4b7T3r1XI.png', 14, '49.00', 1, '2018-05-10 17:03:45', '2018-05-10 17:03:45'),
(53, '13', 'Pó Compacto', 'po-compacto', '<p><strong>O segredo da pele perfeita</strong></p>\r\n\r\n<ul>\r\n	<li>Acabamento matte;</li>\r\n	<li>Textura aveludada;</li>\r\n	<li>A&ccedil;&atilde;o antioxidante;</li>\r\n	<li>Livre de &oacute;leo;</li>\r\n	<li>Cont&eacute;m FPS 15;</li>\r\n	<li>Cont&eacute;m vitamina E.</li>\r\n</ul>\r\n\r\n<p><strong>Tons de Cores:</strong>&nbsp;Dark 1, Dark 2, Light 1, Medium</p>', 'products/vApSGPXi3ef8j8MkuHB5YvkabhOmfwtddF8WcrI6.png', 14, '49.00', 1, '2018-05-10 17:05:45', '2018-05-10 17:05:45'),
(54, '14', 'Iluminador Em Pó', 'iluminador-em-po', '<p><strong>O segredo da pele perfeita e bem iluminada</strong></p>\r\n\r\n<p>O iluminador em p&oacute; compacto da i9Life vem em dois tons para deixar a sua pele maravilhosa.</p>\r\n\r\n<ul>\r\n	<li>Textura fina;</li>\r\n	<li>Acabamento glamouroso;</li>\r\n	<li>Livre de &oacute;leo;</li>\r\n	<li>Cont&eacute;m vitamina E.</li>\r\n</ul>\r\n\r\n<p><strong>Tons de Cores:</strong>&nbsp;Shampagne, Chic Glow</p>', 'products/Fdnybxd7a9hGEjI4kxvzkUa8s6QCiG5XJZuGulZD.png', 14, '49.00', 1, '2018-05-10 17:09:11', '2018-05-10 17:09:11'),
(55, '15', 'Bronzeador Em Pó', 'bronzeador-em-po', '<p><strong>O segredo da pele perfeita</strong></p>\r\n\r\n<p>Em duas op&ccedil;&otilde;es de cores, o bronzeador em p&oacute; compacto i9 Life vem para trazer um efeito bronze luminoso para a sua pele.</p>\r\n\r\n<ul>\r\n	<li>Textura fina;</li>\r\n	<li>Acabamento sofisticado;</li>\r\n	<li>Cont&eacute;m vitamina E;</li>\r\n	<li>Livre de &oacute;leo.</li>\r\n</ul>\r\n\r\n<p><strong>Tons de Cores:</strong>&nbsp;Golden Beach, Tropical</p>', 'products/bwR3B3HwchBOg3y4PM4k48t9Zvzrt99oCQSICf7A.png', 14, '49.00', 1, '2018-05-10 17:11:54', '2018-05-10 17:11:54'),
(56, '16', 'Corretivos Liquidos', 'corretivos-liquidos', '<p><strong>O segredo da pele perfeita</strong></p>\r\n\r\n<ul>\r\n	<li>Toque seco;</li>\r\n	<li>Acabamento matte natural;</li>\r\n	<li>Suaviza olheiras, uniformizando a pele;</li>\r\n	<li>Livre de &oacute;leo.</li>\r\n</ul>\r\n\r\n<p><strong>Tons de Cores:</strong> Verde, Amarelo, Azul, Laranja, Bege Claro, bege Medio Claro, Bege Medio escuro, Bege Escuro,&nbsp;</p>', 'products/Lp3olues4xRl45ZOVH9NFkoY6H5e6nfyxRxSTQKO.png', 14, '42.00', 1, '2018-05-10 17:18:20', '2018-05-10 17:18:20'),
(57, '01', 'Hidratante Corporal Rosé', 'hidratante-corporal-rose', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>212 Vip Ros&eacute; Carolina Herrera</p>', 'products/GYjkC9qlDm8hwVHguxCRM5yLYLIbUd0rtOIKKQV6.jpeg', 14, '45.00', 1, '2018-05-10 17:32:16', '2018-05-10 17:32:16'),
(58, '02', 'Hidratante Corporal Candy', 'hidratante-corporal-candy', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Prada Candy</p>', 'products/cW1uhKnpSLnFVUsDoEh3crQKUTKqgDyj6hUjV31u.jpeg', 13, '45.00', 1, '2018-05-10 17:33:48', '2018-05-16 17:23:39'),
(59, '03', 'Hidratante Corporal Fantasy', 'hidratante-corporal-fantasy', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Fantasy Britney</p>', 'products/HgJ7Hoo8uZX94M4PayUmxZjLfkAf6QjvsgyHmmIK.jpeg', 14, '45.00', 1, '2018-05-10 17:35:35', '2018-05-10 17:35:35'),
(60, '04', 'Hidratante Corporal Ollympic', 'hidratante-corporal-ollympic', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Olympea Paco Rabanne</p>', 'products/Hs0ALgBrzxLdGJvnrqHqqWnvVjMjFTR5wkFih9w3.jpeg', 14, '45.00', 1, '2018-05-10 17:37:12', '2018-05-10 17:37:12'),
(61, '05', 'Hidratante Corporal Belle', 'hidratante-corporal-belle', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>La Vie Est Belle Lanc&ocirc;me</p>', 'products/hUeN4YxJ7XwdKmoMdnolAYDdtLH4fRvUb2kBy2sB.jpeg', 14, '45.00', 1, '2018-05-10 17:41:42', '2018-05-10 17:41:42'),
(62, '06', 'Hidratante Corporal Black', 'hidratante-corporal-black', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:</strong>&nbsp;Ferrari Black&nbsp;</p>', 'products/CPgkq8TdJnD9jeXMUdBDWaQXOwLGdUgp9xrC0T6W.jpeg', 14, '45.00', 1, '2018-05-10 17:43:39', '2018-05-10 17:43:39'),
(63, '07', 'Hidratante Corporal Gold', 'hidratante-corporal-gold', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:</strong>&nbsp;One Million</p>', 'products/mCUfpN1mf6Ejsyei4Y20DeaxaJk45gqpaPXnfFsQ.jpeg', 14, '45.00', 1, '2018-05-10 17:44:52', '2018-05-10 17:44:52'),
(64, '08', 'Hidratante Corporal Silver', 'hidratante-corporal-silver', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Silver Scent&nbsp;</p>', 'products/gGLxYKnMRqiPAFQasg7Ma2z7yk0yGamQy6e4ehOf.jpeg', 14, '45.00', 1, '2018-05-10 17:49:01', '2018-05-10 17:49:01'),
(92, '03', 'Hidratação Absoluta - Serum', 'hidratacao-absoluta-serum', '<p><strong>Blindagem intensa para os seus cabelos</strong></p>\r\n\r\n<p>O S&eacute;rum Hidrata&ccedil;&atilde;o Absoluta DUX promove brilho, reduz o frizz, aumenta a elasticidade e a flexibilidade do cabelo. Forma um filme protetor e veda as escamas dos fios evitando a perda de &aacute;gua por evapora&ccedil;&atilde;o, o que mant&eacute;m os cabelos hidratados e lindos por muito mais tempo.</p>\r\n\r\n<p><strong>Peso: 60ML</strong></p>', 'products/rOj0MZU4tymMmzSx96KO04KPbUd3HEcUhsiSI1uj.png', 14, '39.90', 1, '2018-05-16 16:40:52', '2018-05-16 16:40:52'),
(89, '07', 'Perfume Woman Orange', 'perfume-woman-orange', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Flor de Neroli, framboesa, tangerina verde, jasmim, flor de laranjeira, marshmallow, baunilha,&nbsp; heliotr&oacute;pio e s&acirc;ndalo</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/kf86FtHBwgVnlAQO9DKH8v9Pzj2CKP7aPSAzo6HS.png', 14, '160.00', 1, '2018-05-10 23:48:43', '2018-05-10 23:49:16'),
(88, '06', 'Perfume Fabulous', 'perfume-fabulous', '<p>O mist&eacute;rio de ser fabulosa est&aacute; na ess&ecirc;ncia da mulher moderna. Independente e segura, sempre est&aacute; pronta para qualquer desafio. A fragr&acirc;ncia traduz poder e sensualidade em um bouquet Floral Especiado extremamente feminino, sua sa&iacute;da fica evidenciada pelas notas de bergamota, cardamomo e canela. As notas de cora&ccedil;&atilde;o trazem a delicadeza do jasmin, a do&ccedil;ura da pimenta rosa e o amadeirado do cedro. A fragr&acirc;ncia finaliza em um fundo de s&acirc;ndalo, chocolate e White musk.&nbsp;<strong>Fabulous &ndash; Desvende o&nbsp;</strong></p>\r\n\r\n<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Bergamota, cardamomo, canela, jasmin, pimenta, rosa, cedro, s&acirc;ndalo, chocolate e white musk.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/mhWX1aEnp58khQXSWXbngxP4b5uPlx96K5EiltoU.jpeg', 14, '160.00', 1, '2018-05-10 23:47:10', '2018-05-10 23:47:10'),
(86, '04', 'Perfume Imprint Black', 'perfume-imprint-black', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Lim&atilde;o, gengibre, abacaxi, lavanda, cardamomo, musgo, s&acirc;ndalo e orcanox,&nbsp;Amadeirada Frutal</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/1AgF8SIihusAshfEJYzhaixZsCzj6to31yYrQyGH.jpeg', 14, '160.00', 1, '2018-05-10 23:29:14', '2018-05-10 23:47:42'),
(83, '01', 'Perfume Mode-On', 'perfume-mode-on', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Birch leaves, mandarina, bergamota, notas aquosas, alecrim, pimenta do reino, amberwood, baunilha&nbsp;</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/kdFq7CPyjY7IkwZBlh6VxeV8l0Rmfz8gRUKKkKTn.jpeg', 14, '160.00', 1, '2018-05-10 23:26:25', '2018-05-10 23:50:00'),
(84, '02', 'Perfume Imprint', 'perfume-imprint', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Lim&atilde;o, gengibre, abacaxi, lavanda, cardamomo, musgo, s&acirc;ndalo e orcanox,&nbsp;Amadeirada Frutal</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/srdESMBVq76XxcUCInjNWEz3cTCke2QJxMSnu9iD.jpeg', 12, '160.00', 1, '2018-05-10 23:27:34', '2018-05-17 22:51:29'),
(87, '05', 'Perfume Sunny', 'perfume-sunny', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Abacaxi, mel&atilde;o, ma&ccedil;&atilde;, flor de laranjeira, cedro, marine, amberwood, baunilha e powdery</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/Vk7Cnq2NUc3YsoyQRNg1yGf95jAHzeJVHSMudQGX.jpeg', 14, '160.00', 1, '2018-05-10 23:45:25', '2018-05-10 23:45:58'),
(85, '03', 'Perfume Fragnace Blue', 'perfume-fragnace-blue', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Tangerina, Canela, Tabaco, Mirra, Patchouli e Fava Tonka, Fragr&acirc;ncia Oriental Amadeirada</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/28cYS0DbP6qaeWJct8HE2u8ShbKxsnj9a0uw1h68.jpeg', 14, '160.00', 1, '2018-05-10 23:28:26', '2018-05-10 23:43:01'),
(82, '08', 'Kit Intense Liss Dux Pro', 'kit-intense-liss-dux-pro', '<p>- Shampoo Antirres&iacute;duos Dux Pro Intense Liss 200ml: Shampoo de limpeza profunda para os cabelos. Abre a cut&iacute;cula dos fios, elimina res&iacute;duos de cremes, polui&ccedil;&atilde;o, oleosidade, finalizadores e prepara o cabelo para receber o tratamento.<br />\r\n- Shampoo Liso Absoluto Dux Pro Intense Liss 200ml:&nbsp;Alinha gradualmente os fios de forma natural e sem danos. Elimina o frizz, confere maleabilidade, hidrata&ccedil;&atilde;o e brilho intenso.<br />\r\n-&nbsp;Creme Selante Termoativado Dux Pro Intense Liss 120ml:&nbsp;O Creme Selante Termoativado garante prote&ccedil;&atilde;o aos fios. Seus ativos formam um filme que distribui uniformemente o calor do secador e chapa nos fios. Al&eacute;m disso, ajuda a proporcionar brilho, maciez, redu&ccedil;&atilde;o do frizz e pontas duplas dos cabelos.</p>', 'products/xiQQmMic4IRYYEbIdDib9BLsMJRvysogXwjL4qIl.jpeg', 14, '198.00', 1, '2018-05-10 22:28:46', '2018-05-10 23:50:53'),
(90, '01', 'Hidratação Absoluta - Condicionador', 'hidratacao-absoluta-condicionador', '<p><strong>Blindagem intensa para os seus cabelos</strong></p>\r\n\r\n<p>Com ativo Hydrovance, a linha HIDRATA&Ccedil;&Atilde;O ABSOLUTA repara e hidrata a fibra capilar, promove brilho, aumenta a elasticidade e flexibilidade do fio, ajudando a reduzir o frizz e facilitar o pentear das madeixas.</p>\r\n\r\n<p><strong>Peso: 230ML</strong></p>', 'products/xTNIYX8fXuVZzn76vUVlQy57t0fe2kKZsaXAYK00.png', 14, '49.90', 1, '2018-05-16 16:26:10', '2018-05-16 16:53:44'),
(91, '02', 'Hidratação Absoluta - Shampoo', 'hidratacao-absoluta-shampoo', '<p>Produto desenvolvido com poderosos hidratantes de alto desempenho que promovem brilho, elasticidade e flexibilidade aos fios. O seu uso deixa os cabelos limpos, hidratados, com balan&ccedil;o e maleabilidade al&eacute;m de reduzir o frizz.</p>\r\n\r\n<p><strong>Peso: 250ML</strong></p>', 'products/PI1vZzqUdzqHGIGaq7UAtfoCMuZRRL9hexa8pqHM.png', 13, '49.90', 1, '2018-05-16 16:28:20', '2018-05-16 17:23:39'),
(93, '04', 'Super Cachos - Condicionador', 'super-cachos-condicionador', '<p><strong>Cachos definidos e naturais</strong></p>\r\n\r\n<p>A f&oacute;rmula da linha SUPER CACHOS cont&eacute;m agentes condicionantes e pol&iacute;mero elast&ocirc;mero que hidratam, valorizam, modelam e definem os cachos na sua melhor forma.</p>\r\n\r\n<p><strong>Peso: 230ML</strong></p>', 'products/H1eUZIS61CdlWx4ahvbKbehcTs3qBJH7Hyo3h4A4.png', 14, '49.90', 1, '2018-05-16 16:44:12', '2018-05-16 16:53:14'),
(94, '05', 'Super Cachos - Shampoo', 'super-cachos-shampoo', '<p><strong>Cachos definidos e naturais</strong></p>\r\n\r\n<p>A f&oacute;rmula da linha SUPER CACHOS cont&eacute;m agentes condicionantes e pol&iacute;mero elast&ocirc;mero que hidratam, valorizam, modelam e definem os cachos na sua melhor forma</p>\r\n\r\n<p><strong>Peso: 250ML</strong></p>', 'products/h07IhfFNy8XSXhHqaVJx1witm3hhmZdNyCGTNHOw.png', 14, '49.90', 1, '2018-05-16 16:51:04', '2018-05-16 16:54:23'),
(95, '06', 'Super Cachos - Serum', 'super-cachos-serum', '<p><strong>Cachos definidos e naturais</strong></p>\r\n\r\n<p>A f&oacute;rmula da linha SUPER CACHOS cont&eacute;m agentes condicionantes e pol&iacute;mero elast&ocirc;mero que hidratam, valorizam, modelam e definem os cachos na sua melhor forma.</p>\r\n\r\n<p><strong>Peso: 60ML</strong></p>', 'products/DQjxJyTiOl5uwPXa2bQfH5HwGCxjOtKxJXtDfhGc.png', 14, '39.90', 1, '2018-05-16 16:55:45', '2018-05-16 17:07:25'),
(96, '07', 'Biofio Cauterização - Condicionador', 'biofio-cauterizacao-condicionador', '<p><strong>Cabelos fortes e saud&aacute;veis</strong></p>\r\n\r\n<p>A linha BIOFIO Cauteriza&ccedil;&atilde;o reconstr&oacute;i a fibra capilar danificada e fragilizada por processos qu&iacute;micos, t&eacute;rmicos e mec&acirc;nicos. Cont&eacute;m uma f&oacute;rmula rica em amino&aacute;cidos, arginina e queratina, e trata os fios de dentro para fora, devolvendo a maciez, brilho e vida aos cabelos.</p>\r\n\r\n<p><strong>Peso: 230ML</strong></p>', 'products/pfAdbHYwYueW3miS2DDj5zeg9u7StIT1PMYxDaGw.png', 14, '49.90', 1, '2018-05-16 16:59:37', '2018-05-16 16:59:37'),
(97, '08', 'Biofio Cauterização - Shampoo', 'biofio-cauterizacao-shampoo', '<p><strong>Cabelos fortes e saud&aacute;veis</strong></p>\r\n\r\n<p>A linha BIOFIO Cauteriza&ccedil;&atilde;o reconstr&oacute;i a fibra capilar danificada e fragilizada por processos qu&iacute;micos, t&eacute;rmicos e mec&acirc;nicos. Cont&eacute;m uma f&oacute;rmula rica em amino&aacute;cidos, arginina e queratina, e trata os fios de dentro para fora, devolvendo a maciez, brilho e vida aos cabelos.</p>\r\n\r\n<p><strong>Peso: 250ML</strong></p>', 'products/z1GZS8pnSQ8jgWnhcIZtKetjPm6AwOh9KGIaXsHe.png', 14, '49.90', 1, '2018-05-16 17:01:01', '2018-05-16 17:01:01'),
(98, '09', 'Biofio Cauterização - Serum', 'biofio-cauterizacao-serum', '<p><strong>Cabelos fortes e saud&aacute;veis</strong></p>\r\n\r\n<p>A linha BIOFIO Cauteriza&ccedil;&atilde;o reconstr&oacute;i a fibra capilar danificada e fragilizada por processos qu&iacute;micos, t&eacute;rmicos e mec&acirc;nicos. Cont&eacute;m uma f&oacute;rmula rica em amino&aacute;cidos, arginina e queratina, e trata os fios de dentro para fora, devolvendo a maciez, brilho e vida aos cabelos.</p>', 'products/0rfvBt8dD9mnjurB7A2pak3scNYqsudzS5fjUbaE.png', 14, '39.90', 1, '2018-05-16 17:07:07', '2018-05-16 17:07:07'),
(99, '10', 'Biofio Cauterização - Mascara', 'biofio-cauterizacao-mascara', '<p><strong>Cabelos fortes e saud&aacute;veis</strong></p>\r\n\r\n<p>A linha BIOFIO Cauteriza&ccedil;&atilde;o reconstr&oacute;i a fibra capilar danificada e fragilizada por processos qu&iacute;micos, t&eacute;rmicos e mec&acirc;nicos. Cont&eacute;m uma f&oacute;rmula rica em amino&aacute;cidos, arginina e queratina, e trata os fios de dentro para fora, devolvendo a maciez, brilho e vida aos cabelos.</p>\r\n\r\n<p><strong>Peso: 300ML</strong></p>', 'products/fLrtiRQcfT5abyZaoLgawtjGvtGUhr8FjSIbq1Hm.png', 14, '64.00', 1, '2018-05-16 17:10:03', '2018-05-16 17:10:03'),
(100, '12', 'Hidratação Absoluta - Mascara', 'hidratacao-absoluta-mascara', '<p><strong>Blindagem intensa para os seus cabelos</strong></p>\r\n\r\n<p>Com ativo Hydrovance, a linha HIDRATA&Ccedil;&Atilde;O ABSOLUTA repara e hidrata a fibra capilar, promove brilho, aumenta a elasticidade e flexibilidade do fio, ajudando a reduzir o frizz e facilitar o pentear das madeixas.</p>\r\n\r\n<p><strong>Peso: 300ML</strong></p>', 'products/DxfIBIX0bu1z8OPkvq0sVVDvmQdQlMoZQI8oBKLt.png', 14, '64.00', 1, '2018-05-16 17:19:40', '2018-05-16 17:19:40'),
(101, '12', 'Super Cachos - Mascara', 'super-cachos-mascara', '<p><strong>Cachos definidos e naturais</strong></p>\r\n\r\n<p>A f&oacute;rmula da linha SUPER CACHOS cont&eacute;m agentes condicionantes e pol&iacute;mero elast&ocirc;mero que hidratam, valorizam, modelam e definem os cachos na sua melhor forma.</p>\r\n\r\n<p><strong>Peso: 300ML</strong></p>', 'products/fGcBXVKj8flyaI2n3xoycTeN9H5zn1pVAhPdsUOi.png', 14, '64.00', 1, '2018-05-16 17:21:44', '2018-05-16 17:26:43'),
(102, '13', 'Ultra Cor - Mascara', 'ultra-cor-mascara', '<p><strong>Preserva a vivacidade das cores</strong></p>\r\n\r\n<p>A linha Ultra Cor DUX possui em sua formula&ccedil;&atilde;o o ativo Kerarice, composto desenvolvido para proteger a colora&ccedil;&atilde;o e a fibra capilar contra a agress&atilde;o ocasionada pela radia&ccedil;&atilde;o solar, al&eacute;m de compostos hidratantes. O seu uso valoriza a cor dos cabelos, evita o desbotamento por mais tempo e fortalece a cut&iacute;cula dos fios. A M&aacute;scara Ultra Cor possui um alto poder condicionante, nutre, hidrata e protege os fios. Sua f&oacute;rmula promove uma selagem da cut&iacute;cula do fio e como resultado, seus cabelos ficar&atilde;o macios, hidratados e com brilho intenso.</p>\r\n\r\n<p><strong>Peso: 300ML</strong></p>', 'products/4BtbBccHx6nRvh5n7KckxM9Y9O5INZgDYDsPHYpZ.png', 14, '64.00', 1, '2018-05-16 17:29:00', '2018-05-16 17:29:00'),
(103, '14', 'Ultra Cor - Condicionador', 'ultra-cor-condicionador', '<p><strong>Preserva a vivacidade das cores</strong></p>\r\n\r\n<p>A linha Ultra Cor DUX possui em sua formula&ccedil;&atilde;o o ativo Kerarice, composto desenvolvido para proteger a colora&ccedil;&atilde;o e a fibra capilar. Seu uso valoriza a cor dos cabelos, evita o desbotamento por mais tempo e fortalece a cut&iacute;cula dos fios.</p>\r\n\r\n<p><strong>Peso: 230ML</strong></p>', 'products/HA195HahlOXFejVpkB50Xt27tPDdNroMCU88CYk8.jpeg', 14, '49.90', 1, '2018-05-16 17:30:52', '2018-05-16 17:32:45'),
(104, '15', 'Ultra Cor - Shampoo', 'ultra-cor-shampoo', '<p><strong>Preserva a vivacidade das cores</strong></p>\r\n\r\n<p>A linha Ultra Cor DUX possui em sua formula&ccedil;&atilde;o o ativo Kerarice, composto desenvolvido para proteger a colora&ccedil;&atilde;o e a fibra capilar. O seu uso refor&ccedil;a o brilho e auxilia na manuten&ccedil;&atilde;o da colora&ccedil;&atilde;o pois forma um filme protetor sobre os cabelos e os deixa com apar&ecirc;ncia mais saud&aacute;vel e bonita.</p>\r\n\r\n<p><strong>Peso: 250ML</strong></p>', 'products/0Y6m7V6IZRobae4lBgzm98YoZNmCc02qrrDPCSnU.jpeg', 14, '49.90', 1, '2018-05-16 17:32:00', '2018-05-16 17:32:00'),
(105, '16', 'Perfect Liss - Condicionador', 'perfect-liss-condicionador', '<p><strong>Lisos mais que perfeitos</strong></p>\r\n\r\n<p>A linha PERFECT LISS foi desenvolvida para manuten&ccedil;&atilde;o de cabelos com progressivas em geral, lisos e/ou com frizz. Seus ativos tratam o fio de dentro para fora deixando a fibra capilar alinhada e hidratada, potencializando assim o efeito liso de forma natural com styling.</p>\r\n\r\n<p><strong>Peso: 230ML</strong></p>', 'products/qZo5LCJ4SYnCm5vyYubcd2kHWbFPk3y5vynLAS1y.png', 14, '49.90', 1, '2018-05-16 17:45:23', '2018-05-16 17:56:55'),
(106, '17', 'Perfect Liss - Shampoo', 'perfect-liss-shampoo', '<p><strong>Lisos mais que perfeitos</strong></p>\r\n\r\n<p>A linha PERFECT LISS foi desenvolvida para manuten&ccedil;&atilde;o de cabelos com progressivas em geral, lisos e/ou com frizz. Seus ativos tratam o fio de dentro para fora deixando a fibra capilar alinhada e hidratada, potencializando assim o efeito liso de forma natural com styling.</p>\r\n\r\n<p><strong>Peso: 250ML</strong></p>', 'products/7Un5GNfqKxwCdQUnSCUY6jOmWdV5xsAXOSIdhYis.png', 14, '49.90', 1, '2018-05-16 17:46:51', '2018-05-16 17:57:03'),
(107, '18', 'Perfect Liss - Mascara', 'perfect-liss-mascara', '<p><strong>Lisos mais que perfeitos</strong></p>\r\n\r\n<p>A linha PERFECT LISS foi desenvolvida para manuten&ccedil;&atilde;o de cabelos com progressivas em geral, lisos e/ou com frizz. Seus ativos tratam o fio de dentro para fora deixando a fibra capilar alinhada e hidratada, potencializando assim o efeito liso de forma natural com styling.</p>\r\n\r\n<p><strong>Peso: 300ML</strong></p>', 'products/Obx4tqY4f8Qn3HqZd2jdmW1yUpZbnxZI4wmtt9EF.png', 14, '64.00', 1, '2018-05-16 17:50:16', '2018-05-16 17:57:10'),
(108, '19', 'Clear Dux - Shampoo', 'clear-dux-shampoo', '<p>O Shampoo Anticaspa Clear Dux i9Life &eacute; indicado no tratamento da caspa, apresentando resultados surpreendentes desde as primeiras aplica&ccedil;&otilde;es. Possui elevado poder anti-&oacute;leo, que acalma e regenera o couro cabeludo. Controla o excesso de oleosidade, nutrindo e hidratando profundamente cada fio de cabelo, al&eacute;m de ser refrescante e promover uma &oacute;tima sensa&ccedil;&atilde;o de limpeza.</p>\r\n\r\n<p><strong>Peso: 200ML</strong></p>', 'products/PEQZsHcDHQ8zfZd8zl3qJH70jq3QEqzYKagElCUo.png', 14, '49.90', 1, '2018-05-16 17:55:44', '2018-05-16 17:57:16'),
(109, '20', 'GEL Fixador', 'gel-fixador', '<p><strong>Cabelos modelados e fixos</strong></p>\r\n\r\n<p>O Gel Fixador Dux promove fixa&ccedil;&atilde;o de longa dura&ccedil;&atilde;o para voc&ecirc; criar os mais diversos penteados, com uma modelagem incr&iacute;vel.</p>\r\n\r\n<p><strong>Peso: 200ML</strong></p>', 'products/WYF72e98OmOcSGTAdXwm4PDdVE0CKR3cq82MsG87.png', 14, '39.90', 1, '2018-05-16 18:00:04', '2018-05-16 18:00:04'),
(110, '01', 'Sabonete Liquido - Lichia Silvestre', 'sabonete-liquido-lichia-silvestre', '<p><strong>Um perfume incr&iacute;vel na pele</strong></p>\r\n\r\n<p>A linha de sabonetes l&iacute;quidos para m&atilde;os da DUX tem cheirinhos super agrad&aacute;veis e cont&eacute;m ativos capazes de limpar a pele de forma profunda e delicada, proporcionando sensa&ccedil;&atilde;o de maciez e hidrata&ccedil;&atilde;o.</p>\r\n\r\n<p><strong>Peso: 250ML</strong></p>', 'products/LFOWyey90OSUHZXkuvJGdPvSmUT1gWgYiGkglmwj.png', 14, '37.00', 1, '2018-05-16 18:09:20', '2018-05-16 18:09:20');
INSERT INTO `products` (`id`, `sku`, `name`, `slug`, `description`, `cover`, `quantity`, `price`, `status`, `created_at`, `updated_at`) VALUES
(111, '02', 'Sabonete Liquido - Orvalio de Alecrim', 'sabonete-liquido-orvalio-de-alecrim', '<p><strong>Um perfume incr&iacute;vel na pele</strong></p>\r\n\r\n<p>A linha de sabonetes l&iacute;quidos para m&atilde;os da DUX tem cheirinhos super agrad&aacute;veis e cont&eacute;m ativos capazes de limpar a pele de forma profunda e delicada, proporcionando sensa&ccedil;&atilde;o de maciez e hidrata&ccedil;&atilde;o.</p>\r\n\r\n<p><strong>Peso: 250ML</strong></p>', 'products/HmxF25nX8oqZdyjQ9qZUaSPxEr34oaPE209YXYYl.png', 14, '37.00', 1, '2018-05-16 18:10:22', '2018-05-16 18:12:02'),
(112, '03', 'Sabonete Liquido - Erva Doce', 'sabonete-liquido-erva-doce', '<p><strong>Um perfume incr&iacute;vel na pele</strong></p>\r\n\r\n<p>A linha de sabonetes l&iacute;quidos para m&atilde;os da DUX tem cheirinhos super agrad&aacute;veis e cont&eacute;m ativos capazes de limpar a pele de forma profunda e delicada, proporcionando sensa&ccedil;&atilde;o de maciez e hidrata&ccedil;&atilde;o.</p>\r\n\r\n<p><strong>Peso: 250ML</strong></p>', 'products/o1S8XxC1KKba0pq8YitK0tkDW5CnEqYqPdlGqoBO.png', 14, '37.00', 1, '2018-05-16 18:14:34', '2018-05-16 18:14:34'),
(113, '04', 'Sabonete Liquido - Cheiro de bebê', 'sabonete-liquido-cheiro-de-bebe', '<p><strong>Um perfume incr&iacute;vel na pele</strong></p>\r\n\r\n<p>A linha de sabonetes l&iacute;quidos para m&atilde;os da DUX tem cheirinhos super agrad&aacute;veis e cont&eacute;m ativos capazes de limpar a pele de forma profunda e delicada, proporcionando sensa&ccedil;&atilde;o de maciez e hidrata&ccedil;&atilde;o.</p>\r\n\r\n<p><strong>Peso: 250ML</strong></p>', 'products/8ek8ZLTx0nixnoN5FgOfS8zY0SfH7I4uEwf4OeVl.png', 14, '37.00', 1, '2018-05-16 18:15:55', '2018-05-16 18:15:55'),
(114, '05', 'Spa - Creme Hidratante', 'spa-creme-hidratante', '<p>O creme hidratante antirressecamento SPA i9Life foi desenvolvido para uma hidrata&ccedil;&atilde;o profunda da pele e enriquecido com alta concentra&ccedil;&atilde;o de ureia e cacau. Seu uso cont&iacute;nuo deixa a pele suave e sedosa por muito mais tempo.</p>\r\n\r\n<p><strong>Peso: 200ML</strong></p>', 'products/jv0ZkmeG3P6i0UHTRaEYXuzVahLSbYP3FWWe40ph.jpeg', 14, '69.90', 1, '2018-05-16 18:33:39', '2018-05-16 18:33:39'),
(115, '06', 'Spa - Creme Esfoliante', 'spa-creme-esfoliante', '<p>O Creme Esfoliante Antirressecamento i9 Skin Spa &eacute; um potente esfoliante e hidratante que estimula a renova&ccedil;&atilde;o celular, hidrata e limpa a pele profundamente, deixando-a macia e com toque acetinado &uacute;nico.</p>\r\n\r\n<p>Peso: 200ML</p>', 'products/Vh33lTILvN27kd0yJ3jHo7Uh1GGeXX312Ad9yUnq.jpeg', 14, '69.90', 1, '2018-05-16 18:35:49', '2018-05-16 18:35:49'),
(116, '07', 'Solen Defense - 30 FPS', 'solen-defense-30-fps', '<p><strong>Ver&atilde;o sem preocupa&ccedil;&atilde;o com Solen Defense</strong></p>\r\n\r\n<ul>\r\n	<li>Protege contra a a&ccedil;&atilde;o dos raios UVA 10 e UVB;</li>\r\n	<li>Livre de &oacute;leo;</li>\r\n	<li>Pele bronzeada, hidratada e protegida.</li>\r\n</ul>\r\n\r\n<p><strong>Peso: 120G</strong></p>', 'products/CsT2IaBJ3N6kTh4RV27xa4GiAUsczdOvcdlFIEcx.png', 14, '59.90', 1, '2018-05-16 18:38:20', '2018-05-16 18:38:20'),
(117, '08', 'Solen Defense - 50 FPS', 'solen-defense-50-fps', '<p><strong>Ver&atilde;o sem preocupa&ccedil;&atilde;o com Solen Defense</strong></p>\r\n\r\n<ul>\r\n	<li>Protege contra a a&ccedil;&atilde;o dos raios UVA 17 e UVB;</li>\r\n	<li>Livre de &oacute;leo;</li>\r\n	<li>Cont&eacute;m vitamina E;</li>\r\n	<li>Sem PABA.</li>\r\n</ul>\r\n\r\n<p><strong>Peso: 120G</strong></p>', 'products/HMOn7aVfIvnUtIHSn9ycZfVkKgFQKHbEyeOEnQuH.png', 14, '79.90', 1, '2018-05-16 18:43:35', '2018-05-16 18:43:35'),
(118, '09', 'Lipo Reductor', 'lipo-reductor', '<p>O Lipo Reductor da i9Life &eacute; um mousse corporal redutor de medidas f&aacute;cil de aplicar.&nbsp;</p>\r\n\r\n<p>Resultados comprovados em at&eacute; 4 semanas; Com &oacute;leo de caf&eacute; verde; Anticelulite; Efeito crioter&aacute;pico; Reduz aspecto casca de laranja; Potencializa firmeza da pele; Deixa a pele mais hidratada; Silhueta mais fina.</p>\r\n\r\n<p>&nbsp;</p>', 'products/UfLy8U7FHBroxYPu0PjYQMPizGGwEpz0gBj00x0c.png', 14, '179.90', 1, '2018-05-16 18:52:09', '2018-05-16 19:03:59'),
(119, '10', 'Gel Redutor de Medidas', 'gel-redutor-de-medidas', '<p>O Gel Reductor foi especialmente desenvolvido para ajudar na queima da gordura localizada e modelagem do corpo, produzindo a agrad&aacute;vel sensa&ccedil;&atilde;o de frescor e calor ao mesmo tempo, devido a sua formula&ccedil;&atilde;o com c&acirc;nfora e mentol.</p>', 'products/5z650MnvfxeoU6XaRlEPRvZqECJDcHZJYM5a7IPO.jpeg', 14, '58.00', 1, '2018-05-16 18:57:18', '2018-05-16 19:02:35'),
(122, '01', 'Suplemento - Omega 3', 'suplemento-omega-3', '<p>Suplemento em c&aacute;psulas gelatinosas contendo &oacute;leo de peixe, rico em &ocirc;mega 3<br />\r\nEstimula o aumento do colesterol bom (HDL);<br />\r\nAjuda na redu&ccedil;&atilde;o do colesterol ruim (LDL);<br />\r\nAuxilia a reduzir o triglic&eacute;rides;<br />\r\nMelhora o sistema imunol&oacute;gico;<br />\r\nAumenta a fluidez do sangue;<br />\r\nAjudar a evitar o decl&iacute;nio mental;<br />\r\nC&aacute;psulas gelatinosas: ingest&atilde;o r&aacute;pida e f&aacute;cil de engolir;<br />\r\n<strong>Cont&eacute;m:</strong>&nbsp;90 c&aacute;psulas.</p>', 'products/CdIpX1ENK0URCeFmhFx3yISocvORQwq9CcphCP1L.png', 12, '110.00', 1, '2018-05-16 21:38:02', '2018-05-17 23:11:26'),
(120, '11', 'Mascara Black', 'mascara-black', '<p><strong>Argila preta para uma pele renovada e purificada.</strong>&nbsp;</p>\r\n\r\n<p>Limpa os poros; Remove os cravos;</p>\r\n\r\n<p>&nbsp;</p>', 'products/Murm2oK1tpiJTEjjR9lVyeD5qG6nW7HMD6p9oG5q.png', 14, '39.90', 1, '2018-05-16 19:00:09', '2018-05-16 19:02:52'),
(121, '12', 'Mascara Black - Caixa 4 Saches', 'mascara-black-caixa-4-saches', '<p><strong>Argila preta para uma pele renovada e purificada.</strong></p>\r\n\r\n<p>Limpa os poros; Remove os cravos;</p>\r\n\r\n<p>BLACK MASK M&Aacute;SCARA NEGRA - CAIXA COM 4 SACH&Ecirc;S</p>', 'products/DkLO5GcIu6KzjoEdcwN69i8oqzrHxZpIlcHvbRgM.jpeg', 14, '56.00', 1, '2018-05-16 19:01:33', '2018-05-16 19:03:23'),
(125, '04', 'Suplemento - Fiber Caps', 'suplemento-fiber-caps', '<p><strong>Suplemento baseado em Chitosan, Psyllium e Vitamina C</strong></p>\r\n\r\n<p>&bull; Ajuda a melhorar o tr&aacute;fego intestinal;<br />\r\n&bull; Proporciona saciedade;<br />\r\n&bull; Ajuda a evitar a absor&ccedil;&atilde;o de gorduras e controla os n&iacute;veis de colesterol;<br />\r\n&bull; Ajuda a controlar a glicemia, colesterol e press&atilde;o sangu&iacute;nea;<br />\r\n&bull; Ajuda a regular o metabolismo;<br />\r\n&bull; Com propriedades antioxidantes.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;90 c&aacute;psulas</p>', 'products/H6a81bmEdGDYZxMonZQIpd7652ZHSg8OnFk5TyTh.png', 14, '89.00', 1, '2018-05-16 21:46:46', '2018-05-16 21:51:47'),
(123, '02', 'Suplemento - Goji Berry', 'suplemento-goji-berry', '<p><strong>Suplemento de extrato de Goji Berry</strong></p>\r\n\r\n<p>&bull; Ajuda a acelerar o metabolismo, auxiliando no emagrecimento;<br />\r\n&bull; Ajuda a reduzir a flacidez e combater a celulite;<br />\r\n&bull; Aumenta as defesas imunol&oacute;gicas do corpo;<br />\r\n&bull; A&ccedil;&atilde;o antioxidante &rarr; Combate o envelhecimento prematuro;<br />\r\n&bull; Auxilia na redu&ccedil;&atilde;o dos riscos de doen&ccedil;as cardiovasculares;<br />\r\n&bull; Regula os n&iacute;veis de colesterol e glicemia;<br />\r\n&bull; Melhora a fun&ccedil;&atilde;o gastrointestinal;<br />\r\n&bull; Favorece o desempenho neurol&oacute;gico e psicol&oacute;gico;<br />\r\n&bull; Contribui para uma boa sa&uacute;de dos olhos.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;90 c&aacute;psulas.</p>', 'products/YidLrGc8MQ9wpvnKTVqPkPHtnRFaeNfJaqkdMDtK.png', 14, '89.00', 1, '2018-05-16 21:42:02', '2018-05-16 21:42:02'),
(124, '03', 'Suplemento - Detox', 'suplemento-detox', '<p><strong>Suplemento de desintoxica&ccedil;&atilde;o vitam&iacute;nica e mineral</strong></p>\r\n\r\n<p>&bull; Ajudar na elimina&ccedil;&atilde;o de toxinas do corpo;<br />\r\n&bull; Poderosa a&ccedil;&atilde;o antioxidante &rarr; evita o envelhecimento prematuro;<br />\r\n&bull; Ajuda no processo de desbaste;<br />\r\n&bull; Ajuda a fortalecer o sistema imunol&oacute;gico;<br />\r\n&bull; Ajuda a reduzir a fadiga.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;90 c&aacute;psulas.</p>', 'products/nC6DMULHQqo2gnpI3C71vUbzhMEgpjCVmkCLUUAn.png', 9, '89.00', 1, '2018-05-16 21:43:14', '2018-05-17 23:33:46'),
(126, '05', 'Suplemento - Skin Flex', 'suplemento-skin-flex', '<p><strong>Para uma pele saud&aacute;vel e bonita</strong></p>\r\n\r\n<p>&bull; Fortalece cabelos e unhas;<br />\r\n&bull; Contribui para a sa&uacute;de dos ossos e articula&ccedil;&otilde;es;<br />\r\n&bull; Auxilia no aumento da massa magra;<br />\r\n&bull; Proporciona firmeza e elasticidade &agrave; pele, auxiliando a prevenir rugas;<br />\r\n&bull; Previne flacidez e celulite.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;90 c&aacute;psulas.</p>', 'products/QMT04Mg8mVMOPR7OaK7REF74sUQuc5RzMbMXUo4l.png', 14, '89.00', 1, '2018-05-16 22:09:05', '2018-05-16 22:09:05'),
(127, '06', 'Suplemento - Polivitaminico', 'suplemento-polivitaminico', '<p><strong>Suplemento&nbsp;polivitam&iacute;nico e polimineral</strong></p>\r\n\r\n<p>Cont&eacute;m todas as vitaminas e minerais essenciais ao organismo em quantidades di&aacute;rias ideais para o bom funcionamento&nbsp;do organismo, do sistema imunol&oacute;gico e para o crescimento e desenvolvimento corporal.&nbsp;Pode ser usado para complementar a alimenta&ccedil;&atilde;o de crian&ccedil;as (se recomendado pelo m&eacute;dico), jovens, adultos e idosos.</p>\r\n\r\n<ul>\r\n	<li>Energia e resist&ecirc;ncia;</li>\r\n	<li>Sa&uacute;de e longevidade;</li>\r\n	<li>Sa&uacute;de da mente;</li>\r\n	<li>N&atilde;o engorda.</li>\r\n</ul>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;90 c&aacute;psulas.</p>', 'products/RMv1oQFAVCRyyNHei5xVQBvrAc9Nz2SG2bAKb9lZ.png', 14, '89.00', 1, '2018-05-16 22:11:22', '2018-05-16 22:11:22'),
(128, '07', 'Suplemento - Osteo Defense', 'suplemento-osteo-defense', '<p>Suplemento em c&aacute;psulas para reposi&ccedil;&atilde;o de c&aacute;lcio 4 em 1: cont&eacute;m&nbsp;c&aacute;lcio, magn&eacute;sio, vitamina D3 e vitamina K2.<br />\r\nAjuda a melhorar a sa&uacute;de &oacute;ssea, card&iacute;aca, dental, vascular e sangu&iacute;nea.&nbsp;Auxilia na preven&ccedil;&atilde;o de doen&ccedil;as como osteoporose, osteopenia, trombose, fibromialgia, Parkinson, Alzheimer e outras.<br />\r\nO consumo do c&aacute;lcio &eacute; essencial em todas as faixas et&aacute;rias e sua defici&ecirc;ncia &eacute; muito comum. Apesar de vir de variadas fontes alimentares como leite e derivados, carnes, verduras e legumes, muitas pessoas n&atilde;o conseguem ingerir a quantidade di&aacute;ria necess&aacute;ria.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;90 c&aacute;psulas.</p>', 'products/Nld1oVuOAWwy9rh9kMYeDg4rb8ritARHmdmj4qis.png', 10, '118.00', 1, '2018-05-16 22:12:23', '2018-05-17 20:43:45'),
(129, '08', 'Chá -Detox', 'cha-detox', '<p>P&oacute; para preparar bebidas arom&aacute;ticas com ch&aacute; verde e ch&aacute; branco<br />\r\nHidratante, antioxidante, desintoxicante e hepatoprotetor;<br />\r\nReduz a reten&ccedil;&atilde;o de l&iacute;quidos;<br />\r\nElimina subst&acirc;ncias inflamat&oacute;rias;<br />\r\nAjuda a acelerar o metabolismo;<br />\r\nMelhora a sa&uacute;de celular.</p>', 'products/t6tUi3YxuCSYIq631jQngdzwVC1DeuBdh02plCrH.jpeg', 14, '89.00', 1, '2018-05-16 22:15:49', '2018-05-16 22:17:52'),
(130, '09', 'Chá - Energi', 'cha-energi', '<p>P&oacute; para preparo de bebidas de ervas Arom&aacute;ticas e Guaran&aacute; Natural<br />\r\nEfeito ergog&ecirc;nico &rarr; aumenta a capacidade para o trabalho corporal e mental, especialmente pela elimina&ccedil;&atilde;o dos sintomas de fadiga, visando melhora da performance;<br />\r\nRefrescante e revigorante;<br />\r\nCont&eacute;m Guaran&aacute; &rarr; fonte natural de cafe&iacute;na;<br />\r\nSem gl&uacute;ten.</p>', 'products/ew1KJtzlIqsY2gByGw1UT7Qdn8emFmY51p8sWuhP.png', 14, '89.00', 1, '2018-05-16 22:17:17', '2018-05-16 22:18:23'),
(131, '09', 'Energy Drink - Pack C/ 6 Unidates', 'energy-drink-pack-c-6-unidates', '<p>Bebida energ&eacute;tica de baixa caloria &agrave; base de taurina e cafe&iacute;na pronta para consumo.<br />\r\nExtrato de A&ccedil;a&iacute; + Extrato de Guaran&aacute;<br />\r\nZero a&ccedil;&uacute;car;<br />\r\nZero calorias;<br />\r\nZero carboidratos;<br />\r\nZero gorduras;<br />\r\nBaixo teor de s&oacute;dio.<br />\r\n<strong>PACK C/ 6 UNIDADES</strong></p>', 'products/Y5uTDM5qsH3XxUGUST3geGyeEc8PsxhsVNOctv57.png', 14, '90.00', 1, '2018-05-16 22:24:26', '2018-05-16 22:37:26'),
(134, '13', 'Shake - Baunilha', 'shake-baunilha', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/PKoOjjRiNhnsZ6BCcG8M6YZFNFFn5U8MWN2NY5rL.jpeg', 14, '177.90', 1, '2018-05-16 22:38:10', '2018-05-16 22:38:10'),
(132, '11', 'Shake - Açai', 'shake-acai', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/vkaFuUsqhSjOgIIlQyEG4k9tBPhJeQY94YRzKuSt.jpeg', 14, '177.90', 1, '2018-05-16 22:35:58', '2018-05-16 22:36:27'),
(133, '12', 'Shake - Banana', 'shake-banana', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/7pXU0hw077pqHm2c3s64uVG4xZfkJqup5LFp4Egr.jpeg', 14, '177.90', 1, '2018-05-16 22:36:57', '2018-05-16 22:36:57'),
(135, '14', 'Shake - Café', 'shake-cafe', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/VC6GWWIqpEnZ5Jcp8QgqFhvSJZyHsflOzqD3KrTH.jpeg', 14, '177.90', 1, '2018-05-16 22:40:26', '2018-05-16 22:40:26'),
(136, '15', 'Shale - Doce de Leite', 'shale-doce-de-leite', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/IPA8i7dDkFMIVDZeCyqXfWihUVaRVFGoYbIWuBYo.jpeg', 14, '177.90', 1, '2018-05-16 22:41:04', '2018-05-16 22:44:36'),
(137, '16', 'Shake - Graviola', 'shake-graviola', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/6UjmyhmxelK62A3EFjoAUAe269Qr4Y1l9kukQZlw.jpeg', 14, '177.90', 1, '2018-05-16 22:41:42', '2018-05-16 22:41:42'),
(138, '17', 'Shake - Milho', 'shake-milho', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/7cckIFlcz6Nknw8VnDNA5H913u7NeK3lx8P7DcWK.jpeg', 14, '177.90', 1, '2018-05-16 22:42:47', '2018-05-16 22:42:47'),
(139, '18', 'Shake - Morango', 'shake-morango', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/4gHRXUIfaOpNmvGc2aePWmpy9KEYXZlAIyaSRjyE.jpeg', 14, '177.90', 1, '2018-05-16 22:43:16', '2018-05-16 22:43:16'),
(140, '19', 'Shake - Paçoca', 'shake-pacoca', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/9VPRYyFS4Aix2LPgZ2KnDfS61lnMuD3qGYD3v3yb.jpeg', 14, '177.90', 1, '2018-05-16 22:44:01', '2018-05-16 22:44:01'),
(141, '20', 'Shake -  Chocolate', 'shake-chocolate', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/YrBma64ohRljt633svoRpKvOMK9ko5qIjFFiMOOs.jpeg', 14, '130.00', 1, '2018-05-16 22:57:45', '2018-05-16 22:59:31'),
(142, '21', 'Shake - Milho Verde', 'shake-milho-verde', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/UrA8mN0mnrRBFKMhpeZKnWQ54R45Cwh8i1qlpPHL.jpeg', 14, '130.00', 1, '2018-05-16 22:58:27', '2018-05-16 22:59:24'),
(143, '22', 'Shake - Paçoca+', 'shake-pacoca', '<p><strong>Bebida nutritiva preparada para controle de peso</strong></p>\r\n\r\n<p>Suplemento alimentar com alto teor de prote&iacute;na e baixo conte&uacute;do de s&oacute;dio, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Saborosa e com nutrientes equilibrados, esta substitui&ccedil;&atilde;o parcial da refei&ccedil;&atilde;o &eacute; uma aliada daqueles que querem perder, manter ou ganhar peso de maneira saud&aacute;vel.</p>\r\n\r\n<p><strong>Cont&eacute;m:</strong>&nbsp;750 gramas (30 por&ccedil;&otilde;es)</p>', 'products/Zcb3AQ7Su4oN6Th3hxE2xmWq4rVt8L27nf8mWSmS.jpeg', 14, '130.00', 1, '2018-05-16 22:59:14', '2018-05-16 22:59:14'),
(144, '23', 'Proteina isolada da soja e soro do Leite', 'proteina-isolada-da-soja-e-soro-do-leite', '<p><strong>Prote&iacute;na de soja e de soro de leite</strong><br />\r\npara a prepara&ccedil;&atilde;o de bebidas para controle de peso, especialmente formulado para melhorar a nutri&ccedil;&atilde;o. Ele fornece amino&aacute;cidos essenciais que o corpo n&atilde;o produz e que s&oacute; pode ser absorvido atrav&eacute;s de uma nutri&ccedil;&atilde;o adequada.<br />\r\n&Eacute; um alimento rico em prote&iacute;nas isoladas de soja e soro de leite que ajudam a controlar a fome, aumentam a sensa&ccedil;&atilde;o de plenitude e preservam a massa muscular.</p>', 'products/1adPqgeB8lzofE1mf35vUNXMmkvLuGGwMSgkVF6i.png', 14, '199.90', 1, '2018-05-16 23:06:24', '2018-05-16 23:06:24'),
(145, '17', 'Demaquilante em Creme', 'demaquilante-em-creme', '<p>&nbsp;Desenvolvido para remover todo tipo de maquiagem, inclusive aquelas &agrave; prova d&acute;&aacute;gua. Limpa a pele de maneira suave e eficaz, eliminando as impurezas e deixando-a sedosa e hidratada.</p>\r\n\r\n<p><strong>Peso: 200ML</strong></p>', 'products/2DcNpb4qmNbbRkzuUFChQ5OM6KxIzc5fUVLc4wHp.jpeg', 14, '58.00', 1, '2018-05-17 16:05:59', '2018-05-17 16:08:03'),
(146, '18', 'Gold Mask - Máscara facial de Ouro', 'gold-mask-mascara-facial-de-ouro', '<p><strong>Indicada para nutrir e trazer vitalidade para a pele, a M&aacute;scara Facial Ouro i9 Life deixar&aacute; seu rosto hidratado e bonito. Sua a&ccedil;&atilde;o previne e reduz a perda de &aacute;gua e da luminosidade a pele. Al&eacute;m de eliminar as c&eacute;lulas mortas e reduzir a oleosidade.</strong></p>\r\n\r\n<p><strong>Peso: 20ML</strong></p>', 'products/RC5PBCy1SpIALQDhqIrCAAfsf6UPoYWLxPlhIRUe.jpeg', 14, '39.90', 1, '2018-05-17 16:07:42', '2018-05-17 16:07:42');

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_attributes`
--

DROP TABLE IF EXISTS `product_attributes`;
CREATE TABLE IF NOT EXISTS `product_attributes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attributes_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `src` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_index` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `src`) VALUES
(1, 1, 'products/0MmX31Ui3iLkmFBpGqVc3lSBuUQZK9L0vDX6Xi9E.jpeg'),
(2, 2, 'products/5Z8mehQ8eOAwa4XH55twaMboLuHAoL15KWRANosR.jpeg'),
(3, 3, 'products/CtGH1Sx3exdC2j967VqlfKzBftSme6hvAkC5AvfT.jpeg'),
(4, 4, 'products/MSfc5Fw828jzmQIGbAq1FLlFugC9GvcqcVE9HYGn.jpeg'),
(5, 5, 'products/I6HTMh8ne4Am18KO8DDBBZbtPOULaqRjEwZZpuh8.jpeg'),
(6, 6, 'products/MO3BP6bRXRCiFhHFnYEp8p0LUdsGk8oSJ3OOP9J3.jpeg'),
(11, 7, 'products/52TFjaFlyM3XwG40KjjYw3g7kQK73L2JqM7lXpCL.png'),
(8, 8, 'products/vLEn4RpQULLT1wTRUPc54tNMugeD6mN8HCF7dmFs.jpeg'),
(9, 9, 'products/1G4wdUKr1D3o84brhcGpR5sYdYkL84Qbl9JWCsVW.jpeg'),
(12, 10, 'products/pxTT4n45tfrtOJxJnUhtDCDSgQmpwnZ5AlP633LD.jpeg'),
(13, 11, 'products/T4gvLOXgmbALkZerTW3BKawmB9cp8Tm5hs4aOijM.jpeg'),
(14, 12, 'products/aftnhQulO7fzZMfkyBx5iWjjYICzacsCgPSX3RcL.jpeg'),
(15, 13, 'products/19EtyBh4Hb1HPXlGv30BfLVRQcW0Jw7ux4K2wNSV.jpeg'),
(35, 14, 'products/4lvZR4ZZKWxn6OYwzCUjZ8MCyktBQe7XV6cLH3ne.jpeg'),
(17, 15, 'products/Pk2ylLT8VghZgEBxB71kfShFxwuKAOzVLxUZ79Ju.jpeg'),
(18, 16, 'products/jQiKQPYhRlAy2PUfeSqpYT8G5XM6LYunIlQVubuw.jpeg'),
(19, 17, 'products/YS31cd8XXOo2uGEAFzVMa3jKaM9YuYVEoMbWtac7.jpeg'),
(20, 18, 'products/hePCHDP76T1kQvBi55BcpaZ50xUq62094nKpylet.jpeg'),
(21, 19, 'products/7rI0vQ4WFppAKKckJz1nX7LLB6lOsoXSuaSkVqFn.jpeg'),
(22, 20, 'products/pjz7ZmOfw6Ffyypb4MNMP8VTDs7iDame9GaaPgT5.jpeg'),
(23, 21, 'products/AJkb5Cf2rSh02HPemAh3wKy1EE3xTGxZKgh5empj.jpeg'),
(24, 22, 'products/ihAWyNvVQEBWU057FPScM5bP3Uh9FPv5iZlz3xC2.jpeg'),
(25, 23, 'products/YxO3l3t2DuVhiszL7DZ9OFYja7UhjBNh6wfzgZAu.jpeg'),
(26, 24, 'products/3Jcx3dRTxHkf3tcgjoLkqCDW3TXgqmaeHl50r6QM.jpeg'),
(27, 25, 'products/ca70YPMmHgxVTsXSiOjPYTc2kG4ufRptwxlU4sOK.jpeg'),
(28, 26, 'products/X2zM3KpatLwmixSxqa1pDVtxGCBlPCPhzEP0ZWpB.jpeg'),
(29, 27, 'products/pibyrubrBrF3NbyBRgxUS4DB0TDmtioVywqxPocM.jpeg'),
(30, 28, 'products/z9bWeEkm4tUqnYktmF7oUskR3uMylTAZC6SRRPRp.jpeg'),
(31, 29, 'products/2flQxLlRy9FNSups964iC4DfFKf2rUMrk8HMuqfA.jpeg'),
(32, 30, 'products/SpULoCyaX6Mmq7Z9Q3eIQXKKj1DraUTo2zqOyILc.jpeg'),
(33, 31, 'products/x4crOpQhQ1la6FyNMPBNwmPe8to8dYUU8QQ6jMwi.jpeg'),
(36, 32, 'products/9vCXwF6C2w9qkpIeXmxe0cGSoDEaDwrrjpDzmpmV.jpeg'),
(37, 33, 'products/Vm2LH8CBJ4fnqjuKMFQNsNoonXn0upwsCdH5MpJt.jpeg'),
(38, 34, 'products/0bABkV0jOebVOAi6bbjPZP6uWa6Zz4hxsUrnQ62H.jpeg'),
(39, 35, 'products/JEArFjxlZIoi5Iu5oSD4yOieGbn8BX4eopiUYxL2.jpeg'),
(40, 36, 'products/TlqQUhS2STQdNNsm50nIUlaQlvJMdHmJJ7YKk3oJ.jpeg'),
(41, 37, 'products/kABpi3e9ydQcQL4mdguxqYAIrLuVuqAzvBAx4x54.jpeg'),
(42, 38, 'products/t80FFm0GGrAuDbxFh4PxDg9oULAelBA4xBK9qi9L.jpeg'),
(43, 39, 'products/9MNnk9aDK14aVTZZo2O9fGflAoQZyk5Meo5C088c.jpeg'),
(44, 40, 'products/TxQgyI7Xtg3UcJOhLSLpW7XSv6M38ZH6Zk0In2VH.png'),
(45, 41, 'products/Xbst7Ga1oNkderVLm208MiQyHGq9xCoGeZWJ4fpX.png'),
(46, 42, 'products/vM5wZw703MQvenrMiG6I43wHi3iEd3QZhllZhYJz.png'),
(47, 43, 'products/MWltCfVWsrHNcxGviPS3bu6MTYfF8NSb7xUwjD1k.png'),
(48, 44, 'products/WOK1z4Eh4ZmkjYBqEo7V69ljZUhEoWh4P4bgfYG2.png'),
(49, 45, 'products/wr2PzLSHE2KLpi1AdoTeKme8o8fROD8nJaaf9lm6.jpeg'),
(50, 46, 'products/WITPFYfpESkjmHjWBRXOfQEYFNygwI3ii3YtOFgW.jpeg'),
(51, 47, 'products/yqUtHebHjohtA5KrudNNMo1OYzV6qhqUnLzA6276.jpeg'),
(53, 48, 'products/TKvOJEMpZk8txMsiv8LUE3kaRTedgsOEgtc0N98s.png'),
(54, 49, 'products/sv1vNiS2B66aCrooQPwhP9neuxBDwoIPttkI1Tkb.png'),
(57, 50, 'products/Ytlf6Q0XDAJgMDJWoWTZGpQaPgmyNEs0DjsfccNw.png'),
(56, 51, 'products/TGD8PfPZPnfBkbGdzFPhgRIo7Hom7nMmufaF26WU.jpeg'),
(58, 52, 'products/35OpZuM6aTZWCdVUxF6qMPscvxev9a49gi4iebRV.png'),
(59, 53, 'products/seCW4L4MLaQi078Ez095kB7aKUNpP2i5Wb2VpdVp.png'),
(60, 54, 'products/gzMqRzDyqXhEvh6imGeTJ0pBtEhY1GLkJW2bztik.png'),
(61, 55, 'products/9g2KOuDG2kz7BJE44xjtaBhrrKiYecHHDQ3VkbAo.png'),
(62, 56, 'products/juTuLp1pive726Z0nvD66JIUpRsTw1g0fMSB9xol.png'),
(63, 57, 'products/RYvi6z7e3fcYpv5jFYrK4nDn6GsSJUdlC2a2Y841.jpeg'),
(64, 58, 'products/ZDo3g0AHDPRxsP5kWNA3rhC3nmzIQ7MHTLALWJfM.jpeg'),
(65, 59, 'products/i1wnvvCRZjDqXdlH07ntykhZiQSrgC29aFjdMQCs.jpeg'),
(66, 60, 'products/iDDbYPbj0HlgwAJ6FCcABTpWIx49AryQrdmd6Q5t.jpeg'),
(67, 61, 'products/3sQ9orjTZoGgc74YPb0Ax0s6bBbIsfyhokCFXHSa.jpeg'),
(68, 62, 'products/wdtyhqalVx4U7X1xkkonxa3XGgqPGI6R8FokPqkt.jpeg'),
(69, 63, 'products/i0xlwmhtrpolIMnajEt3RCeGdP9qo1Q6ZlRJEQER.jpeg'),
(70, 64, 'products/yDyki3PPoNAtsPAp4TndjJ4dyPkQdtnBJfrn1akw.jpeg'),
(74, 65, 'products/akYdt7rdEqyuGTTKVLZldBjHAzZKvKuT5h99r4tB.png'),
(72, 66, 'products/Nu2XmWVXh25j8gxiM9BwWRkBC1vlkFeXVUyuF9n0.png'),
(73, 67, 'products/ZLIEpJpipAsh55zBJzf1OvBUGtYSRvOTjQOpPYxO.png'),
(75, 68, 'products/iEatnWlXWWN7gKe89MbFcn56bPVMrsStBdGjQ8Wt.png'),
(76, 69, 'products/1NJBO7yMUTDhbu3Gr4q68VpJYPBYpWG91MEIh35h.png'),
(77, 70, 'products/5atndGCm7mghGYddEfWPHMiD0pxcpSl3nuMzcWoR.png'),
(78, 71, 'products/91rqmPCGOUiLswr5agDw4O26TnPHLGVWSggjFUD4.png'),
(79, 72, 'products/T031bnuSvJfIU0mQ8QQUtKJaDIMH8l0FEmhT9Rj8.png'),
(80, 73, 'products/An7wbRBLHjprhLADFaBHzKHNT5bACs0Nw09FFQXD.png'),
(81, 74, 'products/Gb382YYzvvqJoSnIXCxYGNzXV3iuVfHrcbuN8OHK.png'),
(82, 75, 'products/peuCvG0P3ooZtUhL7okNpVRY8It2kOGVtqu23Oa9.png'),
(83, 76, 'products/gMP26lm4lKe1fofYnDLzIVDM78DKoRGYakZhp2eJ.png'),
(84, 77, 'products/PY1ERk7QGSwtTbFFkoeNTHVaZ5pcVm7tBsjOUYXI.png'),
(85, 78, 'products/YqYF8iFH2kxBoPi5g2roP7D4qEX9quBwDTaB3Ukb.png'),
(86, 79, 'products/n62N5BkCWcCVLZHQ1wqxUSGU6E1U3HBZTXV2HqeV.png'),
(87, 80, 'products/XVgWdVOz8TGN5A5ardaviAJzXIsFReUugiau3BTD.png'),
(88, 81, 'products/zZwmmNT92ABfRxjoyhCY2zAMmpMt90HMnmFgXUkz.png'),
(89, 82, 'products/cgfbMOdbaAjKTCswpjoBbioraP2kvvltPbIDEFHq.jpeg'),
(90, 83, 'products/nlDEiJtaVRnYoEWEAmzfMgjskftLulWwsstL03Dt.jpeg'),
(91, 84, 'products/vhqr2Z7ad0FfyfbfFheAWvvcbwJQK4g4IUkv6NsH.jpeg'),
(92, 85, 'products/TxwACboyXEAR6tXFtdLwT3iYseuXA8MJa9YBiOsZ.jpeg'),
(96, 86, 'products/5zRoTuzPqnScZHaAIQkTd8WMnEmBb8wwTXz9nLeR.jpeg'),
(94, 87, 'products/hEA1znGTZDFkwrxrjrbur37y1SzfyMsMCxKvTcsO.jpeg'),
(95, 88, 'products/TMVEbuWXXkhYIPiq9Db5ui3tPHXfWXrgWtK7GW95.jpeg'),
(98, 89, 'products/sk9S1JNrrm2xJdNQvvuFMWhkXxkjEKT9FowXjcKi.png'),
(105, 90, 'products/F8JYNVtBP9kO0wVGEhOqFuUOjyUKTg0px9P1oaAQ.png'),
(100, 91, 'products/UvmqnXpXt0kPzod7jlsoxrLH0vm8S5Jj5LxUcqnP.png'),
(101, 92, 'products/p7QbLHiX2dJyY4mcP10IjRYkpMraRd7UMNFNS4Nn.png'),
(104, 93, 'products/TlGgcRZLc6M53jNZf3JoDrNnUk1Gse9igdawvlOX.png'),
(106, 94, 'products/I2b5BZpNQE22ajGudiOQK32AfnwPvlSmXoJEECII.png'),
(107, 95, 'products/d377jCOks9be9xr9VEgE68FW7KePZhYnEye6SfNj.png'),
(108, 96, 'products/IWXIFTjAFQ1dkS1TZDx2wnTCNXbxQtywr8RsQXNY.png'),
(109, 97, 'products/8Dq280LoNSu74H0k3jRd6crwB0tFxp8vCKqBKSX0.png'),
(110, 98, 'products/ln7XWmzTPQU2EfITIPTy4GRGh0e2B10VRUCR6CoK.png'),
(111, 99, 'products/7dwheBprzvevnMeFUiXFC9pA1P1cwb3lQwTWHgba.png'),
(112, 100, 'products/fWDoZeUaEwGD0QNLb1D5LkTm6gGmsuJgWJAsLHw9.png'),
(113, 101, 'products/2z1yJpsl9Z6HJbBaLLThKdLqTNOcQDRBKHr1sykM.png'),
(114, 102, 'products/mgJ8WPBdNGIQIF9GsV42AdpN914z3LiOHXRDMAkp.png'),
(117, 103, 'products/u479pOsNsvSNfpJg4GJwzczTbtLcy2zbMtrZSW1i.jpeg'),
(116, 104, 'products/k3P5PUprSOjCdrFUjwH8XITnpbSsxDV3THAEmL0G.jpeg'),
(118, 105, 'products/dzo3U8MgztqZ0DzcKVEdWtzZqPM4jF80TNJ48Luj.png'),
(120, 106, 'products/tNcr6g7CV1xJGe8QTH6A29SOL5AnEySiWAj950GF.png'),
(121, 107, 'products/f7hEFUg7p3fMgMQNmyqYhGaEdTMQ7hiuVwp3GPZ4.png'),
(122, 108, 'products/DRvmKwf3v221V4i0iPeaDiK0EAy66XgTlydyOmZu.png'),
(123, 109, 'products/GX77lXv1J7HcVLR9SdqgfjueTfuLUUVQj7my6Cz7.png'),
(124, 110, 'products/ecftJP3XZfFKKK8mQ66qYBN1LPPlJuq3rhwnR1Ep.png'),
(125, 111, 'products/Szb69u6lZ7EEe7iLfUMB5mEbLmY06gH4O0GjxJQe.png'),
(126, 112, 'products/J5CVjTHtxNeHIcpafwL1Qsi6vtViKkIDDmIjQSLj.png'),
(127, 113, 'products/6Z1bJeqJVtJfy6Qtds2YnwExvQY3mfCBVnkFhCQX.png'),
(128, 114, 'products/eR8jH8fcHkSksd7kFVJqL9zV82VnDvx7F4ZpgTKF.jpeg'),
(129, 115, 'products/VSYqe7jj4wp57PPPPuwg5EcWGLnLlLAMyAW678ZD.jpeg'),
(130, 116, 'products/OclTmY7xNh17LWiut3wYeM9512ZWC8zthhT3BDnR.png'),
(131, 117, 'products/dxfstUxf9PmdjnY4cTfzmF8EPZt1ega64vVoY7RK.png'),
(132, 118, 'products/yKZMCAnuk3TznPv0qKSUNoXP2UqJlxLoJP06wFvh.png'),
(133, 119, 'products/ULTfbL919cOGt9SwzEwbo0gX8NQh3KvjVk4t0X9o.jpeg'),
(134, 120, 'products/UJH6qvcq9vQyinUqeYVPIjBJQ6hfBmXcoLI0ydGz.png'),
(135, 121, 'products/CmTd5WtFIzasD2UJ5QR41a1Uflb4pSgaTGjt3asD.jpeg'),
(136, 122, 'products/5XeAcuSZYEkF4veQBiw3Vrib413NmKsUdJ4QfbEl.png'),
(137, 123, 'products/HO3FMXOfM2TtFfT0sCjkog1foZmz9lvO93eMXKVr.png'),
(138, 124, 'products/QxxbHasRik7UxBrn7fWIfk4Eu2iRdR8yi5OmM3jk.png'),
(140, 125, 'products/7mnIPxdWFv7GLpUuXBA6j1rxDcZtUgllJI08LunT.png'),
(141, 126, 'products/fAwcxInSbP3rE4jvMYuC4Nbmz6c9Gnfh5eIdkwin.png'),
(142, 127, 'products/ljdeaXQzMssB9VZ50SXnxwImP4km0TreEUOdJOjD.png'),
(143, 128, 'products/YGVfdVOTx9sv4EwQLU89px1WBNCgGZgglWxjdoCt.png'),
(144, 129, 'products/9eAxIYlJAeSHwd0LLnr6z5epyTnyTebYkSf6WznZ.jpeg'),
(145, 130, 'products/n8VWZ9VGO8q0oHirlyZNK7xLqfiE1CsogqJXw1Yz.png'),
(146, 131, 'products/TpjW6CCBzJ8l3Frk3qXJmwQIjcMzOJbGzw4QDj2H.png'),
(147, 132, 'products/opzWEnXibgGnN8DYiYk6hJLhcsKWXeODnU8wKPjS.jpeg'),
(148, 133, 'products/yrejokkcLE4OMOPg0RAOzKRcBq4bizQUrSEH10kv.jpeg'),
(149, 134, 'products/zsSVScOXrErOIj3lNvZvQp9IFI5F9r1mqS54DAJw.jpeg'),
(150, 135, 'products/UJM1lyTpOoRPOioLStuEgHtUKUpFxcEkcWYnt1DW.jpeg'),
(156, 136, 'products/63KssDe6amwwtp9oXcOcxIiYGOy5903dCT8AB4z9.jpeg'),
(152, 137, 'products/DwMIY5CwZaCGl893nDYHtcy5GhADIhJw0uvrXaO5.jpeg'),
(153, 138, 'products/LxS8We7tv3wu1AFg1LcSvg1xf5WIdHETlwOm8L53.jpeg'),
(154, 139, 'products/KBYSqzjNxlp48WVrkOGlerpglhPR1Q0hSsG7a9JK.jpeg'),
(155, 140, 'products/qYaIcuVHoy49TwW8qXSmnG9OPRSAaC2SmL88Wbs2.jpeg'),
(157, 141, 'products/tE9Po1Ia8bX9FFEO6qqR5Mb3hZeEtL47rmRotlrn.jpeg'),
(158, 142, 'products/sQ0CpTmjGMa4eWmjnGp3IisaEEAUipjsad3EWQbS.jpeg'),
(159, 143, 'products/kqjym1McKHv7xONOXmVJLL7WH63EMTsZx12Ouz0U.jpeg'),
(160, 144, 'products/nzH9MLaDKQXdHXRa9DsKhsZ83lC0REGEUpW76cKl.png'),
(161, 145, 'products/yzZtCnCTJRadQRvUqBpMuuFXohXPBLcVeocF2z6s.jpeg'),
(162, 146, 'products/9Ic0YtvC1pw8pLmbd9KoaRuTjurOrYQv4hoCa2vW.jpeg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `provinces`
--

DROP TABLE IF EXISTS `provinces`;
CREATE TABLE IF NOT EXISTS `provinces` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provinces_country_id_index` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `provinces`
--

INSERT INTO `provinces` (`id`, `name`, `country_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'sao paulo', 1, 1, '2018-05-07 22:39:35', '2018-05-07 22:39:35');

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', '', '', '2018-05-02 22:39:33', '2018-05-02 22:39:33');

-- --------------------------------------------------------

--
-- Estrutura da tabela `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  KEY `role_user_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `status`, `user_type`) VALUES
(1, 1, 1, 'App\\Shop\\Employees\\Employee');

-- --------------------------------------------------------

--
-- Estrutura da tabela `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE IF NOT EXISTS `shoppingcart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
