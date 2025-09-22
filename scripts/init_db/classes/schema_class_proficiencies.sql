-- =============================================================================
-- SCHEMA: D&D 5e Class Proficiencies
-- =============================================================================
-- 
-- Este schema cria e popula tabelas de proficiências das classes do D&D 5e
-- com nomes padronizados (class_proficiencies_*)
-- Classes organizadas em ordem alfabética
--
-- =============================================================================

-- =============================================================================
-- TABLE CREATION WITH STANDARDIZED NAMES
-- =============================================================================

-- Table: class_proficiencies_saving_throws
DROP TABLE IF EXISTS class_proficiencies_saving_throws;
CREATE TABLE class_proficiencies_saving_throws (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    attribute_id INTEGER NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (attribute_id) REFERENCES core_attributes(id),
    UNIQUE(class_id, attribute_id)
);

-- Table: class_proficiencies_armor  
DROP TABLE IF EXISTS class_proficiencies_armor;
CREATE TABLE class_proficiencies_armor (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    armor_type_id INTEGER NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (armor_type_id) REFERENCES item_armor_types(id),
    UNIQUE(class_id, armor_type_id)
);

-- Table: class_proficiencies_weapons
DROP TABLE IF EXISTS class_proficiencies_weapons;
CREATE TABLE class_proficiencies_weapons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    weapon_category_id INTEGER NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (weapon_category_id) REFERENCES item_weapons_categories(id),
    UNIQUE(class_id, weapon_category_id)
);

-- Table: class_proficiencies_tools
DROP TABLE IF EXISTS class_proficiencies_tools;
CREATE TABLE class_proficiencies_tools (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    tool_id INTEGER NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (tool_id) REFERENCES item_tools(tool_id),
    UNIQUE(class_id, tool_id)
);

-- Table: class_proficiencies_skill_choices
DROP TABLE IF EXISTS class_proficiencies_skill_choices;
CREATE TABLE class_proficiencies_skill_choices (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    skill_choices INTEGER NOT NULL DEFAULT 2,
    FOREIGN KEY (class_id) REFERENCES classes(id),
    UNIQUE(class_id)
);

-- Table: class_proficiencies_skill_options (NEW - Skills available for each class)
DROP TABLE IF EXISTS class_proficiencies_skill_options;
CREATE TABLE class_proficiencies_skill_options (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    skill_id INTEGER NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (skill_id) REFERENCES core_skills(id),
    UNIQUE(class_id, skill_id)
);

-- =============================================================================
-- PRIMARY ABILITIES (já estão configuradas na tabela classes)
-- =============================================================================

-- As habilidades primárias já estão configuradas como TEXT na tabela classes

-- =============================================================================
-- SAVING THROW PROFICIENCIES (em ordem alfabética)
-- =============================================================================

INSERT OR IGNORE INTO class_proficiencies_saving_throws (class_id, attribute_id) VALUES
-- Artificer: Constitution, Intelligence
(1 /* Artificer */, 3), (1 /* Artificer */, 4),
-- Barbarian: Strength, Constitution  
(2 /* Barbarian */, 1), (2 /* Barbarian */, 3),
-- Bard: Dexterity, Charisma
(3 /* Bard */, 2), (3 /* Bard */, 6),
-- Blood Hunter: Dexterity, Wisdom
(4 /* Blood Hunter */, 2), (4 /* Blood Hunter */, 5),
-- Cleric: Wisdom, Charisma
(5 /* Cleric */, 5), (5 /* Cleric */, 6),
-- Druid: Intelligence, Wisdom
(6 /* Druid */, 4), (6 /* Druid */, 5),
-- Fighter: Strength, Constitution
(7 /* Fighter */, 1), (7 /* Fighter */, 3),
-- Monk: Strength, Dexterity
(8 /* Monk */, 1), (8 /* Monk */, 2),
-- Paladin: Wisdom, Charisma
(9 /* Paladin */, 5), (9 /* Paladin */, 6),
-- Ranger: Strength, Dexterity
(10 /* Ranger */, 1), (10 /* Ranger */, 2),
-- Rogue: Dexterity, Intelligence
(11 /* Rogue */, 2), (11 /* Rogue */, 4),
-- Sorcerer: Constitution, Charisma
(12 /* Sorcerer */, 3), (12 /* Sorcerer */, 6),
-- Warlock: Wisdom, Charisma
(13 /* Warlock */, 5), (13 /* Warlock */, 6),
-- Wizard: Intelligence, Wisdom
(14 /* Wizard */, 4), (14 /* Wizard */, 5);

