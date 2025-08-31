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
(1, 'Bludgeoning', (SELECT id FROM core_books WHERE code = 'PHB')),
(2, 'Piercing', (SELECT id FROM core_books WHERE code = 'PHB')),
(3, 'Slashing', (SELECT id FROM core_books WHERE code = 'PHB')),

-- Dano Elemental
(4, 'Acid', (SELECT id FROM core_books WHERE code = 'PHB')),
(5, 'Cold', (SELECT id FROM core_books WHERE code = 'PHB')),
(6, 'Fire', (SELECT id FROM core_books WHERE code = 'PHB')),
(7, 'Lightning', (SELECT id FROM core_books WHERE code = 'PHB')),
(8, 'Thunder', (SELECT id FROM core_books WHERE code = 'PHB')),

-- Dano de Energia
(9, 'Force', (SELECT id FROM core_books WHERE code = 'PHB')),
(10, 'Necrotic', (SELECT id FROM core_books WHERE code = 'PHB')),
(11, 'Psychic', (SELECT id FROM core_books WHERE code = 'PHB')),
(12, 'Radiant', (SELECT id FROM core_books WHERE code = 'PHB')),

-- Dano Especial
(13, 'Poison', (SELECT id FROM core_books WHERE code = 'PHB'));
