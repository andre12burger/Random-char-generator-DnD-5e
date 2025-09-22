-- =============================================================================
-- SCHEMA: SPELL SLOTS PARA CLASSES SPELLCASTERS D&D 5e
-- =============================================================================
-- Tabela simples de spell slots baseada no formato padrão do D&D 5e
-- Colunas: Level + Cantrips + Spell Slots 1º-9º nível
-- Classes organizadas em ordem alfabética
-- =============================================================================

-- Remover tabela existente se houver
DROP TABLE IF EXISTS class_spell_slots;

CREATE TABLE IF NOT EXISTS class_spell_slots (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    level INTEGER NOT NULL,
    
    -- Cantrips conhecidos (nível 0)
    cantrips_known INTEGER DEFAULT 0,
    
    -- Spell slots por nível (1º ao 9º)
    spell_slot_1st INTEGER DEFAULT 0,
    spell_slot_2nd INTEGER DEFAULT 0,
    spell_slot_3rd INTEGER DEFAULT 0,
    spell_slot_4th INTEGER DEFAULT 0,
    spell_slot_5th INTEGER DEFAULT 0,
    spell_slot_6th INTEGER DEFAULT 0,
    spell_slot_7th INTEGER DEFAULT 0,
    spell_slot_8th INTEGER DEFAULT 0,
    spell_slot_9th INTEGER DEFAULT 0,
    
    -- Constraints
    UNIQUE(class_id, level),
    FOREIGN KEY (class_id) REFERENCES classes(id),
    CHECK (level >= 1 AND level <= 20)
);

-- ARTIFICER (HALF CASTER) - ID: 1
INSERT OR IGNORE INTO class_spell_slots (
    class_id, level, cantrips_known, spell_slot_1st, spell_slot_2nd, spell_slot_3rd, 
    spell_slot_4th, spell_slot_5th, spell_slot_6th, spell_slot_7th, spell_slot_8th, spell_slot_9th
) VALUES
(1 /* Artificer */, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 3, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 4, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 5, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 6, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 7, 2, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 8, 2, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 9, 2, 4, 3, 2, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 10, 3, 4, 3, 2, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 11, 3, 4, 3, 3, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 12, 3, 4, 3, 3, 0, 0, 0, 0, 0, 0),
(1 /* Artificer */, 13, 3, 4, 3, 3, 1, 0, 0, 0, 0, 0),
(1 /* Artificer */, 14, 4, 4, 3, 3, 1, 0, 0, 0, 0, 0),
(1 /* Artificer */, 15, 4, 4, 3, 3, 2, 0, 0, 0, 0, 0),
(1 /* Artificer */, 16, 4, 4, 3, 3, 2, 0, 0, 0, 0, 0),
(1 /* Artificer */, 17, 4, 4, 3, 3, 3, 1, 0, 0, 0, 0),
(1 /* Artificer */, 18, 4, 4, 3, 3, 3, 1, 0, 0, 0, 0),
(1 /* Artificer */, 19, 4, 4, 3, 3, 3, 2, 0, 0, 0, 0),
(1 /* Artificer */, 20, 4, 4, 3, 3, 3, 2, 0, 0, 0, 0);

