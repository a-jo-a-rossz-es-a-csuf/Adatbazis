-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Feb 18. 10:47
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
-- Adatbázis: `autoalkatresz_db`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `alkatreszek`
--

CREATE TABLE `alkatreszek` (
  `id` int(11) NOT NULL,
  `cikkszam` varchar(50) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `leiras` text DEFAULT NULL,
  `kategoria_id` int(11) DEFAULT NULL,
  `ar` decimal(10,2) NOT NULL,
  `akcios_ar` decimal(10,2) DEFAULT NULL,
  `keszlet` int(11) DEFAULT 0,
  `gyarto` varchar(100) DEFAULT NULL,
  `oe_szam` varchar(100) DEFAULT NULL,
  `kep_url` varchar(255) DEFAULT NULL,
  `aktiv` tinyint(1) DEFAULT 1,
  `letrehozva` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `alkatreszek`
--

INSERT INTO `alkatreszek` (`id`, `cikkszam`, `nev`, `leiras`, `kategoria_id`, `ar`, `akcios_ar`, `keszlet`, `gyarto`, `oe_szam`, `kep_url`, `aktiv`, `letrehozva`) VALUES
(1, 'BMW-1E87-FB01', 'Elso fekbetet BMW 1-es E87', NULL, 2, 14900.00, NULL, 35, 'TRW', '34116780711', NULL, 1, '2026-02-18 09:04:44'),
(2, 'BMW-1E87-FT01', 'Elso fektarcsa BMW 1-es E87', NULL, 3, 24900.00, NULL, 20, 'Brembo', '34116855781', NULL, 1, '2026-02-18 09:04:44'),
(3, 'BMW-1E87-OS01', 'Olajszuro BMW 1-es E87', NULL, 5, 2990.00, NULL, 80, 'Mann', '11427508969', NULL, 1, '2026-02-18 09:04:44'),
(4, 'BMW-1E87-LS01', 'Legszuro BMW 1-es E87', NULL, 6, 4490.00, NULL, 55, 'Mahle', '13717798331', NULL, 1, '2026-02-18 09:04:44'),
(5, 'BMW-1F20-FB01', 'Elso fekbetet BMW 1-es F20', NULL, 2, 16900.00, NULL, 40, 'ATE', '34116858910', NULL, 1, '2026-02-18 09:04:44'),
(6, 'BMW-1F20-FT01', 'Elso fektarcsa BMW 1-es F20', NULL, 3, 28900.00, NULL, 25, 'Brembo', '34116792223', NULL, 1, '2026-02-18 09:04:44'),
(7, 'BMW-1F20-OS01', 'Olajszuro BMW 1-es F20', NULL, 5, 3290.00, NULL, 90, 'Mann', '11428683196', NULL, 1, '2026-02-18 09:04:44'),
(8, 'BMW-1F20-LS01', 'Legszuro BMW 1-es F20', NULL, 6, 4990.00, NULL, 60, 'K&N', '13718507320', NULL, 1, '2026-02-18 09:04:44'),
(9, 'BMW-3E46-FB01', 'Elso fekbetet BMW 3-as E46', NULL, 2, 15900.00, NULL, 45, 'TRW', '34116761244', NULL, 1, '2026-02-18 09:04:44'),
(10, 'BMW-3E46-FT01', 'Elso fektarcsa BMW 3-as E46', NULL, 3, 22900.00, NULL, 30, 'Zimmermann', '34116855153', NULL, 1, '2026-02-18 09:04:44'),
(11, 'BMW-3E46-LC01', 'Lengescsillapito elso BMW 3-as E46', NULL, 9, 26900.00, NULL, 18, 'Bilstein', '31316759090', NULL, 1, '2026-02-18 09:04:44'),
(12, 'BMW-3E46-OS01', 'Olajszuro BMW 3-as E46', NULL, 5, 2490.00, NULL, 100, 'Mann', '11421427908', NULL, 1, '2026-02-18 09:04:44'),
(13, 'BMW-3E90-FB01', 'Elso fekbetet BMW 3-as E90', NULL, 2, 18900.00, NULL, 50, 'Brembo', '34116763617', NULL, 1, '2026-02-18 09:04:44'),
(14, 'BMW-3E90-FT01', 'Elso fektarcsa BMW 3-as E90', NULL, 3, 32900.00, NULL, 22, 'Brembo', '34116854998', NULL, 1, '2026-02-18 09:04:44'),
(15, 'BMW-3E90-LC01', 'Lengescsillapito elso BMW 3-as E90', NULL, 9, 32900.00, NULL, 15, 'Sachs', '31316786005', NULL, 1, '2026-02-18 09:04:44'),
(16, 'BMW-3E90-OS01', 'Olajszuro BMW 3-as E90', NULL, 5, 3290.00, NULL, 85, 'Mann', '11427566327', NULL, 1, '2026-02-18 09:04:44'),
(17, 'BMW-3E90-LS01', 'Legszuro BMW 3-as E90', NULL, 6, 5490.00, NULL, 45, 'Mann', '13717797465', NULL, 1, '2026-02-18 09:04:44'),
(18, 'BMW-3E90-GY01', 'Gyujtagyertya BMW 3-as E90 4db', NULL, 7, 12900.00, NULL, 60, 'NGK', '12120037607', NULL, 1, '2026-02-18 09:04:44'),
(19, 'BMW-3F30-FB01', 'Elso fekbetet BMW 3-as F30', NULL, 2, 19900.00, NULL, 55, 'TRW', '34116850568', NULL, 1, '2026-02-18 09:04:44'),
(20, 'BMW-3F30-FB02', 'Hatso fekbetet BMW 3-as F30', NULL, 2, 14900.00, NULL, 48, 'ATE', '34216873093', NULL, 1, '2026-02-18 09:04:44'),
(21, 'BMW-3F30-FT01', 'Elso fektarcsa BMW 3-as F30', NULL, 3, 34900.00, NULL, 20, 'Brembo', '34106859182', NULL, 1, '2026-02-18 09:04:44'),
(22, 'BMW-3F30-LC01', 'Lengescsillapito elso BMW 3-as F30', NULL, 9, 35900.00, NULL, 12, 'Bilstein', '31316851335', NULL, 1, '2026-02-18 09:04:44'),
(23, 'BMW-3F30-OS01', 'Olajszuro BMW 3-as F30', NULL, 5, 3490.00, NULL, 95, 'Mann', '11428683196', NULL, 1, '2026-02-18 09:04:44'),
(24, 'BMW-3F30-LS01', 'Legszuro BMW 3-as F30', NULL, 6, 5990.00, NULL, 50, 'K&N', '13718507320', NULL, 1, '2026-02-18 09:04:44'),
(25, 'BMW-3F30-GY01', 'Gyujtagyertya BMW 3-as F30 4db', NULL, 7, 15900.00, NULL, 55, 'Bosch', '12120039664', NULL, 1, '2026-02-18 09:04:44'),
(26, 'BMW-3F30-VS01', 'Vizszivattyu BMW 3-as F30', NULL, 13, 28900.00, NULL, 18, 'Graf', '11517597715', NULL, 1, '2026-02-18 09:04:44'),
(27, 'BMW-3G20-FB01', 'Elso fekbetet BMW 3-as G20', NULL, 2, 22900.00, NULL, 40, 'Brembo', '34106888459', NULL, 1, '2026-02-18 09:04:44'),
(28, 'BMW-3G20-FT01', 'Elso fektarcsa BMW 3-as G20', NULL, 3, 38900.00, NULL, 18, 'Zimmermann', '34106888457', NULL, 1, '2026-02-18 09:04:44'),
(29, 'BMW-3G20-OS01', 'Olajszuro BMW 3-as G20', NULL, 5, 3990.00, NULL, 70, 'Mann', '11428575211', NULL, 1, '2026-02-18 09:04:44'),
(30, 'BMW-3G20-LS01', 'Legszuro BMW 3-as G20', NULL, 6, 6490.00, NULL, 42, 'Mahle', '13718577171', NULL, 1, '2026-02-18 09:04:44'),
(31, 'BMW-5E39-FB01', 'Elso fekbetet BMW 5-os E39', NULL, 2, 16900.00, NULL, 38, 'TRW', '34116761252', NULL, 1, '2026-02-18 09:04:44'),
(32, 'BMW-5E39-FT01', 'Elso fektarcsa BMW 5-os E39', NULL, 3, 28900.00, NULL, 22, 'Brembo', '34111163153', NULL, 1, '2026-02-18 09:04:44'),
(33, 'BMW-5E39-LC01', 'Lengescsillapito elso BMW 5-os E39', NULL, 9, 28900.00, NULL, 16, 'Monroe', '31311096857', NULL, 1, '2026-02-18 09:04:44'),
(34, 'BMW-5E39-OS01', 'Olajszuro BMW 5-os E39', NULL, 5, 2790.00, NULL, 75, 'Mann', '11421427908', NULL, 1, '2026-02-18 09:04:44'),
(35, 'BMW-5E60-FB01', 'Elso fekbetet BMW 5-os E60', NULL, 2, 19900.00, NULL, 42, 'ATE', '34116763617', NULL, 1, '2026-02-18 09:04:44'),
(36, 'BMW-5E60-FT01', 'Elso fektarcsa BMW 5-os E60', NULL, 3, 34900.00, NULL, 20, 'Brembo', '34116763824', NULL, 1, '2026-02-18 09:04:44'),
(37, 'BMW-5E60-LC01', 'Lengescsillapito elso BMW 5-os E60', NULL, 9, 34900.00, NULL, 14, 'Bilstein', '31316780186', NULL, 1, '2026-02-18 09:04:44'),
(38, 'BMW-5E60-OS01', 'Olajszuro BMW 5-os E60', NULL, 5, 3190.00, NULL, 82, 'Mann', '11427566327', NULL, 1, '2026-02-18 09:04:44'),
(39, 'BMW-5F10-FB01', 'Elso fekbetet BMW 5-os F10', NULL, 2, 24900.00, NULL, 38, 'Brembo', '34116851269', NULL, 1, '2026-02-18 09:04:44'),
(40, 'BMW-5F10-FT01', 'Elso fektarcsa BMW 5-os F10', NULL, 3, 42900.00, NULL, 16, 'Zimmermann', '34116794429', NULL, 1, '2026-02-18 09:04:44'),
(41, 'BMW-5F10-LC01', 'Lengescsillapito elso BMW 5-os F10', NULL, 9, 38900.00, NULL, 12, 'Sachs', '31316789363', NULL, 1, '2026-02-18 09:04:44'),
(42, 'BMW-5F10-OS01', 'Olajszuro BMW 5-os F10', NULL, 5, 3590.00, NULL, 78, 'Mann', '11428683196', NULL, 1, '2026-02-18 09:04:44'),
(43, 'BMW-5F10-GY01', 'Gyujtagyertya BMW 5-os F10 6db', NULL, 7, 23900.00, NULL, 35, 'NGK', '12120039664', NULL, 1, '2026-02-18 09:04:44'),
(44, 'BMW-X5G05-FB01', 'Elso fekbetet BMW X5 G05', NULL, 2, 32900.00, NULL, 25, 'Brembo', '34106888459', NULL, 1, '2026-02-18 09:04:44'),
(45, 'BMW-X5G05-FT01', 'Elso fektarcsa BMW X5 G05', NULL, 3, 54900.00, NULL, 14, 'Brembo', '34106888457', NULL, 1, '2026-02-18 09:04:44'),
(46, 'BMW-X5G05-OS01', 'Olajszuro BMW X5 G05', NULL, 5, 4290.00, NULL, 55, 'Mann', '11428575211', NULL, 1, '2026-02-18 09:04:44'),
(47, 'AUDI-A38P-FB01', 'Elso fekbetet Audi A3 8P', NULL, 2, 15900.00, NULL, 48, 'TRW', '1K0698151', NULL, 1, '2026-02-18 09:04:44'),
(48, 'AUDI-A38P-FT01', 'Elso fektarcsa Audi A3 8P', NULL, 3, 24900.00, NULL, 28, 'Brembo', '1K0615301AA', NULL, 1, '2026-02-18 09:04:44'),
(49, 'AUDI-A38P-OS01', 'Olajszuro Audi A3 8P', NULL, 5, 2890.00, NULL, 90, 'Mann', '06D115562', NULL, 1, '2026-02-18 09:04:44'),
(50, 'AUDI-A38P-LS01', 'Legszuro Audi A3 8P', NULL, 6, 3990.00, NULL, 65, 'Mahle', '1K0129620D', NULL, 1, '2026-02-18 09:04:44'),
(51, 'AUDI-A38V-FB01', 'Elso fekbetet Audi A3 8V', NULL, 2, 17900.00, NULL, 42, 'ATE', '5Q0698151', NULL, 1, '2026-02-18 09:04:44'),
(52, 'AUDI-A38V-FT01', 'Elso fektarcsa Audi A3 8V', NULL, 3, 28900.00, NULL, 24, 'Zimmermann', '5Q0615301F', NULL, 1, '2026-02-18 09:04:44'),
(53, 'AUDI-A38V-OS01', 'Olajszuro Audi A3 8V', NULL, 5, 3190.00, NULL, 85, 'Mann', '06L115562', NULL, 1, '2026-02-18 09:04:44'),
(54, 'AUDI-A38V-LS01', 'Legszuro Audi A3 8V', NULL, 6, 4490.00, NULL, 58, 'K&N', '5Q0129620B', NULL, 1, '2026-02-18 09:04:44'),
(55, 'AUDI-A4B8-FB01', 'Elso fekbetet Audi A4 B8', NULL, 2, 19900.00, NULL, 45, 'TRW', '8K0698151', NULL, 1, '2026-02-18 09:04:44'),
(56, 'AUDI-A4B8-FB02', 'Hatso fekbetet Audi A4 B8', NULL, 2, 15900.00, NULL, 40, 'ATE', '8K0698451', NULL, 1, '2026-02-18 09:04:44'),
(57, 'AUDI-A4B8-FT01', 'Elso fektarcsa Audi A4 B8', NULL, 3, 32900.00, NULL, 22, 'Brembo', '8K0615301', NULL, 1, '2026-02-18 09:04:44'),
(58, 'AUDI-A4B8-LC01', 'Lengescsillapito elso Audi A4 B8', NULL, 9, 32900.00, NULL, 16, 'Bilstein', '8K0413031', NULL, 1, '2026-02-18 09:04:44'),
(59, 'AUDI-A4B8-OS01', 'Olajszuro Audi A4 B8', NULL, 5, 3290.00, NULL, 88, 'Mann', '06L115562', NULL, 1, '2026-02-18 09:04:44'),
(60, 'AUDI-A4B8-LS01', 'Legszuro Audi A4 B8', NULL, 6, 4990.00, NULL, 52, 'Mahle', '8K0133843', NULL, 1, '2026-02-18 09:04:44'),
(61, 'AUDI-A4B8-GY01', 'Gyujtagyertya Audi A4 B8 4db', NULL, 7, 14900.00, NULL, 48, 'NGK', '06H905611', NULL, 1, '2026-02-18 09:04:44'),
(62, 'AUDI-A4B9-FB01', 'Elso fekbetet Audi A4 B9', NULL, 2, 21900.00, NULL, 40, 'Brembo', '8W0698151', NULL, 1, '2026-02-18 09:04:44'),
(63, 'AUDI-A4B9-FT01', 'Elso fektarcsa Audi A4 B9', NULL, 3, 36900.00, NULL, 20, 'Zimmermann', '8W0615301', NULL, 1, '2026-02-18 09:04:44'),
(64, 'AUDI-A4B9-OS01', 'Olajszuro Audi A4 B9', NULL, 5, 3590.00, NULL, 82, 'Mann', '06L115562B', NULL, 1, '2026-02-18 09:04:44'),
(65, 'AUDI-A4B9-LS01', 'Legszuro Audi A4 B9', NULL, 6, 5290.00, NULL, 48, 'K&N', '8W0133843', NULL, 1, '2026-02-18 09:04:44'),
(66, 'AUDI-A6C7-FB01', 'Elso fekbetet Audi A6 C7', NULL, 2, 24900.00, NULL, 35, 'TRW', '4G0698151', NULL, 1, '2026-02-18 09:04:44'),
(67, 'AUDI-A6C7-FT01', 'Elso fektarcsa Audi A6 C7', NULL, 3, 42900.00, NULL, 18, 'Brembo', '4G0615301H', NULL, 1, '2026-02-18 09:04:44'),
(68, 'AUDI-A6C7-LC01', 'Lengescsillapito elso Audi A6 C7', NULL, 9, 38900.00, NULL, 14, 'Sachs', '4G0413031', NULL, 1, '2026-02-18 09:04:44'),
(69, 'AUDI-A6C7-OS01', 'Olajszuro Audi A6 C7', NULL, 5, 3890.00, NULL, 72, 'Mann', '06E115562H', NULL, 1, '2026-02-18 09:04:44'),
(70, 'AUDI-Q5FY-FB01', 'Elso fekbetet Audi Q5 FY', NULL, 2, 26900.00, NULL, 32, 'Brembo', '80A698151', NULL, 1, '2026-02-18 09:04:44'),
(71, 'AUDI-Q5FY-FT01', 'Elso fektarcsa Audi Q5 FY', NULL, 3, 48900.00, NULL, 16, 'Zimmermann', '80A615301', NULL, 1, '2026-02-18 09:04:44'),
(72, 'AUDI-Q5FY-OS01', 'Olajszuro Audi Q5 FY', NULL, 5, 4190.00, NULL, 65, 'Mann', '06L115562', NULL, 1, '2026-02-18 09:04:44'),
(73, 'MB-AW176-FB01', 'Elso fekbetet Mercedes A W176', NULL, 2, 18900.00, NULL, 40, 'TRW', 'A0004206900', NULL, 1, '2026-02-18 09:04:44'),
(74, 'MB-AW176-FT01', 'Elso fektarcsa Mercedes A W176', NULL, 3, 29900.00, NULL, 24, 'Brembo', 'A2464210012', NULL, 1, '2026-02-18 09:04:44'),
(75, 'MB-AW176-OS01', 'Olajszuro Mercedes A W176', NULL, 5, 3290.00, NULL, 75, 'Mann', 'A2701800009', NULL, 1, '2026-02-18 09:04:44'),
(76, 'MB-AW176-LS01', 'Legszuro Mercedes A W176', NULL, 6, 4690.00, NULL, 55, 'Mahle', 'A2700940004', NULL, 1, '2026-02-18 09:04:44'),
(77, 'MB-CW205-FB01', 'Elso fekbetet Mercedes C W205', NULL, 2, 22900.00, NULL, 38, 'Brembo', 'A0004207800', NULL, 1, '2026-02-18 09:04:44'),
(78, 'MB-CW205-FB02', 'Hatso fekbetet Mercedes C W205', NULL, 2, 18900.00, NULL, 35, 'ATE', 'A0004207900', NULL, 1, '2026-02-18 09:04:44'),
(79, 'MB-CW205-FT01', 'Elso fektarcsa Mercedes C W205', NULL, 3, 38900.00, NULL, 20, 'Zimmermann', 'A2054210012', NULL, 1, '2026-02-18 09:04:44'),
(80, 'MB-CW205-LC01', 'Lengescsillapito elso Mercedes C W205', NULL, 9, 35900.00, NULL, 14, 'Sachs', 'A2053200030', NULL, 1, '2026-02-18 09:04:44'),
(81, 'MB-CW205-OS01', 'Olajszuro Mercedes C W205', NULL, 5, 3590.00, NULL, 78, 'Mann', 'A2701800109', NULL, 1, '2026-02-18 09:04:44'),
(82, 'MB-CW205-LS01', 'Legszuro Mercedes C W205', NULL, 6, 5290.00, NULL, 50, 'Mahle', 'A2740940004', NULL, 1, '2026-02-18 09:04:44'),
(83, 'MB-CW205-GY01', 'Gyujtagyertya Mercedes C W205 4db', NULL, 7, 16900.00, NULL, 42, 'Bosch', 'A0041596403', NULL, 1, '2026-02-18 09:04:44'),
(84, 'MB-EW213-FB01', 'Elso fekbetet Mercedes E W213', NULL, 2, 26900.00, NULL, 32, 'TRW', 'A0004208400', NULL, 1, '2026-02-18 09:04:44'),
(85, 'MB-EW213-FT01', 'Elso fektarcsa Mercedes E W213', NULL, 3, 46900.00, NULL, 18, 'Brembo', 'A2134210012', NULL, 1, '2026-02-18 09:04:44'),
(86, 'MB-EW213-LC01', 'Lengescsillapito elso Mercedes E W213', NULL, 9, 42900.00, NULL, 12, 'Bilstein', 'A2133200030', NULL, 1, '2026-02-18 09:04:44'),
(87, 'MB-EW213-OS01', 'Olajszuro Mercedes E W213', NULL, 5, 3990.00, NULL, 70, 'Mann', 'A2761800009', NULL, 1, '2026-02-18 09:04:44'),
(88, 'MB-GLCX253-FB01', 'Elso fekbetet Mercedes GLC X253', NULL, 2, 28900.00, NULL, 30, 'Brembo', 'A0004207200', NULL, 1, '2026-02-18 09:04:44'),
(89, 'MB-GLCX253-FT01', 'Elso fektarcsa Mercedes GLC X253', NULL, 3, 52900.00, NULL, 15, 'Zimmermann', 'A2534210012', NULL, 1, '2026-02-18 09:04:44'),
(90, 'MB-GLCX253-OS01', 'Olajszuro Mercedes GLC X253', NULL, 5, 4290.00, NULL, 62, 'Mann', 'A2761800009', NULL, 1, '2026-02-18 09:04:44'),
(91, 'MAN-TGX-FB01', 'Elso fekbetet MAN TGX', NULL, 14, 45900.00, NULL, 25, 'Knorr-Bremse', '81508206086', NULL, 1, '2026-02-18 09:04:44'),
(92, 'MAN-TGX-FT01', 'Fektarcsa MAN TGX', NULL, 14, 89900.00, NULL, 18, 'Wabco', '81508030038', NULL, 1, '2026-02-18 09:04:44'),
(93, 'MAN-TGX-OS01', 'Olajszuro MAN TGX D26', NULL, 14, 8900.00, NULL, 45, 'Mann', '51055040107', NULL, 1, '2026-02-18 09:04:44'),
(94, 'MAN-TGX-LS01', 'Legszuro MAN TGX', NULL, 14, 12900.00, NULL, 38, 'Mahle', '81084050020', NULL, 1, '2026-02-18 09:04:44'),
(95, 'MAN-TGX-US01', 'Uzemanyagszuro MAN TGX', NULL, 14, 9900.00, NULL, 50, 'Mann', '51125030066', NULL, 1, '2026-02-18 09:04:44'),
(96, 'MAN-TGS-FB01', 'Elso fekbetet MAN TGS', NULL, 14, 42900.00, NULL, 28, 'Knorr-Bremse', '81508206085', NULL, 1, '2026-02-18 09:04:44'),
(97, 'MAN-TGS-LC01', 'Lengescsillapito MAN TGS', NULL, 14, 65900.00, NULL, 15, 'Sachs', '81437016946', NULL, 1, '2026-02-18 09:04:44'),
(98, 'MAN-TGS-OS01', 'Olajszuro MAN TGS', NULL, 14, 7900.00, NULL, 52, 'Mann', '51055040105', NULL, 1, '2026-02-18 09:04:44'),
(99, 'SCAN-R-FB01', 'Elso fekbetet Scania R', NULL, 14, 48900.00, NULL, 22, 'Knorr-Bremse', '1535490', NULL, 1, '2026-02-18 09:04:44'),
(100, 'SCAN-R-FT01', 'Fektarcsa Scania R', NULL, 14, 95900.00, NULL, 15, 'Wabco', '1402272', NULL, 1, '2026-02-18 09:04:44'),
(101, 'SCAN-R-OS01', 'Olajszuro Scania R DC13', NULL, 14, 9900.00, NULL, 40, 'Mann', '2022275', NULL, 1, '2026-02-18 09:04:44'),
(102, 'SCAN-R-LS01', 'Legszuro Scania R', NULL, 14, 14900.00, NULL, 35, 'Mahle', '1869993', NULL, 1, '2026-02-18 09:04:44'),
(103, 'SCAN-R-US01', 'Uzemanyagszuro Scania R', NULL, 14, 11900.00, NULL, 42, 'Mann', '1873018', NULL, 1, '2026-02-18 09:04:44'),
(104, 'SCAN-S-FB01', 'Elso fekbetet Scania S', NULL, 14, 52900.00, NULL, 20, 'Knorr-Bremse', '2195220', NULL, 1, '2026-02-18 09:04:44'),
(105, 'SCAN-S-LC01', 'Lengescsillapito Scania S', NULL, 14, 72900.00, NULL, 12, 'Sachs', '2195110', NULL, 1, '2026-02-18 09:04:44'),
(106, 'HON-CBR6-FB01', 'Elso fekbetet Honda CBR600RR', NULL, 15, 18900.00, NULL, 30, 'EBC', '06455-MFJ-D01', NULL, 1, '2026-02-18 09:04:44'),
(107, 'HON-CBR6-FT01', 'Elso fektarcsa Honda CBR600RR', NULL, 15, 32900.00, NULL, 18, 'Brembo', '45120-MFJ-D01', NULL, 1, '2026-02-18 09:04:44'),
(108, 'HON-CBR6-OS01', 'Olajszuro Honda CBR600RR', NULL, 15, 2490.00, NULL, 65, 'HiFlo', '15410-MFJ-D01', NULL, 1, '2026-02-18 09:04:44'),
(109, 'HON-CBR6-LS01', 'Legszuro Honda CBR600RR', NULL, 15, 4290.00, NULL, 45, 'K&N', '17210-MFJ-D00', NULL, 1, '2026-02-18 09:04:44'),
(110, 'HON-CBR10-FB01', 'Elso fekbetet Honda CBR1000RR', NULL, 15, 22900.00, NULL, 28, 'EBC', '06455-MKF-D01', NULL, 1, '2026-02-18 09:04:44'),
(111, 'HON-CBR10-FT01', 'Elso fektarcsa Honda CBR1000RR', NULL, 15, 38900.00, NULL, 15, 'Brembo', '45120-MKF-D01', NULL, 1, '2026-02-18 09:04:44'),
(112, 'HON-CBR10-OS01', 'Olajszuro Honda CBR1000RR', NULL, 15, 2890.00, NULL, 58, 'HiFlo', '15410-MKF-D01', NULL, 1, '2026-02-18 09:04:44'),
(113, 'HON-CB5-FB01', 'Elso fekbetet Honda CB500F', NULL, 15, 12900.00, NULL, 38, 'EBC', '06455-MGZ-J01', NULL, 1, '2026-02-18 09:04:44'),
(114, 'HON-CB5-OS01', 'Olajszuro Honda CB500F', NULL, 15, 1990.00, NULL, 72, 'HiFlo', '15410-MGZ-D01', NULL, 1, '2026-02-18 09:04:44'),
(115, 'HON-AFT-FB01', 'Elso fekbetet Honda Africa Twin', NULL, 15, 16900.00, NULL, 32, 'EBC', '06455-MKK-D01', NULL, 1, '2026-02-18 09:04:44'),
(116, 'HON-AFT-OS01', 'Olajszuro Honda Africa Twin', NULL, 15, 2690.00, NULL, 55, 'HiFlo', '15410-MKK-D01', NULL, 1, '2026-02-18 09:04:44'),
(117, 'HON-AFT-LS01', 'Legszuro Honda Africa Twin', NULL, 15, 5490.00, NULL, 40, 'K&N', '17210-MKK-D00', NULL, 1, '2026-02-18 09:04:44'),
(118, 'YAM-R6-FB01', 'Elso fekbetet Yamaha YZF-R6', NULL, 15, 19900.00, NULL, 28, 'EBC', '2C0-W0045-00', NULL, 1, '2026-02-18 09:04:44'),
(119, 'YAM-R6-FT01', 'Elso fektarcsa Yamaha YZF-R6', NULL, 15, 34900.00, NULL, 16, 'Brembo', '2C0-2581T-00', NULL, 1, '2026-02-18 09:04:44'),
(120, 'YAM-R6-OS01', 'Olajszuro Yamaha YZF-R6', NULL, 15, 2290.00, NULL, 62, 'HiFlo', '5GH-13440-50', NULL, 1, '2026-02-18 09:04:44'),
(121, 'YAM-R1-FB01', 'Elso fekbetet Yamaha YZF-R1', NULL, 15, 24900.00, NULL, 25, 'EBC', 'B67-W0045-00', NULL, 1, '2026-02-18 09:04:44'),
(122, 'YAM-R1-FT01', 'Elso fektarcsa Yamaha YZF-R1', NULL, 15, 42900.00, NULL, 14, 'Brembo', 'B67-2581T-00', NULL, 1, '2026-02-18 09:04:44'),
(123, 'YAM-R1-OS01', 'Olajszuro Yamaha YZF-R1', NULL, 15, 2590.00, NULL, 55, 'HiFlo', '5GH-13440-60', NULL, 1, '2026-02-18 09:04:44'),
(124, 'YAM-MT7-FB01', 'Elso fekbetet Yamaha MT-07', NULL, 15, 14900.00, NULL, 35, 'EBC', '1WS-W0045-00', NULL, 1, '2026-02-18 09:04:44'),
(125, 'YAM-MT7-OS01', 'Olajszuro Yamaha MT-07', NULL, 15, 1890.00, NULL, 70, 'HiFlo', '5GH-13440-30', NULL, 1, '2026-02-18 09:04:44'),
(126, 'YAM-MT9-FB01', 'Elso fekbetet Yamaha MT-09', NULL, 15, 16900.00, NULL, 32, 'EBC', 'B4C-W0045-00', NULL, 1, '2026-02-18 09:04:44'),
(127, 'YAM-MT9-FT01', 'Elso fektarcsa Yamaha MT-09', NULL, 15, 29900.00, NULL, 20, 'Brembo', 'B4C-2581T-00', NULL, 1, '2026-02-18 09:04:44'),
(128, 'YAM-MT9-OS01', 'Olajszuro Yamaha MT-09', NULL, 15, 2190.00, NULL, 65, 'HiFlo', '5GH-13440-40', NULL, 1, '2026-02-18 09:04:44');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `alkatresz_auto`
--

CREATE TABLE `alkatresz_auto` (
  `id` int(11) NOT NULL,
  `alkatresz_id` int(11) NOT NULL,
  `modell_id` int(11) NOT NULL,
  `motor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `alkatresz_auto`
--

INSERT INTO `alkatresz_auto` (`id`, `alkatresz_id`, `modell_id`, `motor_id`) VALUES
(1, 1, 1, NULL),
(2, 2, 1, NULL),
(3, 3, 1, NULL),
(4, 4, 1, NULL),
(5, 5, 2, NULL),
(6, 6, 2, NULL),
(7, 7, 2, NULL),
(8, 8, 2, NULL),
(9, 9, 3, NULL),
(10, 10, 3, NULL),
(11, 11, 3, NULL),
(12, 12, 3, NULL),
(13, 13, 4, NULL),
(14, 14, 4, NULL),
(15, 15, 4, NULL),
(16, 16, 4, NULL),
(17, 17, 4, NULL),
(18, 18, 4, NULL),
(19, 19, 5, NULL),
(20, 20, 5, NULL),
(21, 21, 5, NULL),
(22, 22, 5, NULL),
(23, 23, 5, NULL),
(24, 24, 5, NULL),
(25, 25, 5, NULL),
(26, 26, 5, NULL),
(27, 27, 6, NULL),
(28, 28, 6, NULL),
(29, 29, 6, NULL),
(30, 30, 6, NULL),
(31, 31, 7, NULL),
(32, 32, 7, NULL),
(33, 33, 7, NULL),
(34, 34, 7, NULL),
(35, 35, 8, NULL),
(36, 36, 8, NULL),
(37, 37, 8, NULL),
(38, 38, 8, NULL),
(39, 39, 9, NULL),
(40, 40, 9, NULL),
(41, 41, 9, NULL),
(42, 42, 9, NULL),
(43, 43, 9, NULL),
(44, 44, 17, NULL),
(45, 45, 17, NULL),
(46, 46, 17, NULL),
(47, 47, 19, NULL),
(48, 48, 19, NULL),
(49, 49, 19, NULL),
(50, 50, 19, NULL),
(51, 51, 20, NULL),
(52, 52, 20, NULL),
(53, 53, 20, NULL),
(54, 54, 20, NULL),
(55, 55, 25, NULL),
(56, 56, 25, NULL),
(57, 57, 25, NULL),
(58, 58, 25, NULL),
(59, 59, 25, NULL),
(60, 60, 25, NULL),
(61, 61, 25, NULL),
(62, 62, 26, NULL),
(63, 63, 26, NULL),
(64, 64, 26, NULL),
(65, 65, 26, NULL),
(66, 66, 29, NULL),
(67, 67, 29, NULL),
(68, 68, 29, NULL),
(69, 69, 29, NULL),
(70, 70, 32, NULL),
(71, 71, 32, NULL),
(72, 72, 32, NULL),
(73, 73, 36, NULL),
(74, 74, 36, NULL),
(75, 75, 36, NULL),
(76, 76, 36, NULL),
(77, 77, 40, NULL),
(78, 78, 40, NULL),
(79, 79, 40, NULL),
(80, 80, 40, NULL),
(81, 81, 40, NULL),
(82, 82, 40, NULL),
(83, 83, 40, NULL),
(84, 84, 44, NULL),
(85, 85, 44, NULL),
(86, 86, 44, NULL),
(87, 87, 44, NULL),
(88, 88, 47, NULL),
(89, 89, 47, NULL),
(90, 90, 47, NULL),
(91, 91, 52, NULL),
(92, 91, 53, NULL),
(93, 92, 52, NULL),
(94, 92, 53, NULL),
(95, 93, 52, NULL),
(96, 93, 53, NULL),
(97, 94, 52, NULL),
(98, 94, 53, NULL),
(99, 95, 52, NULL),
(100, 95, 53, NULL),
(101, 96, 54, NULL),
(102, 96, 55, NULL),
(103, 97, 54, NULL),
(104, 97, 55, NULL),
(105, 98, 54, NULL),
(106, 98, 55, NULL),
(107, 99, 58, NULL),
(108, 99, 59, NULL),
(109, 100, 58, NULL),
(110, 100, 59, NULL),
(111, 101, 58, NULL),
(112, 101, 59, NULL),
(113, 102, 58, NULL),
(114, 102, 59, NULL),
(115, 103, 58, NULL),
(116, 103, 59, NULL),
(117, 104, 60, NULL),
(118, 105, 60, NULL),
(119, 106, 64, NULL),
(120, 107, 64, NULL),
(121, 108, 64, NULL),
(122, 109, 64, NULL),
(123, 110, 65, NULL),
(124, 111, 65, NULL),
(125, 112, 65, NULL),
(126, 113, 66, NULL),
(127, 114, 66, NULL),
(128, 115, 68, NULL),
(129, 116, 68, NULL),
(130, 117, 68, NULL),
(131, 118, 72, NULL),
(132, 119, 72, NULL),
(133, 120, 72, NULL),
(134, 121, 73, NULL),
(135, 122, 73, NULL),
(136, 123, 73, NULL),
(137, 124, 74, NULL),
(138, 125, 74, NULL),
(139, 126, 75, NULL),
(140, 127, 75, NULL),
(141, 128, 75, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `automodellek`
--

CREATE TABLE `automodellek` (
  `id` int(11) NOT NULL,
  `marka_id` int(11) NOT NULL,
  `modell_nev` varchar(100) NOT NULL,
  `generacio` varchar(50) DEFAULT NULL,
  `evjarat_tol` int(11) DEFAULT NULL,
  `evjarat_ig` int(11) DEFAULT NULL,
  `karosszeria` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `automodellek`
--

INSERT INTO `automodellek` (`id`, `marka_id`, `modell_nev`, `generacio`, `evjarat_tol`, `evjarat_ig`, `karosszeria`) VALUES
(1, 1, '1-es sorozat', 'E87', 2004, 2011, 'hatchback'),
(2, 1, '1-es sorozat', 'F20', 2011, 2019, 'hatchback'),
(3, 1, '3-as sorozat', 'E46', 1998, 2006, 'sedan'),
(4, 1, '3-as sorozat', 'E90', 2005, 2012, 'sedan'),
(5, 1, '3-as sorozat', 'F30', 2012, 2019, 'sedan'),
(6, 1, '3-as sorozat', 'G20', 2019, 2025, 'sedan'),
(7, 1, '5-os sorozat', 'E39', 1995, 2004, 'sedan'),
(8, 1, '5-os sorozat', 'E60', 2003, 2010, 'sedan'),
(9, 1, '5-os sorozat', 'F10', 2010, 2017, 'sedan'),
(10, 1, '5-os sorozat', 'G30', 2017, 2025, 'sedan'),
(11, 1, 'X3', 'E83', 2003, 2010, 'suv'),
(12, 1, 'X3', 'F25', 2010, 2017, 'suv'),
(13, 1, 'X3', 'G01', 2017, 2025, 'suv'),
(14, 1, 'X5', 'E53', 1999, 2006, 'suv'),
(15, 1, 'X5', 'E70', 2006, 2013, 'suv'),
(16, 1, 'X5', 'F15', 2013, 2018, 'suv'),
(17, 1, 'X5', 'G05', 2018, 2025, 'suv'),
(18, 2, 'A3', '8L', 1996, 2003, 'hatchback'),
(19, 2, 'A3', '8P', 2003, 2012, 'hatchback'),
(20, 2, 'A3', '8V', 2012, 2020, 'hatchback'),
(21, 2, 'A3', '8Y', 2020, 2025, 'hatchback'),
(22, 2, 'A4', 'B5', 1994, 2001, 'sedan'),
(23, 2, 'A4', 'B6', 2000, 2006, 'sedan'),
(24, 2, 'A4', 'B7', 2004, 2009, 'sedan'),
(25, 2, 'A4', 'B8', 2007, 2015, 'sedan'),
(26, 2, 'A4', 'B9', 2015, 2025, 'sedan'),
(27, 2, 'A6', 'C5', 1997, 2004, 'sedan'),
(28, 2, 'A6', 'C6', 2004, 2011, 'sedan'),
(29, 2, 'A6', 'C7', 2011, 2018, 'sedan'),
(30, 2, 'A6', 'C8', 2018, 2025, 'sedan'),
(31, 2, 'Q5', '8R', 2008, 2017, 'suv'),
(32, 2, 'Q5', 'FY', 2017, 2025, 'suv'),
(33, 2, 'Q7', '4L', 2005, 2015, 'suv'),
(34, 2, 'Q7', '4M', 2015, 2025, 'suv'),
(35, 3, 'A-osztaly', 'W169', 2004, 2012, 'hatchback'),
(36, 3, 'A-osztaly', 'W176', 2012, 2018, 'hatchback'),
(37, 3, 'A-osztaly', 'W177', 2018, 2025, 'hatchback'),
(38, 3, 'C-osztaly', 'W203', 2000, 2007, 'sedan'),
(39, 3, 'C-osztaly', 'W204', 2007, 2014, 'sedan'),
(40, 3, 'C-osztaly', 'W205', 2014, 2021, 'sedan'),
(41, 3, 'C-osztaly', 'W206', 2021, 2025, 'sedan'),
(42, 3, 'E-osztaly', 'W211', 2002, 2009, 'sedan'),
(43, 3, 'E-osztaly', 'W212', 2009, 2016, 'sedan'),
(44, 3, 'E-osztaly', 'W213', 2016, 2023, 'sedan'),
(45, 3, 'GLA', 'X156', 2013, 2020, 'suv'),
(46, 3, 'GLA', 'H247', 2020, 2025, 'suv'),
(47, 3, 'GLC', 'X253', 2015, 2022, 'suv'),
(48, 3, 'GLC', 'X254', 2022, 2025, 'suv'),
(49, 3, 'GLE', 'W166', 2015, 2019, 'suv'),
(50, 3, 'GLE', 'V167', 2019, 2025, 'suv'),
(51, 3, 'S-osztaly', 'W222', 2013, 2020, 'sedan'),
(52, 4, 'TGX', '1. gen', 2007, 2020, 'nyerges'),
(53, 4, 'TGX', '2. gen', 2020, 2025, 'nyerges'),
(54, 4, 'TGS', '1. gen', 2007, 2020, 'platos'),
(55, 4, 'TGS', '2. gen', 2020, 2025, 'platos'),
(56, 4, 'TGM', '', 2007, 2025, 'dobozos'),
(57, 4, 'TGL', '', 2005, 2025, 'dobozos'),
(58, 5, 'R-series', 'R', 2004, 2016, 'nyerges'),
(59, 5, 'R-series', 'New R', 2016, 2025, 'nyerges'),
(60, 5, 'S-series', '', 2016, 2025, 'nyerges'),
(61, 5, 'G-series', '', 2009, 2025, 'platos'),
(62, 5, 'P-series', '', 2004, 2025, 'dobozos'),
(63, 5, 'L-series', '', 2018, 2025, 'dobozos'),
(64, 6, 'CBR600RR', '', 2003, 2025, 'sport'),
(65, 6, 'CBR1000RR', 'Fireblade', 2004, 2025, 'sport'),
(66, 6, 'CB500F', '', 2013, 2025, 'naked'),
(67, 6, 'CB650R', '', 2019, 2025, 'naked'),
(68, 6, 'Africa Twin', 'CRF1100L', 2016, 2025, 'enduro'),
(69, 6, 'NC750X', '', 2012, 2025, 'tura'),
(70, 6, 'Forza 350', '', 2018, 2025, 'robogo'),
(71, 6, 'PCX125', '', 2010, 2025, 'robogo'),
(72, 7, 'YZF-R6', '', 1999, 2025, 'sport'),
(73, 7, 'YZF-R1', '', 1998, 2025, 'sport'),
(74, 7, 'MT-07', '', 2014, 2025, 'naked'),
(75, 7, 'MT-09', '', 2013, 2025, 'naked'),
(76, 7, 'Tenere 700', '', 2019, 2025, 'enduro'),
(77, 7, 'Tracer 9', '', 2015, 2025, 'tura'),
(78, 7, 'XMAX 300', '', 2017, 2025, 'robogo'),
(79, 7, 'NMAX 125', '', 2015, 2025, 'robogo');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `chat_uzenetek`
--

CREATE TABLE `chat_uzenetek` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `uzenet` text NOT NULL,
  `admin_valasz` text DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `statusz` enum('uj','folyamatban','megvalaszolva','lezart') DEFAULT 'uj',
  `letrehozva` datetime DEFAULT current_timestamp(),
  `valaszolva` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `chat_uzenetek`
--

INSERT INTO `chat_uzenetek` (`id`, `user_id`, `uzenet`, `admin_valasz`, `admin_id`, `statusz`, `letrehozva`, `valaszolva`) VALUES
(1, 2, 'segitseg', 'anyad', 1, 'lezart', '2026-02-18 10:00:27', '2026-02-18 10:01:01');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cimek`
--

CREATE TABLE `cimek` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cim_tipus` varchar(20) DEFAULT 'szallitas',
  `nev` varchar(100) DEFAULT NULL,
  `iranyitoszam` varchar(10) DEFAULT NULL,
  `varos` varchar(50) DEFAULT NULL,
  `utca` varchar(100) DEFAULT NULL,
  `hazszam` varchar(20) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `alapertelmezett` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jarmuvek`
--

CREATE TABLE `jarmuvek` (
  `id` int(11) NOT NULL,
  `alvazszam` varchar(17) NOT NULL,
  `modell_id` int(11) NOT NULL,
  `motor_id` int(11) DEFAULT NULL,
  `evjarat` int(11) DEFAULT NULL,
  `szin` varchar(50) DEFAULT NULL,
  `letrehozva` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `jarmuvek`
--

INSERT INTO `jarmuvek` (`id`, `alvazszam`, `modell_id`, `motor_id`, `evjarat`, `szin`, `letrehozva`) VALUES
(1, 'WBANE31000B123401', 1, 1, 2006, 'fekete', '2026-02-18 10:37:18'),
(2, 'WBANE31000B123402', 1, 1, 2008, 'feher', '2026-02-18 10:37:18'),
(3, 'WBANE31000B123403', 1, 2, 2007, 'ezust', '2026-02-18 10:37:18'),
(4, 'WBA1S31040B234501', 2, 3, 2013, 'kek', '2026-02-18 10:37:18'),
(5, 'WBA1S31040B234502', 2, 4, 2015, 'piros', '2026-02-18 10:37:18'),
(6, 'WBAEV31050B345601', 3, 5, 2002, 'fekete', '2026-02-18 10:37:18'),
(7, 'WBAEV31050B345602', 3, 6, 2004, 'ezust', '2026-02-18 10:37:18'),
(8, 'WBAPH31090B456701', 4, 7, 2008, 'feher', '2026-02-18 10:37:18'),
(9, 'WBAPH31090B456702', 4, 8, 2010, 'szurke', '2026-02-18 10:37:18'),
(10, 'WBA3A31030B567801', 5, 9, 2014, 'fekete', '2026-02-18 10:37:18'),
(11, 'WBA3A31030B567802', 5, 10, 2016, 'kek', '2026-02-18 10:37:18'),
(12, 'WBA5A31020B678901', 6, 11, 2020, 'feher', '2026-02-18 10:37:18'),
(13, 'WBA5A31020B678902', 6, 12, 2022, 'szurke', '2026-02-18 10:37:18'),
(14, 'WBADN39050B789012', 7, 13, 2000, 'fekete', '2026-02-18 10:37:18'),
(15, 'WBADN39050B789013', 7, 14, 2002, 'zold', '2026-02-18 10:37:18'),
(16, 'WBANB38060B890123', 8, 15, 2006, 'ezust', '2026-02-18 10:37:18'),
(17, 'WBANB38060B890124', 8, 16, 2008, 'fekete', '2026-02-18 10:37:18'),
(18, 'WBXPA93040B901234', 9, 17, 2005, 'feher', '2026-02-18 10:37:18'),
(19, 'WBXPA93040B901235', 9, 18, 2008, 'barna', '2026-02-18 10:37:18'),
(20, 'WBXFB93050B012345', 10, 19, 2002, 'fekete', '2026-02-18 10:37:18'),
(21, 'WBXFB93050B012346', 10, 20, 2005, 'ezust', '2026-02-18 10:37:18'),
(22, 'WAUZZZ8P3BA123456', 11, 21, 2005, 'feher', '2026-02-18 10:37:18'),
(23, 'WAUZZZ8P3BA123457', 11, 22, 2008, 'fekete', '2026-02-18 10:37:18'),
(24, 'WAUZZZ8E47A234567', 12, 23, 2006, 'ezust', '2026-02-18 10:37:18'),
(25, 'WAUZZZ8E47A234568', 12, 24, 2008, 'kek', '2026-02-18 10:37:18'),
(26, 'WAUZZZ8K49A345678', 13, 25, 2010, 'fekete', '2026-02-18 10:37:19'),
(27, 'WAUZZZ8K49A345679', 13, 26, 2013, 'feher', '2026-02-18 10:37:19'),
(28, 'WAUZZZ4F46N456789', 14, 27, 2006, 'szurke', '2026-02-18 10:37:19'),
(29, 'WAUZZZ4F46N456790', 14, 28, 2009, 'fekete', '2026-02-18 10:37:19'),
(30, 'WAUZZZ8R8BA567890', 15, 29, 2010, 'feher', '2026-02-18 10:37:19'),
(31, 'WAUZZZ8R8BA567891', 15, 30, 2013, 'barna', '2026-02-18 10:37:19'),
(32, 'WDB2030461A678901', 16, 31, 2002, 'ezust', '2026-02-18 10:37:19'),
(33, 'WDB2030461A678902', 16, 32, 2005, 'fekete', '2026-02-18 10:37:19'),
(34, 'WDD2040461A789012', 17, 33, 2009, 'feher', '2026-02-18 10:37:19'),
(35, 'WDD2040461A789013', 17, 34, 2012, 'szurke', '2026-02-18 10:37:19'),
(36, 'WDB2110561A890123', 18, 35, 2004, 'fekete', '2026-02-18 10:37:19'),
(37, 'WDB2110561A890124', 18, 36, 2007, 'ezust', '2026-02-18 10:37:19'),
(38, 'WMAN05ZZ26Y901234', 19, 37, 2004, 'feher', '2026-02-18 10:37:19'),
(39, 'WMAN05ZZ26Y901235', 19, 38, 2006, 'piros', '2026-02-18 10:37:19'),
(40, 'WMAN08ZZ29Y012345', 20, 39, 2010, 'feher', '2026-02-18 10:37:19'),
(41, 'WMAN08ZZ29Y012346', 20, 40, 2015, 'kek', '2026-02-18 10:37:19'),
(42, 'YS2R4X20051123456', 21, 41, 2006, 'feher', '2026-02-18 10:37:19'),
(43, 'YS2R4X20051123457', 21, 42, 2010, 'sarga', '2026-02-18 10:37:19'),
(44, 'YS2S4X20071234567', 22, 43, 2018, 'feher', '2026-02-18 10:37:19'),
(45, 'YS2S4X20071234568', 22, 44, 2020, 'ezust', '2026-02-18 10:37:19'),
(46, 'JH2PC40A37M345678', 23, 45, 2006, 'piros', '2026-02-18 10:37:19'),
(47, 'JH2PC40A37M345679', 23, 46, 2010, 'fekete', '2026-02-18 10:37:19'),
(48, 'JH2PC44A38M456789', 24, 47, 2015, 'feher', '2026-02-18 10:37:19'),
(49, 'JH2PC44A38M456790', 24, 47, 2018, 'piros', '2026-02-18 10:37:19'),
(50, 'JYARM33E09A567890', 25, 48, 2016, 'kek', '2026-02-18 10:37:19'),
(51, 'JYARM33E09A567891', 25, 48, 2019, 'fekete', '2026-02-18 10:37:19'),
(52, 'JYARJ16E08A678901', 26, 49, 2008, 'kek', '2026-02-18 10:37:19'),
(53, 'JYARJ16E08A678902', 26, 50, 2015, 'fekete', '2026-02-18 10:37:19');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoriak`
--

CREATE TABLE `kategoriak` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `szulo_id` int(11) DEFAULT NULL,
  `tipus` varchar(20) DEFAULT 'szemely'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoriak`
--

INSERT INTO `kategoriak` (`id`, `nev`, `szulo_id`, `tipus`) VALUES
(1, 'Fekrendszer', NULL, 'szemely'),
(2, 'Fekbetet', 1, 'szemely'),
(3, 'Fektarcsa', 1, 'szemely'),
(4, 'Motor', NULL, 'szemely'),
(5, 'Olajszuro', 4, 'szemely'),
(6, 'Legszuro', 4, 'szemely'),
(7, 'Gyujtagyertya', 4, 'szemely'),
(8, 'Felfuggesztes', NULL, 'szemely'),
(9, 'Lengescsillapito', 8, 'szemely'),
(10, 'Elektromos', NULL, 'szemely'),
(11, 'Akkumulator', 10, 'szemely'),
(12, 'Hutes', NULL, 'szemely'),
(13, 'Vizszivattyu', 12, 'szemely'),
(14, 'Teher alkatreszek', NULL, 'teher'),
(15, 'Motor alkatreszek', NULL, 'motor');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar`
--

CREATE TABLE `kosar` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alkatresz_id` int(11) DEFAULT NULL,
  `olaj_id` int(11) DEFAULT NULL,
  `mennyiseg` int(11) DEFAULT 1,
  `hozzaadva` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `markak`
--

CREATE TABLE `markak` (
  `id` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL,
  `tipus` varchar(20) DEFAULT 'szemely',
  `logo_url` varchar(255) DEFAULT NULL,
  `aktiv` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `markak`
--

INSERT INTO `markak` (`id`, `nev`, `tipus`, `logo_url`, `aktiv`) VALUES
(1, 'BMW', 'szemely', NULL, 1),
(2, 'Audi', 'szemely', NULL, 1),
(3, 'Mercedes-Benz', 'szemely', NULL, 1),
(4, 'MAN', 'teher', NULL, 1),
(5, 'Scania', 'teher', NULL, 1),
(6, 'Honda', 'motor', NULL, 1),
(7, 'Yamaha', 'motor', NULL, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `motorok`
--

CREATE TABLE `motorok` (
  `id` int(11) NOT NULL,
  `modell_id` int(11) NOT NULL,
  `motor_kod` varchar(50) DEFAULT NULL,
  `hengerurtartalom` int(11) DEFAULT NULL,
  `teljesitmeny_le` int(11) DEFAULT NULL,
  `teljesitmeny_kw` int(11) DEFAULT NULL,
  `uzemanyag` varchar(20) DEFAULT NULL,
  `nyomatek` int(11) DEFAULT NULL,
  `hengerszam` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `motorok`
--

INSERT INTO `motorok` (`id`, `modell_id`, `motor_kod`, `hengerurtartalom`, `teljesitmeny_le`, `teljesitmeny_kw`, `uzemanyag`, `nyomatek`, `hengerszam`) VALUES
(1, 4, 'N46B20', 1995, 150, 110, 'benzin', 200, 4),
(2, 4, 'N52B25', 2497, 218, 160, 'benzin', 250, 6),
(3, 4, 'N47D20', 1995, 177, 130, 'dizel', 350, 4),
(4, 5, 'N20B20', 1997, 184, 135, 'benzin', 270, 4),
(5, 5, 'B48B20', 1998, 252, 185, 'benzin', 350, 4),
(6, 5, 'B47D20', 1995, 190, 140, 'dizel', 400, 4),
(7, 9, 'N20B20', 1997, 184, 135, 'benzin', 270, 4),
(8, 9, 'N55B30', 2979, 306, 225, 'benzin', 400, 6),
(9, 9, 'N57D30', 2993, 258, 190, 'dizel', 560, 6),
(10, 25, 'CDNC', 1984, 180, 132, 'benzin', 320, 4),
(11, 25, 'CAGA', 1968, 143, 105, 'dizel', 320, 4),
(12, 25, 'CAHA', 1968, 170, 125, 'dizel', 350, 4),
(13, 26, 'CYRB', 1984, 190, 140, 'benzin', 320, 4),
(14, 26, 'DCPC', 1968, 150, 110, 'dizel', 320, 4),
(15, 26, 'DETA', 1968, 190, 140, 'dizel', 400, 4),
(16, 40, 'M274', 1991, 184, 135, 'benzin', 300, 4),
(17, 40, 'M276', 2996, 333, 245, 'benzin', 480, 6),
(18, 40, 'OM654', 1950, 194, 143, 'dizel', 400, 4),
(19, 44, 'M264', 1991, 197, 145, 'benzin', 320, 4),
(20, 44, 'M276', 2996, 333, 245, 'benzin', 480, 6),
(21, 44, 'OM654', 1950, 194, 143, 'dizel', 400, 4),
(22, 52, 'D2676', 12419, 440, 324, 'dizel', 2100, 6),
(23, 52, 'D2676', 12419, 480, 353, 'dizel', 2300, 6),
(24, 53, 'D2676', 12419, 510, 375, 'dizel', 2500, 6),
(25, 58, 'DC13', 12700, 450, 331, 'dizel', 2300, 6),
(26, 59, 'DC13', 12700, 500, 368, 'dizel', 2550, 6),
(27, 59, 'DC16', 16400, 580, 427, 'dizel', 3000, 8),
(28, 64, 'PC40E', 599, 120, 88, 'benzin', 66, 4),
(29, 65, 'SC82E', 999, 217, 160, 'benzin', 113, 4),
(30, 66, 'PC60E', 471, 47, 35, 'benzin', 43, 2),
(31, 67, 'RH03E', 649, 95, 70, 'benzin', 64, 4),
(32, 72, 'RJ27', 599, 118, 87, 'benzin', 61, 4),
(33, 73, 'RN65', 998, 200, 147, 'benzin', 112, 4),
(34, 74, 'RM33', 689, 73, 54, 'benzin', 68, 2),
(35, 75, 'RN69', 890, 119, 88, 'benzin', 93, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `olajok`
--

CREATE TABLE `olajok` (
  `id` int(11) NOT NULL,
  `cikkszam` varchar(50) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `leiras` text DEFAULT NULL,
  `tipus` varchar(50) DEFAULT NULL,
  `viszkozitas` varchar(20) DEFAULT NULL,
  `kiszereles` varchar(20) DEFAULT NULL,
  `ar` decimal(10,2) NOT NULL,
  `akcios_ar` decimal(10,2) DEFAULT NULL,
  `keszlet` int(11) DEFAULT 0,
  `gyarto` varchar(100) DEFAULT NULL,
  `specifikacio` varchar(255) DEFAULT NULL,
  `aktiv` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `olajok`
--

INSERT INTO `olajok` (`id`, `cikkszam`, `nev`, `leiras`, `tipus`, `viszkozitas`, `kiszereles`, `ar`, `akcios_ar`, `keszlet`, `gyarto`, `specifikacio`, `aktiv`) VALUES
(1, 'OLJ-001', 'Castrol EDGE 5W-30 LL', NULL, 'motorolaj', '5W-30', '5L', 24900.00, 21900.00, 50, 'Castrol', 'BMW LL-04, MB 229.51, VW 504/507', 1),
(2, 'OLJ-002', 'Mobil 1 ESP 5W-30', NULL, 'motorolaj', '5W-30', '5L', 26900.00, NULL, 45, 'Mobil', 'BMW LL-04, MB 229.52, VW 504/507', 1),
(3, 'OLJ-003', 'Shell Helix Ultra 5W-40', NULL, 'motorolaj', '5W-40', '5L', 22900.00, 19900.00, 60, 'Shell', 'MB 229.5, VW 502/505, BMW LL-01', 1),
(4, 'OLJ-004', 'Total Quartz 9000 5W-40', NULL, 'motorolaj', '5W-40', '5L', 19900.00, NULL, 55, 'Total', 'MB 229.5, VW 502/505', 1),
(5, 'OLJ-005', 'Liqui Moly Top Tec 4200 5W-30', NULL, 'motorolaj', '5W-30', '5L', 28900.00, 25900.00, 40, 'Liqui Moly', 'BMW LL-04, MB 229.51', 1),
(6, 'OLJ-006', 'Castrol GTX 10W-40', NULL, 'motorolaj', '10W-40', '5L', 14900.00, NULL, 75, 'Castrol', 'ACEA A3/B4, VW 501/505', 1),
(7, 'OLJ-007', 'Shell Rimula R6 LME 5W-30', NULL, 'motorolaj', '5W-30', '20L', 89900.00, NULL, 25, 'Shell', 'Teherauto, MB 228.51', 1),
(8, 'OLJ-008', 'Motul 7100 10W-40', NULL, 'motorolaj', '10W-40', '4L', 18900.00, 16900.00, 48, 'Motul', 'Motorkerekpar 4T', 1),
(9, 'OLJ-009', 'ATE SL DOT4 fekfolyadek', NULL, 'fekfolyadek', '', '1L', 4900.00, NULL, 85, 'ATE', 'DOT4, FMVSS 116', 1),
(10, 'OLJ-010', 'Prestone hutofolyadek -38C', NULL, 'hutofolyadek', '', '4L', 8900.00, 7900.00, 65, 'Prestone', 'G12+', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rendeles_szam` varchar(50) NOT NULL,
  `statusz` varchar(30) DEFAULT 'fuggoben',
  `nev` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `iranyitoszam` varchar(10) DEFAULT NULL,
  `varos` varchar(50) DEFAULT NULL,
  `utca` varchar(100) DEFAULT NULL,
  `hazszam` varchar(20) DEFAULT NULL,
  `megjegyzes` text DEFAULT NULL,
  `osszeg` decimal(10,2) NOT NULL,
  `szallitasi_dij` decimal(10,2) DEFAULT 1490.00,
  `vegosszeg` decimal(10,2) NOT NULL,
  `fizetesi_mod` varchar(30) DEFAULT 'utanvet',
  `letrehozva` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendelesek`
--

INSERT INTO `rendelesek` (`id`, `user_id`, `rendeles_szam`, `statusz`, `nev`, `email`, `telefon`, `iranyitoszam`, `varos`, `utca`, `hazszam`, `megjegyzes`, `osszeg`, `szallitasi_dij`, `vegosszeg`, `fizetesi_mod`, `letrehozva`) VALUES
(1, 1, 'AP-20260218-4858', 'fuggoben', 'Admin Rendszer', 'admin@gmail.com', '123453', '3525', 'asdasd', 'asdasd', '4', '', 22900.00, 1490.00, 24390.00, 'utanvet', '2026-02-18 09:58:03'),
(2, 2, 'AP-20260218-6504', 'fuggoben', 'Teszt Elek', 'teszt@teszt.hu', '123453', '3525', 'asdasd', 'asdasd', '4', 'hgfhgfhgfhgf', 54480.00, 1490.00, 55970.00, 'utanvet', '2026-02-18 10:00:10');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_tetelek`
--

CREATE TABLE `rendeles_tetelek` (
  `id` int(11) NOT NULL,
  `rendeles_id` int(11) NOT NULL,
  `alkatresz_id` int(11) DEFAULT NULL,
  `olaj_id` int(11) DEFAULT NULL,
  `termek_nev` varchar(255) DEFAULT NULL,
  `mennyiseg` int(11) NOT NULL,
  `egysegar` decimal(10,2) NOT NULL,
  `osszeg` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendeles_tetelek`
--

INSERT INTO `rendeles_tetelek` (`id`, `rendeles_id`, `alkatresz_id`, `olaj_id`, `termek_nev`, `mennyiseg`, `egysegar`, `osszeg`) VALUES
(1, 1, 27, NULL, 'Elso fekbetet BMW 3-as G20', 1, 22900.00, 22900.00),
(2, 2, 51, NULL, 'Elso fekbetet Audi A3 8V', 1, 17900.00, 17900.00),
(3, 2, 52, NULL, 'Elso fektarcsa Audi A3 8V', 1, 28900.00, 28900.00),
(4, 2, 54, NULL, 'Legszuro Audi A3 8V', 1, 4490.00, 4490.00),
(5, 2, 53, NULL, 'Olajszuro Audi A3 8V', 1, 3190.00, 3190.00);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `felhasznalonev` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jelszo` varchar(255) NOT NULL,
  `vezeteknev` varchar(50) DEFAULT NULL,
  `keresztnev` varchar(50) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `szerepkor` varchar(20) DEFAULT 'user',
  `letrehozva` datetime DEFAULT current_timestamp(),
  `utolso_belepes` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `felhasznalonev`, `email`, `jelszo`, `vezeteknev`, `keresztnev`, `telefon`, `szerepkor`, `letrehozva`, `utolso_belepes`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', 'Admin', 'Rendszer', NULL, 'admin', '2026-02-18 09:04:43', '2026-02-18 10:09:41'),
(2, 'teszt', 'teszt@teszt.hu', 'teszt123', 'Teszt', 'Elek', NULL, 'user', '2026-02-18 09:04:43', '2026-02-18 09:59:32');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `alkatreszek`
--
ALTER TABLE `alkatreszek`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cikkszam` (`cikkszam`),
  ADD KEY `idx_kategoria_id` (`kategoria_id`);

--
-- A tábla indexei `alkatresz_auto`
--
ALTER TABLE `alkatresz_auto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_alkatresz_id` (`alkatresz_id`),
  ADD KEY `idx_modell_id` (`modell_id`);

--
-- A tábla indexei `automodellek`
--
ALTER TABLE `automodellek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_marka_id` (`marka_id`);

--
-- A tábla indexei `chat_uzenetek`
--
ALTER TABLE `chat_uzenetek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_statusz` (`statusz`),
  ADD KEY `admin_id` (`admin_id`);

--
-- A tábla indexei `cimek`
--
ALTER TABLE `cimek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- A tábla indexei `jarmuvek`
--
ALTER TABLE `jarmuvek`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_alvazszam` (`alvazszam`),
  ADD KEY `idx_modell_id` (`modell_id`),
  ADD KEY `idx_motor_id` (`motor_id`);

--
-- A tábla indexei `kategoriak`
--
ALTER TABLE `kategoriak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_szulo_id` (`szulo_id`);

--
-- A tábla indexei `kosar`
--
ALTER TABLE `kosar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- A tábla indexei `markak`
--
ALTER TABLE `markak`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `motorok`
--
ALTER TABLE `motorok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_modell_id` (`modell_id`);

--
-- A tábla indexei `olajok`
--
ALTER TABLE `olajok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cikkszam` (`cikkszam`);

--
-- A tábla indexei `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_rendeles_szam` (`rendeles_szam`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_statusz` (`statusz`);

--
-- A tábla indexei `rendeles_tetelek`
--
ALTER TABLE `rendeles_tetelek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rendeles_id` (`rendeles_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_felhasznalonev` (`felhasznalonev`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `alkatreszek`
--
ALTER TABLE `alkatreszek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT a táblához `alkatresz_auto`
--
ALTER TABLE `alkatresz_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT a táblához `automodellek`
--
ALTER TABLE `automodellek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT a táblához `chat_uzenetek`
--
ALTER TABLE `chat_uzenetek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `cimek`
--
ALTER TABLE `cimek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `jarmuvek`
--
ALTER TABLE `jarmuvek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT a táblához `kategoriak`
--
ALTER TABLE `kategoriak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `kosar`
--
ALTER TABLE `kosar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `markak`
--
ALTER TABLE `markak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `motorok`
--
ALTER TABLE `motorok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT a táblához `olajok`
--
ALTER TABLE `olajok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `rendeles_tetelek`
--
ALTER TABLE `rendeles_tetelek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `chat_uzenetek`
--
ALTER TABLE `chat_uzenetek`
  ADD CONSTRAINT `chat_uzenetek_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_uzenetek_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `kosar`
--
ALTER TABLE `kosar`
  ADD CONSTRAINT `fk_kosar_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
