DROP TABLE IF EXISTS creature_types;
CREATE TABLE creature_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

INSERT INTO creature_types (name) VALUES
('Humanoid'),
('Fey'),
('Celestial'),
('Fiend'),
('Undead'),
('Construct'),
('Dragon'),
('Aberration'),
('Elemental');

DROP TABLE IF EXISTS lineages;
CREATE TABLE lineages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    slug TEXT NOT NULL,
    source_book_id INTEGER NOT NULL,
    description TEXT,
    creature_type_id INTEGER NOT NULL,
    size_id INTEGER NOT NULL,
    speed_value INTEGER NOT NULL DEFAULT 30,
    speed_unit_id INTEGER NOT NULL DEFAULT 1,
    alignment_id INTEGER,
    alignment_description TEXT,
    age_max_years INTEGER,
    age_description TEXT,
    is_default_version BOOLEAN DEFAULT 1,
    is_overlay BOOLEAN DEFAULT 0,
    FOREIGN KEY (source_book_id) REFERENCES core_books(id),
    FOREIGN KEY (creature_type_id) REFERENCES creature_types(id),
    FOREIGN KEY (size_id) REFERENCES core_sizes(id),
    FOREIGN KEY (speed_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (alignment_id) REFERENCES core_alignments(id),
    UNIQUE(slug, source_book_id)
);

INSERT INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, alignment_id, alignment_description, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Dwarf', 'dwarf', b.id, 'Kingdoms rich in ancient grandeur, halls carved into the roots of mountains, the echoing of picks and hammers in deep mines and blazing forges, a commitment to clan and tradition, and a burning hatred of goblins and orcs – these common threads unite all dwarves.', ct.id, s.id, 25, u.id, a.id, 'Most dwarves are lawful, believing firmly in the benefits of a well-ordered society. They tend toward good as well, with a strong sense of fair play and a belief that everyone deserves to share in the benefits of a just order.', 350, 'Dwarves mature at the same rate as humans, but they''re considered young until they reach the age of 50. On average, they live about 350 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u, core_alignments a
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft' AND a.name = 'Lawful Good';

INSERT INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, alignment_id, alignment_description, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Elf', 'elf', b.id, 'Elves are a magical people of otherworldly grace, living in places of ethereal beauty, in the midst of ancient forests or in silvery spires glittering with faerie light, where soft music drifts through the air and gentle fragrances waft on the breeze. Elves love nature and magic, art and artistry, music and poetry.', ct.id, s.id, 30, u.id, a.id, 'Elves love freedom, variety, and self-expression, so they lean strongly towards the gentler aspects of chaos. They value and protect others'' freedom as well as their own, and are good more often than not.', 750, 'Although elves reach physical maturity at about the same age as humans, the elven understanding of adulthood goes beyond physical growth to encompass worldly experience. An elf typically claims adulthood and an adult name around the age of 100 and can live to be 750 years old.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u, core_alignments a
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft' AND a.name = 'Chaotic Good';

INSERT INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, alignment_id, alignment_description, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Human', 'human', b.id, 'In the reckonings of most worlds, humans are the youngest of the common races, late to arrive on the world scene and short-lived in comparison to dwarves, elves, and dragons. Perhaps it is because of their shorter lives that they strive to achieve as much as they can in the years they are given. Or maybe they feel they have something to prove to the elder races, and that''s why they build their mighty empires on the foundation of conquest and trade. Whatever drives them, humans are the innovators, the achievers, and the pioneers of the worlds.', ct.id, s.id, 30, u.id, a.id, 'Humans tend toward no particular alignment. The best and the worst are found among them.', 100, 'Humans reach adulthood in their late teens and live less than a century.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u, core_alignments a
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft' AND a.name = 'True Neutral';

INSERT INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, alignment_id, alignment_description, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Halfling', 'halfling', b.id, 'The comforts of home are the goals of most halflings'' lives: a place to settle in peace and quiet, far from marauding monsters and clashing armies; a blazing fire and a generous meal; fine drink and fine conversation. Though some halflings live out their days in remote agricultural communities, others form nomadic bands that travel constantly, lured by the open road and the wide horizon to discover the wonders of new lands and peoples. But even these wanderers love peace, food, hearth, and home, though home might be a wagon jostling along an dirt road or a raft floating downriver.', ct.id, s.id, 25, u.id, a.id, 'Most halflings are lawful good. As a rule, they are good-hearted and kind, hate to see others in pain, and have no tolerance for oppression. They are also very orderly and traditional, leaning heavily on the support of their community and the comfort of their old ways.', 150, 'A halfling reaches adulthood at the age of 20 and generally lives into the middle of his or her second century.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u, core_alignments a
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Small' AND u.code = 'ft' AND a.name = 'Lawful Good';

INSERT INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, alignment_id, alignment_description, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Tiefling', 'tiefling', b.id, 'To be greeted with stares and whispers, to suffer violence and insult on the street, to see mistrust and fear in every eye: this is the lot of the tiefling. And to twist the knife, tieflings know that this is because a pact struck generations ago infused the essence of Asmodeus—overlord of the Nine Hells—into their bloodline. Their appearance and their nature are not their fault but the result of an ancient sin, for which they and their children and their children''s children will always be held accountable.', ct.id, s.id, 30, u.id, a.id, 'Tieflings might not have an innate tendency toward evil, but many of them end up there. Evil or not, an independent nature inclines many tieflings toward a chaotic alignment.', 100, 'Tieflings mature at the same rate as humans but live a few years longer.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u, core_alignments a
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft' AND a.name = 'Chaotic Neutral';

-- Dragonborn
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Dragonborn', 'dragonborn', b.id, 'Dragonborn look very much like dragons standing erect in humanoid form, though they lack wings or a tail.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Gnome
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Gnome', 'gnome', b.id, 'A constant hum of busy activity pervades the warrens and neighborhoods where gnomes form their close-knit communities.', ct.id, s.id, 25, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Small' AND u.code = 'ft';

