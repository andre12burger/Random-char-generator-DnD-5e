DROP TABLE IF EXISTS sublineages;
CREATE TABLE sublineages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    parent_lineage_id INTEGER NOT NULL,
    parent_lineage_slug TEXT NOT NULL,
    name TEXT NOT NULL,
    slug TEXT NOT NULL,
    source_book_id INTEGER NOT NULL,
    description TEXT,
    is_default_version BOOLEAN DEFAULT 1,
    is_overlay BOOLEAN DEFAULT 0,
    FOREIGN KEY (parent_lineage_id) REFERENCES lineages(id) ON DELETE CASCADE,
    FOREIGN KEY (source_book_id) REFERENCES core_books(id),
    UNIQUE(parent_lineage_slug, slug, source_book_id)
);

DROP TABLE IF EXISTS sublineage_ability_score_increases;
CREATE TABLE sublineage_ability_score_increases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sublineage_id INTEGER NOT NULL,
    attribute_id INTEGER NOT NULL,
    bonus_value INTEGER NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (sublineage_id) REFERENCES sublineages(id) ON DELETE CASCADE,
    FOREIGN KEY (attribute_id) REFERENCES core_attributes(id)
);

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dwarf', 'Hill Dwarf', 'hill-dwarf', b.id, 'As a hill dwarf, you have keen senses, deep intuition, and remarkable resilience. The gold dwarves of Faerun in their mighty southern kingdom are hill dwarves, as are the exiled Neidar and the debased Klar of Krynn in the Dragonlance setting.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dwarf' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dwarf', 'Mountain Dwarf', 'mountain-dwarf', b.id, 'As a mountain dwarf, you''re strong and hardy, accustomed to a difficult life in rugged terrain. You''re probably on the tall side (for a dwarf), and tend toward lighter coloration. The shield dwarves of northern Faerun, as well as the ruling Hylar clan and the noble Daewar clan of Dragonlance, are mountain dwarves.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dwarf' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dwarf', 'Mark of Warding', 'mark-of-warding', b.id, 'If you''re a dwarf with the Mark of Warding, you have this subrace, with the following traits.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dwarf' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'elf', 'High Elf', 'high-elf', b.id, 'As a high elf, you have a keen mind and a mastery of at least the basics of magic. In many of the worlds of D&D, there are two kinds of high elves. One type (which includes the gray elves and valley elves of Greyhawk, the Silvanesti of Dragonlance, and the sun elves of the Forgotten Realms) is haughty and reclusive, believing themselves to be superior to non-elves and even other elves. The other type (including the high elves of Greyhawk, the Qualinesti of Dragonlance, and the moon elves of the Forgotten Realms) are more common and more friendly, and often encountered among humans and other races. The sun elves of Faerun (also called gold elves or sunrise elves) have bronze skin and hair of copper, black, or golden blond. Their eyes are golden, silver, or black. Moon elves (also called silver elves or gray elves) are much paler, with alabaster skin sometimes tinged with blue. They often have hair of silver-white, black, or blue, but various shades of blond, brown, and red are not uncommon. Their eyes are blue or green and flecked with gold.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'elf' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'elf', 'Wood Elf', 'wood-elf', b.id, 'As a wood elf, you have keen senses and intuition, and your fleet feet carry you quickly and stealthily through your native forests. This category includes the wild elves (grugach) of Greyhawk and the Kagonesti of Dragonlance, as well as the races called wood elves in Greyhawk and the Forgotten Realms. In Faerun, wood elves (also called wild elves, green elves, or forest elves) are reclusive and distrusting of non-elves.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'elf' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'halfling', 'Lightfoot Halfling', 'lightfoot-halfling', b.id, 'As a lightfoot halfling, you can easily hide from notice, even using other people as cover. You''re inclined to be affable and get along well with others. In the Forgotten Realms, lightfoot halflings have spread the farthest and thus are the most common variety. Lightfoots are more prone to wanderlust than other halflings, and often dwell alongside other races or take up a nomadic life. In the world of Greyhawk, these halflings are called hairfeet or tallfellows.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'halfling' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'halfling', 'Stout Halfling', 'stout-halfling', b.id, 'As a stout halfling, you''re hardier than average and have some resistance to poison. Some say that stouts have dwarven blood. In the Forgotten Realms, these halflings are called stronghearts, and they''re most common in the south.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'halfling' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tiefling', 'Asmodeus Tiefling', 'asmodeus-tiefling', b.id, 'Tieflings connected to Nessus command the power of fire and darkness, guided by a keener than normal intellect, as befits those linked to Asmodeus himself.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tiefling' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tiefling', 'Baalzebul Tiefling', 'baalzebul-tiefling', b.id, 'Tieflings associated with Baalzebul are often arrogant and self-serving.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tiefling' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tiefling', 'Dispater Tiefling', 'dispater-tiefling', b.id, 'Tieflings associated with Dispater are calculating and methodical.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tiefling' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tiefling', 'Fierna Tiefling', 'fierna-tiefling', b.id, 'Tieflings associated with Fierna are passionate and ambitious.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tiefling' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tiefling', 'Glasya Tiefling', 'glasya-tiefling', b.id, 'Tieflings associated with Glasya are cunning and manipulative.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tiefling' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tiefling', 'Levistus Tiefling', 'levistus-tiefling', b.id, 'Tieflings associated with Levistus are cold and calculating.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tiefling' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tiefling', 'Mammon Tiefling', 'mammon-tiefling', b.id, 'Tieflings associated with Mammon are greedy and materialistic.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tiefling' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tiefling', 'Mephistopheles Tiefling', 'mephistopheles-tiefling', b.id, 'Tieflings associated with Mephistopheles are charismatic and ambitious.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tiefling' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tiefling', 'Zariel Tiefling', 'zariel-tiefling', b.id, 'Tieflings associated with Zariel are disciplined and warlike.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tiefling' AND b.code = 'ERLW';

