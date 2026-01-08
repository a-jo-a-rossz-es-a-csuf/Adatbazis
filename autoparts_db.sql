-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Jan 08. 11:18
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `autoparts_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_type` enum('billing','shipping') NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(100) DEFAULT 'Hungary',
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `car_brands`
--

CREATE TABLE `car_brands` (
  `brand_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `car_brands`
--

INSERT INTO `car_brands` (`brand_id`, `name`, `logo_url`, `created_at`) VALUES
(1, 'Audi', NULL, '2026-01-08 10:16:15'),
(2, 'BMW', NULL, '2026-01-08 10:16:15'),
(3, 'Mercedes-Benz', NULL, '2026-01-08 10:16:15'),
(4, 'Volkswagen', NULL, '2026-01-08 10:16:15'),
(5, 'Opel', NULL, '2026-01-08 10:16:15'),
(6, 'Ford', NULL, '2026-01-08 10:16:15'),
(7, 'Peugeot', NULL, '2026-01-08 10:16:15'),
(8, 'Renault', NULL, '2026-01-08 10:16:15'),
(9, 'Skoda', NULL, '2026-01-08 10:16:15');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `car_models`
--

CREATE TABLE `car_models` (
  `model_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `year_from` int(11) DEFAULT NULL,
  `year_to` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `car_models`
--

INSERT INTO `car_models` (`model_id`, `brand_id`, `name`, `year_from`, `year_to`, `created_at`) VALUES
(1, 1, '100', 1982, 1994, '2026-01-08 10:16:15'),
(2, 1, '200', 1983, 1991, '2026-01-08 10:16:15'),
(3, 1, '50/60/FOX', 1974, 1978, '2026-01-08 10:16:15'),
(4, 1, '80', 1978, 1996, '2026-01-08 10:16:15'),
(5, 1, '90', 1984, 1991, '2026-01-08 10:16:15'),
(6, 1, 'A1', 2010, NULL, '2026-01-08 10:16:15'),
(7, 1, 'A2', 1999, 2005, '2026-01-08 10:16:15'),
(8, 1, 'A3', 1996, NULL, '2026-01-08 10:16:15'),
(9, 1, 'A4', 1994, NULL, '2026-01-08 10:16:15'),
(10, 1, 'A5', 2007, NULL, '2026-01-08 10:16:15'),
(11, 1, 'A6', 1994, NULL, '2026-01-08 10:16:15'),
(12, 1, 'A7', 2010, NULL, '2026-01-08 10:16:15'),
(13, 1, 'A8', 1994, NULL, '2026-01-08 10:16:15'),
(14, 1, 'Q2', 2016, NULL, '2026-01-08 10:16:15'),
(15, 1, 'Q3', 2011, NULL, '2026-01-08 10:16:15'),
(16, 1, 'Q5', 2008, NULL, '2026-01-08 10:16:15'),
(17, 1, 'Q7', 2006, NULL, '2026-01-08 10:16:15'),
(18, 1, 'Q8', 2018, NULL, '2026-01-08 10:16:15'),
(19, 1, 'TT', 1998, NULL, '2026-01-08 10:16:15'),
(20, 1, 'R8', 2007, NULL, '2026-01-08 10:16:15'),
(21, 1, 'e-tron', 2018, NULL, '2026-01-08 10:16:15'),
(22, 2, '1-es sorozat', 2004, NULL, '2026-01-08 10:16:15'),
(23, 2, '2-es sorozat', 2014, NULL, '2026-01-08 10:16:15'),
(24, 2, '3-as sorozat', 1975, NULL, '2026-01-08 10:16:15'),
(25, 2, '4-es sorozat', 2013, NULL, '2026-01-08 10:16:15'),
(26, 2, '5-ös sorozat', 1972, NULL, '2026-01-08 10:16:15'),
(27, 2, '6-os sorozat', 1976, NULL, '2026-01-08 10:16:15'),
(28, 2, '7-es sorozat', 1977, NULL, '2026-01-08 10:16:15'),
(29, 2, '8-as sorozat', 1990, NULL, '2026-01-08 10:16:15'),
(30, 2, 'X1', 2009, NULL, '2026-01-08 10:16:15'),
(31, 2, 'X2', 2018, NULL, '2026-01-08 10:16:15'),
(32, 2, 'X3', 2003, NULL, '2026-01-08 10:16:15'),
(33, 2, 'X4', 2014, NULL, '2026-01-08 10:16:15'),
(34, 2, 'X5', 1999, NULL, '2026-01-08 10:16:15'),
(35, 2, 'X6', 2008, NULL, '2026-01-08 10:16:15'),
(36, 2, 'X7', 2018, NULL, '2026-01-08 10:16:15'),
(37, 2, 'Z3', 1995, 2002, '2026-01-08 10:16:15'),
(38, 2, 'Z4', 2002, NULL, '2026-01-08 10:16:15'),
(39, 2, 'i3', 2013, NULL, '2026-01-08 10:16:15'),
(40, 2, 'i4', 2021, NULL, '2026-01-08 10:16:15'),
(41, 2, 'iX', 2021, NULL, '2026-01-08 10:16:15'),
(42, 3, 'A-osztály', 1997, NULL, '2026-01-08 10:16:15'),
(43, 3, 'B-osztály', 2005, NULL, '2026-01-08 10:16:15'),
(44, 3, 'C-osztály', 1993, NULL, '2026-01-08 10:16:15'),
(45, 3, 'CLA', 2013, NULL, '2026-01-08 10:16:15'),
(46, 3, 'CLS', 2004, NULL, '2026-01-08 10:16:15'),
(47, 3, 'E-osztály', 1953, NULL, '2026-01-08 10:16:15'),
(48, 3, 'S-osztály', 1954, NULL, '2026-01-08 10:16:15'),
(49, 3, 'GLA', 2013, NULL, '2026-01-08 10:16:15'),
(50, 3, 'GLB', 2019, NULL, '2026-01-08 10:16:15'),
(51, 3, 'GLC', 2015, NULL, '2026-01-08 10:16:15'),
(52, 3, 'GLE', 1997, NULL, '2026-01-08 10:16:15'),
(53, 3, 'GLS', 2015, NULL, '2026-01-08 10:16:15'),
(54, 3, 'G-osztály', 1979, NULL, '2026-01-08 10:16:15'),
(55, 3, 'V-osztály', 1996, NULL, '2026-01-08 10:16:15'),
(56, 3, 'AMG GT', 2014, NULL, '2026-01-08 10:16:15'),
(57, 3, 'EQA', 2021, NULL, '2026-01-08 10:16:15'),
(58, 3, 'EQB', 2021, NULL, '2026-01-08 10:16:15'),
(59, 3, 'EQC', 2019, NULL, '2026-01-08 10:16:15'),
(60, 3, 'EQE', 2022, NULL, '2026-01-08 10:16:15'),
(61, 3, 'EQS', 2021, NULL, '2026-01-08 10:16:15');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `parent_category_id`, `created_at`) VALUES
(1, 'Fékrendszer', 'Fékbetétek, féktárcsák, fékfolyadékok', NULL, '2026-01-08 10:16:15'),
(2, 'Motor', 'Motorszűrők, gyertyák, motoralkatrészek', NULL, '2026-01-08 10:16:15'),
(3, 'Felfüggesztés', 'Lengéscsillapítók, rugók, stabilizátorok', NULL, '2026-01-08 10:16:15'),
(4, 'Elektromos rendszer', 'Akkumulátorok, generátorok, indítómotorok', NULL, '2026-01-08 10:16:15'),
(5, 'Olajok', 'Motorolajok, hajtóműolajok, hűtőfolyadékok', NULL, '2026-01-08 10:16:15'),
(6, 'Szűrők', 'Olajszűrő, levegőszűrő, pollenszűrő', NULL, '2026-01-08 10:16:15');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `order_status` enum('pending','confirmed','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `payment_status` enum('pending','paid','failed','refunded') DEFAULT 'pending',
  `payment_method` enum('card','transfer','cash_on_delivery') NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `shipping_cost` decimal(10,2) DEFAULT 0.00,
  `tax` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `sku` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `warranty_months` int(11) DEFAULT 12,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `description`, `sku`, `price`, `stock_quantity`, `image_url`, `manufacturer`, `warranty_months`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Fékbetét szett elülső', 'Prémium minőségű kerámia fékbetét', 'FEK-001', 12500.00, 15, NULL, 'Bosch', 12, 1, '2026-01-08 10:16:15', '2026-01-08 10:16:15'),
(2, 2, 'Olajszűrő', 'OE minőségű olajszűrő', 'SZUR-001', 2890.00, 32, NULL, 'Mann-Filter', 12, 1, '2026-01-08 10:16:15', '2026-01-08 10:16:15'),
(3, 2, 'Levegőszűrő', 'Nagy teljesítményű levegőszűrő', 'SZUR-002', 3450.00, 28, NULL, 'K&N', 12, 1, '2026-01-08 10:16:15', '2026-01-08 10:16:15'),
(4, 3, 'Lengéscsillapító pár', 'Gáznyomású lengéscsillapító', 'LENG-001', 38900.00, 12, NULL, 'Bilstein', 12, 1, '2026-01-08 10:16:15', '2026-01-08 10:16:15'),
(5, 4, 'Autó akkumulátor 60Ah', 'Karbantartásmentes akkumulátor', 'AKK-001', 24500.00, 8, NULL, 'Varta', 12, 1, '2026-01-08 10:16:15', '2026-01-08 10:16:15'),
(6, 5, 'Motorolaj 5W-30 4L', 'Szintetikus motorolaj', 'OLAJ-001', 8900.00, 45, NULL, 'Castrol', 12, 1, '2026-01-08 10:16:15', '2026-01-08 10:16:15'),
(7, 1, 'Féktárcsa szett', 'Szellőztetett féktárcsa pár', 'FEK-002', 18900.00, 10, NULL, 'Brembo', 12, 1, '2026-01-08 10:16:15', '2026-01-08 10:16:15'),
(8, 6, 'Pollenszűrő aktív szenes', 'Szagszűrős pollenszűrő', 'SZUR-003', 4200.00, 25, NULL, 'Bosch', 12, 1, '2026-01-08 10:16:15', '2026-01-08 10:16:15');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `product_compatibility`
--

CREATE TABLE `product_compatibility` (
  `compatibility_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `promotions`
--

CREATE TABLE `promotions` (
  `promotion_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_purchase_amount` decimal(10,2) DEFAULT 0.00,
  `max_uses` int(11) DEFAULT NULL,
  `current_uses` int(11) DEFAULT 0,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `title` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `is_verified_purchase` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`user_id`, `email`, `password_hash`, `first_name`, `last_name`, `phone`, `is_admin`, `created_at`, `updated_at`) VALUES
(1, 'admin@autoparts.hu', '$2a$11$YourHashedPasswordHere', 'Admin', 'User', NULL, 1, '2026-01-08 10:16:15', '2026-01-08 10:16:15'),
(2, 'test@example.com', '$2a$11$YourHashedPasswordHere', 'Test', 'Felhasználó', '+36301234567', 0, '2026-01-08 10:16:15', '2026-01-08 10:16:15');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- A tábla indexei `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD UNIQUE KEY `unique_cart_item` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- A tábla indexei `car_brands`
--
ALTER TABLE `car_brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- A tábla indexei `car_models`
--
ALTER TABLE `car_models`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `idx_brand_id` (`brand_id`);

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `parent_category_id` (`parent_category_id`);

--
-- A tábla indexei `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `shipping_address_id` (`shipping_address_id`),
  ADD KEY `billing_address_id` (`billing_address_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_order_number` (`order_number`),
  ADD KEY `idx_order_status` (`order_status`);

--
-- A tábla indexei `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_product_id` (`product_id`);

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `idx_category_id` (`category_id`),
  ADD KEY `idx_sku` (`sku`),
  ADD KEY `idx_price` (`price`);

--
-- A tábla indexei `product_compatibility`
--
ALTER TABLE `product_compatibility`
  ADD PRIMARY KEY (`compatibility_id`),
  ADD UNIQUE KEY `unique_compatibility` (`product_id`,`model_id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_model_id` (`model_id`);

--
-- A tábla indexei `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`promotion_id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `idx_code` (`code`),
  ADD KEY `idx_dates` (`start_date`,`end_date`);

--
-- A tábla indexei `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_rating` (`rating`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `car_brands`
--
ALTER TABLE `car_brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `car_models`
--
ALTER TABLE `car_models`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `product_compatibility`
--
ALTER TABLE `product_compatibility`
  MODIFY `compatibility_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `promotions`
--
ALTER TABLE `promotions`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `car_models`
--
ALTER TABLE `car_models`
  ADD CONSTRAINT `car_models_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `car_brands` (`brand_id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`shipping_address_id`) REFERENCES `addresses` (`address_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`billing_address_id`) REFERENCES `addresses` (`address_id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `product_compatibility`
--
ALTER TABLE `product_compatibility`
  ADD CONSTRAINT `product_compatibility_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_compatibility_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `car_models` (`model_id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
