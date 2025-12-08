-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Dec 08. 17:21
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `autoalkatresz_webshop`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `automodellek`
--

CREATE TABLE `automodellek` (
  `id` int(11) NOT NULL,
  `gyarto` varchar(100) NOT NULL,
  `modell` varchar(100) NOT NULL,
  `evjarat_tol` int(11) NOT NULL,
  `evjarat_ig` int(11) DEFAULT NULL,
  `motor_kod` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `automodellek`
--

INSERT INTO `automodellek` (`id`, `gyarto`, `modell`, `evjarat_tol`, `evjarat_ig`, `motor_kod`) VALUES
(1, 'Volkswagen', 'Golf IV', 1997, 2006, NULL),
(2, 'Volkswagen', 'Golf V', 2003, 2009, NULL),
(3, 'Volkswagen', 'Golf VI', 2008, 2013, NULL),
(4, 'Volkswagen', 'Passat B5', 1996, 2005, NULL),
(5, 'Volkswagen', 'Passat B6', 2005, 2010, NULL),
(6, 'Skoda', 'Octavia I', 1996, 2010, NULL),
(7, 'Skoda', 'Octavia II', 2004, 2013, NULL),
(8, 'Skoda', 'Fabia I', 1999, 2007, NULL),
(9, 'Audi', 'A3 8L', 1996, 2003, NULL),
(10, 'Audi', 'A4 B5', 1995, 2001, NULL),
(11, 'Audi', 'A4 B6', 2001, 2004, NULL),
(12, 'Opel', 'Astra G', 1998, 2009, NULL),
(13, 'Opel', 'Astra H', 2004, 2014, NULL),
(14, 'Opel', 'Corsa C', 2000, 2006, NULL),
(15, 'Opel', 'Vectra C', 2002, 2008, NULL),
(16, 'Ford', 'Focus I', 1998, 2004, NULL),
(17, 'Ford', 'Focus II', 2004, 2011, NULL),
(18, 'Ford', 'Mondeo III', 2000, 2007, NULL),
(19, 'BMW', 'E46', 1998, 2006, NULL),
(20, 'BMW', 'E90', 2005, 2012, NULL),
(21, 'Toyota', 'Corolla E12', 2001, 2007, NULL),
(22, 'Suzuki', 'Swift', 2005, 2010, NULL),
(23, 'Suzuki', 'Swift', 2010, 2017, NULL),
(24, 'Honda', 'Civic VIII', 2006, 2011, NULL),
(25, 'Peugeot', '307', 2001, 2008, NULL),
(26, 'Renault', 'Megane II', 2002, 2009, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cimek`
--

CREATE TABLE `cimek` (
  `id` int(11) NOT NULL,
  `felhasznalo_id` int(11) NOT NULL,
  `tipus` enum('szamlazasi','szallitasi') DEFAULT 'szallitasi',
  `nev` varchar(100) DEFAULT NULL,
  `iranyitoszam` varchar(20) DEFAULT NULL,
  `varos` varchar(100) DEFAULT NULL,
  `cim` varchar(255) DEFAULT NULL,
  `alapertelmezett` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `jelszo_hash` varchar(255) NOT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  `szerepkor` enum('vasarlo','admin') DEFAULT 'vasarlo',
  `email_megerositve` tinyint(1) DEFAULT 0,
  `letrehozva` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `nev`, `email`, `jelszo_hash`, `telefon`, `szerepkor`, `email_megerositve`, `letrehozva`) VALUES
(1, 'Admin User', 'admin@autoalkatresz.hu', '$2y$10$z9z3x4f5g6h7j8k9l0m1n2o3p4q5r6s7t8u9v0w1x2y3z4a5b6c7d', '06201234567', 'admin', 1, '2025-12-08 16:14:17'),
(2, 'Kovács Béla', 'kovacs.bela@gmail.com', '$2y$10$a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a', '06301234567', 'vasarlo', 1, '2025-12-08 16:14:17'),
(3, 'Nagy Eszter', 'nagyeszti@freemail.hu', '$2y$10$b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b', '06309876543', 'vasarlo', 1, '2025-12-08 16:14:17'),
(4, 'Tóth László', 'tothlaci86@citromail.hu', '$2y$10$c3d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c', '06205551234', 'vasarlo', 1, '2025-12-08 16:14:17'),
(5, 'Kiss Anna', 'kiss.anna89@gmail.com', '$2y$10$d4e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d', '06701237890', 'vasarlo', 1, '2025-12-08 16:14:17'),
(6, 'Szabó Gábor', 'szabo.gabor@outlook.com', '$2y$10$e5f6g7h8i9j0k1l2m3n4o5p6q7r8s9t0u1v2w3x4y5z6a7b8c9d0e', '06304567890', 'vasarlo', 1, '2025-12-08 16:14:17');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoria`
--

CREATE TABLE `kategoria` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `szulo_kategoria_id` int(11) DEFAULT NULL,
  `sorrend` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoria`
--

INSERT INTO `kategoria` (`id`, `nev`, `szulo_kategoria_id`, `sorrend`) VALUES
(1, 'Fék', NULL, 1),
(2, 'Fékbetét', 1, 1),
(3, 'Féktárcsa', 1, 2),
(4, 'Fékmunkahenger', 1, 3),
(5, 'Fékcső', 1, 4),
(6, 'Motor', NULL, 2),
(7, 'Olajszűrő', 6, 1),
(8, 'Levegőszűrő', 6, 2),
(9, 'Üzemanyagszűrő', 6, 3),
(10, 'Pollenszűrő', 6, 4),
(11, 'Vezérlés', NULL, 3),
(12, 'Vezérműszíj', 11, 1),
(13, 'Vízpumpa', 11, 2),
(14, 'Feszítőgörgő', 11, 3),
(15, 'Futómű', NULL, 4),
(16, 'Lengéscsillapító', 15, 1),
(17, 'Toronycsapágy', 15, 2),
(18, 'Gömbfej', 15, 3),
(19, 'Szilentblokkok', 15, 4),
(20, 'Kuplung', NULL, 5),
(21, 'Kuplung szett', 20, 1),
(22, 'Kuplung munkahenger', 20, 2),
(23, 'Gyújtás', NULL, 6),
(24, 'Gyújtógyertya', 23, 1),
(25, 'Gyújtótrafó', 23, 2),
(26, 'Világítás', NULL, 7),
(27, 'Fényszóró', 26, 1),
(28, 'Hátsó lámpa', 26, 2),
(29, 'Irányjelző', 26, 3),
(30, 'Hűtés', NULL, 8),
(31, 'Vízhűtő', 30, 1),
(32, 'Termosztát', 30, 2),
(33, 'Vízcső', 30, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosarak`
--

CREATE TABLE `kosarak` (
  `id` int(11) NOT NULL,
  `felhasznalo_id` int(11) NOT NULL,
  `letrehozva` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar_tetelek`
--

CREATE TABLE `kosar_tetelek` (
  `id` int(11) NOT NULL,
  `kosar_id` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL DEFAULT 1,
  `hozzaadva` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `markak`
--

CREATE TABLE `markak` (
  `id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `leiras` text DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `markak`
--

INSERT INTO `markak` (`id`, `nev`, `leiras`, `logo_url`) VALUES
(1, 'Bosch', 'Német prémium alkatrész gyártó', NULL),
(2, 'Mann-Filter', 'Prémium szűrők', NULL),
(3, 'Valeo', 'Kuplung, világítás, hűtés', NULL),
(4, 'Brembo', 'Nagyteljesítményű fékrendszerek', NULL),
(5, 'NGK', 'Gyújtógyertyák és izzítógyertyák', NULL),
(6, 'SKF', 'Csapágyak és tömítések', NULL),
(7, 'Gates', 'Szíjak és tömlők', NULL),
(8, 'ContiTech', 'Continental szíjak', NULL),
(9, 'Ate', 'Fékrendszerek', NULL),
(10, 'Textar', 'Fékbetétek', NULL),
(11, 'Febi Bilstein', 'Futómű és kormányzás', NULL),
(12, 'TRW', 'Fékrendszerek és kormányzás', NULL),
(13, 'KyB', 'Lengéscsillapítók', NULL),
(14, 'Monroe', 'Lengéscsillapítók', NULL),
(15, 'Sachs', 'Kuplungok és lengéscsillapítók', NULL),
(16, 'LuK', 'Kuplungok', NULL),
(17, 'Mahle', 'Dugattyúk, szűrők', NULL),
(18, 'Hella', 'Világítás', NULL),
(19, 'Beru', 'Izzítógyertyák', NULL),
(20, 'Denso', 'Japán alkatrészek', NULL),
(21, 'Castrol', 'Kenőanyagok', NULL),
(22, 'Motul', 'Prémium olajok', NULL),
(23, 'Liqui Moly', 'Adalékok és olajok', NULL),
(24, 'Filtron', 'Szűrők', NULL),
(25, 'Delphi', 'Elektronika és befecskendezők', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `id` int(11) NOT NULL,
  `rendeles_szam` varchar(20) NOT NULL,
  `felhasznalo_id` int(11) NOT NULL,
  `rendeles_datuma` timestamp NOT NULL DEFAULT current_timestamp(),
  `statusz` enum('uj','fizetve','csomagolva','feladva','teljesitve','stornózva') DEFAULT 'uj',
  `fizetesi_mod` varchar(50) DEFAULT NULL,
  `szallitasi_mod` varchar(50) DEFAULT NULL,
  `szallitasi_koltseg` decimal(10,2) DEFAULT 0.00,
  `vegosszeg` decimal(10,2) NOT NULL,
  `szamlazasi_cim_id` int(11) DEFAULT NULL,
  `szallitasi_cim_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_tetelek`
--

CREATE TABLE `rendeles_tetelek` (
  `id` int(11) NOT NULL,
  `rendeles_id` int(11) NOT NULL,
  `termek_id` int(11) NOT NULL,
  `mennyiseg` int(11) NOT NULL,
  `egysegar` decimal(10,2) NOT NULL,
  `kedvezmeny_szazalek` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termekek`
--

CREATE TABLE `termekek` (
  `id` int(11) NOT NULL,
  `cikkszam` varchar(50) DEFAULT NULL,
  `nev` varchar(255) NOT NULL,
  `leiras` text DEFAULT NULL,
  `ar` decimal(10,2) NOT NULL,
  `akcios_ar` decimal(10,2) DEFAULT NULL,
  `keszlet` int(11) DEFAULT 0,
  `marka_id` int(11) DEFAULT NULL,
  `kategoria_id` int(11) DEFAULT NULL,
  `kep_url` varchar(255) DEFAULT NULL,
  `aktiv` tinyint(1) DEFAULT 1,
  `letrehozva` timestamp NOT NULL DEFAULT current_timestamp(),
  `frissitve` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `termekek`
--

INSERT INTO `termekek` (`id`, `cikkszam`, `nev`, `leiras`, `ar`, `akcios_ar`, `keszlet`, `marka_id`, `kategoria_id`, `kep_url`, `aktiv`, `letrehozva`, `frissitve`) VALUES
(1, '0 986 479 156', 'Bosch Fékbetét készlet első', 'Bosch első fékbetét készlet VW Golf IV-V, Skoda Octavia I-II-hez', 18900.00, 15900.00, 25, 1, 2, '/images/termekek/bosch-fekbetet-1.jpg', 1, '2025-12-08 16:14:17', '2025-12-08 16:14:17'),
(2, '0 451 103 261', 'Bosch Fékbetét hátsó tárcsafék', 'Hátsó fékbetét tárcsafékes modellekhez', 14900.00, NULL, 18, 1, 2, NULL, 1, '2025-12-08 16:14:17', '2025-12-08 16:14:17'),
(3, '1 987 947 061', 'Bosch Levegőszűrő', 'Levegőszűrő 1.9 TDI motorokhoz', 6900.00, 5900.00, 42, 1, 8, NULL, 1, '2025-12-08 16:14:17', '2025-12-08 16:14:17'),
(4, 'C 1137', 'Mann Levegőszűrő', 'Mann-Filter prémium levegőszűrő', 7900.00, NULL, 33, 2, 8, NULL, 1, '2025-12-08 16:14:17', '2025-12-08 16:14:17'),
(5, 'HU 719/6 x', 'Mann Olajszűrő', 'Mann olajszűrő 1.9 TDI PD motorokhoz', 5900.00, NULL, 55, 2, 7, NULL, 1, '2025-12-08 16:14:17', '2025-12-08 16:14:17'),
(6, 'W 712/80', 'Mann Olajszűrő', 'Mann olajszűrő 1.6-2.0 benzines motorokhoz', 4900.00, 4200.00, 61, 2, 7, NULL, 1, '2025-12-08 16:14:17', '2025-12-08 16:14:17'),
(7, '1987429404', 'Bosch Gyújtógyertya szett 4db', 'Bosch Platinum gyújtógyertya 1.4-1.6 16V motorokhoz', 12900.00, NULL, 19, 1, 24, NULL, 1, '2025-12-08 16:14:17', '2025-12-08 16:14:17'),
(8, 'P 1001', 'Brembo Féktárcsa első hűtött', 'Brembo 280mm hűtött első féktárcsa párban', 38900.00, 34900.00, 8, 4, 3, NULL, 1, '2025-12-08 16:14:17', '2025-12-08 16:14:17'),
(9, 'WK 820/1', 'Mann Üzemanyagszűrő', 'Dízel üzemanyagszűrő 1.9 TDI motorokhoz', 8900.00, NULL, 27, 2, 9, NULL, 1, '2025-12-08 16:14:17', '2025-12-08 16:14:17'),
(10, 'BK 1234', 'Valeo Kuplung szett', 'Valeo kuplung szett + kinyomólagár 1.9 TDI 90-130LE', 78900.00, 69900.00, 5, 3, 21, NULL, 1, '2025-12-08 16:14:17', '2025-12-08 16:14:17');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek_kompatibilitas`
--

CREATE TABLE `termek_kompatibilitas` (
  `termek_id` int(11) NOT NULL,
  `automodell_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `termek_kompatibilitas`
--

INSERT INTO `termek_kompatibilitas` (`termek_id`, `automodell_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 6),
(1, 7),
(1, 12),
(1, 13),
(2, 1),
(2, 2),
(2, 6),
(2, 7),
(2, 12),
(2, 13),
(3, 1),
(3, 2),
(3, 6),
(3, 7),
(3, 12),
(3, 13),
(4, 1),
(4, 2),
(4, 3),
(4, 6),
(4, 7),
(4, 8),
(5, 1),
(5, 2),
(5, 6),
(5, 7),
(5, 12),
(5, 13),
(6, 4),
(6, 5),
(6, 16),
(6, 17),
(7, 4),
(7, 5),
(7, 16),
(7, 17),
(8, 1),
(8, 2),
(8, 3),
(8, 6),
(8, 7),
(9, 1),
(9, 2),
(9, 6),
(9, 7),
(10, 1),
(10, 2),
(10, 6),
(10, 7);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `automodellek`
--
ALTER TABLE `automodellek`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `egyedi_modell` (`gyarto`,`modell`,`evjarat_tol`,`evjarat_ig`);

--
-- A tábla indexei `cimek`
--
ALTER TABLE `cimek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `felhasznalo_id` (`felhasznalo_id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A tábla indexei `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `szulo_kategoria_id` (`szulo_kategoria_id`);

--
-- A tábla indexei `kosarak`
--
ALTER TABLE `kosarak`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `egy_kosar_per_felhasznalo` (`felhasznalo_id`);

--
-- A tábla indexei `kosar_tetelek`
--
ALTER TABLE `kosar_tetelek`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `egy_termek_per_kosar` (`kosar_id`,`termek_id`),
  ADD KEY `termek_id` (`termek_id`);

--
-- A tábla indexei `markak`
--
ALTER TABLE `markak`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nev` (`nev`);

--
-- A tábla indexei `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rendeles_szam` (`rendeles_szam`),
  ADD KEY `szamlazasi_cim_id` (`szamlazasi_cim_id`),
  ADD KEY `szallitasi_cim_id` (`szallitasi_cim_id`),
  ADD KEY `idx_rendeles_felhasznalo` (`felhasznalo_id`),
  ADD KEY `idx_rendeles_statusz` (`statusz`);

--
-- A tábla indexei `rendeles_tetelek`
--
ALTER TABLE `rendeles_tetelek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rendeles_id` (`rendeles_id`),
  ADD KEY `termek_id` (`termek_id`);

--
-- A tábla indexei `termekek`
--
ALTER TABLE `termekek`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cikkszam` (`cikkszam`),
  ADD KEY `marka_id` (`marka_id`),
  ADD KEY `kategoria_id` (`kategoria_id`),
  ADD KEY `idx_termek_nev` (`nev`),
  ADD KEY `idx_termek_cikkszam` (`cikkszam`);

--
-- A tábla indexei `termek_kompatibilitas`
--
ALTER TABLE `termek_kompatibilitas`
  ADD PRIMARY KEY (`termek_id`,`automodell_id`),
  ADD KEY `idx_kompatibilitas_auto` (`automodell_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `automodellek`
--
ALTER TABLE `automodellek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT a táblához `cimek`
--
ALTER TABLE `cimek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT a táblához `kosarak`
--
ALTER TABLE `kosarak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kosar_tetelek`
--
ALTER TABLE `kosar_tetelek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `markak`
--
ALTER TABLE `markak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `rendeles_tetelek`
--
ALTER TABLE `rendeles_tetelek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `termekek`
--
ALTER TABLE `termekek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `cimek`
--
ALTER TABLE `cimek`
  ADD CONSTRAINT `cimek_ibfk_1` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalok` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `kategoria`
--
ALTER TABLE `kategoria`
  ADD CONSTRAINT `kategoria_ibfk_1` FOREIGN KEY (`szulo_kategoria_id`) REFERENCES `kategoria` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `kosarak`
--
ALTER TABLE `kosarak`
  ADD CONSTRAINT `kosarak_ibfk_1` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalok` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `kosar_tetelek`
--
ALTER TABLE `kosar_tetelek`
  ADD CONSTRAINT `kosar_tetelek_ibfk_1` FOREIGN KEY (`kosar_id`) REFERENCES `kosarak` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kosar_tetelek_ibfk_2` FOREIGN KEY (`termek_id`) REFERENCES `termekek` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD CONSTRAINT `rendelesek_ibfk_1` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalok` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rendelesek_ibfk_2` FOREIGN KEY (`szamlazasi_cim_id`) REFERENCES `cimek` (`id`),
  ADD CONSTRAINT `rendelesek_ibfk_3` FOREIGN KEY (`szallitasi_cim_id`) REFERENCES `cimek` (`id`);

--
-- Megkötések a táblához `rendeles_tetelek`
--
ALTER TABLE `rendeles_tetelek`
  ADD CONSTRAINT `rendeles_tetelek_ibfk_1` FOREIGN KEY (`rendeles_id`) REFERENCES `rendelesek` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rendeles_tetelek_ibfk_2` FOREIGN KEY (`termek_id`) REFERENCES `termekek` (`id`);

--
-- Megkötések a táblához `termekek`
--
ALTER TABLE `termekek`
  ADD CONSTRAINT `termekek_ibfk_1` FOREIGN KEY (`marka_id`) REFERENCES `markak` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `termekek_ibfk_2` FOREIGN KEY (`kategoria_id`) REFERENCES `kategoria` (`id`) ON DELETE SET NULL;

--
-- Megkötések a táblához `termek_kompatibilitas`
--
ALTER TABLE `termek_kompatibilitas`
  ADD CONSTRAINT `termek_kompatibilitas_ibfk_1` FOREIGN KEY (`termek_id`) REFERENCES `termekek` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `termek_kompatibilitas_ibfk_2` FOREIGN KEY (`automodell_id`) REFERENCES `automodellek` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