-- Half-Elf
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Half-Elf', 'half-elf', b.id, 'Half-elves combine what some say are the best qualities of their elf and human parents.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Half-Orc
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Half-Orc', 'half-orc', b.id, 'Half-orcs'' grayish pigmentation, sloping foreheads, jutting jaws, prominent teeth, and towering builds make their orcish heritage plain for all to see.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Aasimar
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Aasimar', 'aasimar', b.id, 'Aasimar are humanoids with a celestial heritage, blessed with the divine touch of the gods.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Firbolg
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Firbolg', 'firbolg', b.id, 'Firbolg are reclusive giants who live in isolated forests and mountains.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EGW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Goliath
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Goliath', 'goliath', b.id, 'Goliaths are mountain-dwelling humanoids who revere the power of nature and their connection to the land.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Kenku
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Kenku', 'kenku', b.id, 'Kenku are humanoid birds who have lost their ability to fly and their voice.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Lizardfolk
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Lizardfolk', 'lizardfolk', b.id, 'Lizardfolk are reptilian humanoids who live in swamps and marshes.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Tabaxi
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Tabaxi', 'tabaxi', b.id, 'Tabaxi are feline humanoids who are curious and agile.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Triton
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Triton', 'triton', b.id, 'Tritons are aquatic humanoids who live in underwater cities.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Bugbear
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Bugbear', 'bugbear', b.id, 'Bugbears are large, furry goblinoids known for their strength and stealth.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Goblin
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Goblin', 'goblin', b.id, 'Goblins are small, green-skinned humanoids known for their cunning and malice.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Small' AND u.code = 'ft';

-- Hobgoblin
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Hobgoblin', 'hobgoblin', b.id, 'Hobgoblins are disciplined and militaristic goblinoids.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Kobold
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Kobold', 'kobold', b.id, 'Kobolds are small, reptilian humanoids who are cunning and often cowardly.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Small' AND u.code = 'ft';

-- Orc
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Orc', 'orc', b.id, 'Orcs are brutish humanoids known for their strength and aggression.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Centaur
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Centaur', 'centaur', b.id, 'Centaurs are creatures with the upper body of a humanoid and the lower body of a horse.', ct.id, s.id, 40, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'GGR' AND ct.name = 'Humanoid' AND s.name = 'Large' AND u.code = 'ft';

-- Merfolk
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Merfolk', 'merfolk', b.id, 'Merfolk are aquatic humanoids with the upper body of a humanoid and the lower body of a fish.', ct.id, s.id, 10, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Minotaur
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Minotaur', 'minotaur', b.id, 'Minotaurs are large, bull-headed humanoids known for their strength and maze-like lairs.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Satyr
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Satyr', 'satyr', b.id, 'Satyrs are fey creatures known for their love of music, dance, and revelry.', ct.id, s.id, 35, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';

-- Grung
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Grung', 'grung', b.id, 'Grung are small, frog-like humanoids with a strict social hierarchy based on color.', ct.id, s.id, 25, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'OGA' AND ct.name = 'Humanoid' AND s.name = 'Small' AND u.code = 'ft';

-- Vedalken
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Vedalken', 'vedalken', b.id, 'Vedalken are blue-skinned humanoids known for their intelligence and innovation.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'GGR' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Aarakocra
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Aarakocra', 'aarakocra', b.id, 'Sequestered in high mountains atop tall trees, the aarakocra evoke fear and wonder.', ct.id, s.id, 25, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Changeling
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Changeling', 'changeling', b.id, 'Changelings can shift their forms with a thought.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Warforged
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Warforged', 'warforged', b.id, 'The warforged were built to fight in the Last War. They are made of stone, metal, and wood.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Tortle
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Tortle', 'tortle', b.id, 'Tortles are turtle-like humanoids with a natural shell that provides protection.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Yuan-ti Pureblood
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Yuan-ti Pureblood', 'yuan-ti', b.id, 'Yuan-ti purebloods are the most humanoid of the yuan-ti, often serving as infiltrators.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Genasi
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Genasi', 'genasi', b.id, 'Genasi are planetouched beings with elemental heritage.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Githyanki
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Githyanki', 'githyanki', b.id, 'Githyanki are militaristic raiders who dwell in the Astral Plane.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Githzerai
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Githzerai', 'githzerai', b.id, 'Githzerai are contemplative philosophers who dwell in the plane of Limbo.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Kalashtar
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Kalashtar', 'kalashtar', b.id, 'Kalashtar are bound to dream spirits from the plane of Dal Quor.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Shifter
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Shifter', 'shifter', b.id, 'Shifters have lycanthropic heritage and can temporarily enhance their animalistic features.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'ERLW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Loxodon
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Loxodon', 'loxodon', b.id, 'Loxodons are elephant-like humanoids known for their wisdom and loyalty.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'GGR' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Simic Hybrid
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Simic Hybrid', 'simic-hybrid', b.id, 'Simic hybrids are magically modified humanoids with animal enhancements.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'GGR' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Leonin
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Leonin', 'leonin', b.id, 'Leonin are lion-like humanoids known for their fierce loyalty and prowess in battle.', ct.id, s.id, 35, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Fairy
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Fairy', 'fairy', b.id, 'The Feywild is home to many fantastic peoples, including fairies. Fairies are a wee folk, but not nearly as much so as their pixie and sprite friends. The first fairies spoke Elvish, Goblin, or Sylvan, and encounters with human visitors prompted many of them to learn Common as well.', ct.id, s.id, 30, u.id, 'Fairies live for several centuries. They reach adulthood around age 10.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Fey' AND s.name = 'Small' AND u.code = 'ft';

