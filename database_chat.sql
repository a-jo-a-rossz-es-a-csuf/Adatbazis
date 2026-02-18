-- =============================================
-- SEGÍTSÉGKÉRÉS / CHAT TÁBLA
-- Futtasd le phpMyAdmin-ban a meglévő adatbázis mellé
-- =============================================

USE autoalkatresz_db;

-- Töröld a régi táblát ha létezik (opcionális, ha újra akarod kezdeni)
-- DROP TABLE IF EXISTS chat_uzenetek;

-- Chat üzenetek tábla
CREATE TABLE IF NOT EXISTS chat_uzenetek (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    uzenet TEXT NOT NULL,
    admin_valasz TEXT,
    admin_id INT,
    -- megvalaszolva hozzáadva az ENUM-hoz
    statusz ENUM('uj', 'folyamatban', 'megvalaszolva', 'lezart') DEFAULT 'uj',
    letrehozva DATETIME DEFAULT CURRENT_TIMESTAMP,
    valaszolva DATETIME,
    PRIMARY KEY (id),
    KEY idx_user_id (user_id),
    KEY idx_statusz (statusz),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (admin_id) REFERENCES users(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