-- Dragonborn sublineages
INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dragonborn', 'Black Dragonborn', 'black-dragonborn', b.id, 'Black dragonborn have glossy black scales and yellow eyes. They are cunning and self-centered.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dragonborn' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dragonborn', 'Blue Dragonborn', 'blue-dragonborn', b.id, 'Blue dragonborn have smooth blue scales and yellow eyes. They are proud and domineering.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dragonborn' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dragonborn', 'Brass Dragonborn', 'brass-dragonborn', b.id, 'Brass dragonborn have polished brass scales and yellow eyes. They are talkative and optimistic.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dragonborn' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dragonborn', 'Bronze Dragonborn', 'bronze-dragonborn', b.id, 'Bronze dragonborn have polished bronze scales and yellow eyes. They are honorable and dutiful.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dragonborn' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dragonborn', 'Copper Dragonborn', 'copper-dragonborn', b.id, 'Copper dragonborn have coppery scales and yellow eyes. They are quick-witted and playful.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dragonborn' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dragonborn', 'Gold Dragonborn', 'gold-dragonborn', b.id, 'Gold dragonborn have gleaming gold scales and yellow eyes. They are noble and wise.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dragonborn' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dragonborn', 'Green Dragonborn', 'green-dragonborn', b.id, 'Green dragonborn have smooth green scales and yellow eyes. They are calculating and self-interested.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dragonborn' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dragonborn', 'Red Dragonborn', 'red-dragonborn', b.id, 'Red dragonborn have crimson scales and yellow eyes. They are bold and impetuous.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dragonborn' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dragonborn', 'Silver Dragonborn', 'silver-dragonborn', b.id, 'Silver dragonborn have shimmering silver scales and yellow eyes. They are valiant and protective.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dragonborn' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'dragonborn', 'White Dragonborn', 'white-dragonborn', b.id, 'White dragonborn have pale white scales and yellow eyes. They are fierce and territorial.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'dragonborn' AND b.code = 'PHB';