-- Harengon
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Harengon', 'harengon', b.id, 'Harengons are bipedal, humanoid rabbits. They are blessed with a little fey luck, and they often find themselves a few fortunate feet away from dangers during adventures. They are native to the Feywild.', ct.id, s.id, 30, u.id, 'Harengons have a lifespan of about a century.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Owlin
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Owlin', 'owlin', b.id, 'Owlins are owl-like humanoid creatures. They have arms and legs like other humanoids, as well as wings that extend from their back. Owlins are renowned for their piercing stare and have a knack for always finding their prey.', ct.id, s.id, 30, u.id, 'Owlins mature at the same rate as humans and can live up to 150 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Dhampir
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Dhampir', 'dhampir', b.id, 'Poised between the worlds of the living and the dead, dhampirs retain their grip on life yet are endlessly tested by vicious hungers. Their ties to the undead grant dhampirs a taste of a vampire''s deathless prowess in the form of increased speed, darkvision, and a life-draining bite.', ct.id, s.id, 35, u.id, 'Dhampirs mature at the same rate as humans and live slightly longer, about 150 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Hexblood
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Hexblood', 'hexblood', b.id, 'Where wishing fails, ancient magic can offer a heart''s desire—at least, for a time. Hexbloods are individuals infused with eldritch magic, fey energy, or mysterious witchcraft. Some who enter into bargains with hags gain their deepest wishes but eventually find themselves transformed into hexbloods, haunted by the hag''s magic.', ct.id, s.id, 30, u.id, 'Hexbloods mature at the same rate as the creatures that birthed them and have similar lifespans.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';

-- Reborn
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Reborn', 'reborn', b.id, 'Death isn''t always the end. The reborn exemplify this, being individuals who have died yet, somehow, still live. Some reborn exhibit the scars of fatal ends, their ashen flesh or bloodless veins making it clear that they''ve been touched by death. Other reborn are marvels of magic or science, being stitched together from disparate beings or bearing mysterious minds in manufactured bodies.', ct.id, s.id, 30, u.id, 'Reborn don''t age normally and are difficult to physically harm.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Undead' AND s.name = 'Medium' AND u.code = 'ft';

-- Eladrin
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, alignment_id, alignment_description, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Eladrin', 'eladrin', b.id, 'Eladrin are elves native to the Feywild, a realm of beauty, unpredictable emotion, and boundless magic. An eladrin is associated with one of the four seasons and has coloration reminiscent of that season, which can also affect the eladrin''s mood.', ct.id, s.id, 30, u.id, a.id, 'Eladrin tend toward chaotic alignments, as they are prone to sudden shifts in emotion and behavior. They value freedom and self-expression.', 750, 'Eladrin mature at the same rate as humans but can live for several centuries, much like other elves.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u, core_alignments a
WHERE b.code = 'PHB' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft' AND a.name = 'Chaotic Good';

-- Shadar-kai
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Shadar-kai', 'shadar-kai', b.id, 'Shadar-kai are the elves of the Shadowfell, originally drawn to that dread realm by the Raven Queen. Over the centuries, some of them have continued to serve her, while others have ventured into the Material Plane to forge their own fates. Once shadar-kai were Fey like the rest of their elven kin; now they exist in a state between life and death, thanks to being transformed by the Shadowfell''s grim energy.', ct.id, s.id, 30, u.id, 750, 'Shadar-kai mature at the same rate as other elves but appear to age more slowly due to their connection to the Shadowfell.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Kender
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Kender', 'kender', b.id, 'Originating in the world of Krynn, kender are diminutive Humanoids who look like humans with pointed ears and diverse appearances. Kender have a supernatural curiosity that drives them to adventure. Due to this inquisitiveness, many kender find themselves falling through portals to other planes and worlds.', ct.id, s.id, 30, u.id, 100, 'Kender mature at around age 20 and can live to be over 100 years old.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Small' AND u.code = 'ft';

-- Thri-kreen
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Thri-kreen', 'thri-kreen', b.id, 'Thri-kreen have insectile features and two pairs of arms. Their bodies are encased in protective chitin. They can alter the coloration of this carapace to blend in with their natural surroundings. Although thri-kreen don''t sleep, they do require periods of inactivity to revitalize themselves.', ct.id, s.id, 35, u.id, 35, 'Thri-kreen have relatively short lifespans, reaching adulthood by age 5 and living only about 30 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Plasmoid
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Plasmoid', 'plasmoid', b.id, 'Plasmoids are amorphous beings with no typical shape. In the presence of other folk, they often adopt a similar shape, but there''s little chance of mistaking a plasmoid for anything else. They consume food by osmosis, the way an amoeba does, and excrete waste through tiny pores.', ct.id, s.id, 30, u.id, 'Plasmoids mature at around age 5 and can live up to 100 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Giff
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Giff', 'giff', b.id, 'Giff are tall, broad-shouldered folk with hippo-like heads. Some have smooth skin, while others have short bristles on their faces and the tops of their heads. As beings of impressive size and unforgettable appearance, giff are noticed wherever they go.', ct.id, s.id, 30, u.id, 'Giff mature at the same rate as humans and have lifespans similar to humans, around 80 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Hadozee
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Hadozee', 'hadozee', b.id, 'Hadozees are sapient, bipedal beings eager to leave behind the fearsome predators of their homeworld and explore other worlds. Hadozees have hulking builds and fur-covered bodies. Membranes of skin hang from their sides, stretching between their wrists and ankles.', ct.id, s.id, 30, u.id, 'Hadozees mature a little faster than humans, reaching adulthood around age 14. They live about as long as humans.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Autognome
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Autognome', 'autognome', b.id, 'Autognomes are mechanical beings built by rock gnomes. Sometimes, because of a malfunction or a unique circumstance, an autognome becomes separated from its creator and strikes out on its own. An autognome bears a resemblance to its creator.', ct.id, s.id, 30, u.id, 'Autognomes don''t age like other creatures. They can function indefinitely if maintained.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Construct' AND s.name = 'Small' AND u.code = 'ft';

