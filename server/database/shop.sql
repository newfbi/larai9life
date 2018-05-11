-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 11-Maio-2018 às 20:19
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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `addresses`
--

INSERT INTO `addresses` (`id`, `alias`, `address_1`, `address_2`, `zip`, `phone`, `city_id`, `province_id`, `country_id`, `customer_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'pç miguel braga', '139', 'casa 1', '02353050', '963612389', 1, 1, 1, 1, 0, NULL, '2018-05-07 03:00:00', '2018-05-09 21:06:43'),
(23, 'pç miguel braga', '139', 'casa 1', '01101-080', '963612389', 1, 1, 1, 1, 1, NULL, '2018-05-11 17:44:44', '2018-05-11 17:59:57');

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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `cover`, `status`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 'uncategorized', 'Ut dicta aut nesciunt dolorem quis at rerum amet. Reprehenderit dolorum dolores iusto veritatis non eos. Ut vel explicabo quae modi ea qui. Minima nihil quia est earum dolores aut voluptates ipsam.', 'categories/k0zrWhVV2F0m3xE1X3Sd8sZ9cn0Qae3VEiDxyEC0.png', 1, 0, '2018-05-02 22:39:34', '2018-05-02 22:39:34'),
(3, 'Perfumes', 'perfumes', NULL, 'mYjI7lRXAtiquD0UNV9Td9qmD.png', 1, 1, '2018-05-02 22:53:00', '2018-05-09 20:43:09'),
(8, 'Masculino', 'masculino', NULL, '2cuAn5N9Z6tn8KPhnEzcE9GXz.png', 1, 3, '2018-05-03 15:52:19', '2018-05-09 22:16:08'),
(9, 'Feminino', 'feminino', NULL, 'AHE5wUOWbQ9oAGbqZI6Y5sBA2.png', 1, 3, '2018-05-03 15:53:04', '2018-05-09 22:08:25'),
(6, 'Cremes', 'cremes', NULL, 'BNI3z8IYCqtASXcZme7L2UUII.png', 1, 1, '2018-05-02 22:58:06', '2018-05-09 20:47:49'),
(5, 'Make Up', 'make-up', NULL, '64rqoUg3HMnYCUaRlV9Mce4XD.png', 1, 1, '2018-05-02 23:00:04', '2018-05-09 21:54:31'),
(7, 'Bem estar', 'bem-estar', NULL, 'RiR0AU4IJ3N8UH17kRUC3kdwI.png', 1, 1, '2018-05-02 23:03:47', '2018-05-09 22:13:28'),
(2, 'Novidades', 'novidades', NULL, 'LDNMAVzUGcAIJNhFtt8LWVVfh.jpg', 1, 1, '2018-05-02 22:44:53', '2018-05-09 20:48:37'),
(12, 'Lançamentos', 'lancamentos', NULL, 'oYlmy4lXMTYWJSj3q2FhK8w3a.png', 1, 2, '2018-05-10 22:37:05', '2018-05-10 23:20:44'),
(10, 'Destaques', 'destaques', NULL, 'WkDFPPbbsgz1DwQ2XoivrkOsO.png', 1, 2, '2018-05-09 16:46:14', '2018-05-10 19:07:44');

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
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(110, 6, 57),
(111, 6, 58),
(112, 6, 59),
(113, 6, 60),
(114, 6, 61),
(115, 6, 62),
(116, 6, 63),
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
(165, 6, 64),
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
(167, 12, 83);

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
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `couriers`
--

INSERT INTO `couriers` (`id`, `name`, `description`, `url`, `is_free`, `cost`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pronta entrega', 'Entrega direto com o cliente', 'https://i9infinity.com.br', 1, '0.00', 1, '2018-05-02 22:39:35', '2018-05-03 17:48:10');

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
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `status`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Danilo Candido', 'new_dan08@hotmail.com', '$2y$10$fWRlwTSBix3JnMncGKhGquK2Bp61u0RoeHgG86QJipeKCqBLGNmxO', 1, NULL, NULL, NULL, NULL, NULL, 'dyCmKR5meZFGo56dEJDvZv5tjHSrHZUD3LbZxgLCCVQGhd956p7dsVzjAnfq', '2018-05-03 15:23:48', '2018-05-03 15:23:48'),
(2, 'teste', 'teste@teste.com', '$2y$10$3JUVoa8KaRSuuxQjamWmQOooHDc1MnBaZg9iPpQzcLskOnCB11nxi', 1, NULL, NULL, NULL, NULL, NULL, '84d42ydIDXzFI4PYQheUNLIWu8yuVqIa2T6uvYdiI9YSUtKPkUnROow5pMfs', '2018-05-08 21:31:42', '2018-05-08 21:31:42');

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

INSERT INTO `employees` (`id`, `name`, `email`, `password`, `admin`, `status`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Danilo Candido', 'new_dan08@hotmail.com', '$2y$10$fWRlwTSBix3JnMncGKhGquK2Bp61u0RoeHgG86QJipeKCqBLGNmxO', 1, 1, NULL, 'QOAsCYPMQV', '2018-05-02 22:39:33', '2018-05-02 22:39:33');

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
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courier_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `orders`
--

INSERT INTO `orders` (`id`, `reference`, `courier_id`, `customer_id`, `address_id`, `order_status_id`, `payment`, `discounts`, `total_products`, `tax`, `total`, `total_paid`, `invoice`, `created_at`, `updated_at`) VALUES
(1, 'e20fafbc-54ff-3b15-a622-facd9f559fa4', 1, 1, 1, 1, 'paypal', '482.79', '83.45', '9599.63', '5600.34', '1468.74', NULL, '2018-05-02 22:39:35', '2018-05-02 22:39:35'),
(2, '14c4647a-512b-3f36-ac46-c51bf70a9f8c', 1, 1, 1, 2, 'paypal', '190.64', '2597.80', '9663.64', '3746.27', '3746.27', NULL, '2018-05-02 22:39:35', '2018-05-02 22:39:35'),
(3, 'bc533c72-aa0c-3dc1-bb80-2614b1731a73', 1, 1, 1, 1, 'paypal', '525.94', '3781.93', '7038.58', '2934.20', '5926.07', NULL, '2018-05-02 22:39:35', '2018-05-02 22:39:35'),
(4, '22a9fbf0-1fb9-3f24-82ba-cea00465df3f', 1, 1, 1, 1, 'paypal', '732.51', '1516.75', '6854.39', '318.65', '414.18', NULL, '2018-05-02 22:39:35', '2018-05-02 22:39:35'),
(5, '396e084d-db53-3241-aeff-da3de364c89b', 1, 1, 1, 1, 'paypal', '982.29', '2132.73', '5434.49', '1810.62', '3163.81', NULL, '2018-05-02 22:39:35', '2018-05-02 22:39:35'),
(6, '3938688c-4cf7-3909-8e1b-908bcf4ed325', 1, 1, 1, 1, 'paypal', '281.90', '5406.08', '5716.51', '9349.65', '2756.47', NULL, '2018-05-02 22:39:35', '2018-05-02 22:39:35'),
(7, '227c64aa-d879-3a55-b1f5-83c37ee3eb97', 1, 1, 1, 1, 'paypal', '342.83', '739.74', '307.74', '9842.54', '1775.89', NULL, '2018-05-02 22:39:35', '2018-05-02 22:39:35'),
(8, '2bb33dd7-0f7e-3be3-b210-3ca42c3d31d2', 1, 1, 1, 1, 'paypal', '218.66', '2026.12', '8977.30', '3704.46', '117.54', NULL, '2018-05-02 22:39:35', '2018-05-02 22:39:35'),
(9, 'c838cd66-53d6-34c6-976b-57ddff589736', 1, 1, 1, 1, 'paypal', '293.27', '87.42', '391.43', '4207.52', '7018.00', NULL, '2018-05-02 22:39:35', '2018-05-02 22:39:35'),
(10, 'cfce0ff3-fed0-393b-81eb-40afdf8ac94b', 1, 1, 1, 1, 'paypal', '210.27', '1880.90', '4417.82', '1495.37', '6111.97', NULL, '2018-05-02 22:39:35', '2018-05-02 22:39:35');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 2, 20, 2);

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
(1, 'Pago', 'green', '2018-05-02 22:39:35', '2018-05-03 18:27:06'),
(2, 'Pendente', 'yellow', '2018-05-02 22:39:35', '2018-05-03 18:27:17'),
(3, 'Felhou', 'red', '2018-05-02 22:39:35', '2018-05-03 18:27:33'),
(4, 'Entregue', 'blue', '2018-05-02 22:39:35', '2018-05-03 18:27:43');

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
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `slug`, `description`, `cover`, `quantity`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, '03', 'I9Vip-01 - Aerossol Fragance', 'i9vip-01-aerossol-fragance', '<p><strong>Notas Olfativas:&nbsp;</strong>toranja, hortel&atilde;, rosa, canela, &acirc;mbar, patchouli e madeira branca</p>\r\n\r\n<p><strong>Inspirado na fragancia:</strong>&nbsp;One Million</p>', 'products/otX0ZZfcSDja1AqDAO7ZM3alqGo6jkDLCN7I8pOm.jpeg', 14, '120.00', 1, '2018-05-03 16:06:49', '2018-05-09 21:13:37'),
(2, '01', 'I9Vip-03 - Aerossol Fragance', 'i9vip-03-aerossol-fragance', '<p><strong>Notas Olfativas:&nbsp;</strong>lim&atilde;o, ameixa, bergamota, ma&ccedil;&atilde;, almiscar e cedro.</p>\r\n\r\n<p><strong>Inspirado na fragancia:</strong>&nbsp;Ferrari Black&nbsp;</p>', 'products/kBQGlW96NKLrTwo89S8F4oRHBIBSkDqa72iWHgpY.jpeg', 14, '120.00', 1, '2018-05-08 23:11:03', '2018-05-09 21:14:12'),
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
(18, '35', 'I9Vip35 - Aerossol Fragance', 'i9vip35-aerossol-fragance', '<p><strong>Notas olfativas:&nbsp;</strong>Alde&iacute;dos, laranja, tangerina, notas aqu&aacute;ticas, pimenta, n&eacute;roli, cedro, fava tonka, &acirc;mbar, baunilha, vetiver, alm&iacute;scar branco e resina de elemi.</p>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Alure Sport Chanel&nbsp;</p>', 'products/NDNmvBYtTqz6slAsAdqFtLgep9xrlJLT9yRc5DTv.jpeg', 14, '120.00', 1, '2018-05-09 16:55:03', '2018-05-09 21:49:50'),
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
(43, '03', 'Battom Efeito Matte', 'battom-efeito-matte', '<p>Os batons com efeito matte da i9Life cont&eacute;m col&aacute;geno, vitamina E e aloe vera dando o efeito desejado sem ressecar os l&aacute;bios.</p>\r\n\r\n<ul>\r\n	<li>Toque Aveludado</li>\r\n	<li>Alta Cobertura</li>\r\n	<li>A&ccedil;&atilde;o Antioxidante</li>\r\n</ul>\r\n\r\n<p><strong>Tons de cores:&nbsp;</strong>Pink Candy, Chilli, Trendy Nude, Blueberry, Blackberry, Mocha Nede, Red Berry, Summer Brown, Terracota</p>', 'products/n8qJz1aBLi3rvSsyMIER5CUEdmoYApNE9KfQKlYw.png', 14, '49.00', 1, '2018-05-10 15:21:22', '2018-05-10 15:21:22'),
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
(58, '02', 'Hidratante Corporal Candy', 'hidratante-corporal-candy', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Prada Candy</p>', 'products/cW1uhKnpSLnFVUsDoEh3crQKUTKqgDyj6hUjV31u.jpeg', 14, '45.00', 1, '2018-05-10 17:33:48', '2018-05-10 17:33:48'),
(59, '03', 'Hidratante Corporal Fantasy', 'hidratante-corporal-fantasy', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Fantasy Britney</p>', 'products/HgJ7Hoo8uZX94M4PayUmxZjLfkAf6QjvsgyHmmIK.jpeg', 14, '45.00', 1, '2018-05-10 17:35:35', '2018-05-10 17:35:35'),
(60, '04', 'Hidratante Corporal Ollympic', 'hidratante-corporal-ollympic', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Olympea Paco Rabanne</p>', 'products/Hs0ALgBrzxLdGJvnrqHqqWnvVjMjFTR5wkFih9w3.jpeg', 14, '45.00', 1, '2018-05-10 17:37:12', '2018-05-10 17:37:12'),
(61, '05', 'Hidratante Corporal Belle', 'hidratante-corporal-belle', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>La Vie Est Belle Lanc&ocirc;me</p>', 'products/hUeN4YxJ7XwdKmoMdnolAYDdtLH4fRvUb2kBy2sB.jpeg', 14, '45.00', 1, '2018-05-10 17:41:42', '2018-05-10 17:41:42'),
(62, '06', 'Hidratante Corporal Black', 'hidratante-corporal-black', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:</strong>&nbsp;Ferrari Black&nbsp;</p>', 'products/CPgkq8TdJnD9jeXMUdBDWaQXOwLGdUgp9xrC0T6W.jpeg', 14, '45.00', 1, '2018-05-10 17:43:39', '2018-05-10 17:43:39'),
(63, '07', 'Hidratante Corporal Gold', 'hidratante-corporal-gold', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:</strong>&nbsp;One Million</p>', 'products/mCUfpN1mf6Ejsyei4Y20DeaxaJk45gqpaPXnfFsQ.jpeg', 14, '45.00', 1, '2018-05-10 17:44:52', '2018-05-10 17:44:52'),
(64, '08', 'Hidratante Corporal Silver', 'hidratante-corporal-silver', '<p><strong>Fragr&acirc;ncia inspirada em grandes perfumes internacionais</strong></p>\r\n\r\n<ul>\r\n	<li>F&oacute;rmula com Aloe Vera;</li>\r\n	<li>Fragr&acirc;ncia importada da Fran&ccedil;a;</li>\r\n	<li>Pele aveludada e perfume duradouro.</li>\r\n</ul>\r\n\r\n<p><strong>Inspirado na fragancia:&nbsp;</strong>Silver Scent&nbsp;</p>', 'products/gGLxYKnMRqiPAFQasg7Ma2z7yk0yGamQy6e4ehOf.jpeg', 14, '45.00', 1, '2018-05-10 17:49:01', '2018-05-10 17:49:01'),
(89, '07', 'Perfume Woman Orange', 'perfume-woman-orange', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Flor de Neroli, framboesa, tangerina verde, jasmim, flor de laranjeira, marshmallow, baunilha,&nbsp; heliotr&oacute;pio e s&acirc;ndalo</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/kf86FtHBwgVnlAQO9DKH8v9Pzj2CKP7aPSAzo6HS.png', 14, '160.00', 1, '2018-05-10 23:48:43', '2018-05-10 23:49:16'),
(88, '06', 'Perfume Fabulous', 'perfume-fabulous', '<p>O mist&eacute;rio de ser fabulosa est&aacute; na ess&ecirc;ncia da mulher moderna. Independente e segura, sempre est&aacute; pronta para qualquer desafio. A fragr&acirc;ncia traduz poder e sensualidade em um bouquet Floral Especiado extremamente feminino, sua sa&iacute;da fica evidenciada pelas notas de bergamota, cardamomo e canela. As notas de cora&ccedil;&atilde;o trazem a delicadeza do jasmin, a do&ccedil;ura da pimenta rosa e o amadeirado do cedro. A fragr&acirc;ncia finaliza em um fundo de s&acirc;ndalo, chocolate e White musk.&nbsp;<strong>Fabulous &ndash; Desvende o&nbsp;</strong></p>\r\n\r\n<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Bergamota, cardamomo, canela, jasmin, pimenta, rosa, cedro, s&acirc;ndalo, chocolate e white musk.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/mhWX1aEnp58khQXSWXbngxP4b5uPlx96K5EiltoU.jpeg', 14, '160.00', 1, '2018-05-10 23:47:10', '2018-05-10 23:47:10'),
(86, '04', 'Perfume Imprint Black', 'perfume-imprint-black', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Lim&atilde;o, gengibre, abacaxi, lavanda, cardamomo, musgo, s&acirc;ndalo e orcanox,&nbsp;Amadeirada Frutal</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/1AgF8SIihusAshfEJYzhaixZsCzj6to31yYrQyGH.jpeg', 14, '160.00', 1, '2018-05-10 23:29:14', '2018-05-10 23:47:42'),
(83, '01', 'Perfume Mode-On', 'perfume-mode-on', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Birch leaves, mandarina, bergamota, notas aquosas, alecrim, pimenta do reino, amberwood, baunilha&nbsp;</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/kdFq7CPyjY7IkwZBlh6VxeV8l0Rmfz8gRUKKkKTn.jpeg', 14, '160.00', 1, '2018-05-10 23:26:25', '2018-05-10 23:50:00'),
(84, '02', 'Perfume Imprint', 'perfume-imprint', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Lim&atilde;o, gengibre, abacaxi, lavanda, cardamomo, musgo, s&acirc;ndalo e orcanox,&nbsp;Amadeirada Frutal</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/srdESMBVq76XxcUCInjNWEz3cTCke2QJxMSnu9iD.jpeg', 14, '160.00', 1, '2018-05-10 23:27:34', '2018-05-10 23:43:09'),
(87, '05', 'Perfume Sunny', 'perfume-sunny', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Abacaxi, mel&atilde;o, ma&ccedil;&atilde;, flor de laranjeira, cedro, marine, amberwood, baunilha e powdery</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/Vk7Cnq2NUc3YsoyQRNg1yGf95jAHzeJVHSMudQGX.jpeg', 14, '160.00', 1, '2018-05-10 23:45:25', '2018-05-10 23:45:58'),
(85, '03', 'Perfume Fragnace Blue', 'perfume-fragnace-blue', '<ul>\r\n	<li><strong>Notas olfativas</strong><br />\r\n	Tangerina, Canela, Tabaco, Mirra, Patchouli e Fava Tonka, Fragr&acirc;ncia Oriental Amadeirada</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', 'products/28cYS0DbP6qaeWJct8HE2u8ShbKxsnj9a0uw1h68.jpeg', 14, '160.00', 1, '2018-05-10 23:28:26', '2018-05-10 23:43:01'),
(82, '08', 'Kit Intense Liss Dux Pro', 'kit-intense-liss-dux-pro', '<p>- Shampoo Antirres&iacute;duos Dux Pro Intense Liss 200ml: Shampoo de limpeza profunda para os cabelos. Abre a cut&iacute;cula dos fios, elimina res&iacute;duos de cremes, polui&ccedil;&atilde;o, oleosidade, finalizadores e prepara o cabelo para receber o tratamento.<br />\r\n- Shampoo Liso Absoluto Dux Pro Intense Liss 200ml:&nbsp;Alinha gradualmente os fios de forma natural e sem danos. Elimina o frizz, confere maleabilidade, hidrata&ccedil;&atilde;o e brilho intenso.<br />\r\n-&nbsp;Creme Selante Termoativado Dux Pro Intense Liss 120ml:&nbsp;O Creme Selante Termoativado garante prote&ccedil;&atilde;o aos fios. Seus ativos formam um filme que distribui uniformemente o calor do secador e chapa nos fios. Al&eacute;m disso, ajuda a proporcionar brilho, maciez, redu&ccedil;&atilde;o do frizz e pontas duplas dos cabelos.</p>', 'products/xiQQmMic4IRYYEbIdDib9BLsMJRvysogXwjL4qIl.jpeg', 14, '198.00', 1, '2018-05-10 22:28:46', '2018-05-10 23:50:53');

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
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(98, 89, 'products/sk9S1JNrrm2xJdNQvvuFMWhkXxkjEKT9FowXjcKi.png');

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
