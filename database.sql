-- =============================================
-- AUTOPARTS PRO - TELJES MYSQL ADATBÁZIS
-- BMW, Audi, Mercedes + Teherautók + Motorkerékpárok
-- phpMyAdmin / XAMPP kompatibilis
-- =============================================

-- Adatbázis létrehozása
CREATE DATABASE IF NOT EXISTS autoalkatresz_db 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_hungarian_ci;

USE autoalkatresz_db;

-- =============================================
-- TÁBLÁK TÖRLÉSE (ha léteznek)
-- =============================================
DROP TABLE IF EXISTS kosar;
DROP TABLE IF EXISTS rendeles_tetelek;
DROP TABLE IF EXISTS rendelesek;
DROP TABLE IF EXISTS alkatresz_auto;
DROP TABLE IF EXISTS alkatreszek;
DROP TABLE IF EXISTS olajok;
DROP TABLE IF EXISTS motorok;
DROP TABLE IF EXISTS automodellek;
DROP TABLE IF EXISTS kategoriak;
DROP TABLE IF EXISTS markak;
DROP TABLE IF EXISTS cimek;
DROP TABLE IF EXISTS users;

-- =============================================
-- TÁBLÁK LÉTREHOZÁSA
-- =============================================

-- Felhasználók tábla
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    felhasznalonev VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    jelszo VARCHAR(255) NOT NULL,
    vezeteknev VARCHAR(50),
    keresztnev VARCHAR(50),
    telefon VARCHAR(20),
    szerepkor VARCHAR(20) DEFAULT 'user',
    letrehozva DATETIME DEFAULT CURRENT_TIMESTAMP,
    utolso_belepes DATETIME,
    PRIMARY KEY (id),
    UNIQUE KEY unique_felhasznalonev (felhasznalonev),
    UNIQUE KEY unique_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Admin és teszt felhasználók
INSERT INTO users (felhasznalonev, email, jelszo, vezeteknev, keresztnev, szerepkor) VALUES 
('admin', 'admin@gmail.com', 'admin', 'Admin', 'Rendszer', 'admin'),
('teszt', 'teszt@teszt.hu', 'teszt123', 'Teszt', 'Elek', 'user');