-- =============================================================================
-- ARMOR PROFICIENCIES (em ordem alfabética)
-- =============================================================================

INSERT OR IGNORE INTO class_proficiencies_armor (class_id, armor_type_id) VALUES
-- Artificer: Light armor, medium armor, shields
(1 /* Artificer */, 1), (1 /* Artificer */, 2), (1 /* Artificer */, 4),
-- Barbarian: Light armor, medium armor, shields (no heavy)
(2 /* Barbarian */, 1), (2 /* Barbarian */, 2), (2 /* Barbarian */, 4),
-- Bard: Light armor  
(3 /* Bard */, 1),
-- Blood Hunter: Light armor, medium armor, shields
(4 /* Blood Hunter */, 1), (4 /* Blood Hunter */, 2), (4 /* Blood Hunter */, 4),
-- Cleric: Light armor, medium armor, shields
(5 /* Cleric */, 1), (5 /* Cleric */, 2), (5 /* Cleric */, 4),
-- Druid: Light armor, medium armor, shields (non-metal)
(6 /* Druid */, 1), (6 /* Druid */, 2), (6 /* Druid */, 4),
-- Fighter: All armor, shields
(7 /* Fighter */, 1), (7 /* Fighter */, 2), (7 /* Fighter */, 3), (7 /* Fighter */, 4),
-- Monk: None (unarmored defense)
-- Paladin: All armor, shields
(9 /* Paladin */, 1), (9 /* Paladin */, 2), (9 /* Paladin */, 3), (9 /* Paladin */, 4),
-- Ranger: Light armor, medium armor, shields
(10 /* Ranger */, 1), (10 /* Ranger */, 2), (10 /* Ranger */, 4),
-- Rogue: Light armor
(11 /* Rogue */, 1),
-- Sorcerer: None
-- Warlock: Light armor
(13 /* Warlock */, 1);
-- Wizard: None

-- =============================================================================
-- WEAPON PROFICIENCIES (em ordem alfabética)
-- =============================================================================

INSERT OR IGNORE INTO class_proficiencies_weapons (class_id, weapon_category_id) VALUES
-- Artificer: Simple weapons, martial weapons
(1 /* Artificer */, 1), (1 /* Artificer */, 2),
-- Barbarian: All simple weapons, all martial weapons
(2 /* Barbarian */, 1), (2 /* Barbarian */, 2),
-- Bard: Simple weapons, hand crossbows, longswords, rapiers, shortswords
(3 /* Bard */, 1),
-- Blood Hunter: Simple weapons, martial weapons
(4 /* Blood Hunter */, 1), (4 /* Blood Hunter */, 2),
-- Cleric: Simple weapons
(5 /* Cleric */, 1),
-- Druid: Simple weapons (except metal ones)
(6 /* Druid */, 1),
-- Fighter: All simple weapons, all martial weapons
(7 /* Fighter */, 1), (7 /* Fighter */, 2),
-- Monk: Simple weapons, shortswords
(8 /* Monk */, 1),
-- Paladin: All simple weapons, all martial weapons
(9 /* Paladin */, 1), (9 /* Paladin */, 2),
-- Ranger: All simple weapons, all martial weapons
(10 /* Ranger */, 1), (10 /* Ranger */, 2),
-- Rogue: Simple weapons, hand crossbows, longswords, rapiers, shortswords
(11 /* Rogue */, 1),
-- Sorcerer: Simple weapons
(12 /* Sorcerer */, 1),
-- Warlock: Simple weapons
(13 /* Warlock */, 1),
-- Wizard: Simple weapons
(14 /* Wizard */, 1);