-- Duergar (Gray Dwarf)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, alignment_description, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Duergar', 'duergar', b.id, 'Duergar, also known as gray dwarves, are a subterranean race of dwarves who live in the Underdark. Once enslaved by mind flayers, they have since won their freedom and established their own grim society. They are known for their stoic nature and their innate magical abilities.', ct.id, s.id, 25, u.id, 'Most duergar are lawful evil, having been hardened by their time in the Underdark and their constant struggle for survival.', 350, 'Duergar mature at the same rate as other dwarves and live about 350 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Deep Gnome (Svirfneblin)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Deep Gnome', 'deep-gnome', b.id, 'Deep gnomes, or svirfneblin, are a subterranean offshoot of the gnome race. They dwell in cities deep underground and are known for their skill at remaining hidden. They are more serious and suspicious than their surface-dwelling cousins.', ct.id, s.id, 25, u.id, 500, 'Deep gnomes mature at the same rate as other gnomes and live 400 to 500 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Small' AND u.code = 'ft';

-- Sea Elf
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, alignment_id, alignment_description, age_max_years, age_description, is_default_version, is_overlay)
SELECT 'Sea Elf', 'sea-elf', b.id, 'Sea elves fell in love with the wild beauty of the ocean in the earliest days of the multiverse. While other elves traveled from realm to realm, sea elves navigated the deepest currents and explored the waters across a hundred worlds. Today, they live in small, hidden communities in the ocean shallows and on the Elemental Plane of Water.', ct.id, s.id, 30, u.id, a.id, 'Sea elves share the elven love for freedom and self-expression, though they tend to be more neutral in outlook due to their aquatic isolation.', 750, 'Sea elves mature at the same rate as other elves and can live to be 750 years old.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u, core_alignments a
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft' AND a.name = 'Chaotic Good';

-- Astral Elf
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Astral Elf', 'astral-elf', b.id, 'Long ago, groups of elves ventured from the Feywild to the Astral Plane to be closer to their gods. Life in the Silver Void has imbued their souls with a spark of divine light. That light manifests as a starry gleam in an astral elf''s eyes.', ct.id, s.id, 30, u.id, 'Astral elves can live for over 750 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Locathah
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Locathah', 'locathah', b.id, 'Locathah are fish-like humanoids that live in warm coastal waters. They are tribal and reclusive, preferring to avoid contact with other aquatic races. They have humanoid bodies but with fishlike features.', ct.id, s.id, 30, u.id, 'Locathah mature quickly, reaching adulthood by age 10, but their lifespans are short, rarely exceeding 80 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Verdan
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Verdan', 'verdan', b.id, 'Verdan are a recently emerged race of goblinoids transformed by chaos magic. They are known for their rapid physical and mental growth. Verdan start small but grow significantly in their first few years.', ct.id, s.id, 30, u.id, 'Verdan mature at an unusual rate, reaching adulthood in their first year, but their ultimate lifespan is unknown as the race is so new.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Aven (Plane Shift: Amonkhet)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Aven', 'aven', b.id, 'Aven are bird-headed humanoids from the plane of Amonkhet. They have the heads of hawks or ibises and take pride in their physical prowess and skill in combat.', ct.id, s.id, 30, u.id, 'Aven mature slightly faster than humans, reaching adulthood around age 15, and can live about 80 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Khenra (Plane Shift: Amonkhet)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Khenra', 'khenra', b.id, 'Khenra are jackal-headed humanoids from the plane of Amonkhet. They are fierce warriors known for their loyalty and their connection to the afterlife.', ct.id, s.id, 30, u.id, 'Khenra mature at the same rate as humans and live about 80 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Kor (Plane Shift: Zendikar)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Kor', 'kor', b.id, 'Kor are lithe and agile humanoids from Zendikar. They are nomadic climbers and explorers, known for their skill with ropes and hooks.', ct.id, s.id, 30, u.id, 'Kor mature at the same rate as humans and have similar lifespans.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Naga (Plane Shift: Amonkhet)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Naga', 'naga', b.id, 'Naga are serpentine humanoids from Amonkhet. They have humanoid torsos and serpentine lower bodies, combining the cunning of serpents with humanoid intelligence.', ct.id, s.id, 30, u.id, 'Naga mature at the same rate as humans but can live up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Siren (Plane Shift: Ixalan)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Siren', 'siren', b.id, 'Sirens are bird-like humanoids from Ixalan with powerful wings and a connection to wind magic. They are known for their aerial grace and their beautiful songs.', ct.id, s.id, 30, u.id, 'Sirens mature at the same rate as humans and live about 100 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Vampire (Gothic Lineage)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Vampire', 'vampire', b.id, 'Vampires are undead creatures that sustain themselves by drinking blood. Whether through a dark ritual, a vampire''s embrace, or an ancient curse, vampires come into being through myriad means, many of which involve tragedy.', ct.id, s.id, 30, u.id, 'Vampires don''t age in the traditional sense and can potentially live forever if not destroyed.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Undead' AND s.name = 'Medium' AND u.code = 'ft';

