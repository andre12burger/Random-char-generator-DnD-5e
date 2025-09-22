-- =============================================================================
-- SCHEMA: HABILIDADES DE CLASSES D&D 5e (VERSÃO UNIFICADA)
-- =============================================================================
-- Sistema unificado com uma única tabela class_abilities
-- Estrutura: id, class_id, level, ability_name, subclass_specific (5 colunas)
-- =============================================================================

-- =============================================================================
-- TABELA UNIFICADA: CLASS_ABILITIES
-- =============================================================================

-- Tabela unificada para todas as habilidades de classes
CREATE TABLE IF NOT EXISTS class_abilities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    level INTEGER NOT NULL,
    ability_name TEXT NOT NULL,
    subclass_specific BOOLEAN DEFAULT FALSE,
    
    -- Foreign Key
    FOREIGN KEY (class_id) REFERENCES classes(id),
    
    -- Constraints
    CONSTRAINT chk_level_range CHECK (level >= 1 AND level <= 20),
    CONSTRAINT chk_ability_name_not_empty CHECK (LENGTH(TRIM(ability_name)) > 0),
    
    -- Unique constraint
    UNIQUE(class_id, level, ability_name)
);

-- Indexes para performance
CREATE INDEX IF NOT EXISTS idx_class_level ON class_abilities (class_id, level);
CREATE INDEX IF NOT EXISTS idx_class_ability ON class_abilities (class_id, ability_name);

-- =============================================================================
-- DADOS DAS CLASSES: INSERÇÕES UNIFICADAS
-- =============================================================================

-- Classes organizadas em ordem alfabética:
-- 1. ARTIFICER      8. MONK
-- 2. BARBARIAN      9. PALADIN
-- 3. BARD          10. RANGER
-- 4. BLOOD_HUNTER  11. ROGUE
-- 5. CLERIC        12. SORCERER
-- 6. DRUID         13. WARLOCK
-- 7. FIGHTER       14. WIZARD

