DROP TABLE IF EXISTS core_languages;

CREATE TABLE core_languages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,        -- ex: Common, Dwarvish
    type TEXT NOT NULL CHECK(type IN ('standard','exotic')), -- classification
    description TEXT
);

-- Seeds: standard languages (first appearance)
INSERT INTO core_languages (name, type, description) VALUES
('Common','standard','Standard tongue used by most civilized peoples'),
('Dwarvish','standard','Language of dwarves'),
('Elvish','standard','Language of elves'),
('Giant','standard','Language of giants'),
('Gnomish','standard','Language of gnomes'),
('Goblin','standard','Language of goblinoids'),
('Halfling','standard','Language of halflings'),
('Orc','standard','Language of orcs');

-- Seeds: exotic languages (first appearance)
INSERT INTO core_languages (name, type, description) VALUES
('Abyssal','exotic','Tongue of demons'),
('Celestial','exotic','Tongue of celestials'),
('Draconic','exotic','Ancient tongue of dragons'),
('Deep Speech','exotic','Language of aberrations and deep places'),
('Infernal','exotic','Tongue of devils'),
('Primordial','exotic','Language of elementals (multiple dialects)'),
('Sylvan','exotic','Tongue of fey creatures'),
('Undercommon','exotic','Trade language of Underdark denizens');

-- IDIOMA ESPECIAL: Player Choice  
-- Adicionar idioma CHOICE se não existe (para idiomas com escolha do jogador)
INSERT OR IGNORE INTO core_languages (name, type, description) VALUES 
('Player Choice', 'standard', 'Language chosen by player at character creation');