-- Címek tábla
CREATE TABLE cimek (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    cim_tipus VARCHAR(20) DEFAULT 'szallitas',
    nev VARCHAR(100),
    iranyitoszam VARCHAR(10),
    varos VARCHAR(50),
    utca VARCHAR(100),
    hazszam VARCHAR(20),
    telefon VARCHAR(20),
    alapertelmezett TINYINT(1) DEFAULT 0,
    PRIMARY KEY (id),
    KEY idx_user_id (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Autó márkák (személy + teher + motor)
CREATE TABLE markak (
    id INT NOT NULL AUTO_INCREMENT,
    nev VARCHAR(50) NOT NULL,
    tipus VARCHAR(20) DEFAULT 'szemely',
    logo_url VARCHAR(255),
    aktiv TINYINT(1) DEFAULT 1,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Személyautó márkák
INSERT INTO markak (nev, tipus) VALUES 
('BMW', 'szemely'), 
('Audi', 'szemely'), 
('Mercedes-Benz', 'szemely');

-- Teherautó márkák
INSERT INTO markak (nev, tipus) VALUES 
('MAN', 'teher'), 
('Scania', 'teher');

-- Motorkerékpár márkák
INSERT INTO markak (nev, tipus) VALUES 
('Honda', 'motor'), 
('Yamaha', 'motor');

-- Autó modellek tábla
CREATE TABLE automodellek (
    id INT NOT NULL AUTO_INCREMENT,
    marka_id INT NOT NULL,
    modell_nev VARCHAR(100) NOT NULL,
    generacio VARCHAR(50),
    evjarat_tol INT,
    evjarat_ig INT,
    karosszeria VARCHAR(50),
    PRIMARY KEY (id),
    KEY idx_marka_id (marka_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- BMW modellek (id 1-17)
INSERT INTO automodellek (marka_id, modell_nev, generacio, evjarat_tol, evjarat_ig, karosszeria) VALUES
(1, '1-es sorozat', 'E87', 2004, 2011, 'hatchback'),
(1, '1-es sorozat', 'F20', 2011, 2019, 'hatchback'),
(1, '3-as sorozat', 'E46', 1998, 2006, 'sedan'),
(1, '3-as sorozat', 'E90', 2005, 2012, 'sedan'),
(1, '3-as sorozat', 'F30', 2012, 2019, 'sedan'),
(1, '3-as sorozat', 'G20', 2019, 2025, 'sedan'),
(1, '5-os sorozat', 'E39', 1995, 2004, 'sedan'),
(1, '5-os sorozat', 'E60', 2003, 2010, 'sedan'),
(1, '5-os sorozat', 'F10', 2010, 2017, 'sedan'),
(1, '5-os sorozat', 'G30', 2017, 2025, 'sedan'),
(1, 'X3', 'E83', 2003, 2010, 'suv'),
(1, 'X3', 'F25', 2010, 2017, 'suv'),
(1, 'X3', 'G01', 2017, 2025, 'suv'),
(1, 'X5', 'E53', 1999, 2006, 'suv'),
(1, 'X5', 'E70', 2006, 2013, 'suv'),
(1, 'X5', 'F15', 2013, 2018, 'suv'),
(1, 'X5', 'G05', 2018, 2025, 'suv');

-- Audi modellek (id 18-34)
INSERT INTO automodellek (marka_id, modell_nev, generacio, evjarat_tol, evjarat_ig, karosszeria) VALUES
(2, 'A3', '8L', 1996, 2003, 'hatchback'),
(2, 'A3', '8P', 2003, 2012, 'hatchback'),
(2, 'A3', '8V', 2012, 2020, 'hatchback'),
(2, 'A3', '8Y', 2020, 2025, 'hatchback'),
(2, 'A4', 'B5', 1994, 2001, 'sedan'),
(2, 'A4', 'B6', 2000, 2006, 'sedan'),
(2, 'A4', 'B7', 2004, 2009, 'sedan'),
(2, 'A4', 'B8', 2007, 2015, 'sedan'),
(2, 'A4', 'B9', 2015, 2025, 'sedan'),
(2, 'A6', 'C5', 1997, 2004, 'sedan'),
(2, 'A6', 'C6', 2004, 2011, 'sedan'),
(2, 'A6', 'C7', 2011, 2018, 'sedan'),
(2, 'A6', 'C8', 2018, 2025, 'sedan'),
(2, 'Q5', '8R', 2008, 2017, 'suv'),
(2, 'Q5', 'FY', 2017, 2025, 'suv'),
(2, 'Q7', '4L', 2005, 2015, 'suv'),
(2, 'Q7', '4M', 2015, 2025, 'suv');

-- Mercedes modellek (id 35-51)
INSERT INTO automodellek (marka_id, modell_nev, generacio, evjarat_tol, evjarat_ig, karosszeria) VALUES
(3, 'A-osztaly', 'W169', 2004, 2012, 'hatchback'),
(3, 'A-osztaly', 'W176', 2012, 2018, 'hatchback'),
(3, 'A-osztaly', 'W177', 2018, 2025, 'hatchback'),
(3, 'C-osztaly', 'W203', 2000, 2007, 'sedan'),
(3, 'C-osztaly', 'W204', 2007, 2014, 'sedan'),
(3, 'C-osztaly', 'W205', 2014, 2021, 'sedan'),
(3, 'C-osztaly', 'W206', 2021, 2025, 'sedan'),
(3, 'E-osztaly', 'W211', 2002, 2009, 'sedan'),
(3, 'E-osztaly', 'W212', 2009, 2016, 'sedan'),
(3, 'E-osztaly', 'W213', 2016, 2023, 'sedan'),
(3, 'GLA', 'X156', 2013, 2020, 'suv'),
(3, 'GLA', 'H247', 2020, 2025, 'suv'),
(3, 'GLC', 'X253', 2015, 2022, 'suv'),
(3, 'GLC', 'X254', 2022, 2025, 'suv'),
(3, 'GLE', 'W166', 2015, 2019, 'suv'),
(3, 'GLE', 'V167', 2019, 2025, 'suv'),
(3, 'S-osztaly', 'W222', 2013, 2020, 'sedan');

-- MAN teherautó modellek (id 52-57)
INSERT INTO automodellek (marka_id, modell_nev, generacio, evjarat_tol, evjarat_ig, karosszeria) VALUES
(4, 'TGX', '1. gen', 2007, 2020, 'nyerges'),
(4, 'TGX', '2. gen', 2020, 2025, 'nyerges'),
(4, 'TGS', '1. gen', 2007, 2020, 'platos'),
(4, 'TGS', '2. gen', 2020, 2025, 'platos'),
(4, 'TGM', '', 2007, 2025, 'dobozos'),
(4, 'TGL', '', 2005, 2025, 'dobozos');

-- Scania teherautó modellek (id 58-63)
INSERT INTO automodellek (marka_id, modell_nev, generacio, evjarat_tol, evjarat_ig, karosszeria) VALUES
(5, 'R-series', 'R', 2004, 2016, 'nyerges'),
(5, 'R-series', 'New R', 2016, 2025, 'nyerges'),
(5, 'S-series', '', 2016, 2025, 'nyerges'),
(5, 'G-series', '', 2009, 2025, 'platos'),
(5, 'P-series', '', 2004, 2025, 'dobozos'),
(5, 'L-series', '', 2018, 2025, 'dobozos');

-- Honda motorkerékpár modellek (id 64-71)
INSERT INTO automodellek (marka_id, modell_nev, generacio, evjarat_tol, evjarat_ig, karosszeria) VALUES
(6, 'CBR600RR', '', 2003, 2025, 'sport'),
(6, 'CBR1000RR', 'Fireblade', 2004, 2025, 'sport'),
(6, 'CB500F', '', 2013, 2025, 'naked'),
(6, 'CB650R', '', 2019, 2025, 'naked'),
(6, 'Africa Twin', 'CRF1100L', 2016, 2025, 'enduro'),
(6, 'NC750X', '', 2012, 2025, 'tura'),
(6, 'Forza 350', '', 2018, 2025, 'robogo'),
(6, 'PCX125', '', 2010, 2025, 'robogo');

-- Yamaha motorkerékpár modellek (id 72-79)
INSERT INTO automodellek (marka_id, modell_nev, generacio, evjarat_tol, evjarat_ig, karosszeria) VALUES
(7, 'YZF-R6', '', 1999, 2025, 'sport'),
(7, 'YZF-R1', '', 1998, 2025, 'sport'),
(7, 'MT-07', '', 2014, 2025, 'naked'),
(7, 'MT-09', '', 2013, 2025, 'naked'),
(7, 'Tenere 700', '', 2019, 2025, 'enduro'),
(7, 'Tracer 9', '', 2015, 2025, 'tura'),
(7, 'XMAX 300', '', 2017, 2025, 'robogo'),
(7, 'NMAX 125', '', 2015, 2025, 'robogo');

-- Motor konfigurációk tábla
CREATE TABLE motorok (
    id INT NOT NULL AUTO_INCREMENT,
    modell_id INT NOT NULL,
    motor_kod VARCHAR(50),
    hengerurtartalom INT,
    teljesitmeny_le INT,
    teljesitmeny_kw INT,
    uzemanyag VARCHAR(20),
    nyomatek INT,
    hengerszam INT,
    PRIMARY KEY (id),
    KEY idx_modell_id (modell_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- BMW 3-as E90 motorok
INSERT INTO motorok (modell_id, motor_kod, hengerurtartalom, teljesitmeny_le, teljesitmeny_kw, uzemanyag, nyomatek, hengerszam) VALUES
(4, 'N46B20', 1995, 150, 110, 'benzin', 200, 4),
(4, 'N52B25', 2497, 218, 160, 'benzin', 250, 6),
(4, 'N47D20', 1995, 177, 130, 'dizel', 350, 4);

-- BMW 3-as F30 motorok
INSERT INTO motorok (modell_id, motor_kod, hengerurtartalom, teljesitmeny_le, teljesitmeny_kw, uzemanyag, nyomatek, hengerszam) VALUES
(5, 'N20B20', 1997, 184, 135, 'benzin', 270, 4),
(5, 'B48B20', 1998, 252, 185, 'benzin', 350, 4),
(5, 'B47D20', 1995, 190, 140, 'dizel', 400, 4);

-- BMW 5-os F10 motorok
INSERT INTO motorok (modell_id, motor_kod, hengerurtartalom, teljesitmeny_le, teljesitmeny_kw, uzemanyag, nyomatek, hengerszam) VALUES
(9, 'N20B20', 1997, 184, 135, 'benzin', 270, 4),
(9, 'N55B30', 2979, 306, 225, 'benzin', 400, 6),
(9, 'N57D30', 2993, 258, 190, 'dizel', 560, 6);

-- Audi A4 B8 motorok
INSERT INTO motorok (modell_id, motor_kod, hengerurtartalom, teljesitmeny_le, teljesitmeny_kw, uzemanyag, nyomatek, hengerszam) VALUES
(25, 'CDNC', 1984, 180, 132, 'benzin', 320, 4),
(25, 'CAGA', 1968, 143, 105, 'dizel', 320, 4),
(25, 'CAHA', 1968, 170, 125, 'dizel', 350, 4);

-- Audi A4 B9 motorok
INSERT INTO motorok (modell_id, motor_kod, hengerurtartalom, teljesitmeny_le, teljesitmeny_kw, uzemanyag, nyomatek, hengerszam) VALUES
(26, 'CYRB', 1984, 190, 140, 'benzin', 320, 4),
(26, 'DCPC', 1968, 150, 110, 'dizel', 320, 4),
(26, 'DETA', 1968, 190, 140, 'dizel', 400, 4);

-- Mercedes C W205 motorok
INSERT INTO motorok (modell_id, motor_kod, hengerurtartalom, teljesitmeny_le, teljesitmeny_kw, uzemanyag, nyomatek, hengerszam) VALUES
(40, 'M274', 1991, 184, 135, 'benzin', 300, 4),
(40, 'M276', 2996, 333, 245, 'benzin', 480, 6),
(40, 'OM654', 1950, 194, 143, 'dizel', 400, 4);

-- Mercedes E W213 motorok
INSERT INTO motorok (modell_id, motor_kod, hengerurtartalom, teljesitmeny_le, teljesitmeny_kw, uzemanyag, nyomatek, hengerszam) VALUES
(44, 'M264', 1991, 197, 145, 'benzin', 320, 4),
(44, 'M276', 2996, 333, 245, 'benzin', 480, 6),
(44, 'OM654', 1950, 194, 143, 'dizel', 400, 4);

-- MAN TGX motorok
INSERT INTO motorok (modell_id, motor_kod, hengerurtartalom, teljesitmeny_le, teljesitmeny_kw, uzemanyag, nyomatek, hengerszam) VALUES
(52, 'D2676', 12419, 440, 324, 'dizel', 2100, 6),
(52, 'D2676', 12419, 480, 353, 'dizel', 2300, 6),
(53, 'D2676', 12419, 510, 375, 'dizel', 2500, 6);

-- Scania R motorok
INSERT INTO motorok (modell_id, motor_kod, hengerurtartalom, teljesitmeny_le, teljesitmeny_kw, uzemanyag, nyomatek, hengerszam) VALUES
(58, 'DC13', 12700, 450, 331, 'dizel', 2300, 6),
(59, 'DC13', 12700, 500, 368, 'dizel', 2550, 6),
(59, 'DC16', 16400, 580, 427, 'dizel', 3000, 8);

-- Honda motorok
INSERT INTO motorok (modell_id, motor_kod, hengerurtartalom, teljesitmeny_le, teljesitmeny_kw, uzemanyag, nyomatek, hengerszam) VALUES
(64, 'PC40E', 599, 120, 88, 'benzin', 66, 4),
(65, 'SC82E', 999, 217, 160, 'benzin', 113, 4),
(66, 'PC60E', 471, 47, 35, 'benzin', 43, 2),
(67, 'RH03E', 649, 95, 70, 'benzin', 64, 4);

-- Yamaha motorok
INSERT INTO motorok (modell_id, motor_kod, hengerurtartalom, teljesitmeny_le, teljesitmeny_kw, uzemanyag, nyomatek, hengerszam) VALUES
(72, 'RJ27', 599, 118, 87, 'benzin', 61, 4),
(73, 'RN65', 998, 200, 147, 'benzin', 112, 4),
(74, 'RM33', 689, 73, 54, 'benzin', 68, 2),
(75, 'RN69', 890, 119, 88, 'benzin', 93, 3);

-- Alkatrész kategóriák
CREATE TABLE kategoriak (
    id INT NOT NULL AUTO_INCREMENT,
    nev VARCHAR(100) NOT NULL,
    szulo_id INT,
    tipus VARCHAR(20) DEFAULT 'szemely',
    PRIMARY KEY (id),
    KEY idx_szulo_id (szulo_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

INSERT INTO kategoriak (id, nev, szulo_id, tipus) VALUES
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

-- Alkatrészek tábla
CREATE TABLE alkatreszek (
    id INT NOT NULL AUTO_INCREMENT,
    cikkszam VARCHAR(50) NOT NULL,
    nev VARCHAR(255) NOT NULL,
    leiras TEXT,
    kategoria_id INT,
    ar DECIMAL(10,2) NOT NULL,
    akcios_ar DECIMAL(10,2),
    keszlet INT DEFAULT 0,
    gyarto VARCHAR(100),
    oe_szam VARCHAR(100),
    kep_url VARCHAR(255),
    aktiv TINYINT(1) DEFAULT 1,
    letrehozva DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY unique_cikkszam (cikkszam),
    KEY idx_kategoria_id (kategoria_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- Alkatrész-autó kapcsolat
CREATE TABLE alkatresz_auto (
    id INT NOT NULL AUTO_INCREMENT,
    alkatresz_id INT NOT NULL,
    modell_id INT NOT NULL,
    motor_id INT,
    PRIMARY KEY (id),
    KEY idx_alkatresz_id (alkatresz_id),
    KEY idx_modell_id (modell_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- =============================================
-- ALKATRÉSZEK BESZÚRÁSA - SZEMÉLYAUTÓK
-- =============================================

-- BMW 1-es E87 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('BMW-1E87-FB01', 'Elso fekbetet BMW 1-es E87', 2, 14900, 35, 'TRW', '34116780711'),
('BMW-1E87-FT01', 'Elso fektarcsa BMW 1-es E87', 3, 24900, 20, 'Brembo', '34116855781'),
('BMW-1E87-OS01', 'Olajszuro BMW 1-es E87', 5, 2990, 80, 'Mann', '11427508969'),
('BMW-1E87-LS01', 'Legszuro BMW 1-es E87', 6, 4490, 55, 'Mahle', '13717798331');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (1, 1), (2, 1), (3, 1), (4, 1);

-- BMW 1-es F20 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('BMW-1F20-FB01', 'Elso fekbetet BMW 1-es F20', 2, 16900, 40, 'ATE', '34116858910'),
('BMW-1F20-FT01', 'Elso fektarcsa BMW 1-es F20', 3, 28900, 25, 'Brembo', '34116792223'),
('BMW-1F20-OS01', 'Olajszuro BMW 1-es F20', 5, 3290, 90, 'Mann', '11428683196'),
('BMW-1F20-LS01', 'Legszuro BMW 1-es F20', 6, 4990, 60, 'K&N', '13718507320');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (5, 2), (6, 2), (7, 2), (8, 2);

-- BMW 3-as E46 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('BMW-3E46-FB01', 'Elso fekbetet BMW 3-as E46', 2, 15900, 45, 'TRW', '34116761244'),
('BMW-3E46-FT01', 'Elso fektarcsa BMW 3-as E46', 3, 22900, 30, 'Zimmermann', '34116855153'),
('BMW-3E46-LC01', 'Lengescsillapito elso BMW 3-as E46', 9, 26900, 18, 'Bilstein', '31316759090'),
('BMW-3E46-OS01', 'Olajszuro BMW 3-as E46', 5, 2490, 100, 'Mann', '11421427908');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (9, 3), (10, 3), (11, 3), (12, 3);

-- BMW 3-as E90 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('BMW-3E90-FB01', 'Elso fekbetet BMW 3-as E90', 2, 18900, 50, 'Brembo', '34116763617'),
('BMW-3E90-FT01', 'Elso fektarcsa BMW 3-as E90', 3, 32900, 22, 'Brembo', '34116854998'),
('BMW-3E90-LC01', 'Lengescsillapito elso BMW 3-as E90', 9, 32900, 15, 'Sachs', '31316786005'),
('BMW-3E90-OS01', 'Olajszuro BMW 3-as E90', 5, 3290, 85, 'Mann', '11427566327'),
('BMW-3E90-LS01', 'Legszuro BMW 3-as E90', 6, 5490, 45, 'Mann', '13717797465'),
('BMW-3E90-GY01', 'Gyujtagyertya BMW 3-as E90 4db', 7, 12900, 60, 'NGK', '12120037607');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (13, 4), (14, 4), (15, 4), (16, 4), (17, 4), (18, 4);

-- BMW 3-as F30 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('BMW-3F30-FB01', 'Elso fekbetet BMW 3-as F30', 2, 19900, 55, 'TRW', '34116850568'),
('BMW-3F30-FB02', 'Hatso fekbetet BMW 3-as F30', 2, 14900, 48, 'ATE', '34216873093'),
('BMW-3F30-FT01', 'Elso fektarcsa BMW 3-as F30', 3, 34900, 20, 'Brembo', '34106859182'),
('BMW-3F30-LC01', 'Lengescsillapito elso BMW 3-as F30', 9, 35900, 12, 'Bilstein', '31316851335'),
('BMW-3F30-OS01', 'Olajszuro BMW 3-as F30', 5, 3490, 95, 'Mann', '11428683196'),
('BMW-3F30-LS01', 'Legszuro BMW 3-as F30', 6, 5990, 50, 'K&N', '13718507320'),
('BMW-3F30-GY01', 'Gyujtagyertya BMW 3-as F30 4db', 7, 15900, 55, 'Bosch', '12120039664'),
('BMW-3F30-VS01', 'Vizszivattyu BMW 3-as F30', 13, 28900, 18, 'Graf', '11517597715');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (19, 5), (20, 5), (21, 5), (22, 5), (23, 5), (24, 5), (25, 5), (26, 5);

-- BMW 3-as G20 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('BMW-3G20-FB01', 'Elso fekbetet BMW 3-as G20', 2, 22900, 40, 'Brembo', '34106888459'),
('BMW-3G20-FT01', 'Elso fektarcsa BMW 3-as G20', 3, 38900, 18, 'Zimmermann', '34106888457'),
('BMW-3G20-OS01', 'Olajszuro BMW 3-as G20', 5, 3990, 70, 'Mann', '11428575211'),
('BMW-3G20-LS01', 'Legszuro BMW 3-as G20', 6, 6490, 42, 'Mahle', '13718577171');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (27, 6), (28, 6), (29, 6), (30, 6);

-- BMW 5-os E39 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('BMW-5E39-FB01', 'Elso fekbetet BMW 5-os E39', 2, 16900, 38, 'TRW', '34116761252'),
('BMW-5E39-FT01', 'Elso fektarcsa BMW 5-os E39', 3, 28900, 22, 'Brembo', '34111163153'),
('BMW-5E39-LC01', 'Lengescsillapito elso BMW 5-os E39', 9, 28900, 16, 'Monroe', '31311096857'),
('BMW-5E39-OS01', 'Olajszuro BMW 5-os E39', 5, 2790, 75, 'Mann', '11421427908');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (31, 7), (32, 7), (33, 7), (34, 7);

-- BMW 5-os E60 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('BMW-5E60-FB01', 'Elso fekbetet BMW 5-os E60', 2, 19900, 42, 'ATE', '34116763617'),
('BMW-5E60-FT01', 'Elso fektarcsa BMW 5-os E60', 3, 34900, 20, 'Brembo', '34116763824'),
('BMW-5E60-LC01', 'Lengescsillapito elso BMW 5-os E60', 9, 34900, 14, 'Bilstein', '31316780186'),
('BMW-5E60-OS01', 'Olajszuro BMW 5-os E60', 5, 3190, 82, 'Mann', '11427566327');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (35, 8), (36, 8), (37, 8), (38, 8);

-- BMW 5-os F10 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('BMW-5F10-FB01', 'Elso fekbetet BMW 5-os F10', 2, 24900, 38, 'Brembo', '34116851269'),
('BMW-5F10-FT01', 'Elso fektarcsa BMW 5-os F10', 3, 42900, 16, 'Zimmermann', '34116794429'),
('BMW-5F10-LC01', 'Lengescsillapito elso BMW 5-os F10', 9, 38900, 12, 'Sachs', '31316789363'),
('BMW-5F10-OS01', 'Olajszuro BMW 5-os F10', 5, 3590, 78, 'Mann', '11428683196'),
('BMW-5F10-GY01', 'Gyujtagyertya BMW 5-os F10 6db', 7, 23900, 35, 'NGK', '12120039664');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (39, 9), (40, 9), (41, 9), (42, 9), (43, 9);

-- BMW X5 G05 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('BMW-X5G05-FB01', 'Elso fekbetet BMW X5 G05', 2, 32900, 25, 'Brembo', '34106888459'),
('BMW-X5G05-FT01', 'Elso fektarcsa BMW X5 G05', 3, 54900, 14, 'Brembo', '34106888457'),
('BMW-X5G05-OS01', 'Olajszuro BMW X5 G05', 5, 4290, 55, 'Mann', '11428575211');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (44, 17), (45, 17), (46, 17);

-- Audi A3 8P alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('AUDI-A38P-FB01', 'Elso fekbetet Audi A3 8P', 2, 15900, 48, 'TRW', '1K0698151'),
('AUDI-A38P-FT01', 'Elso fektarcsa Audi A3 8P', 3, 24900, 28, 'Brembo', '1K0615301AA'),
('AUDI-A38P-OS01', 'Olajszuro Audi A3 8P', 5, 2890, 90, 'Mann', '06D115562'),
('AUDI-A38P-LS01', 'Legszuro Audi A3 8P', 6, 3990, 65, 'Mahle', '1K0129620D');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (47, 19), (48, 19), (49, 19), (50, 19);

-- Audi A3 8V alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('AUDI-A38V-FB01', 'Elso fekbetet Audi A3 8V', 2, 17900, 42, 'ATE', '5Q0698151'),
('AUDI-A38V-FT01', 'Elso fektarcsa Audi A3 8V', 3, 28900, 24, 'Zimmermann', '5Q0615301F'),
('AUDI-A38V-OS01', 'Olajszuro Audi A3 8V', 5, 3190, 85, 'Mann', '06L115562'),
('AUDI-A38V-LS01', 'Legszuro Audi A3 8V', 6, 4490, 58, 'K&N', '5Q0129620B');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (51, 20), (52, 20), (53, 20), (54, 20);

-- Audi A4 B8 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('AUDI-A4B8-FB01', 'Elso fekbetet Audi A4 B8', 2, 19900, 45, 'TRW', '8K0698151'),
('AUDI-A4B8-FB02', 'Hatso fekbetet Audi A4 B8', 2, 15900, 40, 'ATE', '8K0698451'),
('AUDI-A4B8-FT01', 'Elso fektarcsa Audi A4 B8', 3, 32900, 22, 'Brembo', '8K0615301'),
('AUDI-A4B8-LC01', 'Lengescsillapito elso Audi A4 B8', 9, 32900, 16, 'Bilstein', '8K0413031'),
('AUDI-A4B8-OS01', 'Olajszuro Audi A4 B8', 5, 3290, 88, 'Mann', '06L115562'),
('AUDI-A4B8-LS01', 'Legszuro Audi A4 B8', 6, 4990, 52, 'Mahle', '8K0133843'),
('AUDI-A4B8-GY01', 'Gyujtagyertya Audi A4 B8 4db', 7, 14900, 48, 'NGK', '06H905611');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (55, 25), (56, 25), (57, 25), (58, 25), (59, 25), (60, 25), (61, 25);

-- Audi A4 B9 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('AUDI-A4B9-FB01', 'Elso fekbetet Audi A4 B9', 2, 21900, 40, 'Brembo', '8W0698151'),
('AUDI-A4B9-FT01', 'Elso fektarcsa Audi A4 B9', 3, 36900, 20, 'Zimmermann', '8W0615301'),
('AUDI-A4B9-OS01', 'Olajszuro Audi A4 B9', 5, 3590, 82, 'Mann', '06L115562B'),
('AUDI-A4B9-LS01', 'Legszuro Audi A4 B9', 6, 5290, 48, 'K&N', '8W0133843');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (62, 26), (63, 26), (64, 26), (65, 26);

-- Audi A6 C7 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('AUDI-A6C7-FB01', 'Elso fekbetet Audi A6 C7', 2, 24900, 35, 'TRW', '4G0698151'),
('AUDI-A6C7-FT01', 'Elso fektarcsa Audi A6 C7', 3, 42900, 18, 'Brembo', '4G0615301H'),
('AUDI-A6C7-LC01', 'Lengescsillapito elso Audi A6 C7', 9, 38900, 14, 'Sachs', '4G0413031'),
('AUDI-A6C7-OS01', 'Olajszuro Audi A6 C7', 5, 3890, 72, 'Mann', '06E115562H');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (66, 29), (67, 29), (68, 29), (69, 29);

-- Audi Q5 FY alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('AUDI-Q5FY-FB01', 'Elso fekbetet Audi Q5 FY', 2, 26900, 32, 'Brembo', '80A698151'),
('AUDI-Q5FY-FT01', 'Elso fektarcsa Audi Q5 FY', 3, 48900, 16, 'Zimmermann', '80A615301'),
('AUDI-Q5FY-OS01', 'Olajszuro Audi Q5 FY', 5, 4190, 65, 'Mann', '06L115562');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (70, 32), (71, 32), (72, 32);

-- Mercedes A W176 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('MB-AW176-FB01', 'Elso fekbetet Mercedes A W176', 2, 18900, 40, 'TRW', 'A0004206900'),
('MB-AW176-FT01', 'Elso fektarcsa Mercedes A W176', 3, 29900, 24, 'Brembo', 'A2464210012'),
('MB-AW176-OS01', 'Olajszuro Mercedes A W176', 5, 3290, 75, 'Mann', 'A2701800009'),
('MB-AW176-LS01', 'Legszuro Mercedes A W176', 6, 4690, 55, 'Mahle', 'A2700940004');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (73, 36), (74, 36), (75, 36), (76, 36);

-- Mercedes C W205 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('MB-CW205-FB01', 'Elso fekbetet Mercedes C W205', 2, 22900, 38, 'Brembo', 'A0004207800'),
('MB-CW205-FB02', 'Hatso fekbetet Mercedes C W205', 2, 18900, 35, 'ATE', 'A0004207900'),
('MB-CW205-FT01', 'Elso fektarcsa Mercedes C W205', 3, 38900, 20, 'Zimmermann', 'A2054210012'),
('MB-CW205-LC01', 'Lengescsillapito elso Mercedes C W205', 9, 35900, 14, 'Sachs', 'A2053200030'),
('MB-CW205-OS01', 'Olajszuro Mercedes C W205', 5, 3590, 78, 'Mann', 'A2701800109'),
('MB-CW205-LS01', 'Legszuro Mercedes C W205', 6, 5290, 50, 'Mahle', 'A2740940004'),
('MB-CW205-GY01', 'Gyujtagyertya Mercedes C W205 4db', 7, 16900, 42, 'Bosch', 'A0041596403');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (77, 40), (78, 40), (79, 40), (80, 40), (81, 40), (82, 40), (83, 40);

-- Mercedes E W213 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('MB-EW213-FB01', 'Elso fekbetet Mercedes E W213', 2, 26900, 32, 'TRW', 'A0004208400'),
('MB-EW213-FT01', 'Elso fektarcsa Mercedes E W213', 3, 46900, 18, 'Brembo', 'A2134210012'),
('MB-EW213-LC01', 'Lengescsillapito elso Mercedes E W213', 9, 42900, 12, 'Bilstein', 'A2133200030'),
('MB-EW213-OS01', 'Olajszuro Mercedes E W213', 5, 3990, 70, 'Mann', 'A2761800009');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (84, 44), (85, 44), (86, 44), (87, 44);

-- Mercedes GLC X253 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('MB-GLCX253-FB01', 'Elso fekbetet Mercedes GLC X253', 2, 28900, 30, 'Brembo', 'A0004207200'),
('MB-GLCX253-FT01', 'Elso fektarcsa Mercedes GLC X253', 3, 52900, 15, 'Zimmermann', 'A2534210012'),
('MB-GLCX253-OS01', 'Olajszuro Mercedes GLC X253', 5, 4290, 62, 'Mann', 'A2761800009');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (88, 47), (89, 47), (90, 47);

-- =============================================
-- TEHERAUTÓ ALKATRÉSZEK
-- =============================================

-- MAN TGX alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('MAN-TGX-FB01', 'Elso fekbetet MAN TGX', 14, 45900, 25, 'Knorr-Bremse', '81508206086'),
('MAN-TGX-FT01', 'Fektarcsa MAN TGX', 14, 89900, 18, 'Wabco', '81508030038'),
('MAN-TGX-OS01', 'Olajszuro MAN TGX D26', 14, 8900, 45, 'Mann', '51055040107'),
('MAN-TGX-LS01', 'Legszuro MAN TGX', 14, 12900, 38, 'Mahle', '81084050020'),
('MAN-TGX-US01', 'Uzemanyagszuro MAN TGX', 14, 9900, 50, 'Mann', '51125030066');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (91, 52), (91, 53), (92, 52), (92, 53), (93, 52), (93, 53), (94, 52), (94, 53), (95, 52), (95, 53);

-- MAN TGS alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('MAN-TGS-FB01', 'Elso fekbetet MAN TGS', 14, 42900, 28, 'Knorr-Bremse', '81508206085'),
('MAN-TGS-LC01', 'Lengescsillapito MAN TGS', 14, 65900, 15, 'Sachs', '81437016946'),
('MAN-TGS-OS01', 'Olajszuro MAN TGS', 14, 7900, 52, 'Mann', '51055040105');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (96, 54), (96, 55), (97, 54), (97, 55), (98, 54), (98, 55);

-- Scania R-series alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('SCAN-R-FB01', 'Elso fekbetet Scania R', 14, 48900, 22, 'Knorr-Bremse', '1535490'),
('SCAN-R-FT01', 'Fektarcsa Scania R', 14, 95900, 15, 'Wabco', '1402272'),
('SCAN-R-OS01', 'Olajszuro Scania R DC13', 14, 9900, 40, 'Mann', '2022275'),
('SCAN-R-LS01', 'Legszuro Scania R', 14, 14900, 35, 'Mahle', '1869993'),
('SCAN-R-US01', 'Uzemanyagszuro Scania R', 14, 11900, 42, 'Mann', '1873018');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (99, 58), (99, 59), (100, 58), (100, 59), (101, 58), (101, 59), (102, 58), (102, 59), (103, 58), (103, 59);

-- Scania S-series alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('SCAN-S-FB01', 'Elso fekbetet Scania S', 14, 52900, 20, 'Knorr-Bremse', '2195220'),
('SCAN-S-LC01', 'Lengescsillapito Scania S', 14, 72900, 12, 'Sachs', '2195110');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (104, 60), (105, 60);

-- =============================================
-- MOTORKERÉKPÁR ALKATRÉSZEK
-- =============================================

-- Honda CBR600RR alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('HON-CBR6-FB01', 'Elso fekbetet Honda CBR600RR', 15, 18900, 30, 'EBC', '06455-MFJ-D01'),
('HON-CBR6-FT01', 'Elso fektarcsa Honda CBR600RR', 15, 32900, 18, 'Brembo', '45120-MFJ-D01'),
('HON-CBR6-OS01', 'Olajszuro Honda CBR600RR', 15, 2490, 65, 'HiFlo', '15410-MFJ-D01'),
('HON-CBR6-LS01', 'Legszuro Honda CBR600RR', 15, 4290, 45, 'K&N', '17210-MFJ-D00');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (106, 64), (107, 64), (108, 64), (109, 64);

-- Honda CBR1000RR alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('HON-CBR10-FB01', 'Elso fekbetet Honda CBR1000RR', 15, 22900, 28, 'EBC', '06455-MKF-D01'),
('HON-CBR10-FT01', 'Elso fektarcsa Honda CBR1000RR', 15, 38900, 15, 'Brembo', '45120-MKF-D01'),
('HON-CBR10-OS01', 'Olajszuro Honda CBR1000RR', 15, 2890, 58, 'HiFlo', '15410-MKF-D01');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (110, 65), (111, 65), (112, 65);

-- Honda CB500F alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('HON-CB5-FB01', 'Elso fekbetet Honda CB500F', 15, 12900, 38, 'EBC', '06455-MGZ-J01'),
('HON-CB5-OS01', 'Olajszuro Honda CB500F', 15, 1990, 72, 'HiFlo', '15410-MGZ-D01');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (113, 66), (114, 66);

-- Honda Africa Twin alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('HON-AFT-FB01', 'Elso fekbetet Honda Africa Twin', 15, 16900, 32, 'EBC', '06455-MKK-D01'),
('HON-AFT-OS01', 'Olajszuro Honda Africa Twin', 15, 2690, 55, 'HiFlo', '15410-MKK-D01'),
('HON-AFT-LS01', 'Legszuro Honda Africa Twin', 15, 5490, 40, 'K&N', '17210-MKK-D00');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (115, 68), (116, 68), (117, 68);

-- Yamaha YZF-R6 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('YAM-R6-FB01', 'Elso fekbetet Yamaha YZF-R6', 15, 19900, 28, 'EBC', '2C0-W0045-00'),
('YAM-R6-FT01', 'Elso fektarcsa Yamaha YZF-R6', 15, 34900, 16, 'Brembo', '2C0-2581T-00'),
('YAM-R6-OS01', 'Olajszuro Yamaha YZF-R6', 15, 2290, 62, 'HiFlo', '5GH-13440-50');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (118, 72), (119, 72), (120, 72);

-- Yamaha YZF-R1 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('YAM-R1-FB01', 'Elso fekbetet Yamaha YZF-R1', 15, 24900, 25, 'EBC', 'B67-W0045-00'),
('YAM-R1-FT01', 'Elso fektarcsa Yamaha YZF-R1', 15, 42900, 14, 'Brembo', 'B67-2581T-00'),
('YAM-R1-OS01', 'Olajszuro Yamaha YZF-R1', 15, 2590, 55, 'HiFlo', '5GH-13440-60');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (121, 73), (122, 73), (123, 73);

-- Yamaha MT-07 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('YAM-MT7-FB01', 'Elso fekbetet Yamaha MT-07', 15, 14900, 35, 'EBC', '1WS-W0045-00'),
('YAM-MT7-OS01', 'Olajszuro Yamaha MT-07', 15, 1890, 70, 'HiFlo', '5GH-13440-30');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (124, 74), (125, 74);

-- Yamaha MT-09 alkatrészek
INSERT INTO alkatreszek (cikkszam, nev, kategoria_id, ar, keszlet, gyarto, oe_szam) VALUES
('YAM-MT9-FB01', 'Elso fekbetet Yamaha MT-09', 15, 16900, 32, 'EBC', 'B4C-W0045-00'),
('YAM-MT9-FT01', 'Elso fektarcsa Yamaha MT-09', 15, 29900, 20, 'Brembo', 'B4C-2581T-00'),
('YAM-MT9-OS01', 'Olajszuro Yamaha MT-09', 15, 2190, 65, 'HiFlo', '5GH-13440-40');

INSERT INTO alkatresz_auto (alkatresz_id, modell_id) VALUES (126, 75), (127, 75), (128, 75);

-- =============================================
-- OLAJOK
-- =============================================

CREATE TABLE olajok (
    id INT NOT NULL AUTO_INCREMENT,
    cikkszam VARCHAR(50) NOT NULL,
    nev VARCHAR(255) NOT NULL,
    leiras TEXT,
    tipus VARCHAR(50),
    viszkozitas VARCHAR(20),
    kiszereles VARCHAR(20),
    ar DECIMAL(10,2) NOT NULL,
    akcios_ar DECIMAL(10,2),
    keszlet INT DEFAULT 0,
    gyarto VARCHAR(100),
    specifikacio VARCHAR(255),
    aktiv TINYINT(1) DEFAULT 1,
    PRIMARY KEY (id),
    UNIQUE KEY unique_cikkszam (cikkszam)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

INSERT INTO olajok (cikkszam, nev, tipus, viszkozitas, kiszereles, ar, akcios_ar, keszlet, gyarto, specifikacio) VALUES
('OLJ-001', 'Castrol EDGE 5W-30 LL', 'motorolaj', '5W-30', '5L', 24900, 21900, 50, 'Castrol', 'BMW LL-04, MB 229.51, VW 504/507'),
('OLJ-002', 'Mobil 1 ESP 5W-30', 'motorolaj', '5W-30', '5L', 26900, NULL, 45, 'Mobil', 'BMW LL-04, MB 229.52, VW 504/507'),
('OLJ-003', 'Shell Helix Ultra 5W-40', 'motorolaj', '5W-40', '5L', 22900, 19900, 60, 'Shell', 'MB 229.5, VW 502/505, BMW LL-01'),
('OLJ-004', 'Total Quartz 9000 5W-40', 'motorolaj', '5W-40', '5L', 19900, NULL, 55, 'Total', 'MB 229.5, VW 502/505'),
('OLJ-005', 'Liqui Moly Top Tec 4200 5W-30', 'motorolaj', '5W-30', '5L', 28900, 25900, 40, 'Liqui Moly', 'BMW LL-04, MB 229.51'),
('OLJ-006', 'Castrol GTX 10W-40', 'motorolaj', '10W-40', '5L', 14900, NULL, 75, 'Castrol', 'ACEA A3/B4, VW 501/505'),
('OLJ-007', 'Shell Rimula R6 LME 5W-30', 'motorolaj', '5W-30', '20L', 89900, NULL, 25, 'Shell', 'Teherauto, MB 228.51'),
('OLJ-008', 'Motul 7100 10W-40', 'motorolaj', '10W-40', '4L', 18900, 16900, 48, 'Motul', 'Motorkerekpar 4T'),
('OLJ-009', 'ATE SL DOT4 fekfolyadek', 'fekfolyadek', '', '1L', 4900, NULL, 85, 'ATE', 'DOT4, FMVSS 116'),
('OLJ-010', 'Prestone hutofolyadek -38C', 'hutofolyadek', '', '4L', 8900, 7900, 65, 'Prestone', 'G12+');

-- =============================================
-- RENDELÉSEK
-- =============================================

CREATE TABLE rendelesek (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT,
    rendeles_szam VARCHAR(50) NOT NULL,
    statusz VARCHAR(30) DEFAULT 'fuggoben',
    nev VARCHAR(100),
    email VARCHAR(100),
    telefon VARCHAR(20),
    iranyitoszam VARCHAR(10),
    varos VARCHAR(50),
    utca VARCHAR(100),
    hazszam VARCHAR(20),
    megjegyzes TEXT,
    osszeg DECIMAL(10,2) NOT NULL,
    szallitasi_dij DECIMAL(10,2) DEFAULT 1490,
    vegosszeg DECIMAL(10,2) NOT NULL,
    fizetesi_mod VARCHAR(30) DEFAULT 'utanvet',
    letrehozva DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY unique_rendeles_szam (rendeles_szam),
    KEY idx_user_id (user_id),
    KEY idx_statusz (statusz)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

CREATE TABLE rendeles_tetelek (
    id INT NOT NULL AUTO_INCREMENT,
    rendeles_id INT NOT NULL,
    alkatresz_id INT,
    olaj_id INT,
    termek_nev VARCHAR(255),
    mennyiseg INT NOT NULL,
    egysegar DECIMAL(10,2) NOT NULL,
    osszeg DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id),
    KEY idx_rendeles_id (rendeles_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

CREATE TABLE kosar (
    id INT NOT NULL AUTO_INCREMENT,
    session_id VARCHAR(100) NOT NULL,
    user_id INT,
    alkatresz_id INT,
    olaj_id INT,
    mennyiseg INT DEFAULT 1,
    hozzaadva DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_session_id (session_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- =============================================
-- KÉSZ
-- =============================================