-- =============================================================================
-- TOOL PROFICIENCIES (em ordem alfabética)
-- =============================================================================

INSERT OR IGNORE INTO class_proficiencies_tools (class_id, tool_id) VALUES
-- ARTIFICER: Thieves' tools (tool_id: 37) + Tinker's tools (tool_id: 15)
(1 /* Artificer */, 3),
(1 /* Artificer */, 15),
-- DRUID: Herbalism kit (tool_id: 34)
(6 /* Druid */, 8),
-- ROGUE: Thieves' tools (tool_id: 37)
(11 /* Rogue */, 3);

-- =============================================================================
-- SKILL CHOICES (quantidade de escolhas por classe - em ordem alfabética)
-- =============================================================================

INSERT OR IGNORE INTO class_proficiencies_skill_choices (class_id, skill_choices) VALUES
(1 /* Artificer */, 2),  -- Artificer: Choose 2 from Arcana, History, Investigation, Medicine, Nature, Perception, Sleight of Hand
(2 /* Barbarian */, 2),  -- Barbarian: Choose 2 from Animal Handling, Athletics, Intimidation, Nature, Perception, Survival
(3 /* Bard */, 3),       -- Bard: Choose any 3 skills
(4 /* Blood Hunter */, 2), -- Blood Hunter: Choose 2 from Athletics, Acrobatics, Arcana, History, Insight, Investigation, Religion, Survival
(5 /* Cleric */, 2),     -- Cleric: Choose 2 from History, Insight, Medicine, Persuasion, Religion
(6 /* Druid */, 2),      -- Druid: Choose 2 from Arcana, Animal Handling, Insight, Medicine, Nature, Perception, Religion, Survival
(7 /* Fighter */, 2),    -- Fighter: Choose 2 from Acrobatics, Animal Handling, Athletics, History, Insight, Intimidation, Perception, Survival
(8 /* Monk */, 2),       -- Monk: Choose 2 from Acrobatics, Athletics, History, Insight, Religion, Stealth
(9 /* Paladin */, 2),    -- Paladin: Choose 2 from Athletics, Insight, Intimidation, Medicine, Persuasion, Religion
(10 /* Ranger */, 3),     -- Ranger: Choose 3 from Animal Handling, Athletics, Insight, Investigation, Nature, Perception, Stealth, Survival
(11 /* Rogue */, 4),      -- Rogue: Choose 4 from Acrobatics, Athletics, Deception, Insight, Intimidation, Investigation, Perception, Performance, Persuasion, Sleight of Hand, Stealth
(12 /* Sorcerer */, 2),   -- Sorcerer: Choose 2 from Arcana, Deception, Insight, Intimidation, Persuasion, Religion
(13 /* Warlock */, 2),    -- Warlock: Choose 2 from Arcana, Deception, History, Intimidation, Investigation, Nature, Religion
(14 /* Wizard */, 2);     -- Wizard: Choose 2 from Arcana, History, Insight, Investigation, Medicine, Religion

-- =============================================================================
-- SKILL OPTIONS (skills disponíveis para escolha por classe - em ordem alfabética)
-- =============================================================================

-- ARTIFICER: Arcana, History, Investigation, Medicine, Nature, Perception, Sleight of Hand
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(1 /* Artificer */, 4),   -- Arcana
(1 /* Artificer */, 6),   -- History
(1 /* Artificer */, 7),   -- Investigation
(1 /* Artificer */, 9),   -- Medicine
(1 /* Artificer */, 12),  -- Nature
(1 /* Artificer */, 13),  -- Perception
(1 /* Artificer */, 17);  -- Sleight of Hand

