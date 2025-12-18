-- =========================================================================
-- RELAÇÕES SUBCLASSE-LIVRO COM LÓGICA is_ua_version CORRIGIDA
-- Todas as 219 subclasses com marcação UA precisa
-- =========================================================================

DROP TABLE IF EXISTS subclass_books;

CREATE TABLE IF NOT EXISTS subclass_books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subclass_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    is_ua_version INTEGER CHECK(is_ua_version IN (0, 1)) DEFAULT 0,
    FOREIGN KEY (subclass_id) REFERENCES subclasses(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES core_books(id),
    UNIQUE(subclass_id, book_id)
);

CREATE INDEX IF NOT EXISTS idx_subclass_books_subclass ON subclass_books(subclass_id);
CREATE INDEX IF NOT EXISTS idx_subclass_books_book ON subclass_books(book_id);

-- ==================== DADOS COM LÓGICA UA CORRIGIDA ====================

-- ===== ARTIFICER =====

-- Artificer - Alchemist
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (1, 31, 0);

-- Artificer - Armorer
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (2, 2, 0);

-- Artificer - Artillerist
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (3, 31, 0);

-- Artificer - Battle Smith
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (4, 31, 0);

-- Artificer - Archivist (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (5, 55, 1);

-- Artificer - Armorer (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (6, 55, 1);


-- ===== BARBARIAN =====

-- Barbarian - Path of the Ancestral Guardian
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (7, 14, 0);

-- Barbarian - Path of the Battlerager
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (8, 8, 0);

-- Barbarian - Path Of The Beast
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (9, 2, 0);

-- Barbarian - Path of the Berserker
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (10, 2, 0);

-- Barbarian - Path of the Giant
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (11, 2, 0);

-- Barbarian - Path of the Storm Herald
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (12, 14, 0);

-- Barbarian - Path of the Totem Warrior
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (13, 2, 0);

-- Barbarian - Path of Wild Magic
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (14, 31, 0);

-- Barbarian - Path of the Zealot
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (15, 14, 0);

-- Barbarian - Path of the Beast (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (16, 55, 1);

-- Barbarian - Path of the Giant (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (17, 55, 1);

-- Barbarian - Path of the Wild Soul (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (18, 55, 1);


-- ===== BARD =====

-- Bard - College of Creation
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (19, 2, 0);

-- Bard - College of Eloquence
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (20, 31, 0);

-- Bard - College of Glamour
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (21, 14, 0);

-- Bard - College of Lore
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (22, 2, 0);

-- Bard - College of Spirits
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (23, 2, 0);

-- Bard - College of Swords
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (24, 14, 0);

-- Bard - College of Valor
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (25, 2, 0);

-- Bard - College of Whispers
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (26, 14, 0);

-- Bard - College of Creation (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (27, 55, 1);

-- Bard - College of Spirits (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (28, 55, 1);

-- Bard - College of Satire (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (29, 55, 1);

-- Bard - Mage of Lorehold (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (30, 55, 1);

-- Bard - Mage of Silverquill (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (31, 55, 1);


-- ===== BLOOD HUNTER =====

-- Blood Hunter - Order of the Ghostslayer
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (32, 55, 0);

-- Blood Hunter - Order of the Lycan
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (33, 55, 0);

-- Blood Hunter - Order of the Mutant
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (34, 55, 0);

-- Blood Hunter - Order of the Profane Soul
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (35, 55, 0);


-- ===== CLERIC =====

-- Cleric - Arcana Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (36, 8, 0);

-- Cleric - Death Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (37, 5, 0);

-- Cleric - Forge Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (38, 14, 0);

-- Cleric - Grave Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (39, 14, 0);

-- Cleric - Knowledge Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (40, 2, 0);

-- Cleric - Life Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (41, 2, 0);

-- Cleric - Light Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (42, 2, 0);

-- Cleric - Nature Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (43, 2, 0);

-- Cleric - Order Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (44, 31, 0);

-- Cleric - Peace Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (45, 31, 0);

-- Cleric - Tempest Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (46, 2, 0);

-- Cleric - Trickery Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (47, 2, 0);

-- Cleric - Twilight Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (48, 2, 0);

-- Cleric - War Domain
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (49, 2, 0);

-- Cleric - Solidarity Domain (Amonkhet)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (50, 2, 0);

-- Cleric - Strength Domain (Amonkhet)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (51, 2, 0);

-- Cleric - Ambition Domain (Amonkhet)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (52, 2, 0);

-- Cleric - Zeal Domain (Amonkhet)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (53, 2, 0);

-- Cleric - Fate Domain (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (54, 55, 1);

-- Cleric - City Domain (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (55, 55, 1);

-- Cleric - Protection Domain (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (56, 55, 1);

-- Cleric - Twilight Domain (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (57, 55, 1);

-- Cleric - Unity Domain (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (58, 55, 1);


-- ===== DRUID =====

-- Druid - Circle of Dreams
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (59, 14, 0);

-- Druid - Circle of the Land
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (60, 2, 0);

-- Druid - Circle of the Moon
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (61, 2, 0);

-- Druid - Circle of the Shepherd
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (62, 14, 0);

-- Druid - Circle of Spores
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (63, 31, 0);

-- Druid - Circle of Stars
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (64, 2, 0);

-- Druid - Circle of Wildfire
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (65, 2, 0);

-- Druid - Circle of the Primeval (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (66, 55, 1);

-- Druid - Circle of Stars (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (67, 55, 1);

-- Druid - Circle of Twilight (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (68, 55, 1);

-- Druid - Circle of Wildfire (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (69, 55, 1);

-- Druid - Mage of Prismari (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (70, 55, 1);

-- Druid - Mage of Witherbloom (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (71, 55, 1);


-- ===== FIGHTER =====

-- Fighter - Arcane Archer
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (72, 14, 0);

-- Fighter - Banneret
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (73, 8, 0);

-- Fighter - Battle Master
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (74, 2, 0);

-- Fighter - Cavalier
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (75, 2, 0);

-- Fighter - Champion
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (76, 2, 0);

-- Fighter - Echo Knight
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (77, 28, 0);

-- Fighter - Eldritch Knight
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (78, 2, 0);

-- Fighter - Psi Warrior
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (79, 31, 0);

-- Fighter - Psi Knight
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (80, 2, 0);

-- Fighter - Rune Knight
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (81, 2, 0);

-- Fighter - Samurai
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (82, 2, 0);

-- Fighter - Arcane Archer (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (83, 55, 1);

-- Fighter - Arcane Archer Revised (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (84, 55, 1);

-- Fighter - Brute (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (85, 55, 1);

-- Fighter - Cavalier (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (86, 55, 1);

-- Fighter - Knight (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (87, 55, 1);

-- Fighter - Monster Hunter (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (88, 55, 1);

-- Fighter - Psi Warrior (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (89, 55, 1);

-- Fighter - Psychic Warrior (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (90, 55, 1);

-- Fighter - Rune Knight (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (91, 55, 1);

-- Fighter - Samurai (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (92, 55, 1);

-- Fighter - Scout (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (93, 55, 1);

-- Fighter - Sharpshooter (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (94, 55, 1);


-- ===== MONK =====

-- Monk - Way of the Astral Self
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (95, 2, 0);

-- Monk - Way of the Ascendant Dragon
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (96, 2, 0);

-- Monk - Way of the Drunken Master
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (97, 14, 0);

-- Monk - Way of the Four Elements
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (98, 2, 0);

-- Monk - Way of the Kensei
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (99, 2, 0);

-- Monk - Way of the Long Death
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (100, 8, 0);

-- Monk - Way of Mercy
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (101, 2, 0);

-- Monk - Way of the Open Hand
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (102, 2, 0);

-- Monk - Way of Shadow
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (103, 2, 0);

-- Monk - Way of the Sun Soul
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (104, 14, 0);

-- Monk - Way of the Ascendant Dragon (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (105, 55, 1);

-- Monk - Way of the Astral Self (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (106, 55, 1);

-- Monk - Kensei (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (107, 55, 1);

-- Monk - Way of Mercy (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (108, 55, 1);

-- Monk - Way of Tranquility (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (109, 55, 1);


-- ===== PALADIN =====

-- Paladin - Oath of the Ancients
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (110, 2, 0);

-- Paladin - Oath of Conquest
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (111, 14, 0);

-- Paladin - Oath of the Crown
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (112, 8, 0);

-- Paladin - Oath of Devotion
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (113, 2, 0);

-- Paladin - Oath of Glory
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (114, 31, 0);

-- Paladin - Oath of Redemption
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (115, 2, 0);

-- Paladin - Oath of Vengeance
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (116, 2, 0);

-- Paladin - Oath of the Watchers
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (117, 2, 0);

-- Paladin - Oathbreaker
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (118, 2, 0);

-- Paladin - Oath of Treachery (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (119, 55, 1);

-- Paladin - Oath of Redemption (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (120, 55, 1);

-- Paladin - Oath of the Watchers (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (121, 55, 1);

-- Paladin - Oath of Heroism (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (122, 55, 1);


-- ===== RANGER =====

-- Ranger - Beast Master Conclave
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (123, 2, 0);

-- Ranger - Fey Wanderer
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (124, 2, 0);

-- Ranger - Gloom Stalker Conclave
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (125, 14, 0);

-- Ranger - Horizon Walker Conclave
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (126, 14, 0);

-- Ranger - Hunter Conclave
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (127, 2, 0);

-- Ranger - Monster Slayer Conclave
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (128, 2, 0);

-- Ranger - Swarmkeeper
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (129, 2, 0);

-- Ranger - Drakewarden
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (130, 35, 0);

-- Ranger - Drakewarden (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (131, 55, 1);

-- Ranger - Deep Stalker (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (132, 55, 1);

-- Ranger - Fey Wanderer (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (133, 55, 1);

-- Ranger - Monster Slayer (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (134, 55, 1);

-- Ranger - Primeval Guardian (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (135, 55, 1);

-- Ranger - Swarmkeeper (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (136, 55, 1);


-- ===== ROGUE =====

-- Rogue - Arcane Trickster
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (137, 2, 0);

-- Rogue - Assassin
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (138, 2, 0);

-- Rogue - Inquisitive
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (139, 14, 0);

-- Rogue - Mastermind
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (140, 14, 0);

-- Rogue - Phantom
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (141, 2, 0);

-- Rogue - Scout
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (142, 14, 0);

-- Rogue - Soulknife
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (143, 31, 0);

-- Rogue - Swashbuckler
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (144, 14, 0);

-- Rogue - Thief
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (145, 2, 0);

-- Rogue - Phantom (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (146, 55, 1);

-- Rogue - Revived (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (147, 55, 1);

-- Rogue - Soulknife (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (148, 55, 1);

-- Rogue - Soulknife Revisited (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (149, 55, 1);


-- ===== SORCERER =====

-- Sorcerer - Aberrant Mind
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (150, 2, 0);

-- Sorcerer - Clockwork Soul
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (151, 2, 0);

-- Sorcerer - Draconic Bloodline
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (152, 2, 0);

-- Sorcerer - Divine Soul
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (153, 14, 0);

-- Sorcerer - Lunar Sorcery
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (154, 41, 0);

-- Sorcerer - Shadow Magic
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (155, 14, 0);

-- Sorcerer - Storm Sorcery
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (156, 14, 0);

-- Sorcerer - Wild Magic
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (157, 2, 0);

-- Sorcerer - Pyromancy (Plane Shift)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (158, 53, 0);

-- Sorcerer - Lunar Magic (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (159, 55, 1);

-- Sorcerer - Aberrant Mind (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (160, 55, 1);

-- Sorcerer - Clockwork Soul (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (161, 55, 1);

-- Sorcerer - Favored Soul (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (162, 55, 1);

-- Sorcerer - Favored Soul Revisited (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (163, 55, 1);

-- Sorcerer - Giant Soul (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (164, 55, 1);

-- Sorcerer - Phoenix Sorcery (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (165, 55, 1);

-- Sorcerer - Psionic Soul (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (166, 55, 1);

-- Sorcerer - Sea Sorcery (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (167, 55, 1);

-- Sorcerer - Shadow (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (168, 55, 1);

-- Sorcerer - Stone Sorcery (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (169, 55, 1);

-- Sorcerer - Mage of Prismari (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (170, 55, 1);

-- Sorcerer - Mage of Quandrix (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (171, 55, 1);


-- ===== WARLOCK =====

-- Warlock - The Archfey
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (172, 2, 0);

-- Warlock - The Celestial
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (173, 2, 0);

-- Warlock - The Fathomless
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (174, 31, 0);

-- Warlock - The Fiend
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (175, 2, 0);

-- Warlock - The Genie
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (176, 2, 0);

-- Warlock - The Great Old One
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (177, 2, 0);

-- Warlock - The Hexblade
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (178, 2, 0);

-- Warlock - The Undead
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (179, 2, 0);

-- Warlock - The Undying
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (180, 8, 0);

-- Warlock - The Celestial (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (181, 55, 1);

-- Warlock - The Genie (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (182, 55, 1);

-- Warlock - Ghost In The Machine (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (183, 55, 1);

-- Warlock - The Hexblade (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (184, 55, 1);

-- Warlock - Lurker in the Deep (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (185, 55, 1);

-- Warlock - The Noble Genie (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (186, 55, 1);

-- Warlock - The Raven Queen (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (187, 55, 1);

-- Warlock - The Seeker (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (188, 55, 1);

-- Warlock - The Undead (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (189, 55, 1);

-- Warlock - The Undying Light (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (190, 55, 1);

-- Warlock - Mage of Lorehold (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (191, 55, 1);

-- Warlock - Mage of Silverquill (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (192, 55, 1);

-- Warlock - Mage of Witherbloom (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (193, 55, 1);


-- ===== WIZARD =====

-- Wizard - School of Abjuration
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (194, 2, 0);

-- Wizard - Bladesinging
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (195, 31, 0);

-- Wizard - Chronurgy Magic
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (196, 28, 0);

-- Wizard - School of Conjuration
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (197, 2, 0);

-- Wizard - School of Divination
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (198, 2, 0);

-- Wizard - School of Enchantment
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (199, 2, 0);

-- Wizard - School of Evocation
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (200, 2, 0);

-- Wizard - Graviturgy Magic
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (201, 28, 0);

-- Wizard - School of Illusion
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (202, 2, 0);

-- Wizard - School of Necromancy
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (203, 2, 0);

-- Wizard - Order of Scribes
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (204, 2, 0);

-- Wizard - School of Transmutation
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (205, 2, 0);

-- Wizard - War Magic
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (206, 14, 0);

-- Wizard - Runecrafter (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (207, 55, 1);

-- Wizard - Artificer (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (208, 55, 1);

-- Wizard - School of Invention (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (209, 55, 1);

-- Wizard - Lore Mastery (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (210, 55, 1);

-- Wizard - Onomancy (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (211, 55, 1);

-- Wizard - Order Of Scribes (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (212, 55, 1);

-- Wizard - Psionics (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (213, 55, 1);

-- Wizard - Technomancy (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (214, 55, 1);

-- Wizard - Theurgy (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (215, 55, 1);

-- Wizard - Mage of Lorehold (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (216, 55, 1);

-- Wizard - Mage of Prismari (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (217, 55, 1);

-- Wizard - Mage of Quandrix (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (218, 55, 1);

-- Wizard - Mage of Silverquill (UA)
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (219, 55, 1);


-- ==================== ESTATÍSTICAS FINAIS ====================
-- Subclasses processadas: 219 de 219
-- Relações criadas: 219
-- Taxa de sucesso: 100.0%
-- Lógica UA corrigida: is_ua_version baseado no nome da subclasse
-- =========================================================================