-- Gnome sublineages
INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'gnome', 'Forest Gnome', 'forest-gnome', b.id, 'As a forest gnome, you have a natural knack for illusion and inherent quickness and stealth. Wood gnomes and forest gnomes are the same people, although forest gnomes consider themselves one with the woods and often call themselves wood gnomes.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'gnome' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'gnome', 'Rock Gnome', 'rock-gnome', b.id, 'As a rock gnome, you have a natural inventiveness and hardiness beyond that of other gnomes. Most gnomes in the worlds of D&D are rock gnomes, including the tinker gnomes of the Dragonlance setting.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'gnome' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'gnome', 'Mark of Scribing', 'mark-of-scribing', b.id, 'If you''re a gnome with the Mark of Scribing, you have this subrace, with the following traits.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'gnome' AND b.code = 'ERLW';

-- Half-Elf sublineages
INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'half-elf', 'High Half-Elf', 'high-half-elf', b.id, 'Some half-elves seek to emulate their elven ancestors, especially the high elves. These half-elves often choose to live among elves, seeking to learn more about their elven heritage.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'half-elf' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'half-elf', 'Wood Half-Elf', 'wood-half-elf', b.id, 'Some half-elves seek to emulate their elven ancestors, especially the wood elves. These half-elves often choose to live among elves, seeking to learn more about their elven heritage.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'half-elf' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'half-elf', 'Drow Half-Elf', 'drow-half-elf', b.id, 'Some half-elves seek to emulate their elven ancestors, especially the drow. These half-elves often choose to live among elves, seeking to learn more about their elven heritage.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'half-elf' AND b.code = 'ERLW';

-- Half-Orc sublineages
INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'half-orc', 'Mark of Finding', 'mark-of-finding', b.id, 'If you''re a half-orc with the Mark of Finding, you have this subrace, with the following traits.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'half-orc' AND b.code = 'ERLW';

-- Aasimar sublineages
INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'aasimar', 'Protector Aasimar', 'protector-aasimar', b.id, 'Protector aasimars are charged by the gods with the protection of their mortal kin.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'aasimar', 'Scourge Aasimar', 'scourge-aasimar', b.id, 'Scourge aasimars are imbued with a divine energy that blazes intensely within them.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'aasimar', 'Fallen Aasimar', 'fallen-aasimar', b.id, 'An aasimar who was touched by dark powers as a youth or who turns to evil in early adulthood can become a fallen aasimar, suffering a fall from grace.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND b.code = 'ERLW';

-- Genasi sublineages
INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'genasi', 'Air Genasi', 'air-genasi', b.id, 'As an air genasi, you are descended from the djinn. As changeable as the weather, your moods shift from calm to wild and violent with little warning, but these storms rarely last long. Air genasi typically have light blue skin, hair, and eyes. A faint but constant breeze accompanies them, tousling the hair and stirring the clothing. Some air genasi speak with breathy voices, marked by a faint echo. A few display odd patterns in their flesh or grow crystals from their scalps.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'genasi' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'genasi', 'Earth Genasi', 'earth-genasi', b.id, 'As an earth genasi, you are descended from the cruel and greedy dao, though you aren''t necessarily evil. You have inherited some measure of control over earth, reveling in superior strength and solid power. You tend to avoid rash decisions, pausing long enough to consider your options before taking action. Elemental earth manifests differently from one individual to the next. Some earth genasi always have bits of dust falling from their bodies and mud clinging to their clothes, never getting clean no matter how often they bathe. Others are as shiny and polished as gemstones, with skin tones of deep brown or black, eyes sparkling like agates. Earth genasi can also have smooth metallic flesh, dull iron skin spotted with rust, a pebbled and rough hide, or even a coating of tiny embedded crystals.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'genasi' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'genasi', 'Fire Genasi', 'fire-genasi', b.id, 'As a fire genasi, you have inherited the volatile mood and keen mind of the efreet. You tend toward impatience and making snap judgments. Rather than hide your distinctive appearance, you exult in it. Nearly all fire genasi are feverishly hot as if burning inside, an impression reinforced by flaming red, coal-black, or ash-gray skin tones. The more human-looking have fiery red hair that writhes under extreme emotion, while more exotic specimens sport actual flames dancing on their heads. Fire genasi voices might sound like crackling flames, and their eyes flare when angered. Some are accompanied by the faint scent of brimstone.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'genasi' AND b.code = 'PHB';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'genasi', 'Water Genasi', 'water-genasi', b.id, 'The lapping of waves, the spray of sea foam on the wind, the ocean depths—all of these things call to your heart. You wander freely and take pride in your independence, though others might consider you selfish. Most water genasi look as if they just finished bathing, with beads of moisture collecting on their skin and hair. They smell of fresh rain and clean water. Blue or green skin is common, and most have somewhat overlarge eyes, blue-black in color. A water genasi''s hair might float freely, swaying and waving as if underwater. Some have voices with undertones reminiscent of whale song or trickling streams.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'genasi' AND b.code = 'PHB';

