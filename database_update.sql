-- =============================================
-- KOSÁR TÁBLA FRISSÍTÉS - user_id alapú
-- Futtasd ezt a scriptet a meglévő adatbázishoz
-- =============================================

USE autoalkatresz_db;

-- Kosár tábla törlése és újra létrehozása user_id-vel
DROP TABLE IF EXISTS kosar;

CREATE TABLE kosar (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    alkatresz_id INT DEFAULT NULL,
    olaj_id INT DEFAULT NULL,
    mennyiseg INT DEFAULT 1,
    hozzaadva DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_user_id (user_id),
    CONSTRAINT fk_kosar_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;
