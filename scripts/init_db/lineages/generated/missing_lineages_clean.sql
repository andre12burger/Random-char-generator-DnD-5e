-- ============================================
-- LINEAGES BASE (versões únicas por livro)
-- ============================================

-- Aarakocra (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aarakocra', 'aarakocra', b.id, 'You have a flying speed of 50 feet. To use this speed, you can’t be wearing medium or heavy armor.', ct.id, s.id, 30, u.id, 30, 'Aarakocra reach maturity by age 3. Compared to humans, aarakocra don’t usually live longer than 30 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Aarakocra (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aarakocra', 'aarakocra', b.id, 'Because of your wings, you have a flying speed equal to your walking speed. You can’t use this flying speed if you’re wearing medium or heavy armor.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Aasimar (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aasimar', 'aasimar', b.id, 'You have resistance to necrotic damage and radiant damage.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Aasimar (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aasimar', 'aasimar', b.id, 'You have resistance to necrotic damage and radiant damage.', ct.id, s.id, 30, u.id, 160, 'Aasimar mature at the same rate as humans, but they can live up to 160 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Bugbear (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Bugbear', 'bugbear', b.id, 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Bugbear (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Bugbear', 'bugbear', b.id, 'When you make a melee attack on your turn, your reach for it is 5 feet greater than normal.', ct.id, s.id, 30, u.id, 80, 'Bugbears reach adulthood at age 16 and live up to 80 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Centaur (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Centaur', 'centaur', b.id, 'If you move at least 30 feet straight toward a target and then hit it with a melee weapon attack on the same turn, you can immediately follow that attack with a bonus action, making one attack against the target with your hooves.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';

-- Centaur (MOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Centaur', 'centaur', b.id, 'Your creature type is fey, rather than humanoid.', ct.id, s.id, 30, u.id, NULL, 'Centaurs mature and age at about the same rate as humans.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Changeling (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Changeling', 'changeling', b.id, 'Thanks to your connection to the fey realm, you gain proficiency with two of the following skills of your choice: Deception, Insight, Intimidation, Performance, or Persuasion.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';

-- Deep Gnome (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Deep Gnome', 'deep-gnome', b.id, 'Your darkvision has a radius of 120 feet.', ct.id, s.id, 30, u.id, 350, 'Gnomes mature at the same rate as humans, and most are expected to settle into adult life around the age of 40. They can live to 350 years on average, but it''s not too uncommon for them to reach 500 years of age.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Deep Gnome (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Deep Gnome', 'deep-gnome', b.id, 'Starting at 3rd level, you can cast the Disguise Self spell with this trait. Starting at 5th level, you can also cast the Nondetection spell with it, without requiring a material component. Once you cast either of these spells with this trait, you can’t cast that spell with it again until you finish', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Dhampir (VRGR)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Dhampir', 'dhampir', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VRGR' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Dragonborn (EGW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Dragonborn', 'dragonborn', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EGW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Dragonborn (FTD)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Dragonborn', 'dragonborn', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'FTD' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Duergar (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Duergar', 'duergar', b.id, 'Starting at 3rd level, you can cast the Enlarge/Reduce spell with this trait, without requiring a material component. Starting at 5th level, you can also cast the Invisibility spell with it, without requiring a material component. Once you cast either of these spells with this trait, you can’t cast ', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Duergar (SCAG)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Duergar', 'duergar', b.id, 'You can see in dim light within 120 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.', ct.id, s.id, 30, u.id, 350, 'Dwarves mature at the same rate as humans, but they''re considered young until they reach the age of 50. On average, they live about 350 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'SCAG' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Dwarf (ERLW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Dwarf', 'dwarf', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Eladrin (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Eladrin', 'eladrin', b.id, 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Elf (EGW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Elf', 'elf', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EGW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Elf (ERLW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Elf', 'elf', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Fairy (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Fairy', 'fairy', b.id, 'You know the Druidcraft cantrip. Starting at 3rd level, you can cast the Faerie Fire spell with this trait. Starting at 5th level, you can also cast the Enlarge/Reduce spell with this trait. Once you cast Faerie Fire or Enlarge/Reduce with this trait, you can’t cast that spell with it again until yo', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';

-- Fairy (WBW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Fairy', 'fairy', b.id, 'Fairies have a life span of about a century.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'WBW' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';

-- Firbolg (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Firbolg', 'firbolg', b.id, 'You can cast the Detect Magic and Disguise Self spells with this trait. When you use this version of Disguise Self, you can seem up to 3 feet shorter or taller. Once you cast either of these spells with this trait, you can’t cast that spell with it again until you finish a long rest. You can also ca', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Firbolg (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Firbolg', 'firbolg', b.id, 'You can cast Detect Magic and Disguise Self with this trait, using Wisdom as your spellcasting ability for them. Once you cast either spell, you can''t cast it again with this trait until you finish a short or long rest. When you use this version of disguise self, you can seem up to 3 feet shorter t', ct.id, s.id, 30, u.id, 500, 'As humanoids related to the fey, firbolg have long lifespans. A firbolg reaches adulthood around 30, and the oldest of them can live for 500 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Genasi Air (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Air', 'genasi-air', b.id, 'You can hold your breath indefinitely while you’re not incapacitated.', ct.id, s.id, 30, u.id, 120, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Genasi Air (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Air', 'genasi-air', b.id, 'You can hold your breath indefinitely while you’re not incapacitated.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Genasi Earth (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Earth', 'genasi-earth', b.id, 'You can move across difficult terrain made of earth or stone without expending extra movement.', ct.id, s.id, 30, u.id, 120, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Genasi Earth (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Earth', 'genasi-earth', b.id, 'You can move across difficult terrain without expending extra movement if you are using your walking speed on the ground or a floor.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Genasi Fire (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Fire', 'genasi-fire', b.id, 'You have resistance to fire damage.', ct.id, s.id, 30, u.id, 120, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Genasi Fire (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Fire', 'genasi-fire', b.id, 'You have resistance to fire damage.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Genasi Water (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Water', 'genasi-water', b.id, 'You have a swimming speed of 30 feet.', ct.id, s.id, 30, u.id, 120, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Genasi Water (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Water', 'genasi-water', b.id, 'You have resistance to acid damage.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Githyanki (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Githyanki', 'githyanki', b.id, 'You can mystically access a reservoir of experiences of entities connected to the Astral Plane. Whenever you finish a long rest, you gain proficiency in one skill of your choice and with one weapon or tool of your choice, selected from the Player’s Handbook, as you momentarily project your conscious', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Githzerai (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Githzerai', 'githzerai', b.id, 'You know the Mage Hand cantrip, and the hand is invisible when you cast the cantrip with this trait. Starting at 3rd level, you can cast the Shield spell with this trait. Starting at 5th level, you can also cast the Detect Thoughts spell with it. Once you cast Shield or Detect Thoughts with this tra', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Gnome (ERLW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Gnome', 'gnome', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Goblin (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Goblin', 'goblin', b.id, 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Goblin (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Goblin', 'goblin', b.id, 'When you damage a creature with an attack or a spell and the creature''s size is larger than yours, you can cause the attack or spell to deal extra damage to the creature. The extra damage equals your level. Once you use this trait, you can''t use it again until you finish a short or long rest.', ct.id, s.id, 30, u.id, 60, 'Goblins reach adulthood at age 8 and live up to 60 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Goliath (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Goliath', 'goliath', b.id, 'You have proficiency in the Athletics skill, and you count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Half Elf (ERLW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Half Elf', 'half-elf', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Half Orc (ERLW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Half Orc', 'half-orc', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Halfling (EGW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Halfling', 'halfling', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EGW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Halfling (ERLW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Halfling', 'halfling', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Halfling (SCAG)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Halfling', 'halfling', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'SCAG' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Harengon (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Harengon', 'harengon', b.id, 'You can add your proficiency bonus to your initiative rolls.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Harengon (WBW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Harengon', 'harengon', b.id, 'Harengons have a life span of about a century.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'WBW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Hexblood (VRGR)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Hexblood', 'hexblood', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VRGR' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Hobgoblin (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Hobgoblin', 'hobgoblin', b.id, 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Hobgoblin (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Hobgoblin', 'hobgoblin', b.id, 'You are proficient with two martial weapons of your choice and with light armor.', ct.id, s.id, 30, u.id, NULL, 'Hobgoblins mature at the same rate as humans and have lifespans similar in length to theirs.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Human (ERLW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Human', 'human', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Kenku (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kenku', 'kenku', b.id, 'When you copy writing or craftwork produced by yourself or someone else, you have advantage on any ability checks you make to produce an exact duplicate.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Kenku (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kenku', 'kenku', b.id, 'You can duplicate other creatures'' handwriting and craftwork. You have advantage on all checks made to produce forgeries or duplicates of existing objects.', ct.id, s.id, 30, u.id, 12, 'Kenku have shorter lifespans than humans. They reach maturity at about 12 years old and can live to 60.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Kobold (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kobold', 'kobold', b.id, 'As a bonus action, you let out a cry at your enemies within 10 feet of you. Until the start of your next turn, you and your allies have advantage on attack rolls against any of those enemies who could hear you. You can use this trait a number of times equal to your proficiency bonus, and you regain ', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Kobold (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kobold', 'kobold', b.id, 'As an action on your turn, you can cower pathetically to distract nearby foes. Until the end of your next turn, your allies gain advantage on attack rolls against enemies within 10 feet of you that can see you. Once you use this trait, you can''t use it again until you finish a short or long rest.', ct.id, s.id, 30, u.id, 120, 'Kobolds reach adulthood at age 6 and can live up to 120 years but rarely do so.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Lizardfolk (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Lizardfolk', 'lizardfolk', b.id, 'You have a fanged maw that you can use to make unarmed strikes. When you hit with it, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed strike.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Lizardfolk (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Lizardfolk', 'lizardfolk', b.id, 'Your fanged maw is a natural weapon, which you can use to make unarmed strikes. If you hit with it, you deal piercing damage equal to 1d6 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.', ct.id, s.id, 30, u.id, 60, 'Lizardfolk reach maturity around age 14 and rarely live longer than 60 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Minotaur (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Minotaur', 'minotaur', b.id, 'You have horns that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier piercing damage, instead of the bludgeoning damage normal for an unarmed strike.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Orc (EGW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Orc', 'orc', b.id, 'As a bonus action, you can move up to your speed toward an enemy of your choice that you can see or hear. You must end this move closer to the enemy than you started.', ct.id, s.id, 30, u.id, 80, 'Orcs reach adulthood at age 16 and live up to 80 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EGW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Orc (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Orc', 'orc', b.id, 'You can take the Dash action as a bonus action. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. Whenever you use this trait, you gain a number of temporary hit points equal to your proficiency bonus.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Orc (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Orc', 'orc', b.id, 'As a bonus action, you can move up to your speed toward an enemy of your choice that you can see or hear. You must end this move closer to the enemy than you started.', ct.id, s.id, 30, u.id, 50, 'Orcs reach adulthood at age 12 and live up to 50 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Reborn (VRGR)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Reborn', 'reborn', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VRGR' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Satyr (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Satyr', 'satyr', b.id, 'You can use your head and horns to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier bludgeoning damage, instead of the bludgeoning damage normal for an unarmed strike.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';

-- Satyr (MOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Satyr', 'satyr', b.id, 'Your creature type is fey, rather than humanoid.', ct.id, s.id, 30, u.id, NULL, 'Satyrs mature and age at about the same rate as humans.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Sea Elf (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Sea Elf', 'sea-elf', b.id, 'You can breathe air and water, and you have resistance to cold damage.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Shadar Kai (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Shadar Kai', 'shadar-kai', b.id, 'As a bonus action, you can magically teleport up to 30 feet to an unoccupied space you can see. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. Starting at 3rd level, you also gain resistance to all damage when y', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Shifter (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Shifter', 'shifter', b.id, 'Channeling the beast within, you have proficiency in one of the following skills of your choice: Acrobatics, Athletics, Intimidation, or Survival.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Tabaxi (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Tabaxi', 'tabaxi', b.id, 'You can use your claws to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed strike.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Tabaxi (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Tabaxi', 'tabaxi', b.id, 'Your reflexes and agility allow you to move with a burst of speed. When you move on your tum in combat, you can double your speed until the end of the tum. Once you use this trait, you can''t use it again until you move 0 feet on one of your turns.', ct.id, s.id, 30, u.id, NULL, 'Tabaxi have lifespans equivalent to humans.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Tiefling (SCAG)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Tiefling', 'tiefling', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'SCAG' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Tortle (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Tortle', 'tortle', b.id, 'You have claws that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed strike.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Triton (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Triton', 'triton', b.id, 'You can breathe air and water.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Triton (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Triton', 'triton', b.id, 'You can breathe air and water.', ct.id, s.id, 30, u.id, 200, 'Tritons reach maturity around age 15 and can live up to 200 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Yuan Ti (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Yuan Ti', 'yuan-ti', b.id, 'You have advantage on saving throws against spells.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Yuan Ti (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Yuan Ti', 'yuan-ti', b.id, 'You know the Poison Spray cantrip. You can cast Animal Friendship an unlimited number of times with this trait, but you can target only snakes with it. Starting at 3rd level, you can also cast Suggestion with this trait. Once you cast it, you can''t do so again until you finish a long rest. Charisma', ct.id, s.id, 30, u.id, NULL, 'Purebloods mature at the same rate as humans and have lifespans similar in length to theirs.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';