-- Aetherborn (Plane Shift: Kaladesh)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Aetherborn', 'aetherborn', b.id, 'Aetherborn are beings of condensed aether, the magical energy that powers artifacts and inventions on Kaladesh. They are born spontaneously and live brief but meaningful lives.', ct.id, s.id, 30, u.id, 'Aetherborn have extremely short lifespans, living only a few years at most.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Viashino (Plane Shift)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Viashino', 'viashino', b.id, 'Viashino are reptilian humanoids known for their quick reflexes and fierce warrior traditions. They are found on several planes and are valued as soldiers and guards.', ct.id, s.id, 30, u.id, 'Viashino mature quickly, reaching adulthood around age 8, and live about 60 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PSA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Dwarf (PHB basic)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Dwarf', 'dwarf', b.id, 'Bold and hardy, dwarves are known as skilled warriors, miners, and workers of stone and metal. Though they stand well under 5 feet tall, dwarves are so broad and compact that they can weigh as much as a human standing nearly two feet taller. Their courage and endurance are also easily a match for any of the larger folk.', ct.id, s.id, 25, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Elf (PHB basic)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Elf', 'elf', b.id, 'Elves are a magical people of otherworldly grace, living in the world but not entirely part of it. They live in places of ethereal beauty, in the midst of ancient forests or in silvery spires glittering with faerie light. Elves love nature and magic, art and artistry, music and poetry, and the good things of the world.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Halfling (PHB basic)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Halfling', 'halfling', b.id, 'The diminutive halflings survive in a world full of larger creatures by avoiding notice or, barring that, avoiding offense. Standing about 3 feet tall, they appear relatively harmless and so have managed to survive for centuries in the shadow of empires and on the edges of wars and political strife.', ct.id, s.id, 25, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Small' AND u.code = 'ft';

-- Human (PHB basic)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Human', 'human', b.id, 'In the reckonings of most worlds, humans are the youngest of the common races, late to arrive on the world scene and short-lived in comparison to dwarves, elves, and dragons. Perhaps it is because of their shorter lives that they strive to achieve as much as they can in the years they are given. Humans are the most adaptable and ambitious people among the common races.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'PHB' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Eladrin (DMG variant)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Eladrin', 'eladrin', b.id, 'Eladrin are elves native to the Feywild, a realm of beauty, unpredictable emotion, and boundless magic. An eladrin is associated with one of the four seasons and has coloration reminiscent of that season, which can also affect the eladrin''s mood.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'DMG' AND ct.name = 'Fey' AND s.name = 'Medium' AND u.code = 'ft';

-- Revenant (UA)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Revenant', 'revenant-ua', b.id, 'Revenants are beings who have been brought back from death by a supernatural force. Unlike other undead, revenants retain their memories and personalities from life. They are driven by a single-minded purpose: to fulfill some unfinished business from their former existence.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Undead' AND s.name = 'Medium' AND u.code = 'ft';

-- Glitchling (UA)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Glitchling', 'glitchling-ua', b.id, 'Glitchlings are beings touched by the chaos of the multiverse, their very existence flickering between states of being. They appear as humanoid figures that seem to phase in and out of reality, with portions of their body occasionally becoming translucent or taking on distorted, otherworldly forms.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Custom Lineage (Tasha's)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, is_default_version, is_overlay)
SELECT 'Custom Lineage', 'custom', b.id, 'Instead of choosing one of the game''s races for your character at 1st level, you can use the following traits to represent your character''s lineage, giving you full control over how your character''s origin shaped them.', ct.id, s.id, 30, u.id, 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'TCE' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Air Genasi
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Air Genasi', 'air-genasi', b.id, 'Air genasi are descended from djinn, the genies of the Elemental Plane of Air. Embodying many of the airy traits of their otherworldly ancestors, air genasi can draw upon their connection to the winds.', ct.id, s.id, 30, u.id, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EGW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Earth Genasi
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Earth Genasi', 'earth-genasi', b.id, 'Earth genasi are descended from dao, the genies of the Elemental Plane of Earth. Strong and solid, earth genasi are as enduring as the mountains.', ct.id, s.id, 30, u.id, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EGW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Fire Genasi
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Fire Genasi', 'fire-genasi', b.id, 'Fire genasi are descended from efreet, the genies of the Elemental Plane of Fire. As an embodiment of elemental fire, you have a hot temper and a burning passion.', ct.id, s.id, 30, u.id, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EGW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Water Genasi
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Water Genasi', 'water-genasi', b.id, 'Water genasi are descended from marids, the genies of the Elemental Plane of Water. Water genasi are perfectly suited to life underwater and carry the power of the waves inside themselves.', ct.id, s.id, 30, u.id, 'Genasi mature at about the same rate as humans and reach adulthood in their late teens. They live somewhat longer than humans do, up to 120 years.', 1, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'EGW' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Autognome UA (playtest version - not used in random selection)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Autognome (UA)', 'autognome', b.id, 'Autognomes are mechanical beings built by rock gnomes. This is the Unearthed Arcana playtest version.', ct.id, s.id, 30, u.id, 'Autognomes are considered adults when activated and can function indefinitely.', 0, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Construct' AND s.name = 'Small' AND u.code = 'ft';

-- Giff UA (playtest version - not used in random selection)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Giff (UA)', 'giff', b.id, 'Giff are tall, broad-shouldered folk with hippo-like heads. This is the Unearthed Arcana playtest version.', ct.id, s.id, 30, u.id, 'Giff mature at the same rate as humans and live about 80 years.', 0, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Hadozee UA (playtest version - not used in random selection)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Hadozee (UA)', 'hadozee', b.id, 'Hadozee are sapient, bipedal beings with simian features and skin flaps that allow them to glide. This is the Unearthed Arcana playtest version.', ct.id, s.id, 30, u.id, 'Hadozee mature at the same rate as humans and live about 100 years.', 0, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Kender UA (playtest version - not used in random selection)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Kender (UA)', 'kender', b.id, 'Kender are small, curious beings from Krynn. This is the original Unearthed Arcana playtest version.', ct.id, s.id, 30, u.id, 'Kender mature at the same rate as humans and live about 100 years.', 0, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Humanoid' AND s.name = 'Small' AND u.code = 'ft';

-- Kender UA Revised (playtest version - not used in random selection)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Kender (UA Revised)', 'kender', b.id, 'Kender are small, curious beings from Krynn. This is the revised Unearthed Arcana playtest version.', ct.id, s.id, 30, u.id, 'Kender mature at the same rate as humans and live about 100 years.', 0, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Humanoid' AND s.name = 'Small' AND u.code = 'ft';

-- Owlfolk UA (playtest version - not used in random selection, became Owlin)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Owlfolk (UA)', 'owlin', b.id, 'Owlfolk are owl-like humanoids. This is the Unearthed Arcana playtest version that later became Owlin.', ct.id, s.id, 30, u.id, 'Owlfolk mature at the same rate as humans and live about 100 years.', 0, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Plasmoid UA (playtest version - not used in random selection)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Plasmoid (UA)', 'plasmoid', b.id, 'Plasmoids are amorphous ooze creatures. This is the Unearthed Arcana playtest version.', ct.id, s.id, 30, u.id, 'Plasmoids reach maturity at age 5 and live up to 100 years.', 0, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Ooze' AND s.name = 'Medium' AND u.code = 'ft';

-- Rabbitfolk UA (playtest version - not used in random selection, became Harengon)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Rabbitfolk (UA)', 'harengon', b.id, 'Rabbitfolk are rabbit-like humanoids. This is the Unearthed Arcana playtest version that later became Harengon.', ct.id, s.id, 30, u.id, 'Rabbitfolk mature quickly and live about 100 years.', 0, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

-- Thri-kreen UA (playtest version - not used in random selection)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Thri-kreen (UA)', 'thri-kreen', b.id, 'Thri-kreen are insectoid humanoids. This is the Unearthed Arcana playtest version.', ct.id, s.id, 30, u.id, 'Thri-kreen mature quickly and live about 30 years.', 0, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Monstrosity' AND s.name = 'Medium' AND u.code = 'ft';

-- Viashino UA (playtest version - not used in random selection)
INSERT OR IGNORE INTO lineages (name, slug, source_book_id, description, creature_type_id, size_id, speed_value, speed_unit_id, age_description, is_default_version, is_overlay)
SELECT 'Viashino (UA)', 'viashino', b.id, 'Viashino are reptilian humanoids. This is the Unearthed Arcana playtest version.', ct.id, s.id, 30, u.id, 'Viashino mature quickly, reaching adulthood around age 8, and live about 60 years.', 0, 0
FROM core_books b, creature_types ct, core_sizes s, core_measurement_units u
WHERE b.code = 'UA' AND ct.name = 'Humanoid' AND s.name = 'Medium' AND u.code = 'ft';

DROP TABLE IF EXISTS lineage_ability_score_increases;
CREATE TABLE lineage_ability_score_increases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    lineage_id INTEGER NOT NULL,
    attribute_id INTEGER NOT NULL,
    bonus_value INTEGER NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (lineage_id) REFERENCES lineages(id) ON DELETE CASCADE,
    FOREIGN KEY (attribute_id) REFERENCES core_attributes(id)
);

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'dwarf' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'elf' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your ability scores each increase by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'human' AND a.abbreviation IN ('STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA');

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'halfling' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Charisma score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'tiefling' AND a.abbreviation = 'CHA';

