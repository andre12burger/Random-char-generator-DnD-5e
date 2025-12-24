-- schema_damage_types.sql

-- Tipos de dano
DROP TABLE IF EXISTS core_damage_types;

CREATE TABLE core_damage_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,         -- Abbreviation: B,P,S,A,C,F,FC,L,N,PS,R,T
    name TEXT NOT NULL UNIQUE         -- Nome do tipo de dano
);

-- Inserção dos tipos básicos de dano
INSERT OR REPLACE INTO core_damage_types (code, name) VALUES
-- Dano Físico
('B', 'Bludgeoning'),
('P', 'Piercing'),
('S', 'Slashing'),

-- Dano Elemental
('A', 'Acid'),
('C', 'Cold'),
('F', 'Fire'),
('L', 'Lightning'),
('T', 'Thunder'),

-- Dano de Energia
('FC', 'Force'),
('N', 'Necrotic'),
('R', 'Radiant'),

-- Dano Especial
('PS', 'Poison');