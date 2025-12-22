-- ============================================
-- ASI (ability score increases)
-- ============================================

-- Aarakocra (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Aarakocra (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Aarakocra (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Aasimar (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Aasimar (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Aasimar (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Bugbear (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Bugbear (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Bugbear (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Centaur (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Centaur (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Centaur (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Changeling (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Changeling (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Changeling (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Deep Gnome (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Deep Gnome (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Deep Gnome (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Duergar (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Duergar (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Duergar (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Eladrin (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Eladrin (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Eladrin (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Fairy (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Fairy (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Fairy (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Fairy (WBW) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';

-- Fairy (WBW) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';

-- Fairy (WBW) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';

-- Firbolg (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Firbolg (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Firbolg (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Air (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Air (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Air (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Earth (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Earth (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Earth (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Fire (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Fire (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Fire (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Water (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Water (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Genasi Water (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Githyanki (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Githyanki (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Githyanki (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Githzerai (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Githzerai (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Githzerai (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Goblin (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Goblin (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Goblin (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Goliath (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Goliath (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Goliath (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Harengon (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Harengon (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Harengon (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Harengon (WBW) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';

-- Harengon (WBW) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';

-- Harengon (WBW) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';

-- Hobgoblin (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Hobgoblin (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Hobgoblin (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Kenku (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Kenku (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Kenku (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Kobold (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Kobold (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Kobold (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Lizardfolk (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Lizardfolk (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Lizardfolk (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Minotaur (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Minotaur (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Minotaur (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Orc (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Orc (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Orc (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Satyr (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Satyr (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Satyr (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Sea Elf (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Sea Elf (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Sea Elf (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Shadar Kai (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Shadar Kai (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Shadar Kai (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Shifter (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Shifter (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Shifter (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Tabaxi (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Tabaxi (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Tabaxi (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Tortle (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Tortle (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Tortle (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Triton (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Triton (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Triton (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Yuan Ti (MOOT) - CHOICE+1 #1
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Yuan Ti (MOOT) - CHOICE+1 #2
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

-- Yuan Ti (MOOT) - CHOICE+1 #3
INSERT OR IGNORE INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value)
SELECT l.id, a.id, 1
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';
