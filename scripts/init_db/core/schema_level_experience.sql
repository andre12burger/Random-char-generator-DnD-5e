-- =============================================================================
-- TABELA DE PROGRESSÃO DE NÍVEL E XP PARA D&D 5E
-- =============================================================================

DROP TABLE IF EXISTS core_level_xp;

CREATE TABLE core_level_xp (
    level INTEGER PRIMARY KEY,
    xp_required INTEGER NOT NULL
);

-- Dados de XP necessários para alcançar cada nível
INSERT INTO core_level_xp (level, xp_required) VALUES
(1, 0),
(2, 300),
(3, 900),
(4, 2700),
(5, 6500),
(6, 14000),
(7, 23000),
(8, 34000),
(9, 48000),
(10, 64000),
(11, 85000),
(12, 100000),
(13, 120000),
(14, 140000),
(15, 165000),
(16, 195000),
(17, 225000),
(18, 265000),
(19, 305000),
(20, 355000);