-- Dragonborn
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Strength score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'dragonborn' AND a.abbreviation = 'STR';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Charisma score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'dragonborn' AND a.abbreviation = 'CHA';

-- Gnome
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Intelligence score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'gnome' AND a.abbreviation = 'INT';

-- Half-Elf
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Charisma score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'half-elf' AND a.abbreviation = 'CHA';

-- Half-Orc
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Strength score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'half-orc' AND a.abbreviation = 'STR';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Constitution score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'half-orc' AND a.abbreviation = 'CON';

-- Aasimar
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Charisma score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'aasimar' AND a.abbreviation = 'CHA';

-- Firbolg
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Wisdom score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'firbolg' AND a.abbreviation = 'WIS';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Strength score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'firbolg' AND a.abbreviation = 'STR';

-- Goliath
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Strength score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'goliath' AND a.abbreviation = 'STR';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Constitution score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'goliath' AND a.abbreviation = 'CON';

-- Kenku
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'kenku' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'kenku' AND a.abbreviation = 'WIS';

-- Lizardfolk
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'lizardfolk' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'lizardfolk' AND a.abbreviation = 'WIS';

-- Tabaxi
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'tabaxi' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Charisma score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'tabaxi' AND a.abbreviation = 'CHA';

-- Triton
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Strength score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'triton' AND a.abbreviation = 'STR';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Constitution score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'triton' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Charisma score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'triton' AND a.abbreviation = 'CHA';

-- Bugbear
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Strength score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'bugbear' AND a.abbreviation = 'STR';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Dexterity score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'bugbear' AND a.abbreviation = 'DEX';

-- Goblin
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'goblin' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Constitution score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'goblin' AND a.abbreviation = 'CON';

-- Hobgoblin
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'hobgoblin' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Intelligence score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'hobgoblin' AND a.abbreviation = 'INT';

-- Kobold
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'kobold' AND a.abbreviation = 'DEX';

-- Orc
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Strength score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'orc' AND a.abbreviation = 'STR';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Constitution score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'orc' AND a.abbreviation = 'CON';

-- Centaur
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Strength score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'centaur' AND a.abbreviation = 'STR';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'centaur' AND a.abbreviation = 'WIS';

-- Vedalken
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Intelligence score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'vedalken' AND a.abbreviation = 'INT';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'vedalken' AND a.abbreviation = 'WIS';

-- Merfolk
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Charisma score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'merfolk' AND a.abbreviation = 'CHA';

-- Minotaur
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Strength score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'minotaur' AND a.abbreviation = 'STR';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Constitution score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'minotaur' AND a.abbreviation = 'CON';

-- Satyr
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Charisma score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'satyr' AND a.abbreviation = 'CHA';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Dexterity score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'satyr' AND a.abbreviation = 'DEX';

-- Grung
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'grung' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Constitution score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'grung' AND a.abbreviation = 'CON';

