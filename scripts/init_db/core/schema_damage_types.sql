-- schema_damage_types.sql

-- Remove tabelas antigas (sem prefixo)
DROP TABLE IF EXISTS damage_types;

-- Tipos de dano
DROP TABLE IF EXISTS core_damage_types;

CREATE TABLE core_damage_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,         -- Abbreviation: B,P,S,A,C,F,FC,L,N,PS,R,T
    name TEXT NOT NULL UNIQUE,         -- Nome do tipo de dano
    book_id INTEGER,                   -- Livro onde é descrito
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Inserção dos tipos básicos de dano
INSERT OR REPLACE INTO core_damage_types (id, code, name, book_id) VALUES
-- Dano Físico
(1, 'B', 'Bludgeoning', 1 /* PHB */),
(2, 'P', 'Piercing', 1 /* PHB */),
(3, 'S', 'Slashing', 1 /* PHB */),

-- Dano Elemental
(4, 'A', 'Acid', 1 /* PHB */),
(5, 'C', 'Cold', 1 /* PHB */),
(6, 'F', 'Fire', 1 /* PHB */),
(7, 'L', 'Lightning', 1 /* PHB */),
(8, 'T', 'Thunder', 1 /* PHB */),

-- Dano de Energia
(9, 'FC', 'Force', 1 /* PHB */),
(10, 'N', 'Necrotic', 1 /* PHB */),
(11, 'PS', 'Psychic', 1 /* PHB */),
(12, 'R', 'Radiant', 1 /* PHB */),

-- Dano Especial
(13, 'PY', 'Poison', 1 /* PHB */);
