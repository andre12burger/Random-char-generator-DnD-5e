-- ================================================================================================
-- TOOLS - D&D 5e (Player's Handbook + Xanathar's Guide to Everything)
-- ================================================================================================
-- Sistema de ferramentas, kits e suprimentos organizados por categoria
-- Inclui dados básicos do PHB e informações detalhadas do XGE

-- Drop das tabelas existentes para recriação
DROP TABLE IF EXISTS item_tool_skill_advantages;
DROP TABLE IF EXISTS item_tools;
DROP TABLE IF EXISTS item_tool_categories;

-- ================================================================================================
-- TABELA: CATEGORIAS DE FERRAMENTAS
-- ================================================================================================

CREATE TABLE item_tool_categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT
);

-- ================================================================================================
-- TABELA: FERRAMENTAS PRINCIPAIS
-- ================================================================================================

CREATE TABLE item_tools (
    tool_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    category_id INTEGER NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    cost_currency_id INTEGER NOT NULL,
    weight DECIMAL(10,2),
    weight_unit_id INTEGER,
    item_id INTEGER NOT NULL DEFAULT 9, -- tools
    book_id INTEGER NOT NULL,
    
    -- PHB: Descrição simples
    description_simple TEXT,
    
    -- XGE: Informações detalhadas
    components TEXT,           -- O que vem no kit
    special_use TEXT,         -- Habilidade especial que fornece
    sample_dcs TEXT,          -- DCs sugeridas para uso
    
    FOREIGN KEY (category_id) REFERENCES item_tool_categories(category_id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- ================================================================================================
-- TABELA: HABILIDADES QUE O TOOL FAVORECE (XGE)
-- ================================================================================================

CREATE TABLE item_tool_skill_advantages (
    advantage_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tool_id INTEGER NOT NULL,
    skill_id INTEGER NOT NULL,
    advantage_description TEXT,
    
    FOREIGN KEY (tool_id) REFERENCES item_tools(tool_id),
    FOREIGN KEY (skill_id) REFERENCES core_skills(id)
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_tools_category ON item_tools(category_id);
CREATE INDEX IF NOT EXISTS idx_tools_cost ON item_tools(cost);
CREATE INDEX IF NOT EXISTS idx_tool_advantages_tool ON item_tool_skill_advantages(tool_id);

-- ================================================================================================
-- DADOS: CATEGORIAS DE FERRAMENTAS
-- ================================================================================================

INSERT INTO item_tool_categories (category_id, name, description) VALUES
(1, 'Artisan''s Tools', 'Special tools include the items needed to pursue a craft or trade. Each type of artisan''s tools requires a separate proficiency.'),
(2, 'Gaming Set', 'Encompasses a wide range of game pieces, including dice and decks of cards. Each type of gaming set requires a separate proficiency.'),
(3, 'Musical Instrument', 'Several common types of musical instruments. Each type of musical instrument requires a separate proficiency.'),
(4, 'Miscellaneous', 'Various specialized kits and tools for specific purposes.');

-- ================================================================================================
-- DADOS: ARTISAN'S TOOLS (FERRAMENTAS DE ARTESÃO)
-- ================================================================================================

INSERT INTO item_tools (name, category_id, cost, cost_currency_id, weight, weight_unit_id, book_id, description_simple, components, special_use, sample_dcs) VALUES
('Alchemist''s supplies', 1, 50.00, 4, 8.0, 1, 2, 'Includes the items needed to pursue alchemy craft.', 'Two glass beakers, a metal frame to hold a beaker in place over an open flame, a glass stirring rod, a small mortar and pestle, and a pouch of common alchemical ingredients, including salt, powdered iron, and purified water.', 'Alchemical Crafting: As part of a long rest, you can use alchemist''s supplies to make one dose of acid, alchemist''s fire, antitoxin, oil, perfume, or soap.', 'Create a puff of thick smoke (DC 10), Identify a poison (DC 10), Identify a substance (DC 15), Start a fire (DC 15), Neutralize acid (DC 20)'),
('Brewer''s supplies', 1, 20.00, 4, 9.0, 1, 2, 'Includes the items needed to brew alcoholic beverages.', 'A large glass jug, a quantity of hops, a siphon, and several feet of tubing.', 'Potable Water: Your knowledge of brewing enables you to purify water that would otherwise be undrinkable. As part of a long rest, you can purify up to 6 gallons of water, or 1 gallon as part of a short rest.', 'Detect poison or impurities in a drink (DC 10), Identify alcohol (DC 15), Ignore effects of alcohol (DC 20)'),
('Calligrapher''s supplies', 1, 10.00, 4, 5.0, 1, 2, 'Includes the items needed for fine writing and calligraphy.', 'Ink, a dozen sheets of parchment, and three quills.', 'Decipher Treasure Map: This tool proficiency grants you expertise in examining maps. You can make an Intelligence check to determine a map''s age, whether a map includes any hidden messages, or similar facts.', 'Identify writer of nonmagical script (DC 10), Determine writer''s state of mind (DC 15), Spot forged text (DC 15), Forge a signature (DC 20)'),
('Carpenter''s tools', 1, 8.00, 4, 6.0, 1, 2, 'Includes the items needed for woodworking and carpentry.', 'A saw, a hammer, nails, a hatchet, a square, a ruler, an adze, a plane, and a chisel.', 'Fortify: With 1 minute of work and raw materials, you can make a door or window harder to force open. Increase the DC needed to open it by 5. Temporary Shelter: As part of a long rest, you can construct a lean-to or a similar shelter.', 'Build a simple wooden structure (DC 10), Design a complex wooden structure (DC 15), Find a weak point in a wooden wall (DC 15), Pry apart a door (DC 20)'),
('Cartographer''s tools', 1, 15.00, 4, 6.0, 1, 2, 'Includes the items needed for mapmaking and cartography.', 'A quill, ink, parchment, a pair of compasses, calipers, and a ruler.', 'Craft a Map: While traveling, you can draw a map as you go in addition to engaging in other activity.', 'Determine a map''s age and origin (DC 10), Estimate direction and distance to a landmark (DC 15), Discern that a map is fake (DC 15), Fill in a missing part of a map (DC 20)'),
('Cobbler''s tools', 1, 5.00, 4, 5.0, 1, 2, 'Includes the items needed for shoemaking and leather repair.', 'A hammer, an awl, a knife, a shoe stand, a cutter, spare leather, and thread.', 'Maintain Shoes: As part of a long rest, you can repair your companions'' shoes. For the next 24 hours, up to six creatures of your choice who wear shoes you worked on can travel up to 10 hours a day without making saving throws to avoid exhaustion.', 'Determine a shoe''s age and origin (DC 10), Find a hidden compartment in a boot heel (DC 15)'),
('Cook''s utensils', 1, 1.00, 4, 8.0, 1, 2, 'Includes the items needed for cooking and food preparation.', 'A metal pot, knives, forks, a stirring spoon, and a ladle.', 'Prepare Meals: As part of a short rest, you can prepare a tasty meal that helps your companions regain their strength. You and up to five creatures of your choice regain 1 extra hit point per Hit Die spent during a short rest.', 'Create a typical meal (DC 10), Duplicate a meal (DC 10), Spot poison or impurities in food (DC 15), Create a gourmet meal (DC 15)'),
('Glassblower''s tools', 1, 30.00, 4, 5.0, 1, 2, 'Includes the items needed for glassmaking and glassworking.', 'A blowpipe, a small marver, blocks, and tweezers. You need a source of heat to work glass.', 'Identify Weakness: With 1 minute of study, you can identify the weak points in a glass object. Any damage dealt to the object by striking a weak spot is doubled.', 'Identify source of glass (DC 10), Determine what a glass object once held (DC 20)'),
('Jeweler''s tools', 1, 25.00, 4, 2.0, 1, 2, 'Includes the items needed for jewelry making and gem cutting.', 'A small saw and hammer, files, pliers, and tweezers.', 'Identify Gems: You can identify gems and determine their value at a glance.', 'Modify a gem''s appearance (DC 15), Determine a gem''s history (DC 20)'),
('Leatherworker''s tools', 1, 5.00, 4, 5.0, 1, 2, 'Includes the items needed for leatherworking and hide preparation.', 'A knife, a small mallet, an edger, a hole punch, thread, and leather scraps.', 'Identify Hides: When looking at a hide or a leather item, you can determine the source of the leather and any special techniques used to treat it.', 'Modify a leather item''s appearance (DC 10), Determine a leather item''s history (DC 20)'),
('Mason''s tools', 1, 10.00, 4, 8.0, 1, 2, 'Includes the items needed for stoneworking and masonry.', 'A trowel, a hammer, a chisel, brushes, and a square.', 'Demolition: Your knowledge of masonry allows you to spot weak points in brick walls. You deal double damage to such structures with your weapon attacks.', 'Chisel a small hole in a stone wall (DC 10), Find a weak point in a stone wall (DC 15)'),
('Painter''s supplies', 1, 10.00, 4, 5.0, 1, 2, 'Includes the items needed for painting and artistic work.', 'An easel, canvas, paints, brushes, charcoal sticks, and a palette.', 'Painting and Drawing: As part of a short or long rest, you can produce a simple work of art. Although your work might lack precision, you can capture an image or a scene, or make a quick copy of a piece of art you saw.', 'Paint an accurate portrait (DC 10), Create a painting with a hidden message (DC 20)'),
('Potter''s tools', 1, 10.00, 4, 3.0, 1, 2, 'Includes the items needed for pottery and ceramics.', 'Potter''s needles, ribs, scrapers, a knife, and calipers.', 'Reconstruction: By examining pottery shards, you can determine an object''s original, intact form and its likely purpose.', 'Determine what a vessel once held (DC 10), Create a serviceable pot (DC 15), Find a weak point in a ceramic object (DC 20)'),
('Smith''s tools', 1, 20.00, 4, 8.0, 1, 2, 'Includes the items needed for metalworking and smithing.', 'Hammers, tongs, charcoal, rags, and a whetstone.', 'Repair: With access to your tools and an open flame hot enough to make metal pliable, you can restore 10 hit points to a damaged metal object for each hour of work.', 'Sharpen a dull blade (DC 10), Repair a suit of armor (DC 15), Sunder a nonmagical metal object (DC 15)'),
('Tinker''s tools', 1, 50.00, 4, 10.0, 1, 2, 'Includes the items needed for mechanical repairs and tinkering.', 'A variety of hand tools, thread, needles, a whetstone, scraps of cloth and leather, and a small pot of glue.', 'Repair: You can restore 10 hit points to a damaged object for each hour of work. For any object, you need access to the raw materials required to repair it.', 'Temporarily repair a disabled device (DC 10), Repair an item in half the time (DC 15), Improvise a temporary item using scraps (DC 20)'),
('Weaver''s tools', 1, 1.00, 4, 5.0, 1, 2, 'Includes the items needed for weaving and textile work.', 'Thread, needles, and scraps of cloth. You know how to work a loom, but such equipment is too large to transport.', 'Repair: As part of a short rest, you can repair a single damaged cloth object. Craft Clothing: Assuming you have access to sufficient cloth and thread, you can create an outfit for a creature as part of a long rest.', 'Repurpose cloth (DC 10), Mend a hole in a piece of cloth (DC 10), Tailor an outfit (DC 15)'),
('Woodcarver''s tools', 1, 1.00, 4, 5.0, 1, 2, 'Includes the items needed for wood carving and fine woodworking.', 'A knife, a gouge, and a small saw.', 'Repair: As part of a short rest, you can repair a single damaged wooden object. Craft Arrows: As part of a short rest, you can craft up to five arrows. As part of a long rest, you can craft up to twenty.', 'Craft a small wooden figurine (DC 10), Carve an intricate pattern in wood (DC 15)');

-- ================================================================================================
-- DADOS: GAMING SETS (JOGOS)
-- ================================================================================================

INSERT INTO item_tools (name, category_id, cost, cost_currency_id, weight, weight_unit_id, book_id, description_simple, components, special_use, sample_dcs) VALUES
('Dice set', 2, 0.10, 3, 0.0, 1, 2, 'A set of gaming dice for various games of chance.', 'A set of dice with two, four, six, eight, ten, twelve, and twenty sides. Few game sets are complete without dice.', 'Cheat: A proficient character can attempt to cheat at a game involving dice. Add the character''s proficiency bonus to a Dexterity (Sleight of Hand) check.', 'Catch a player cheating (DC 15), Gain advantage in a game by cheating (DC 15)'),
('Dragonchess set', 2, 1.00, 4, 0.5, 1, 2, 'A strategic board game popular among nobles and scholars.', 'A board and pieces representing the nine types of pieces used in the game of dragonchess. Each piece has its own method of movement, and games involve intense mental challenges.', 'Mental Training: Playing dragonchess regularly sharpens your mind for strategy and tactics. If you spend 1 hour playing dragonchess as part of a long rest, you gain advantage on the next Intelligence, Wisdom, or Charisma saving throw you make.', 'Gain insight into an opponent''s personality (DC 15)'),
('Playing card set', 2, 0.50, 3, 0.0, 1, 2, 'A deck of cards for various card games.', 'A deck of fifty-four cards depicting various symbols, characters, and suits. The deck can be used to play a variety of games.', 'Cheat: A proficient character can attempt to cheat at a game involving cards. Add the character''s proficiency bonus to a Dexterity (Sleight of Hand) check. Card Sharp: You can use cards as weapons, treating them as darts with a range of 20/60 feet.', 'Catch a player cheating (DC 15), Gain advantage in a game by cheating (DC 15), Perform card tricks (DC 15)'),
('Three-Dragon Ante set', 2, 1.00, 4, 0.0, 1, 2, 'A popular gambling card game set.', 'A complete Three-Dragon Ante set consists of a deck of seventy cards of six different suits, with each suit containing a number card (2-10) and three special cards (mortal, arcane, and dragon).', 'Betting Savvy: Your experience with Three-Dragon Ante makes you skilled at sizing up other gamblers. You have advantage on Wisdom (Insight) checks to determine whether someone is lying to you about a bet or gamble.', 'Gain insight into an opponent''s wealth (DC 15), Determine if someone is bluffing (DC 15)');

-- ================================================================================================
-- DADOS: MUSICAL INSTRUMENTS (INSTRUMENTOS MUSICAIS)
-- ================================================================================================

INSERT INTO item_tools (name, category_id, cost, cost_currency_id, weight, weight_unit_id, book_id, description_simple, components, special_use, sample_dcs) VALUES
('Bagpipes', 3, 30.00, 4, 6.0, 1, 2, 'A wind instrument with multiple pipes and a bellows bag.', 'Bagpipes have a bag and a set of pipes. Air blown into the bag through a valve is pressed out through the pipes to create music.', 'Inspire Courage: If you spend 10 minutes playing your bagpipes, you can inspire your allies. Up to six creatures within 30 feet who can hear you gain advantage on saving throws against being frightened for 1 hour.', 'Identify a musical style (DC 10), Improvise a new tune (DC 20)'),
('Drum', 3, 6.00, 4, 3.0, 1, 2, 'A percussion instrument with a stretched membrane.', 'A wooden hoop with a drumhead stretched over it. The drumhead is typically made from the hide of a large beast.', 'Rally: If you spend 1 minute playing your drum, you can inspire your allies to move faster. Up to six creatures within 30 feet of you can use their reaction to move up to their speed without provoking opportunity attacks.', 'Identify the origin of a drumbeat (DC 10), Send a message via drumbeats (DC 15)'),
('Dulcimer', 3, 25.00, 4, 10.0, 1, 2, 'A stringed instrument played with small hammers.', 'A dulcimer is a stringed instrument that is larger and more complex than a lyre. Its strings are struck with special hammers to produce music.', 'Soothe Emotions: If you spend 10 minutes playing your dulcimer, you can soothe frayed emotions. Creatures within 30 feet of you have advantage on Wisdom saving throws to end the charmed or frightened condition on themselves.', 'Identify a folk song''s region of origin (DC 15), Improvise harmony to a tune (DC 20)'),
('Flute', 3, 2.00, 4, 1.0, 1, 2, 'A wind instrument played by blowing across holes.', 'A simple wooden tube with holes that can be covered by the fingers to produce different notes.', 'Animal Friendship: Your music can calm animals. You have advantage on Wisdom (Animal Handling) checks, and animals are indifferent to you unless you or your allies threaten them.', 'Identify a bird''s call (DC 15), Attract local birds (DC 15)'),
('Lute', 3, 35.00, 4, 2.0, 1, 2, 'A plucked string instrument with a rounded body.', 'A stringed instrument with a round body and a neck with frets. The strings are plucked to produce music.', 'Countercharm: If you spend 1 minute playing your lute, you can counteract magical effects that rely on sound. Creatures within 30 feet of you have advantage on saving throws against effects that use enchantment magic until the start of your next turn.', 'Identify a particular style of music (DC 10), Compose a new song (DC 15), Improvise lyrics to a tune (DC 20)'),
('Lyre', 3, 30.00, 4, 2.0, 1, 2, 'A small harp-like stringed instrument.', 'A lyre has a wooden frame with strings stretched between the arms. It is smaller than a harp and can be played with one hand.', 'Gentle Repose: If you spend 10 minutes playing your lyre over a corpse, you can cast gentle repose on the corpse. Once used, this feature can''t be used again until you finish a long rest.', 'Recall the words to a half-remembered song (DC 15), Identify a composer (DC 20)'),
('Horn', 3, 3.00, 4, 2.0, 1, 2, 'A brass wind instrument played by buzzing the lips.', 'A horn is a simple brass instrument consisting of a metal tube that widens at one end.', 'Call to Arms: If you spend 1 minute playing your horn, you can inspire your allies to battle. Up to six creatures within 300 feet who can hear you and who are friendly to you gain 5 temporary hit points.', 'Communicate over a great distance (DC 15), Rally fleeing troops (DC 20)'),
('Pan flute', 3, 12.00, 4, 2.0, 1, 2, 'A wind instrument made of multiple pipes of different lengths.', 'A pan flute is a musical instrument consisting of several hollow tubes of different lengths bound together.', 'Beast Speech: Your music imitates natural sounds. You have advantage on checks made to communicate with beasts, and beasts have an easier time understanding your intent.', 'Identify a natural sound (DC 15), Mimic a bird''s call (DC 15)'),
('Shawm', 3, 2.00, 4, 1.0, 1, 2, 'A double-reed woodwind instrument.', 'A shawm is a woodwind instrument that uses a double reed. It has a loud, penetrating sound.', 'Haunting Melody: If you spend 10 minutes playing your shawm, you can create an unsettling atmosphere. Creatures within 30 feet of you have disadvantage on Wisdom (Perception) checks that rely on hearing.', 'Identify a particular emotion in a piece of music (DC 15), Compose a mournful dirge (DC 20)'),
('Viol', 3, 30.00, 4, 1.0, 1, 2, 'A bowed string instrument, predecessor to the violin.', 'A viol is a stringed instrument that is played with a bow. It produces a softer, more mellow sound than a violin.', 'Elegant Performance: When you play your viol at a social gathering, you have advantage on Charisma (Performance) checks and any Charisma-based checks made to interact with nobles or aristocrats present.', 'Determine the mood of an audience (DC 15), Sight-read a complex piece of music (DC 20)');

-- ================================================================================================
-- DADOS: MISCELLANEOUS (KITS DIVERSOS)
-- ================================================================================================

INSERT INTO item_tools (name, category_id, cost, cost_currency_id, weight, weight_unit_id, book_id, description_simple, components, special_use, sample_dcs) VALUES
('Disguise kit', 4, 25.00, 4, 3.0, 1, 2, 'A pouch of cosmetics, hair dye, and small props for creating disguises.', 'This pouch of cosmetics, hair dye, and small props lets you create disguises that change your physical appearance.', 'Create Disguise: As part of a long rest, you can create a disguise. It takes you 1 minute to don such a disguise once you have created it. You can carry only one such disguise on you at a time without drawing undue attention.', 'Cover injuries or distinguishing marks (DC 10), Spot a disguise being used by someone else (DC 15), Copy a humanoid''s appearance (DC 20)'),
('Forgery kit', 4, 15.00, 4, 5.0, 1, 2, 'Papers, parchments, pens, inks, seals and other supplies for creating convincing forgeries.', 'This small box contains a variety of papers and parchments, pens and inks, seals and sealing wax, gold and silver leaf, and other supplies necessary to create convincing forgeries of physical documents.', 'Quick Fake: During a short rest, you can produce a forged document no more than one page in length. During a long rest, you can produce a document that is up to four pages long.', 'Mimic handwriting (DC 15), Duplicate a wax seal (DC 20)'),
('Herbalism kit', 4, 5.00, 4, 3.0, 1, 2, 'Clippers, mortar and pestle, pouches and vials used to create remedies and potions.', 'This kit contains a variety of instruments such as clippers, mortar and pestle, and pouches and vials used by herbalists to create remedies and potions.', 'Identify Plants: You can identify most plants with a quick inspection and determine whether they are edible, poisonous, or have other properties. Create Antitoxin: During a long rest, you can create one dose of antitoxin.', 'Find plants (DC 15), Identify a poisonous plant (DC 20)'),
('Navigator''s tools', 4, 25.00, 4, 2.0, 1, 2, 'Instruments used for navigation at sea.', 'This set of instruments is used for navigation at sea. It includes a sextant, a compass, calipers, a ruler, parchment, ink, and a quill.', 'Sextant: As long as you can see the sun or stars, you can determine your location and the time of day.', 'Plot a course (DC 15), Determine position on the open sea (DC 15), Predict the weather (DC 20)'),
('Poisoner''s kit', 4, 50.00, 4, 2.0, 1, 2, 'Vials, chemicals, and equipment necessary for the creation of poisons.', 'A poisoner''s kit includes the vials, chemicals, and other equipment necessary for the creation of poisons.', 'Handle Poison: Your training with poisons allows you to apply a poison to a weapon as a bonus action, instead of an action.', 'Spot a poisoned object (DC 10), Determine the effects of a poison (DC 20)'),
('Thieves'' tools', 4, 25.00, 4, 1.0, 1, 2, 'Small file, lock picks, mirror, narrow-bladed scissors, and pliers for disarming traps and opening locks.', 'This set of tools includes a small file, a set of lock picks, a small mirror mounted on a metal handle, a set of narrow-bladed scissors, and a pair of pliers.', 'Fast Hands: You can use thieves'' tools to disarm traps or open locks as a bonus action.', 'Pick a simple lock (DC 15), Disarm a trap (DC 15), Pick a complex lock (DC 20)');
