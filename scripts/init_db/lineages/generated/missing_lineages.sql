-- LINEAGES FALTANTES
-- Gerado automaticamente a partir do JSON extraído


-- Aarakocra (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aarakocra', 'aarakocra', b.id, 'Because of your wings, you have a flying speed equal to your walking speed. You can’t use this flying speed if you’re wearing medium or heavy armor.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Aarakocra (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aarakocra', 'aarakocra', b.id, 'Most aarakocra are good and rarely choose sides when it comes to law and chaos. Tribal leaders and warriors might be lawful, while explorers and adventurers might tend toward chaotic.', ct.id, s.id, 30, u.id, 30, 'Aarakocra reach maturity by age 3. Compared to humans, aarakocra don’t usually live longer than 30 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Aasimar (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aasimar', 'aasimar', b.id, 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Aasimar (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aasimar', 'aasimar', b.id, 'Imbued with celestial power, most aasimar are good. Outcast aasimar are most often neutral or even evil.', ct.id, s.id, 30, u.id, 160, 'Aasimar mature at the same rate as humans, but they can live up to 160 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Aasimar (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aasimar', 'aasimar', b.id, 'Starting at 3rd level, you can use your action to unleash the divine energy within yourself, causing your eyes to glimmer and two luminous, incorporeal wings to sprout from your back. Your transformat', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Aasimar (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aasimar', 'aasimar', b.id, 'Starting at 3rd level, you can use your action to unleash the divine energy within yourself, causing a searing light to radiate from you, pour out of your eyes and mouth, and threaten to char you. You', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Aasimar (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aasimar', 'aasimar', b.id, 'Starting at 3rd level, you can use your action to unleash the divine energy within yourself, causing your eyes to turn into pools of darkness and two skeletal, ghostly, flightless wings to sprout from', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Aven (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aven', 'aven', b.id, 'You can add half your proficiency bonus, rounded down, to any Intelligence check you make that doesn’t already include your proficiency bonus.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Aven (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Aven', 'aven', b.id, 'You have proficiency in the Perception skill. In addition, attacking at long range doesn’t impose disadvantage on your ranged weapon attack rolls.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Bugbear (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Bugbear', 'bugbear', b.id, 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Bugbear (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Bugbear', 'bugbear', b.id, 'Bugbears endure a harsh existence that demands each of them to remain self-sufficient, even at the expense of their fellows. They tend to be chaotic evil.', ct.id, s.id, 30, u.id, 80, 'Bugbears reach adulthood at age 16 and live up to 80 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Centaur (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Centaur', 'centaur', b.id, 'If you move at least 30 feet straight toward a target and then hit it with a melee weapon attack on the same turn, you can immediately follow that attack with a bonus action, making one attack against', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';


-- Centaur (MOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Centaur', 'centaur', b.id, 'Centaurs are inclined toward neutrality. Lagonna centaurs tend to be more lawful, while Pheres centaurs are more often chaotic.', ct.id, s.id, 30, u.id, NULL, 'Centaurs mature and age at about the same rate as humans.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Changeling (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Changeling', 'changeling', b.id, 'Thanks to your connection to the fey realm, you gain proficiency with two of the following skills of your choice: Deception, Insight, Intimidation, Performance, or Persuasion.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';


-- Deep Gnome (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Deep Gnome', 'deep-gnome', b.id, 'You can see in dim light within 120 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Deep Gnome (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Deep Gnome', 'deep-gnome', b.id, 'Your darkvision has a radius of 120 feet.', ct.id, s.id, 30, u.id, 350, 'Gnomes mature at the same rate as humans, and most are expected to settle into adult life around the age of 40. They can live to 350 years on average, but it''s not too uncommon for them to reach 500 years of age.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Dhampir (VRGR)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Dhampir', 'dhampir', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 1
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VRGR' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Dhampir (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Dhampir', 'dhampir', b.id, 'If you replace a race with this lineage, you can keep the following elements of that race: any skill proficiencies you gained from it and any climbing, flying, or swimming speed you gained from it. If', ct.id, s.id, 30, u.id, NULL, '', 1, 1
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Dhampir (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Dhampir', 'dhampir', b.id, 'Humanoid and Undead', ct.id, s.id, 30, u.id, NULL, '', 1, 1
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


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
SELECT 'Duergar', 'duergar', b.id, 'You can see in dim light within 120 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
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
SELECT 'Eladrin', 'eladrin', b.id, 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
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
SELECT 'Fairy', 'fairy', b.id, 'You know the Druidcraft cantrip. Starting at 3rd level, you can cast the Faerie Fire spell with this trait. Starting at 5th level, you can also cast the Enlarge/Reduce spell with this trait. Once you ', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';


-- Fairy (WBW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Fairy', 'fairy', b.id, 'Fairies have a life span of about a century.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'WBW' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';


-- Firbolg (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Firbolg', 'firbolg', b.id, 'You can cast the Detect Magic and Disguise Self spells with this trait. When you use this version of Disguise Self, you can seem up to 3 feet shorter or taller. Once you cast either of these spells wi', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Firbolg (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Firbolg', 'firbolg', b.id, 'As people who follow the rhythm of nature and see themselves as its caretakers, firbolg are typically neutral good. Evil firbolg are rare and are usually the sworn enemies of the rest of their kind.', ct.id, s.id, 30, u.id, 500, 'As humanoids related to the fey, firbolg have long lifespans. A firbolg reaches adulthood around 30, and the oldest of them can live for 500 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Genasi Air (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Air', 'genasi-air', b.id, 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Genasi Air (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Air', 'genasi-air', b.id, 'Independent and self-reliant, genasi tend toward a neutral alignment.', ct.id, s.id, 30, u.id, 120, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Genasi Earth (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Earth', 'genasi-earth', b.id, 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Genasi Earth (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Earth', 'genasi-earth', b.id, 'Independent and self-reliant, genasi tend toward a neutral alignment.', ct.id, s.id, 30, u.id, 120, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Genasi Fire (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Fire', 'genasi-fire', b.id, 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Genasi Fire (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Fire', 'genasi-fire', b.id, 'Independent and self-reliant, genasi tend toward a neutral alignment.', ct.id, s.id, 30, u.id, 120, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Genasi Water (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Water', 'genasi-water', b.id, 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Genasi Water (EEPC)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Genasi Water', 'genasi-water', b.id, 'Independent and self-reliant, genasi tend toward a neutral alignment.', ct.id, s.id, 30, u.id, 120, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EEPC' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Githyanki (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Githyanki', 'githyanki', b.id, 'You can mystically access a reservoir of experiences of entities connected to the Astral Plane. Whenever you finish a long rest, you gain proficiency in one skill of your choice and with one weapon or', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Githzerai (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Githzerai', 'githzerai', b.id, 'You know the Mage Hand cantrip, and the hand is invisible when you cast the cantrip with this trait. Starting at 3rd level, you can cast the Shield spell with this trait. Starting at 5th level, you ca', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Gnome (ERLW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Gnome', 'gnome', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Goblin (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Goblin', 'goblin', b.id, 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Goblin (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Goblin', 'goblin', b.id, 'Goblins are typically neutral evil, as they care only for their own needs. A few goblins might tend toward good or neutrality, but only rarely.', ct.id, s.id, 30, u.id, 60, 'Goblins reach adulthood at age 8 and live up to 60 years.', 1, 0
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


-- Halfling (SCAG)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Halfling', 'halfling', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'SCAG' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


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
SELECT 'Hexblood', 'hexblood', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 1
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VRGR' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Hexblood (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Hexblood', 'hexblood', b.id, 'If you replace a race with this lineage, you can keep the following elements of that race: any skill proficiencies you gained from it and any climbing, flying, or swimming speed you gained from it. If', ct.id, s.id, 30, u.id, NULL, '', 1, 1
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';


-- Hexblood (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Hexblood', 'hexblood', b.id, 'Fey and Humanoid', ct.id, s.id, 30, u.id, NULL, '', 1, 1
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Hobgoblin (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Hobgoblin', 'hobgoblin', b.id, 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Hobgoblin (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Hobgoblin', 'hobgoblin', b.id, 'Hobgoblin society is built on fidelity to a rigid, unforgiving code of conduct. As such, they tend toward lawful evil.', ct.id, s.id, 30, u.id, NULL, 'Hobgoblins mature at the same rate as humans and have lifespans similar in length to theirs.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Human (ERLW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Human', 'human', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Kender Ua Revised (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kender Ua Revised', 'kender-ua-revised', b.id, 'You are immune to the frightened condition.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Kender Ua (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kender Ua', 'kender-ua', b.id, 'You have advantage on saving throws you make to avoid or end the frightened condition on yourself.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Kender (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kender', 'kender', b.id, 'You have advantage on saving throws you make to avoid or end the frightened condition on yourself. When you fail a saving throw to avoid or end the frighted condition on yourself, you can choose to su', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Kenku (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kenku', 'kenku', b.id, 'When you copy writing or craftwork produced by yourself or someone else, you have advantage on any ability checks you make to produce an exact duplicate.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Kenku (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kenku', 'kenku', b.id, 'Kenku are chaotic creatures, rarely making enduring commitments, and they care mostly for preserving their own hides. They are generally chaotic neutral in outlook.', ct.id, s.id, 30, u.id, 12, 'Kenku have shorter lifespans than humans. They reach maturity at about 12 years old and can live to 60.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Kobold (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kobold', 'kobold', b.id, 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Kobold (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kobold', 'kobold', b.id, 'Kobolds are fundamentally selfish, making them evil, but their reliance on the strength of their group makes them trend toward law.', ct.id, s.id, 30, u.id, 120, 'Kobolds reach adulthood at age 6 and can live up to 120 years but rarely do so.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Lizardfolk (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Lizardfolk', 'lizardfolk', b.id, 'You have a fanged maw that you can use to make unarmed strikes. When you hit with it, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an una', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Lizardfolk (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Lizardfolk', 'lizardfolk', b.id, 'Most lizardfolk are neutral. They see the world as a place of predators and prey, where life and death are natural processes. They wish only to survive, and prefer to leave other creatures to their ow', ct.id, s.id, 30, u.id, 60, 'Lizardfolk reach maturity around age 14 and rarely live longer than 60 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Minotaur (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Minotaur', 'minotaur', b.id, 'You have horns that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier piercing damage, instead of the bludgeoning damage normal for an unarmed ', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Orc (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Orc', 'orc', b.id, 'You can take the Dash action as a bonus action. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. Whenever you use', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Orc (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Orc', 'orc', b.id, 'Orcs are vicious raiders, who believe that the world should be theirs. They also respect strength above all else and believe the strong must bully the weak to ensure that weakness does not spread like', ct.id, s.id, 30, u.id, 50, 'Orcs reach adulthood at age 12 and live up to 50 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Orc (EGW)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Orc', 'orc', b.id, 'Orcs fear the curse of ruin that is said to plague their race, and tend strongly toward either chaos (accepting their fate), or toward law (rejecting it).', ct.id, s.id, 30, u.id, 80, 'Orcs reach adulthood at age 16 and live up to 80 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EGW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Reborn (VRGR)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Reborn', 'reborn', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 1
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VRGR' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Reborn (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Reborn', 'reborn', b.id, 'If you replace a race with this lineage, you can keep the following elements of that race: any skill proficiencies you gained from it and any climbing, flying, or swimming speed you gained from it. If', ct.id, s.id, 30, u.id, NULL, '', 1, 1
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Reborn (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Reborn', 'reborn', b.id, 'Humanoid, as well as Construct or Undead (choose when you gain this lineage)', ct.id, s.id, 30, u.id, NULL, '', 1, 1
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Revenant Ua (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Revenant Ua', 'revenant-ua', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Satyr (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Satyr', 'satyr', b.id, 'You can use your head and horns to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier bludgeoning damage, instead of the bludgeoning damage normal for an unarm', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';


-- Satyr (MOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Satyr', 'satyr', b.id, 'Satyrs delight in living a life free of the mantle of law. They gravitate toward being good, but some have devious streaks and enjoy causing dismay.', ct.id, s.id, 30, u.id, NULL, 'Satyrs mature and age at about the same rate as humans.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Sea Elf (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Sea Elf', 'sea-elf', b.id, 'You can breathe air and water, and you have resistance to cold damage.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Shadar Kai (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Shadar Kai', 'shadar-kai', b.id, 'As a bonus action, you can magically teleport up to 30 feet to an unoccupied space you can see. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended us', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Shifter (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Shifter', 'shifter', b.id, 'Channeling the beast within, you have proficiency in one of the following skills of your choice: Acrobatics, Athletics, Intimidation, or Survival.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Shifter (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Shifter', 'shifter', b.id, 'You have proficiency in the Athletics skill.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Shifter (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Shifter', 'shifter', b.id, 'You have proficiency in the Intimidation skill.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Shifter (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Shifter', 'shifter', b.id, 'You have proficiency in the Acrobatics skill.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Shifter (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Shifter', 'shifter', b.id, 'You have proficiency in the Survival skill.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Shifter (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Shifter', 'shifter', b.id, 'While shifting, you gain a climb speed of 30 feet.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Shifter (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Shifter', 'shifter', b.id, 'While shifting, you can make an unarmed strike as a bonus action. You can use your Dexterity for its attack roll and damage bonus, and this attack deals slashing damage.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Tabaxi (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Tabaxi', 'tabaxi', b.id, 'You can use your claws to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed strike.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Tabaxi (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Tabaxi', 'tabaxi', b.id, 'Tabaxi tend toward chaotic alignments, as they let impulse and fancy guide their decisions. They are rarely evil, with most of them driven by curiosity rather than greed or other dark impulses.', ct.id, s.id, 30, u.id, NULL, 'Tabaxi have lifespans equivalent to humans.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Tiefling (SCAG)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Tiefling', 'tiefling', b.id, '', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'SCAG' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Tortle (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Tortle', 'tortle', b.id, 'You have claws that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed ', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Triton (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Triton', 'triton', b.id, 'You can breathe air and water.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Triton (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Triton', 'triton', b.id, 'Tritons tend toward lawful good. As guardians of the darkest reaches of the sea, their culture pushes them toward order and benevolence.', ct.id, s.id, 30, u.id, 200, 'Tritons reach maturity around age 15 and can live up to 200 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Warforged (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Warforged', 'warforged', b.id, 'Most warforged take comfort in order and discipline, tending toward law and neutrality. But some have absorbed the morality – or lack thereof – of the beings with which they served.', ct.id, s.id, 30, u.id, NULL, 'A typical warforged is between two and thirty years old. The maximum lifespan of the warforged remains a mystery; so far, warforged have shown no signs of deterioration due to age.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Warforged (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Warforged', 'warforged', b.id, 'You gain one skill proficiency of your choice, one tool proficiency of your choice, and fluency in one language of your choice.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Warforged (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Warforged', 'warforged', b.id, 'When you make an unarmed strike, you can deal 1d4 + your Strength modifier bludgeoning damage instead of the normal damage.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Warforged (PHB)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Warforged', 'warforged', b.id, 'Your walking speed is increased by 5 feet.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Yuan Ti (MOOT)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Yuan Ti', 'yuan-ti', b.id, 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.', ct.id, s.id, 30, u.id, NULL, '', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'MOOT' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';


-- Yuan Ti (VGTM)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Yuan Ti', 'yuan-ti', b.id, 'Purebloods are devoid of emotion and see others as tools to manipulate. They care little for law or chaos and are typically neutral evil.', ct.id, s.id, 30, u.id, NULL, 'Purebloods mature at the same rate as humans and have lifespans similar in length to theirs.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'VGTM' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';