-- BARBARIAN: Animal Handling, Athletics, Intimidation, Nature, Perception, Survival
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(2 /* Barbarian */, 10),  -- Animal Handling
(2 /* Barbarian */, 1),   -- Athletics
(2 /* Barbarian */, 16),  -- Intimidation
(2 /* Barbarian */, 12),  -- Nature
(2 /* Barbarian */, 13),  -- Perception
(2 /* Barbarian */, 14);  -- Survival

-- BARD: Any skills (todas as skills)
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(3 /* Bard */, 1),   -- Athletics
(3 /* Bard */, 2),   -- Acrobatics
(3 /* Bard */, 3),   -- Sleight of Hand
(3 /* Bard */, 4),   -- Arcana
(3 /* Bard */, 5),   -- Deception
(3 /* Bard */, 6),   -- History
(3 /* Bard */, 7),   -- Investigation
(3 /* Bard */, 8),   -- Insight
(3 /* Bard */, 9),   -- Medicine
(3 /* Bard */, 10),  -- Animal Handling
(3 /* Bard */, 11),  -- Insight
(3 /* Bard */, 12),  -- Nature
(3 /* Bard */, 13),  -- Perception
(3 /* Bard */, 14),  -- Survival
(3 /* Bard */, 15),  -- Performance
(3 /* Bard */, 16),  -- Intimidation
(3 /* Bard */, 17),  -- Sleight of Hand
(3 /* Bard */, 18);  -- Stealth

-- BLOOD HUNTER: Athletics, Acrobatics, Arcana, History, Insight, Investigation, Religion, Survival
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(4 /* Blood Hunter */, 1),   -- Athletics
(4 /* Blood Hunter */, 2),   -- Acrobatics
(4 /* Blood Hunter */, 4),   -- Arcana
(4 /* Blood Hunter */, 6),   -- History
(4 /* Blood Hunter */, 11),  -- Insight
(4 /* Blood Hunter */, 7),   -- Investigation
(4 /* Blood Hunter */, 9),   -- Religion
(4 /* Blood Hunter */, 14);  -- Survival

-- CLERIC: History, Insight, Medicine, Persuasion, Religion
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(5 /* Cleric */, 6),   -- History
(5 /* Cleric */, 11),  -- Insight
(5 /* Cleric */, 9),   -- Medicine
(5 /* Cleric */, 13),  -- Persuasion
(5 /* Cleric */, 11);  -- Religion

-- DRUID: Arcana, Animal Handling, Insight, Medicine, Nature, Perception, Religion, Survival
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(6 /* Druid */, 4),   -- Arcana
(6 /* Druid */, 10),  -- Animal Handling
(6 /* Druid */, 11),  -- Insight
(6 /* Druid */, 9),   -- Medicine
(6 /* Druid */, 12),  -- Nature
(6 /* Druid */, 13),  -- Perception
(6 /* Druid */, 11),  -- Religion
(6 /* Druid */, 14);  -- Survival

-- FIGHTER: Acrobatics, Animal Handling, Athletics, History, Insight, Intimidation, Perception, Survival
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(7 /* Fighter */, 2),   -- Acrobatics
(7 /* Fighter */, 10),  -- Animal Handling
(7 /* Fighter */, 1),   -- Athletics
(7 /* Fighter */, 6),   -- History
(7 /* Fighter */, 11),  -- Insight
(7 /* Fighter */, 16),  -- Intimidation
(7 /* Fighter */, 13),  -- Perception
(7 /* Fighter */, 14);  -- Survival

-- MONK: Acrobatics, Athletics, History, Insight, Religion, Stealth
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(8 /* Monk */, 2),   -- Acrobatics
(8 /* Monk */, 1),   -- Athletics
(8 /* Monk */, 6),   -- History
(8 /* Monk */, 11),  -- Insight
(8 /* Monk */, 11),  -- Religion
(8 /* Monk */, 18);  -- Stealth