-- ═════════════════════════════════════════════════════════════════════════════
-- 🔧 ARTIFICER (ID: 1) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 1, 'Magical Tinkering', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 1, 'Spellcasting', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 2, 'Infuse Item', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 3, 'Artificer Specialist', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 3, 'The Right Tool for the Job', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 5, 'Artificer Specialist feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 6, 'Tool Expertise', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 7, 'Flash of Genius', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 9, 'Artificer Specialist feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 10, 'Magic Item Adept', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 11, 'Spell-Storing Item', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 13, '-', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 14, 'Magic Item Savant', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 15, 'Artificer Specialist feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 17, '-', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 18, 'Magic Item Master', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (1, 20, 'Soul of Artifice', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- ⚔️ BARBARIAN (ID: 2) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 1, 'Rage', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 1, 'Unarmored Defense', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 2, 'Reckless Attack', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 2, 'Danger Sense', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 3, 'Primal Path', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 3, 'Primal Knowledge (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 5, 'Extra Attack', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 5, 'Fast Movement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 6, 'Path feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 7, 'Feral Instinct', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 7, 'Instinctive Pounce (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 9, 'Brutal Critical (1 die)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 10, 'Path feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 10, 'Primal Knowledge (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 11, 'Relentless Rage', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 13, 'Brutal Critical (2 dice)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 14, 'Path feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 15, 'Persistent Rage', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 17, 'Brutal Critical (3 dice)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 18, 'Indomitable Might', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (2, 20, 'Primal Champion', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- 🎵 BARD (ID: 3) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 1, 'Spellcasting', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 1, 'Bardic Inspiration (d6)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 2, 'Jack of All Trades', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 2, 'Song of Rest (d6)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 2, 'Magical Inspiration (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 3, 'Bard College', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 3, 'Expertise', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 4, 'Bardic Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 5, 'Bardic Inspiration (d8)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 5, 'Font of Inspiration', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 6, 'Countercharm', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 6, 'Bard College feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 8, 'Bardic Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 9, 'Song of Rest (d8)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 10, 'Bardic Inspiration (d10)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 10, 'Expertise', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 10, 'Magical Secrets', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 12, 'Bardic Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 13, 'Song of Rest (d10)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 14, 'Magical Secrets', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 14, 'Bard College feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 15, 'Bardic Inspiration (d12)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 16, 'Bardic Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 17, 'Song of Rest (d12)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 18, 'Magical Secrets', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 19, 'Bardic Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (3, 20, 'Superior Inspiration', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- 🩸 BLOOD HUNTER (ID: 4) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 1, 'Blood Maledict', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 2, 'Fighting Style', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 2, 'Crimson Rite', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 3, 'Blood Hunter Order', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 5, 'Extra Attack', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 6, 'Brand of Castigation', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 6, 'Blood Maledict (2/rest)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 7, 'Order Feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 7, 'Crimson Rite Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 9, 'Grim Psychometry', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 10, 'Dark Augmentation', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 11, 'Order Feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 13, 'Brand of Tethering', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 13, 'Blood Maledict (3/rest)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 14, 'Hardened Soul', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 14, 'Crimson Rite Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 15, 'Order Feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 17, 'Blood Maledict (4/rest)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 18, 'Order Feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (4, 20, 'Sanguine Mastery', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- ⛪ CLERIC (ID: 5) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 1, 'Spellcasting', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 1, 'Divine Domain', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 2, 'Channel Divinity (x1)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 2, 'Divine Domain feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 2, 'Harness Divine Power (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 4, 'Cantrip Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 5, 'Destroy Undead (CR 1/2)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 6, 'Channel Divinity (x2)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 6, 'Divine Domain feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 8, 'Destroy Undead (CR 1)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 8, 'Divine Domain feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 8, 'Cantrip Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 10, 'Divine Intervention', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 11, 'Destroy Undead (CR 2)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 12, 'Cantrip Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 14, 'Destroy Undead (CR 3)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 16, 'Cantrip Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 17, 'Destroy Undead (CR 4)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 17, 'Divine Domain feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 18, 'Channel Divinity (x3)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 19, 'Cantrip Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (5, 20, 'Divine Intervention improvement', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- 🌿 DRUID (ID: 6) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 1, 'Druidic', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 1, 'Spellcasting', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 2, 'Wild Shape', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 2, 'Druid Circle', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 2, 'Wild Companion (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 4, 'Wild Shape improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 4, 'Cantrip Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 6, 'Druid Circle feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 8, 'Wild Shape improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 8, 'Cantrip Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 10, 'Druid Circle feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 12, 'Cantrip Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 14, 'Druid Circle feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 16, 'Cantrip Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 18, 'Timeless Body', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 18, 'Beast Spells', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 19, 'Cantrip Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (6, 20, 'Archdruid', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- ⚔️ FIGHTER (ID: 7) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 1, 'Fighting Style', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 1, 'Second Wind', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 2, 'Action Surge (x1)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 3, 'Martial Archetype', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 4, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 5, 'Extra Attack (x1)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 6, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 6, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 7, 'Martial Archetype feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 8, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 9, 'Indomitable (x1)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 10, 'Martial Archetype feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 11, 'Extra Attack (x2)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 12, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 13, 'Indomitable (x2)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 14, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 14, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 15, 'Martial Archetype feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 16, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 17, 'Action Surge (x2)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 17, 'Indomitable (x3)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 18, 'Martial Archetype feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 19, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (7, 20, 'Extra Attack (x3)', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- 👊 MONK (ID: 8) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 1, 'Unarmored Defense', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 1, 'Martial Arts', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 2, 'Ki', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 2, 'Unarmored Movement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 2, 'Dedicated Weapon (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 3, 'Monastic Tradition', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 3, 'Deflect Missiles', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 3, 'Ki-Fueled Attack (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 4, 'Slow Fall', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 4, 'Quickened Healing (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 5, 'Extra Attack', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 5, 'Stunning Strike', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 5, 'Focused Aim (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 6, 'Ki-Empowered Strikes', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 6, 'Monastic Tradition feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 7, 'Evasion', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 7, 'Stillness of Mind', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 9, 'Unarmored Movement improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 10, 'Purity of Body', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 11, 'Monastic Tradition feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 13, 'Tongue of the Sun and Moon', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 14, 'Diamond Soul', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 15, 'Timeless Body', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 17, 'Monastic Tradition feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 18, 'Empty Body', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (8, 20, 'Perfect Self', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- 🛡️ PALADIN (ID: 9) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 1, 'Divine Sense', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 1, 'Lay on Hands', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 2, 'Fighting Style', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 2, 'Spellcasting', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 2, 'Divine Smite', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 3, 'Divine Health', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 3, 'Sacred Oath', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 3, 'Harness Divine Power (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 4, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 5, 'Extra Attack', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 6, 'Aura of Protection', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 7, 'Sacred Oath feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 8, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 10, 'Aura of Courage', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 11, 'Improved Divine Smite', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 12, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 14, 'Cleansing Touch', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 15, 'Sacred Oath feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 16, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 18, 'Aura improvements', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 19, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (9, 20, 'Sacred Oath feature', 1);

-- ═════════════════════════════════════════════════════════════════════════════
-- 🏹 RANGER (ID: 10) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 1, 'Favored Enemy', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 1, 'Natural Explorer', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 1, 'Deft Explorer (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 1, 'Favored Foe (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 2, 'Fighting Style', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 2, 'Spellcasting', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 2, 'Spellcasting Focus (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 3, 'Primeval Awareness', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 3, 'Ranger Conclave', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 3, 'Primal Awareness (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 4, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 5, 'Extra Attack', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 6, 'Favored Enemy Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 6, 'Natural Explorer Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 6, 'Deft Explorer Improvement (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 7, 'Ranger Conclave feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 8, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 10, 'Natural Explorer Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 10, 'Hide in Plain Sight', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 10, 'Deft Explorer Feature (Optional)', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 11, 'Ranger Conclave feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 12, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 14, 'Favored Enemy Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 14, 'Vanish', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 15, 'Ranger Conclave feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 16, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 18, 'Feral Senses', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 19, 'Martial Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (10, 20, 'Foe Slayer', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- 🗡️ ROGUE (ID: 11) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 1, 'Expertise', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 1, 'Sneak Attack', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 2, 'Cunning Action', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 3, 'Roguish Archetype', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 3, 'Steady Aim (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 5, 'Uncanny Dodge', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 6, 'Expertise', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 7, 'Evasion', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 9, 'Roguish Archetype feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 10, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 11, 'Reliable Talent', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 13, 'Roguish Archetype feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 14, 'Blindsense', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 15, 'Slippery Mind', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 17, 'Roguish Archetype feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 18, 'Elusive', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (11, 20, 'Stroke of Luck', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- ✨ SORCERER (ID: 12) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 1, 'Spellcasting', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 1, 'Sorcerous Origin', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 2, 'Font of Magic', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 3, 'Metamagic', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 4, 'Sorcerous Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 5, 'Magical Guidance (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 6, 'Sorcerous Origin feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 8, 'Sorcerous Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 10, 'Metamagic', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 12, 'Sorcerous Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 14, 'Sorcerous Origin feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 16, 'Sorcerous Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 17, 'Metamagic', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 18, 'Sorcerous Origin feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 19, 'Sorcerous Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (12, 20, 'Sorcerous Restoration', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- 👹 WARLOCK (ID: 13) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 1, 'Otherworldly Patron', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 1, 'Pact Magic', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 2, 'Eldritch Invocations', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 3, 'Pact Boon', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 4, 'Eldritch Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 6, 'Otherworldly Patron feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 8, 'Eldritch Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 10, 'Otherworldly Patron feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 11, 'Mystic Arcanum (6th level)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 12, 'Eldritch Versatility (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 13, 'Mystic Arcanum (7th level)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 15, 'Mystic Arcanum (8th level)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 17, 'Mystic Arcanum (9th level)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (13, 20, 'Eldritch Master', 0);

-- ═════════════════════════════════════════════════════════════════════════════
-- 🧙 WIZARD (ID: 14) - HABILIDADES DE CLASSE
-- ═════════════════════════════════════════════════════════════════════════════

INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 1, 'Spellcasting', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 1, 'Arcane Recovery', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 2, 'Arcane Tradition', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 3, 'Cantrip Formulas (Optional)', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 4, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 6, 'Arcane Tradition feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 8, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 10, 'Arcane Tradition feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 12, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 14, 'Arcane Tradition feature', 1);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 16, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 18, 'Spell Mastery', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 19, 'Ability Score Improvement', 0);
INSERT OR IGNORE INTO class_abilities (class_id, level, ability_name, subclass_specific) VALUES (14, 20, 'Signature Spells', 0);
-- =============================================================================
-- FIM DO SCHEMA UNIFICADO
-- =============================================================================