-- Aarakocra
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'aarakocra' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'aarakocra' AND a.abbreviation = 'WIS';

-- Changeling
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Charisma score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'changeling' AND a.abbreviation = 'CHA';

-- Warforged
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'warforged' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Armor Class increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'warforged' AND a.abbreviation = 'STR';

-- Tortle
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Strength score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'tortle' AND a.abbreviation = 'STR';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'tortle' AND a.abbreviation = 'WIS';

-- Yuan-ti Pureblood
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Charisma score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'yuan-ti-pureblood' AND a.abbreviation = 'CHA';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Intelligence score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'yuan-ti-pureblood' AND a.abbreviation = 'INT';

-- Genasi
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'genasi' AND a.abbreviation = 'CON';

-- Githyanki
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Strength score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'githyanki' AND a.abbreviation = 'STR';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Intelligence score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'githyanki' AND a.abbreviation = 'INT';

-- Githzerai
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Wisdom score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'githzerai' AND a.abbreviation = 'WIS';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Intelligence score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'githzerai' AND a.abbreviation = 'INT';

-- Kalashtar
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Wisdom score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'kalashtar' AND a.abbreviation = 'WIS';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Charisma score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'kalashtar' AND a.abbreviation = 'CHA';

-- Shifter
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Dexterity score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'shifter' AND a.abbreviation = 'DEX';

-- Loxodon
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'loxodon' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'loxodon' AND a.abbreviation = 'WIS';

-- Simic Hybrid
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'simic-hybrid' AND a.abbreviation = 'CON';

-- Leonin
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'leonin' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Strength score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'leonin' AND a.abbreviation = 'STR';

-- Fairy
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'fairy' AND a.abbreviation = 'STR' LIMIT 1;

-- Harengon
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'harengon' AND a.abbreviation = 'STR' LIMIT 1;

-- Owlin
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'owlin' AND a.abbreviation = 'STR' LIMIT 1;

-- Dhampir
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'dhampir' AND a.abbreviation = 'STR' LIMIT 1;

-- Hexblood
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'hexblood' AND a.abbreviation = 'STR' LIMIT 1;

-- Reborn
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'reborn' AND a.abbreviation = 'STR' LIMIT 1;

-- Shadar-kai
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'shadar-kai' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Constitution score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'shadar-kai' AND a.abbreviation = 'CON';

-- Kender
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'kender' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Charisma score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'kender' AND a.abbreviation = 'CHA';

-- Thri-kreen
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'thri-kreen' AND a.abbreviation = 'STR' LIMIT 1;

-- Plasmoid
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'plasmoid' AND a.abbreviation = 'STR' LIMIT 1;

-- Giff
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'giff' AND a.abbreviation = 'STR' LIMIT 1;

-- Hadozee
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'hadozee' AND a.abbreviation = 'STR' LIMIT 1;

-- Autognome
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'autognome' AND a.abbreviation = 'STR' LIMIT 1;

-- Duergar
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'duergar' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Strength score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'duergar' AND a.abbreviation = 'STR';

-- Deep Gnome
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Intelligence score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'deep-gnome' AND a.abbreviation = 'INT';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Dexterity score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'deep-gnome' AND a.abbreviation = 'DEX';

-- Sea Elf
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'sea-elf' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Constitution score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'sea-elf' AND a.abbreviation = 'CON';

-- Astral Elf
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'astral-elf' AND a.abbreviation = 'STR' LIMIT 1;

-- Locathah
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Strength score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'locathah' AND a.abbreviation = 'STR';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Dexterity score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'locathah' AND a.abbreviation = 'DEX';

-- Verdan
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Charisma score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'verdan' AND a.abbreviation = 'CHA';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Constitution score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'verdan' AND a.abbreviation = 'CON';

-- Aven
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'aven' AND a.abbreviation = 'DEX';

-- Khenra
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Strength score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'khenra' AND a.abbreviation = 'STR';

-- Kor
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'kor' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'kor' AND a.abbreviation = 'WIS';

-- Naga
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'naga' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Intelligence score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'naga' AND a.abbreviation = 'INT';

-- Siren
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Charisma score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'siren' AND a.abbreviation = 'CHA';

-- Vampire
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase one ability score by 2 and increase a different score by 1, or increase three different scores by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'vampire' AND a.abbreviation = 'STR' LIMIT 1;

-- Aetherborn
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Charisma score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'aetherborn' AND a.abbreviation = 'CHA';

-- Viashino
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2'
FROM lineages l, core_attributes a
WHERE l.slug = 'viashino' AND a.abbreviation = 'DEX';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Strength score increases by 1'
FROM lineages l, core_attributes a
WHERE l.slug = 'viashino' AND a.abbreviation = 'STR';

-- Dwarf ASI
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2.'
FROM lineages l, core_attributes a WHERE l.slug = 'dwarf' AND a.abbreviation = 'CON';

-- Elf ASI
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2.'
FROM lineages l, core_attributes a WHERE l.slug = 'elf' AND a.abbreviation = 'DEX';

-- Halfling ASI
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Dexterity score increases by 2.'
FROM lineages l, core_attributes a WHERE l.slug = 'halfling' AND a.abbreviation = 'DEX';

-- Human ASI (all +1)
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your ability scores each increase by 1.'
FROM lineages l, core_attributes a WHERE l.slug = 'human';