-- Goliath sublineages
INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'goliath', 'Cloud Goliath', 'cloud-goliath', b.id, 'Cloud goliaths are goliaths who live on the peaks of remote mountains, where they commune with the spirits of the sky.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'goliath' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'goliath', 'Fire Goliath', 'fire-goliath', b.id, 'Fire goliaths are goliaths who live on the slopes of volcanoes, where they commune with the spirits of fire.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'goliath' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'goliath', 'Frost Goliath', 'frost-goliath', b.id, 'Frost goliaths are goliaths who live in the cold, icy peaks of mountains, where they commune with the spirits of ice and snow.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'goliath' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'goliath', 'Hill Goliath', 'hill-goliath', b.id, 'Hill goliaths are goliaths who live on the lower slopes of mountains, where they commune with the spirits of earth and stone.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'goliath' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'goliath', 'Stone Goliath', 'stone-goliath', b.id, 'Stone goliaths are goliaths who live in the heart of mountains, where they commune with the spirits of earth and stone.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'goliath' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'goliath', 'Storm Goliath', 'storm-goliath', b.id, 'Storm goliaths are goliaths who live on mountain peaks exposed to violent storms, where they commune with the spirits of wind and lightning.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'goliath' AND b.code = 'ERLW';

-- Tabaxi sublineages
INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tabaxi', 'Leopard Tabaxi', 'leopard-tabaxi', b.id, 'Leopard tabaxi are sleek and agile, with spotted fur patterns.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tabaxi', 'Tiger Tabaxi', 'tiger-tabaxi', b.id, 'Tiger tabaxi are powerful and striped, known for their strength.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'tabaxi', 'Jaguar Tabaxi', 'jaguar-tabaxi', b.id, 'Jaguar tabaxi are stealthy and spotted, masters of ambush.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND b.code = 'ERLW';

-- Triton sublineages
INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'triton', 'Blue Triton', 'blue-triton', b.id, 'Blue tritons are the most common variety, dwelling in coastal waters.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'triton' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'triton', 'Black Triton', 'black-triton', b.id, 'Black tritons dwell in deeper, darker waters.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'triton' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'triton', 'Green Triton', 'green-triton', b.id, 'Green tritons are adapted to kelp forests and coral reefs.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'triton' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'triton', 'White Triton', 'white-triton', b.id, 'White tritons dwell in arctic waters.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'triton' AND b.code = 'ERLW';

-- Lizardfolk sublineages
INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'lizardfolk', 'Green Lizardfolk', 'green-lizardfolk', b.id, 'Green lizardfolk are the most common variety, dwelling in swamps and marshes.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'lizardfolk', 'Black Lizardfolk', 'black-lizardfolk', b.id, 'Black lizardfolk dwell in swamps and marshes, often in more hostile environments.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'lizardfolk', 'Gray Lizardfolk', 'gray-lizardfolk', b.id, 'Gray lizardfolk are adapted to rocky coastal areas and islands.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'lizardfolk', 'Poison Dusk Lizardfolk', 'poison-dusk-lizardfolk', b.id, 'Poison dusk lizardfolk are adapted to desert environments.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND b.code = 'ERLW';

