-- schema_damage_types.sql

-- Remove tabelas antigas (sem prefixo)
DROP TABLE IF EXISTS damage_types;

-- Tipos de dano
DROP TABLE IF EXISTS core_damage_types;

CREATE TABLE core_damage_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,         -- Nome do tipo de dano
    book_id INTEGER,                   -- Livro onde é descrito
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Inserção dos tipos básicos de dano
INSERT OR REPLACE INTO core_damage_types (id, name, book_id) VALUES
-- Dano Físico
(1, 'Bludgeoning', 1 /* PHB */),
(2, 'Piercing', 1 /* PHB */),
(3, 'Slashing', 1 /* PHB */),

-- Dano Elemental
(4, 'Acid', 1 /* PHB */),
(5, 'Cold', 1 /* PHB */),
(6, 'Fire', 1 /* PHB */),
(7, 'Lightning', 1 /* PHB */),
(8, 'Thunder', 1 /* PHB */),

-- Dano de Energia
(9, 'Force', 1 /* PHB */),
(10, 'Necrotic', 1 /* PHB */),
(11, 'Psychic', 1 /* PHB */),
(12, 'Radiant', 1 /* PHB */),

-- Dano Especial
(13, 'Poison', 1 /* PHB */);
