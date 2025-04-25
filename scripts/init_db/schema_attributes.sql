DROP TABLE IF EXISTS attributes;

CREATE TABLE attributes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    abbreviation TEXT NOT NULL UNIQUE
);

-- Inserção dos atributos padrão de D&D 5e
INSERT INTO attributes (name, abbreviation) VALUES
('Strength', 'STR'),
('Dexterity', 'DEX'),
('Constitution', 'CON'),
('Intelligence', 'INT'),
('Wisdom', 'WIS'),
('Charisma', 'CHA');