-- Shifter sublineages
INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'shifter', 'Beasthide Shifter', 'beasthide-shifter', b.id, 'Stoic and solid, a beasthide shifter draws strength and stability from the beast within. Beasthide shifters are typically tied to the bear or the boar, but any creature known for its toughness could apply.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'shifter', 'Longtooth Shifter', 'longtooth-shifter', b.id, 'Longtooth shifters are fierce and aggressive, but they form deep bonds with their friends. Many longtooth shifters have canine traits that become more pronounced as they shift, but they might instead draw on tigers, hyenas, or other predators.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'shifter', 'Swiftstride Shifter', 'swiftstride-shifter', b.id, 'Swiftstride shifters are graceful and quick. Typically feline in nature, swiftstride shifters are often aloof and difficult to pin down physically or socially.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND b.code = 'ERLW';

INSERT INTO sublineages (parent_lineage_id, parent_lineage_slug, name, slug, source_book_id, description, is_default_version, is_overlay)
SELECT l.id, 'shifter', 'Wildhunt Shifter', 'wildhunt-shifter', b.id, 'Wildhunt shifters are sharp and insightful. Some are constantly alert, ever wary for possible threats. Others focus on their intuition, searching within. Wildhunt shifters are excellent hunters, and they also tend to become the spiritual leaders of shifter communities.', 1, 0
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND b.code = 'ERLW';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'dwarf' AND s.slug = 'hill-dwarf' AND a.abbreviation = 'WIS';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 2, 'Your Strength score increases by 2'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'dwarf' AND s.slug = 'mountain-dwarf' AND a.abbreviation = 'STR';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Intelligence score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'dwarf' AND s.slug = 'mark-of-warding' AND a.abbreviation = 'INT';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Intelligence score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'elf' AND s.slug = 'high-elf' AND a.abbreviation = 'INT';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'elf' AND s.slug = 'wood-elf' AND a.abbreviation = 'WIS';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Charisma score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'halfling' AND s.slug = 'lightfoot-halfling' AND a.abbreviation = 'CHA';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Constitution score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'halfling' AND s.slug = 'stout-halfling' AND a.abbreviation = 'CON';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Intelligence score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'tiefling' AND s.slug = 'asmodeus-tiefling' AND a.abbreviation = 'INT';

-- Dragonborn sublineages (no additional ASI - breath weapon type varies)

-- Gnome sublineages
INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Dexterity score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'gnome' AND s.slug = 'forest-gnome' AND a.abbreviation = 'DEX';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Constitution score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'gnome' AND s.slug = 'rock-gnome' AND a.abbreviation = 'CON';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Charisma score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'gnome' AND s.slug = 'mark-of-scribing' AND a.abbreviation = 'CHA';

-- Half-Elf sublineages
INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Intelligence score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'half-elf' AND s.slug = 'high-half-elf' AND a.abbreviation = 'INT';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'half-elf' AND s.slug = 'wood-half-elf' AND a.abbreviation = 'WIS';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Dexterity score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'half-elf' AND s.slug = 'drow-half-elf' AND a.abbreviation = 'DEX';

-- Half-Orc sublineage
INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'half-orc' AND s.slug = 'mark-of-finding' AND a.abbreviation = 'WIS';

-- Aasimar sublineages
INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'aasimar' AND s.slug = 'protector-aasimar' AND a.abbreviation = 'WIS';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Constitution score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'aasimar' AND s.slug = 'scourge-aasimar' AND a.abbreviation = 'CON';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Strength score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'aasimar' AND s.slug = 'fallen-aasimar' AND a.abbreviation = 'STR';

-- Goliath sublineages (no additional ASI - elemental type varies)

-- Lizardfolk sublineages (no additional ASI - camouflage type varies)

-- Tabaxi sublineages (no additional ASI - cat type varies)

-- Triton sublineages (no additional ASI - color varies)