-- Eladrin ASI (flexible - Tasha's Cauldron allows choice)
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Increase one ability score by 2 and increase a different one by 1, or increase three different ability scores by 1.'
FROM lineages l, core_attributes a WHERE l.slug = 'eladrin' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1.'
FROM lineages l, core_attributes a WHERE l.slug = 'eladrin' AND a.abbreviation = 'CHOICE';

-- Revenant ASI
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Constitution score increases by 1.'
FROM lineages l, core_attributes a WHERE l.slug = 'revenant-ua' AND a.abbreviation = 'CON';

-- Glitchling ASI (flexible - UA playtest)
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Increase one ability score by 2 and increase a different one by 1, or increase three different ability scores by 1.'
FROM lineages l, core_attributes a WHERE l.slug = 'glitchling-ua' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1.'
FROM lineages l, core_attributes a WHERE l.slug = 'glitchling-ua' AND a.abbreviation = 'CHOICE';

-- Custom Lineage ASI (flexible - Tasha's allows choice)
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Increase one ability score by 2.'
FROM lineages l, core_attributes a WHERE l.slug = 'custom' AND a.abbreviation = 'CHOICE';

-- Air Genasi ASI
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2.'
FROM lineages l, core_attributes a WHERE l.slug = 'air-genasi' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Dexterity score increases by 1.'
FROM lineages l, core_attributes a WHERE l.slug = 'air-genasi' AND a.abbreviation = 'DEX';

-- Earth Genasi ASI
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2.'
FROM lineages l, core_attributes a WHERE l.slug = 'earth-genasi' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Strength score increases by 1.'
FROM lineages l, core_attributes a WHERE l.slug = 'earth-genasi' AND a.abbreviation = 'STR';

-- Fire Genasi ASI
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2.'
FROM lineages l, core_attributes a WHERE l.slug = 'fire-genasi' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Intelligence score increases by 1.'
FROM lineages l, core_attributes a WHERE l.slug = 'fire-genasi' AND a.abbreviation = 'INT';

-- Water Genasi ASI
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your Constitution score increases by 2.'
FROM lineages l, core_attributes a WHERE l.slug = 'water-genasi' AND a.abbreviation = 'CON';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your Wisdom score increases by 1.'
FROM lineages l, core_attributes a WHERE l.slug = 'water-genasi' AND a.abbreviation = 'WIS';

-- UA versions ASI (flexible choice) - same slugs as official versions but different book
INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Increase one ability score by 2 and increase a different one by 1, or increase three different ability scores by 1.'
FROM lineages l, core_books b, core_attributes a 
WHERE l.source_book_id = b.id AND b.code = 'UA' AND a.abbreviation = 'CHOICE' 
AND l.slug IN ('autognome', 'giff', 'hadozee', 'kender', 'owlin', 'plasmoid', 'harengon', 'thri-kreen', 'viashino');

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1.'
FROM lineages l, core_books b, core_attributes a 
WHERE l.source_book_id = b.id AND b.code = 'UA' AND a.abbreviation = 'CHOICE' 
AND l.slug IN ('autognome', 'giff', 'hadozee', 'kender', 'owlin', 'plasmoid', 'harengon', 'thri-kreen', 'viashino');

-- Commented out lineage_languages table - will be populated separately
-- DROP TABLE IF EXISTS lineage_languages;
-- CREATE TABLE lineage_languages (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     lineage_id INTEGER NOT NULL,
--     language_id INTEGER NOT NULL,
--     description TEXT,
--     FOREIGN KEY (lineage_id) REFERENCES lineages(id) ON DELETE CASCADE,
--     FOREIGN KEY (language_id) REFERENCES core_languages(id)
-- );

CREATE INDEX IF NOT EXISTS idx_lineages_slug ON lineages(slug);
CREATE INDEX IF NOT EXISTS idx_lineages_book ON lineages(source_book_id);
CREATE INDEX IF NOT EXISTS idx_lineage_asi_lineage ON lineage_ability_score_increases(lineage_id);
-- CREATE INDEX IF NOT EXISTS idx_lineage_languages_lineage ON lineage_languages(lineage_id);

DROP VIEW IF EXISTS v_lineages_for_random;
CREATE VIEW v_lineages_for_random AS
SELECT l.id, l.slug, l.name, b.name AS book, ct.name AS creature_type, s.name AS size, l.speed_value || ' ' || u.code AS speed
FROM lineages l
JOIN core_books b ON l.source_book_id = b.id
JOIN creature_types ct ON l.creature_type_id = ct.id
JOIN core_sizes s ON l.size_id = s.id
JOIN core_measurement_units u ON l.speed_unit_id = u.id
WHERE l.is_default_version = 1
ORDER BY l.name;

DROP VIEW IF EXISTS v_lineage_complete;
CREATE VIEW v_lineage_complete AS
SELECT l.id, l.slug, l.name, l.description, ct.name AS creature_type, s.name AS size, l.speed_value, u.code AS speed_unit, a.name AS alignment, l.alignment_description, l.age_max_years, l.age_description, b.name AS source_book, b.release_date
FROM lineages l
JOIN creature_types ct ON l.creature_type_id = ct.id
JOIN core_sizes s ON l.size_id = s.id
JOIN core_measurement_units u ON l.speed_unit_id = u.id
LEFT JOIN core_alignments a ON l.alignment_id = a.id
JOIN core_books b ON l.source_book_id = b.id;

DROP VIEW IF EXISTS v_lineage_asi;
CREATE VIEW v_lineage_asi AS
SELECT l.id AS lineage_id, l.name AS lineage_name, a.name AS attribute, a.abbreviation AS attribute_abbr, asi.bonus_value, asi.description
FROM lineages l
JOIN lineage_ability_score_increases asi ON l.id = asi.lineage_id
JOIN core_attributes a ON asi.attribute_id = a.id
ORDER BY l.id, asi.id;

-- DROP VIEW IF EXISTS v_lineage_languages;
-- CREATE VIEW v_lineage_languages AS
-- SELECT l.id AS lineage_id, l.name AS lineage_name, lang.name AS language, ll.description
-- FROM lineages l
-- JOIN lineage_languages ll ON l.id = ll.lineage_id
-- JOIN core_languages lang ON ll.language_id = lang.id
-- ORDER BY l.id, lang.name;