-- BARD (FULL CASTER) - ID: 3
INSERT OR IGNORE INTO class_spell_slots (
    class_id, level, cantrips_known, spell_slot_1st, spell_slot_2nd, spell_slot_3rd, 
    spell_slot_4th, spell_slot_5th, spell_slot_6th, spell_slot_7th, spell_slot_8th, spell_slot_9th
) VALUES
(3 /* Bard */, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(3 /* Bard */, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(3 /* Bard */, 3, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(3 /* Bard */, 4, 3, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(3 /* Bard */, 5, 3, 4, 3, 2, 0, 0, 0, 0, 0, 0),
(3 /* Bard */, 6, 3, 4, 3, 3, 0, 0, 0, 0, 0, 0),
(3 /* Bard */, 7, 3, 4, 3, 3, 1, 0, 0, 0, 0, 0),
(3 /* Bard */, 8, 3, 4, 3, 3, 2, 0, 0, 0, 0, 0),
(3 /* Bard */, 9, 3, 4, 3, 3, 3, 1, 0, 0, 0, 0),
(3 /* Bard */, 10, 4, 4, 3, 3, 3, 2, 0, 0, 0, 0),
(3 /* Bard */, 11, 4, 4, 3, 3, 3, 2, 1, 0, 0, 0),
(3 /* Bard */, 12, 4, 4, 3, 3, 3, 2, 1, 0, 0, 0),
(3 /* Bard */, 13, 4, 4, 3, 3, 3, 2, 1, 1, 0, 0),
(3 /* Bard */, 14, 4, 4, 3, 3, 3, 2, 1, 1, 0, 0),
(3 /* Bard */, 15, 4, 4, 3, 3, 3, 2, 1, 1, 1, 0),
(3 /* Bard */, 16, 4, 4, 3, 3, 3, 2, 1, 1, 1, 0),
(3 /* Bard */, 17, 4, 4, 3, 3, 3, 2, 1, 1, 1, 1),
(3 /* Bard */, 18, 4, 4, 3, 3, 3, 3, 1, 1, 1, 1),
(3 /* Bard */, 19, 4, 4, 3, 3, 3, 3, 2, 1, 1, 1),
(3 /* Bard */, 20, 4, 4, 3, 3, 3, 3, 2, 2, 1, 1);

-- CLERIC (FULL CASTER) - ID: 5
INSERT OR IGNORE INTO class_spell_slots (
    class_id, level, cantrips_known, spell_slot_1st, spell_slot_2nd, spell_slot_3rd, 
    spell_slot_4th, spell_slot_5th, spell_slot_6th, spell_slot_7th, spell_slot_8th, spell_slot_9th
) VALUES
(5 /* Cleric */, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(5 /* Cleric */, 2, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(5 /* Cleric */, 3, 3, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(5 /* Cleric */, 4, 4, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(5 /* Cleric */, 5, 4, 4, 3, 2, 0, 0, 0, 0, 0, 0),
(5 /* Cleric */, 6, 4, 4, 3, 3, 0, 0, 0, 0, 0, 0),
(5 /* Cleric */, 7, 4, 4, 3, 3, 1, 0, 0, 0, 0, 0),
(5 /* Cleric */, 8, 4, 4, 3, 3, 2, 0, 0, 0, 0, 0),
(5 /* Cleric */, 9, 4, 4, 3, 3, 3, 1, 0, 0, 0, 0),
(5 /* Cleric */, 10, 5, 4, 3, 3, 3, 2, 0, 0, 0, 0),
(5 /* Cleric */, 11, 5, 4, 3, 3, 3, 2, 1, 0, 0, 0),
(5 /* Cleric */, 12, 5, 4, 3, 3, 3, 2, 1, 0, 0, 0),
(5 /* Cleric */, 13, 5, 4, 3, 3, 3, 2, 1, 1, 0, 0),
(5 /* Cleric */, 14, 5, 4, 3, 3, 3, 2, 1, 1, 0, 0),
(5 /* Cleric */, 15, 5, 4, 3, 3, 3, 2, 1, 1, 1, 0),
(5 /* Cleric */, 16, 5, 4, 3, 3, 3, 2, 1, 1, 1, 0),
(5 /* Cleric */, 17, 5, 4, 3, 3, 3, 2, 1, 1, 1, 1),
(5 /* Cleric */, 18, 5, 4, 3, 3, 3, 3, 1, 1, 1, 1),
(5 /* Cleric */, 19, 5, 4, 3, 3, 3, 3, 2, 1, 1, 1),
(5 /* Cleric */, 20, 5, 4, 3, 3, 3, 3, 2, 2, 1, 1);

-- DRUID (FULL CASTER)
INSERT OR IGNORE INTO class_spell_slots (
    class_id, level, cantrips_known, spell_slot_1st, spell_slot_2nd, spell_slot_3rd, 
    spell_slot_4th, spell_slot_5th, spell_slot_6th, spell_slot_7th, spell_slot_8th, spell_slot_9th
) VALUES
(6 /* Druid */, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(6 /* Druid */, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(6 /* Druid */, 3, 2, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(6 /* Druid */, 4, 3, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(6 /* Druid */, 5, 3, 4, 3, 2, 0, 0, 0, 0, 0, 0),
(6 /* Druid */, 6, 3, 4, 3, 3, 0, 0, 0, 0, 0, 0),
(6 /* Druid */, 7, 3, 4, 3, 3, 1, 0, 0, 0, 0, 0),
(6 /* Druid */, 8, 3, 4, 3, 3, 2, 0, 0, 0, 0, 0),
(6 /* Druid */, 9, 3, 4, 3, 3, 3, 1, 0, 0, 0, 0),
(6 /* Druid */, 10, 4, 4, 3, 3, 3, 2, 0, 0, 0, 0),
(6 /* Druid */, 11, 4, 4, 3, 3, 3, 2, 1, 0, 0, 0),
(6 /* Druid */, 12, 4, 4, 3, 3, 3, 2, 1, 0, 0, 0),
(6 /* Druid */, 13, 4, 4, 3, 3, 3, 2, 1, 1, 0, 0),
(6 /* Druid */, 14, 4, 4, 3, 3, 3, 2, 1, 1, 0, 0),
(6 /* Druid */, 15, 4, 4, 3, 3, 3, 2, 1, 1, 1, 0),
(6 /* Druid */, 16, 4, 4, 3, 3, 3, 2, 1, 1, 1, 0),
(6 /* Druid */, 17, 4, 4, 3, 3, 3, 2, 1, 1, 1, 1),
(6 /* Druid */, 18, 4, 4, 3, 3, 3, 3, 1, 1, 1, 1),
(6 /* Druid */, 19, 4, 4, 3, 3, 3, 3, 2, 1, 1, 1),
(6 /* Druid */, 20, 4, 4, 3, 3, 3, 3, 2, 2, 1, 1);

-- PALADIN (HALF CASTER)
INSERT OR IGNORE INTO class_spell_slots (
    class_id, level, cantrips_known, spell_slot_1st, spell_slot_2nd, spell_slot_3rd, 
    spell_slot_4th, spell_slot_5th, spell_slot_6th, spell_slot_7th, spell_slot_8th, spell_slot_9th
) VALUES
(9 /* Paladin */, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 4, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 5, 0, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 6, 0, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 7, 0, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 8, 0, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 9, 0, 4, 3, 2, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 10, 0, 4, 3, 2, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 11, 0, 4, 3, 3, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 12, 0, 4, 3, 3, 0, 0, 0, 0, 0, 0),
(9 /* Paladin */, 13, 0, 4, 3, 3, 1, 0, 0, 0, 0, 0),
(9 /* Paladin */, 14, 0, 4, 3, 3, 1, 0, 0, 0, 0, 0),
(9 /* Paladin */, 15, 0, 4, 3, 3, 2, 0, 0, 0, 0, 0),
(9 /* Paladin */, 16, 0, 4, 3, 3, 2, 0, 0, 0, 0, 0),
(9 /* Paladin */, 17, 0, 4, 3, 3, 3, 1, 0, 0, 0, 0),
(9 /* Paladin */, 18, 0, 4, 3, 3, 3, 1, 0, 0, 0, 0),
(9 /* Paladin */, 19, 0, 4, 3, 3, 3, 2, 0, 0, 0, 0),
(9 /* Paladin */, 20, 0, 4, 3, 3, 3, 2, 0, 0, 0, 0);

-- RANGER (HALF CASTER)
INSERT OR IGNORE INTO class_spell_slots (
    class_id, level, cantrips_known, spell_slot_1st, spell_slot_2nd, spell_slot_3rd, 
    spell_slot_4th, spell_slot_5th, spell_slot_6th, spell_slot_7th, spell_slot_8th, spell_slot_9th
) VALUES
(10 /* Ranger */, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 3, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 4, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 5, 0, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 6, 0, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 7, 0, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 8, 0, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 9, 0, 4, 3, 2, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 10, 0, 4, 3, 2, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 11, 0, 4, 3, 3, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 12, 0, 4, 3, 3, 0, 0, 0, 0, 0, 0),
(10 /* Ranger */, 13, 0, 4, 3, 3, 1, 0, 0, 0, 0, 0),
(10 /* Ranger */, 14, 0, 4, 3, 3, 1, 0, 0, 0, 0, 0),
(10 /* Ranger */, 15, 0, 4, 3, 3, 2, 0, 0, 0, 0, 0),
(10 /* Ranger */, 16, 0, 4, 3, 3, 2, 0, 0, 0, 0, 0),
(10 /* Ranger */, 17, 0, 4, 3, 3, 3, 1, 0, 0, 0, 0),
(10 /* Ranger */, 18, 0, 4, 3, 3, 3, 1, 0, 0, 0, 0),
(10 /* Ranger */, 19, 0, 4, 3, 3, 3, 2, 0, 0, 0, 0),
(10 /* Ranger */, 20, 0, 4, 3, 3, 3, 2, 0, 0, 0, 0);

-- SORCERER (FULL CASTER)
INSERT OR IGNORE INTO class_spell_slots (
    class_id, level, cantrips_known, spell_slot_1st, spell_slot_2nd, spell_slot_3rd, 
    spell_slot_4th, spell_slot_5th, spell_slot_6th, spell_slot_7th, spell_slot_8th, spell_slot_9th
) VALUES
(12 /* Sorcerer */, 1, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(12 /* Sorcerer */, 2, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(12 /* Sorcerer */, 3, 4, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(12 /* Sorcerer */, 4, 5, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(12 /* Sorcerer */, 5, 5, 4, 3, 2, 0, 0, 0, 0, 0, 0),
(12 /* Sorcerer */, 6, 5, 4, 3, 3, 0, 0, 0, 0, 0, 0),
(12 /* Sorcerer */, 7, 5, 4, 3, 3, 1, 0, 0, 0, 0, 0),
(12 /* Sorcerer */, 8, 5, 4, 3, 3, 2, 0, 0, 0, 0, 0),
(12 /* Sorcerer */, 9, 5, 4, 3, 3, 3, 1, 0, 0, 0, 0),
(12 /* Sorcerer */, 10, 6, 4, 3, 3, 3, 2, 0, 0, 0, 0),
(12 /* Sorcerer */, 11, 6, 4, 3, 3, 3, 2, 1, 0, 0, 0),
(12 /* Sorcerer */, 12, 6, 4, 3, 3, 3, 2, 1, 0, 0, 0),
(12 /* Sorcerer */, 13, 6, 4, 3, 3, 3, 2, 1, 1, 0, 0),
(12 /* Sorcerer */, 14, 6, 4, 3, 3, 3, 2, 1, 1, 0, 0),
(12 /* Sorcerer */, 15, 6, 4, 3, 3, 3, 2, 1, 1, 1, 0),
(12 /* Sorcerer */, 16, 6, 4, 3, 3, 3, 2, 1, 1, 1, 0),
(12 /* Sorcerer */, 17, 6, 4, 3, 3, 3, 2, 1, 1, 1, 1),
(12 /* Sorcerer */, 18, 6, 4, 3, 3, 3, 3, 1, 1, 1, 1),
(12 /* Sorcerer */, 19, 6, 4, 3, 3, 3, 3, 2, 1, 1, 1),
(12 /* Sorcerer */, 20, 6, 4, 3, 3, 3, 3, 2, 2, 1, 1);

-- WARLOCK (PACT CASTER)
INSERT OR IGNORE INTO class_spell_slots (
    class_id, level, cantrips_known, spell_slot_1st, spell_slot_2nd, spell_slot_3rd, 
    spell_slot_4th, spell_slot_5th, spell_slot_6th, spell_slot_7th, spell_slot_8th, spell_slot_9th
) VALUES
(13 /* Warlock */, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(13 /* Warlock */, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(13 /* Warlock */, 3, 2, 0, 2, 0, 0, 0, 0, 0, 0, 0),
(13 /* Warlock */, 4, 3, 0, 2, 0, 0, 0, 0, 0, 0, 0),
(13 /* Warlock */, 5, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0),
(13 /* Warlock */, 6, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0),
(13 /* Warlock */, 7, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0),
(13 /* Warlock */, 8, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0),
(13 /* Warlock */, 9, 3, 0, 0, 0, 0, 2, 0, 0, 0, 0),
(13 /* Warlock */, 10, 4, 0, 0, 0, 0, 2, 0, 0, 0, 0),
(13 /* Warlock */, 11, 4, 0, 0, 0, 0, 3, 0, 0, 0, 0),
(13 /* Warlock */, 12, 4, 0, 0, 0, 0, 3, 0, 0, 0, 0),
(13 /* Warlock */, 13, 4, 0, 0, 0, 0, 3, 0, 0, 0, 0),
(13 /* Warlock */, 14, 4, 0, 0, 0, 0, 3, 0, 0, 0, 0),
(13 /* Warlock */, 15, 4, 0, 0, 0, 0, 3, 0, 0, 0, 0),
(13 /* Warlock */, 16, 4, 0, 0, 0, 0, 3, 0, 0, 0, 0),
(13 /* Warlock */, 17, 4, 0, 0, 0, 0, 4, 0, 0, 0, 0),
(13 /* Warlock */, 18, 4, 0, 0, 0, 0, 4, 0, 0, 0, 0),
(13 /* Warlock */, 19, 4, 0, 0, 0, 0, 4, 0, 0, 0, 0),
(13 /* Warlock */, 20, 4, 0, 0, 0, 0, 4, 0, 0, 0, 0);

-- WIZARD (FULL CASTER)
INSERT OR IGNORE INTO class_spell_slots (
    class_id, level, cantrips_known, spell_slot_1st, spell_slot_2nd, spell_slot_3rd, 
    spell_slot_4th, spell_slot_5th, spell_slot_6th, spell_slot_7th, spell_slot_8th, spell_slot_9th
) VALUES
(14 /* Wizard */, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0),
(14 /* Wizard */, 2, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0),
(14 /* Wizard */, 3, 3, 4, 2, 0, 0, 0, 0, 0, 0, 0),
(14 /* Wizard */, 4, 4, 4, 3, 0, 0, 0, 0, 0, 0, 0),
(14 /* Wizard */, 5, 4, 4, 3, 2, 0, 0, 0, 0, 0, 0),
(14 /* Wizard */, 6, 4, 4, 3, 3, 0, 0, 0, 0, 0, 0),
(14 /* Wizard */, 7, 4, 4, 3, 3, 1, 0, 0, 0, 0, 0),
(14 /* Wizard */, 8, 4, 4, 3, 3, 2, 0, 0, 0, 0, 0),
(14 /* Wizard */, 9, 4, 4, 3, 3, 3, 1, 0, 0, 0, 0),
(14 /* Wizard */, 10, 5, 4, 3, 3, 3, 2, 0, 0, 0, 0),
(14 /* Wizard */, 11, 5, 4, 3, 3, 3, 2, 1, 0, 0, 0),
(14 /* Wizard */, 12, 5, 4, 3, 3, 3, 2, 1, 0, 0, 0),
(14 /* Wizard */, 13, 5, 4, 3, 3, 3, 2, 1, 1, 0, 0),
(14 /* Wizard */, 14, 5, 4, 3, 3, 3, 2, 1, 1, 0, 0),
(14 /* Wizard */, 15, 5, 4, 3, 3, 3, 2, 1, 1, 1, 0),
(14 /* Wizard */, 16, 5, 4, 3, 3, 3, 2, 1, 1, 1, 0),
(14 /* Wizard */, 17, 5, 4, 3, 3, 3, 2, 1, 1, 1, 1),
(14 /* Wizard */, 18, 5, 4, 3, 3, 3, 3, 1, 1, 1, 1),
(14 /* Wizard */, 19, 5, 4, 3, 3, 3, 3, 2, 1, 1, 1),
(14 /* Wizard */, 20, 5, 4, 3, 3, 3, 3, 2, 2, 1, 1);

-- =============================================================================
-- ÍNDICES
-- =============================================================================

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_spell_slots_class_level ON class_spell_slots(class_id, level);
CREATE INDEX IF NOT EXISTS idx_spell_slots_class ON class_spell_slots(class_id);