-- PALADIN: Athletics, Insight, Intimidation, Medicine, Persuasion, Religion
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(9 /* Paladin */, 1),   -- Athletics
(9 /* Paladin */, 11),  -- Insight
(9 /* Paladin */, 16),  -- Intimidation
(9 /* Paladin */, 9),   -- Medicine
(9 /* Paladin */, 13),  -- Persuasion
(9 /* Paladin */, 11);  -- Religion

-- RANGER: Animal Handling, Athletics, Insight, Investigation, Nature, Perception, Stealth, Survival
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(10 /* Ranger */, 10),  -- Animal Handling
(10 /* Ranger */, 1),   -- Athletics
(10 /* Ranger */, 11),  -- Insight
(10 /* Ranger */, 7),   -- Investigation
(10 /* Ranger */, 12),  -- Nature
(10 /* Ranger */, 13),  -- Perception
(10 /* Ranger */, 18),  -- Stealth
(10 /* Ranger */, 14);  -- Survival

-- ROGUE: Acrobatics, Athletics, Deception, Insight, Intimidation, Investigation, Perception, Performance, Persuasion, Sleight of Hand, Stealth
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(11 /* Rogue */, 2),   -- Acrobatics
(11 /* Rogue */, 1),   -- Athletics
(11 /* Rogue */, 5),   -- Deception
(11 /* Rogue */, 11),  -- Insight
(11 /* Rogue */, 16),  -- Intimidation
(11 /* Rogue */, 7),   -- Investigation
(11 /* Rogue */, 13),  -- Perception
(11 /* Rogue */, 15),  -- Performance
(11 /* Rogue */, 13),  -- Persuasion
(11 /* Rogue */, 17),  -- Sleight of Hand
(11 /* Rogue */, 18);  -- Stealth

-- SORCERER: Arcana, Deception, Insight, Intimidation, Persuasion, Religion
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(12 /* Sorcerer */, 4),   -- Arcana
(12 /* Sorcerer */, 5),   -- Deception
(12 /* Sorcerer */, 11),  -- Insight
(12 /* Sorcerer */, 16),  -- Intimidation
(12 /* Sorcerer */, 13),  -- Persuasion
(12 /* Sorcerer */, 11);  -- Religion

-- WARLOCK: Arcana, Deception, History, Intimidation, Investigation, Nature, Religion
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(13 /* Warlock */, 4),   -- Arcana
(13 /* Warlock */, 5),   -- Deception
(13 /* Warlock */, 6),   -- History
(13 /* Warlock */, 16),  -- Intimidation
(13 /* Warlock */, 7),   -- Investigation
(13 /* Warlock */, 12),  -- Nature
(13 /* Warlock */, 11);  -- Religion

-- WIZARD: Arcana, History, Insight, Investigation, Medicine, Religion
INSERT OR IGNORE INTO class_proficiencies_skill_options (class_id, skill_id) VALUES
(14 /* Wizard */, 4),   -- Arcana
(14 /* Wizard */, 6),   -- History
(14 /* Wizard */, 11),  -- Insight
(14 /* Wizard */, 7),   -- Investigation
(14 /* Wizard */, 9),   -- Medicine
(14 /* Wizard */, 11);  -- Religion

-- =============================================================================
-- INDICES PARA PERFORMANCE
-- =============================================================================

-- Índices para tabelas de proficiências
CREATE INDEX idx_proficiencies_saving_throws_class ON class_proficiencies_saving_throws(class_id);
CREATE INDEX idx_proficiencies_armor_class ON class_proficiencies_armor(class_id);
CREATE INDEX idx_proficiencies_weapons_class ON class_proficiencies_weapons(class_id);
CREATE INDEX idx_proficiencies_tools_class ON class_proficiencies_tools(class_id);
CREATE INDEX idx_proficiencies_skill_choices_class ON class_proficiencies_skill_choices(class_id);
CREATE INDEX idx_proficiencies_skill_options_class ON class_proficiencies_skill_options(class_id);