-- Additional Tiefling sublineages
INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Charisma score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'tiefling' AND s.slug = 'baalzebul-tiefling' AND a.abbreviation = 'CHA';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Dexterity score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'tiefling' AND s.slug = 'dispater-tiefling' AND a.abbreviation = 'DEX';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'tiefling' AND s.slug = 'fierna-tiefling' AND a.abbreviation = 'WIS';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Dexterity score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'tiefling' AND s.slug = 'glasya-tiefling' AND a.abbreviation = 'DEX';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Constitution score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'tiefling' AND s.slug = 'levistus-tiefling' AND a.abbreviation = 'CON';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Constitution score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'tiefling' AND s.slug = 'mammon-tiefling' AND a.abbreviation = 'CON';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Intelligence score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'tiefling' AND s.slug = 'mephistopheles-tiefling' AND a.abbreviation = 'INT';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Strength score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'tiefling' AND s.slug = 'zariel-tiefling' AND a.abbreviation = 'STR';

-- Genasi sublineages
INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Dexterity score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'genasi' AND s.slug = 'air-genasi' AND a.abbreviation = 'DEX';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Strength score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'genasi' AND s.slug = 'earth-genasi' AND a.abbreviation = 'STR';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Intelligence score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'genasi' AND s.slug = 'fire-genasi' AND a.abbreviation = 'INT';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'genasi' AND s.slug = 'water-genasi' AND a.abbreviation = 'WIS';

-- Shifter sublineages
INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Constitution score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'shifter' AND s.slug = 'beasthide-shifter' AND a.abbreviation = 'CON';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Strength score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'shifter' AND s.slug = 'longtooth-shifter' AND a.abbreviation = 'STR';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Dexterity score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'shifter' AND s.slug = 'swiftstride-shifter' AND a.abbreviation = 'DEX';

INSERT INTO sublineage_ability_score_increases (sublineage_id, attribute_id, bonus_value, description)
SELECT s.id, a.id, 1, 'Your Wisdom score increases by 1'
FROM sublineages s, core_attributes a
WHERE s.parent_lineage_slug = 'shifter' AND s.slug = 'wildhunt-shifter' AND a.abbreviation = 'WIS';



CREATE INDEX IF NOT EXISTS idx_sublineages_parent_id ON sublineages(parent_lineage_id);
CREATE INDEX IF NOT EXISTS idx_sublineages_parent_slug ON sublineages(parent_lineage_slug);
CREATE INDEX IF NOT EXISTS idx_sublineages_slug ON sublineages(slug);
CREATE INDEX IF NOT EXISTS idx_sublineage_asi_sublineage ON sublineage_ability_score_increases(sublineage_id);

DROP VIEW IF EXISTS v_sublineages_for_random;
CREATE VIEW v_sublineages_for_random AS
SELECT s.id, s.parent_lineage_id, s.parent_lineage_slug, l.name AS parent_lineage_name, s.slug, s.name, b.name AS book
FROM sublineages s
JOIN lineages l ON s.parent_lineage_id = l.id
JOIN core_books b ON s.source_book_id = b.id
WHERE s.is_default_version = 1
ORDER BY s.parent_lineage_slug, s.name;

DROP VIEW IF EXISTS v_sublineage_complete;
CREATE VIEW v_sublineage_complete AS
SELECT s.id, s.parent_lineage_id, s.parent_lineage_slug, l.name AS parent_lineage_name, s.slug, s.name, s.description, b.name AS source_book
FROM sublineages s
JOIN lineages l ON s.parent_lineage_id = l.id
JOIN core_books b ON s.source_book_id = b.id;

DROP VIEW IF EXISTS v_sublineage_asi;
CREATE VIEW v_sublineage_asi AS
SELECT s.id AS sublineage_id, s.parent_lineage_slug, s.name AS sublineage_name, a.name AS attribute, a.abbreviation AS attribute_abbr, sasi.bonus_value, sasi.description
FROM sublineages s
JOIN sublineage_ability_score_increases sasi ON s.id = sasi.sublineage_id
JOIN core_attributes a ON sasi.attribute_id = a.id;


