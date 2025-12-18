-- Remove tabelas antigas (sem prefixo)
DROP TABLE IF EXISTS attributes;

DROP TABLE IF EXISTS core_attributes;

CREATE TABLE core_attributes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    abbreviation TEXT NOT NULL UNIQUE
);

-- Inserção dos atributos padrão de D&D 5e
INSERT INTO core_attributes (name, abbreviation) VALUES
('Strength', 'STR'),
('Dexterity', 'DEX'),
('Constitution', 'CON'),
('Intelligence', 'INT'),
('Wisdom', 'WIS'),
('Charisma', 'CHA'),
('Player Choice', 'CHOICE');

-- ATRIBUTO ESPECIAL: Player Choice
-- Adicionar atributo CHOICE se não existe (para ASI com escolha do jogador)
