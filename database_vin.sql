USE autoalkatresz_db;

-- Jarmuvek tabla - egyedi alvazszamokkal
CREATE TABLE IF NOT EXISTS jarmuvek (
    id INT NOT NULL AUTO_INCREMENT,
    alvazszam VARCHAR(17) NOT NULL,
    modell_id INT NOT NULL,
    motor_id INT,
    evjarat INT,
    szin VARCHAR(50),
    letrehozva DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY unique_alvazszam (alvazszam),
    KEY idx_modell_id (modell_id),
    KEY idx_motor_id (motor_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- =============================================
-- MINTA JARMUVEK BESZURASA
-- =============================================

-- BMW 1-es E87 (modell_id=1, motor_id=1,2)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WBANE31000B123401', 1, 1, 2006, 'fekete'),
('WBANE31000B123402', 1, 1, 2008, 'feher'),
('WBANE31000B123403', 1, 2, 2007, 'ezust');

-- BMW 1-es F20 (modell_id=2, motor_id=3,4)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WBA1S31040B234501', 2, 3, 2013, 'kek'),
('WBA1S31040B234502', 2, 4, 2015, 'piros');

-- BMW 3-as E46 (modell_id=3, motor_id=5,6)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WBAEV31050B345601', 3, 5, 2002, 'fekete'),
('WBAEV31050B345602', 3, 6, 2004, 'ezust');

-- BMW 3-as E90 (modell_id=4, motor_id=7,8)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WBAPH31090B456701', 4, 7, 2008, 'feher'),
('WBAPH31090B456702', 4, 8, 2010, 'szurke');

-- BMW 3-as F30 (modell_id=5, motor_id=9,10)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WBA3A31030B567801', 5, 9, 2014, 'fekete'),
('WBA3A31030B567802', 5, 10, 2016, 'kek');

-- BMW 3-as G20 (modell_id=6, motor_id=11,12)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WBA5A31020B678901', 6, 11, 2020, 'feher'),
('WBA5A31020B678902', 6, 12, 2022, 'szurke');

-- BMW 5-os E39 (modell_id=7, motor_id=13,14)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WBADN39050B789012', 7, 13, 2000, 'fekete'),
('WBADN39050B789013', 7, 14, 2002, 'zold');

-- BMW 5-os E60 (modell_id=8, motor_id=15,16)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WBANB38060B890123', 8, 15, 2006, 'ezust'),
('WBANB38060B890124', 8, 16, 2008, 'fekete');

-- BMW X3 E83 (modell_id=9, motor_id=17,18)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WBXPA93040B901234', 9, 17, 2005, 'feher'),
('WBXPA93040B901235', 9, 18, 2008, 'barna');

-- BMW X5 E53 (modell_id=10, motor_id=19,20)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WBXFB93050B012345', 10, 19, 2002, 'fekete'),
('WBXFB93050B012346', 10, 20, 2005, 'ezust');

-- Audi A3 8P (modell_id=11, motor_id=21,22)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WAUZZZ8P3BA123456', 11, 21, 2005, 'feher'),
('WAUZZZ8P3BA123457', 11, 22, 2008, 'fekete');

-- Audi A4 B7 (modell_id=12, motor_id=23,24)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WAUZZZ8E47A234567', 12, 23, 2006, 'ezust'),
('WAUZZZ8E47A234568', 12, 24, 2008, 'kek');

-- Audi A4 B8 (modell_id=13, motor_id=25,26)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WAUZZZ8K49A345678', 13, 25, 2010, 'fekete'),
('WAUZZZ8K49A345679', 13, 26, 2013, 'feher');

-- Audi A6 C6 (modell_id=14, motor_id=27,28)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WAUZZZ4F46N456789', 14, 27, 2006, 'szurke'),
('WAUZZZ4F46N456790', 14, 28, 2009, 'fekete');

-- Audi Q5 8R (modell_id=15, motor_id=29,30)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WAUZZZ8R8BA567890', 15, 29, 2010, 'feher'),
('WAUZZZ8R8BA567891', 15, 30, 2013, 'barna');

-- Mercedes C W203 (modell_id=16, motor_id=31,32)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WDB2030461A678901', 16, 31, 2002, 'ezust'),
('WDB2030461A678902', 16, 32, 2005, 'fekete');

-- Mercedes C W204 (modell_id=17, motor_id=33,34)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WDD2040461A789012', 17, 33, 2009, 'feher'),
('WDD2040461A789013', 17, 34, 2012, 'szurke');

-- Mercedes E W211 (modell_id=18, motor_id=35,36)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WDB2110561A890123', 18, 35, 2004, 'fekete'),
('WDB2110561A890124', 18, 36, 2007, 'ezust');

-- MAN TGA (modell_id=19, motor_id=37,38)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WMAN05ZZ26Y901234', 19, 37, 2004, 'feher'),
('WMAN05ZZ26Y901235', 19, 38, 2006, 'piros');

-- MAN TGX (modell_id=20, motor_id=39,40)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('WMAN08ZZ29Y012345', 20, 39, 2010, 'feher'),
('WMAN08ZZ29Y012346', 20, 40, 2015, 'kek');

-- Scania R-sorozat (modell_id=21, motor_id=41,42)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('YS2R4X20051123456', 21, 41, 2006, 'feher'),
('YS2R4X20051123457', 21, 42, 2010, 'sarga');

-- Scania S-sorozat (modell_id=22, motor_id=43,44)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('YS2S4X20071234567', 22, 43, 2018, 'feher'),
('YS2S4X20071234568', 22, 44, 2020, 'ezust');

-- Honda CBR600RR (modell_id=23, motor_id=45,46)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('JH2PC40A37M345678', 23, 45, 2006, 'piros'),
('JH2PC40A37M345679', 23, 46, 2010, 'fekete');

-- Honda CB500F (modell_id=24, motor_id=47)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('JH2PC44A38M456789', 24, 47, 2015, 'feher'),
('JH2PC44A38M456790', 24, 47, 2018, 'piros');

-- Yamaha MT-07 (modell_id=25, motor_id=48)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('JYARM33E09A567890', 25, 48, 2016, 'kek'),
('JYARM33E09A567891', 25, 48, 2019, 'fekete');

-- Yamaha YZF-R6 (modell_id=26, motor_id=49,50)
INSERT INTO jarmuvek (alvazszam, modell_id, motor_id, evjarat, szin) VALUES
('JYARJ16E08A678901', 26, 49, 2008, 'kek'),
('JYARJ16E08A678902', 26, 50, 2015, 'fekete');
