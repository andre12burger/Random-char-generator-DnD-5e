DROP TABLE IF EXISTS core_languages;

CREATE TABLE core_languages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,        -- ex: Common, Dwarvish
    type TEXT NOT NULL CHECK(type IN ('standard','exotic')), -- classification
    core_book_id INTEGER NOT NULL REFERENCES core_books(id), -- reference to core_books
    description TEXT
);

CREATE INDEX IF NOT EXISTS idx_core_languages_core_book_id ON core_languages(core_book_id);

-- Seeds: standard languages (first appearance)
INSERT INTO core_languages (name, type, core_book_id, description) VALUES
('Common','standard',(SELECT id FROM core_books WHERE code='PHB'),'Standard tongue used by most civilized peoples'),
('Dwarvish','standard',(SELECT id FROM core_books WHERE code='PHB'),'Language of dwarves'),
('Elvish','standard',(SELECT id FROM core_books WHERE code='PHB'),'Language of elves'),
('Giant','standard',(SELECT id FROM core_books WHERE code='PHB'),'Language of giants'),
('Gnomish','standard',(SELECT id FROM core_books WHERE code='PHB'),'Language of gnomes'),
('Goblin','standard',(SELECT id FROM core_books WHERE code='PHB'),'Language of goblinoids'),
('Halfling','standard',(SELECT id FROM core_books WHERE code='PHB'),'Language of halflings'),
('Orc','standard',(SELECT id FROM core_books WHERE code='PHB'),'Language of orcs');

-- Seeds: exotic languages (first appearance)
INSERT INTO core_languages (name, type, core_book_id, description) VALUES
('Abyssal','exotic',(SELECT id FROM core_books WHERE code='PHB'),'Tongue of demons'),
('Celestial','exotic',(SELECT id FROM core_books WHERE code='PHB'),'Tongue of celestials'),
('Draconic','exotic',(SELECT id FROM core_books WHERE code='PHB'),'Ancient tongue of dragons'),
('Deep Speech','exotic',(SELECT id FROM core_books WHERE code='PHB'),'Language of aberrations and deep places'),
('Infernal','exotic',(SELECT id FROM core_books WHERE code='PHB'),'Tongue of devils'),
('Primordial','exotic',(SELECT id FROM core_books WHERE code='PHB'),'Language of elementals (multiple dialects)'),
('Sylvan','exotic',(SELECT id FROM core_books WHERE code='PHB'),'Tongue of fey creatures'),
('Undercommon','exotic',(SELECT id FROM core_books WHERE code='PHB'),'Trade language of Underdark denizens');

-- IDIOMA ESPECIAL: Player Choice  
-- Adicionar idioma CHOICE se não existe (para idiomas com escolha do jogador)
INSERT OR IGNORE INTO core_languages (name, type, core_book_id, description) VALUES 
('Player Choice', 'standard', (SELECT id FROM core_books WHERE code='PHB'), 'Language chosen by player at character creation');