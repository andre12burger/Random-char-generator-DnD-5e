-- Schema e dados das subclasses D&D 5e extraídos automaticamente
-- Gerado por extract_subclass_data.py

-- Tabela de subclasses
DROP TABLE IF EXISTS subclass_features;
DROP TABLE IF EXISTS subclasses;
DROP VIEW IF EXISTS v_subclass_features;
DROP VIEW IF EXISTS v_subclasses;

CREATE TABLE subclasses (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    class_id INTEGER NOT NULL,
    initial_level INTEGER NOT NULL DEFAULT 3,
    book_id INTEGER NOT NULL DEFAULT 1,
    description TEXT,
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Tabela de características das subclasses
CREATE TABLE subclass_features (
    id INTEGER PRIMARY KEY,
    subclass_id INTEGER NOT NULL,
    feature_name TEXT NOT NULL,
    level INTEGER NOT NULL,
    description TEXT,
    FOREIGN KEY (subclass_id) REFERENCES subclasses(id)
);

-- Views para API
CREATE VIEW v_subclasses AS
SELECT 
    s.id,
    s.name as subclass_name,
    c.name as class_name,
    s.initial_level,
    b.name as book_name,
    s.description
FROM subclasses s
JOIN classes c ON s.class_id = c.id  
JOIN core_books b ON s.book_id = b.id;

CREATE VIEW v_subclass_features AS
SELECT 
    sf.id,
    s.name as subclass_name,
    c.name as class_name,
    sf.feature_name,
    sf.level,
    sf.description
FROM subclass_features sf
JOIN subclasses s ON sf.subclass_id = s.id
JOIN classes c ON s.class_id = c.id;

-- Dados das subclasses
-- =============================================================================
-- BARBARIAN SUBCLASSES
-- =============================================================================

-- Subclasse: Path of the Giant (ID: 1)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(1, 'Path of the Giant', 2, 3, 51, 'Barbarians who walk the Path of the Giant draw strength from the same primal forces as giants. As they rage, these barbarians surge with elemental power and grow in size, taking on forms that evoke the glory of giants. Some barbarians look like oversized versions of themselves, perhaps with a hint of elemental energy flaring in their eyes and around their weapons. Others transform more dramatically, taking on the appearance of an actual giant or a form similar to an Elemental, wreathed in fire, frost, or lightning.')
-- Subclasse: Path of the Giant (UA) (ID: 2)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(2, 'Path of the Giant (UA)', 2, 3, 52, 'Barbarians who walk the Path of the Giant draw strength from the primal forces that are the Giants and their elemental ilk. Their rages surge with elemental power and cause these barbarians to grow in size, transforming them into avatars of primordial might.')
-- =============================================================================
-- WIZARD SUBCLASSES
-- =============================================================================

-- Subclasse: Mage of Silverquill (UA) (ID: 3)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(3, 'Mage of Silverquill (UA)', 14, 2, 2, 'Mages of Silverquill hone the power of words. They channel the magic of light and shadow through words, whether spoken aloud, written, or signed through gestures. The words of a mage of Silverquill bring salvation to their allies and despair to their enemies.')
-- =============================================================================
-- DRUID SUBCLASSES
-- =============================================================================

-- Subclasse: Circle of the Primeval (UA) (ID: 4)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(4, 'Circle of the Primeval (UA)', 6, 2, 52, 'The Circle of the Primeval teaches that, though the land may change over time, it never truly forgets. By tapping into the timeworn memory of the earth, these druids summon and bond with the spirit of a primeval behemoth—a hulking creature that once ruled the ancient world alongside the giants. The most well-known primeval behemoths are the dinosaurs, but spirits bonded with members of the Circle of the Primeval have also taken the form of ancient predecessors to today’s common beasts and other fantastical titanic creatures.')
-- =============================================================================
-- WIZARD SUBCLASSES
-- =============================================================================

-- Subclasse: Mage of Prismari (UA) (ID: 5)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(5, 'Mage of Prismari (UA)', 14, 2, 2, 'Mages of Prismari use surges of elemental energy to express who they are and how they see the world. To them, magic and motion are one and the same; both are exhibitions of raw creativity through which masterpieces are made. In their pursuit of the arts, some Prismari mages focus on perfecting the fine details of their technique, while others prefer to unleash their wild creative visions in dazzling spectacles of elemental power.')
-- =============================================================================
-- MONK SUBCLASSES
-- =============================================================================

-- Subclasse: Way of the Ascendant Dragon (UA) (ID: 6)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(6, 'Way of the Ascendant Dragon (UA)', 8, 11, 52, 'Monks who follow the Way of the Ascendant Dragon revere the power and grandeur of dragons. They alter their own ki to resonate with draconic might, channeling it to augment their prowess in battle, soar through the air, and to bolster their allies.')
-- Subclasse: Way of the Ascendant Dragon (UA) (ID: 7)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(7, 'Way of the Ascendant Dragon (UA)', 8, 11, 52, 'Monks who follow the Way of the Ascendant Dragon revere the power and grandeur of dragons. They alter their own ki to resonate with draconic might, channeling it to augment their prowess in battle, soar through the air, and to bolster their allies.')
-- =============================================================================
-- PALADIN SUBCLASSES
-- =============================================================================

-- Subclasse: Oath of the Watchers (UA) (ID: 8)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(8, 'Oath of the Watchers (UA)', 9, 3, 52, 'Paladins who vow the Oath of the Watchers seek to protect the moral realm from the predations of extraplanar creatures, many of which can lay waste to mortal soldiers. Thus, the Watchers hone their minds, spirits, and bodies to be the ultimate weapons against such threats.')
-- =============================================================================
-- RANGER SUBCLASSES
-- =============================================================================

-- Subclasse: Drakewarden (UA) (ID: 9)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(9, 'Drakewarden (UA)', 10, 3, 52, 'Drakewardens are rangers who use their magical connection with nature to form an enduring bond with a minor dragon, a drake. This bond allows the ranger to summon the drake to their side and to share in the awe inspiring power wielded by dragons.')
-- Subclasse: Monster Slayer (UA) (ID: 10)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(10, 'Monster Slayer (UA)', 10, 3, 52, 'Rangers of the Slayer Conclave seek out vampires, dragons, evil fey, fiends, and other powerful magical threats. Trained in a variety of arcane and divine techniques to overcome such monsters, slayers are experts at unearthing and defeating mighty foes.')
-- =============================================================================
-- SORCERER SUBCLASSES
-- =============================================================================

-- Subclasse: Favored Soul (UA) (ID: 11)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(11, 'Favored Soul (UA)', 12, 1, 52, '')
-- =============================================================================
-- WIZARD SUBCLASSES
-- =============================================================================

-- Subclasse: Mage of Prismari (UA) (ID: 12)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(12, 'Mage of Prismari (UA)', 14, 2, 2, 'Mages of Prismari use surges of elemental energy to express who they are and how they see the world. To them, magic and motion are one and the same; both are exhibitions of raw creativity through which masterpieces are made. In their pursuit of the arts, some Prismari mages focus on perfecting the fine details of their technique, while others prefer to unleash their wild creative visions in dazzling spectacles of elemental power.')
-- Subclasse: Mage of Quandrix (UA) (ID: 13)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(13, 'Mage of Quandrix (UA)', 14, 2, 2, 'For those who become Mages of Quandrix, math and magic go hand-in-hand. Such individuals learn to break down natural phenomena into their core numerical components and, through manipulating those, alter reality on a whim. Their talents range from tangible physics, like multiplying plant growth and redistributing elements of probability and acceleration, to bizarrely theoretical exercises that warp the fundamentals of space and self.')
-- =============================================================================
-- WARLOCK SUBCLASSES
-- =============================================================================

-- Subclasse: Ghost In The Machine (UA) (ID: 14)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(14, 'Ghost In The Machine (UA)', 13, 1, 52, 'You have made a bargain for power granted by an entity that you believe to be completely digital. Whether it is a rogue AI or the spirit of a deceased hacker, the Ghost in the Machine is capable of feats that defy explanation.')
-- =============================================================================
-- WIZARD SUBCLASSES
-- =============================================================================

-- Subclasse: Runecrafter (UA) (ID: 15)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(15, 'Runecrafter (UA)', 14, 2, 52, 'Runecrafter wizards enhance their spellcasting through the ancient power of runes. Though the tradition originated with the giant rune casters of old, runecraft magic has expanded to encompass countless languages and practitioners across different worlds.')
-- Subclasse: Artificer (UA) (ID: 16)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(16, 'Artificer (UA)', 14, 2, 52, 'Artificers are a key part of the world of Eberron. They illustrate the evolution of magic from a wild, unpredictable force to one that is becoming available to the masses. Magic items are part of everyday life in the Five Nations of Khorvaire; with an artificer in your party, they become part of every adventuring expedition.')
-- Subclasse: Mage of Prismari (UA) (ID: 17)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(17, 'Mage of Prismari (UA)', 14, 2, 2, 'Mages of Prismari use surges of elemental energy to express who they are and how they see the world. To them, magic and motion are one and the same; both are exhibitions of raw creativity through which masterpieces are made. In their pursuit of the arts, some Prismari mages focus on perfecting the fine details of their technique, while others prefer to unleash their wild creative visions in dazzling spectacles of elemental power.')
-- Subclasse: Mage of Quandrix (UA) (ID: 18)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(18, 'Mage of Quandrix (UA)', 14, 2, 2, 'For those who become Mages of Quandrix, math and magic go hand-in-hand. Such individuals learn to break down natural phenomena into their core numerical components and, through manipulating those, alter reality on a whim. Their talents range from tangible physics, like multiplying plant growth and redistributing elements of probability and acceleration, to bizarrely theoretical exercises that warp the fundamentals of space and self.')
-- Subclasse: Mage of Silverquill (UA) (ID: 19)
INSERT INTO subclasses (id, name, class_id, initial_level, book_id, description) VALUES 
(19, 'Mage of Silverquill (UA)', 14, 2, 2, 'Mages of Silverquill hone the power of words. They channel the magic of light and shadow through words, whether spoken aloud, written, or signed through gestures. The words of a mage of Silverquill bring salvation to their allies and despair to their enemies.')

-- Características das subclasses
-- =============================================================================
-- BARBARIAN SUBCLASSES
-- =============================================================================

-- =============================================================================
-- WIZARD SUBCLASSES
-- =============================================================================

-- =============================================================================
-- DRUID SUBCLASSES
-- =============================================================================

-- =============================================================================
-- WIZARD SUBCLASSES
-- =============================================================================

-- =============================================================================
-- MONK SUBCLASSES
-- =============================================================================

-- Subclasse: Way of the Ascendant Dragon (UA) (ID: 6)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(6, 'Breath of the Dragon', 11, 'At 3rd-level you can channel your ki into destructive waves of energy like the dragons you emulate. When you take the Attack action on your turn, you can replace one of the attacks with an exhalation of draconic energy in either a 20-foot cone or a 30-foot line that is 5 feet wide (your choice). Choose a damage type: acid, cold, fire, lightning, or poison. Each creature in the area must make a Dexterity saving throw against your ki save DC, taking damage of the chosen type equal to two rolls of your Martial Arts die on a failure, or half as much damage on a success. At 11th level, the damage of your breath increases to three rolls of your Martial Arts die. You can use this feature a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. While you have no uses available, you can spend 1 ki point to use this feature again.');
-- Subclasse: Way of the Ascendant Dragon (UA) (ID: 7)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(7, 'Breath of the Dragon', 11, 'At 3rd-level you can channel your ki into destructive waves of energy like the dragons you emulate. When you take the Attack action on your turn, you can replace one of the attacks with an exhalation of draconic energy in either a 20-foot cone or a 30-foot line that is 5 feet wide (your choice). Choose a damage type: acid, cold, fire, lightning, or poison. Each creature in the area must make a Dexterity saving throw against your ki save DC, taking damage of the chosen type equal to two rolls of your Martial Arts die on a failure, or half as much damage on a success. At 11th level, the damage of your breath increases to three rolls of your Martial Arts die. You can use this feature a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. While you have no uses available, you can spend 1 ki point to use this feature again.');
-- =============================================================================
-- PALADIN SUBCLASSES
-- =============================================================================

-- Subclasse: Oath of the Watchers (UA) (ID: 8)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(8, 'Channel Divinity', 3, 'When you take this oath at 3rd level, you gain the following two Channel Divinity options. Adbjure the Extraplanar You can use your Channel Divinity to castigate unwordly beings. As an action, you present your holy symbol and each elemental, fey, fiend, or aberration within 30 feet of you that can hear you must make a Wisdom saving throw. On a failed save, the creature is turned for 1 minute or until it takes damage. A turned creature must spend its turns trying to move as far away from you as it can, and it can''t willingly move to a space within 30 feet of you. For its action, it can use only the Dash action or try to escape from an effect that prevents it from moving. If there''s nowhere to move, the creature can use the Dodge action. Watcher''s Will You can use your Channel Divinity to invest your presence with the warding power of your faith. As an action, you can choose a number of creatures you can see within 30 feet of you, up to a number equal to your Charisma modifier (minimum of one creature). For 1 minute, all the chosen creatures have advantage on Intelligence, Wisdom, and Charisma saving throws.'),
(8, 'Aura of the Sentinel', 7, 'You emit an aura of alertness while you aren''t incapacitated. At 7th level, when you and any creature of your choice within 10 feet of you rolls initiative, you each gain a bonus to initiative equal to your Charisma modifier (minimum of +1). At 18th level, the range of this aura increases to 30 feet.'),
(8, 'Vigilant Rebuke', 15, 'At 15th level, you''ve learned how to magically chastise anyone who dares cast unwanted spells at you and your wards. Whenever you or a creature you can see within 30 feet of you succeeds on a saving throw against a spell, you can use your reaction to deal 2d8 + your Charisma modifier force damage to the spellcaster.'),
(8, 'Mortal Bulwark', 20, 'At 20th level, you manifest a spark of your diety''s power in defense of your sacred oath. As a bonus action, you gain the following benefits for 1 minute: You gain truesight in a 120-foot radius. You have advantage on attack rolls against elementals, fey, fiends, and aberrations. When you hit a creature with an attack and deal damage to it, you can also force it to make a Charisma saving throw. On a failed save, the creature is magically banished to its native plane of existence if it''s currently not there. On a successful save, the creature can''t be banished by this feature for 24 hours. Once you use this bonus action, you can''t use it again until you finish a long rest.');
-- =============================================================================
-- RANGER SUBCLASSES
-- =============================================================================

-- Subclasse: Monster Slayer (UA) (ID: 10)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(10, 'Slayer’s Eye', 3, 'Starting at 3rd level, you gain the ability to study and unravel a creature’s defenses. As a bonus action, choose one creature you can see within 120 feet of you. You immediately learn the target’s vulnerabilities, immunities, and resistances. You also learn any special effects triggered when the target takes damage, such as fire damage halting its regeneration. In addition, the first time each turn you hit the target with a weapon attack, the target takes an extra 1d6 damage from the weapon. This benefit lasts until you target a different creature with this feature or until you finish a short or long rest.'),
(10, 'Extra Attack (Revised Ranger)', 5, 'Beginning at 5th level, you can attack twice, instead of once, whenever you take the Attack action on your turn.'),
(10, 'Supernatural Defense', 7, 'At 7th level, you gain extra resilience against your prey’s assaults on your mind and body. Whenever the target of your Slayer’s Eye forces you to make a saving throw, add 1d6 to your roll.'),
(10, 'Relentless Slayer', 11, 'At 11th level, you gain the ability to foil your foe’s ability to escape. Your study of folklore and arcane knowledge gives you a key insight to keep your prey cornered. If the target of your Slayer’s Eye attempts to teleport, change its shape, travel to another plane of existence, or turn gaseous, you can use your reaction to make a Wisdom check contested by a Wisdom check made by the target. To use this ability, you must be able to see the target and need to be within 30 feet of it. If you succeed, you foil its attempt, causing it to waste the action, bonus action, or reaction it used.'),
(10, 'Slayer’s Counter', 15, 'At 15th level, you gain the ability to counterattack when your prey tries to sabotage you. If the target of your Slayer’s Eye forces you to make a saving throw, you can use your reaction to make one weapon attack against it. You make this attack immediately before making the saving throw. If the attack hits, your save automatically succeeds, in addition to the attack’s normal effects');
-- =============================================================================
-- SORCERER SUBCLASSES
-- =============================================================================

-- Subclasse: Favored Soul (UA) (ID: 11)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(11, 'Chosen of the Gods', 1, 'At 1st level, you choose one of the cleric class’s divine domains. You add that domain’s spells for 1st-level clerics to your known spells. These spells do not count against the number of spells you can know, and they are considered to be sorcerer spells for you. When you reach 3rd, 5th, 7th, and 9th levels in the sorcerer class, you likewise learn your domain’s spells that become available at those levels.'),
(11, 'Bonus Proficiencies', 1, 'At 1st level, you gain proficiency in light armor, medium armor, shields, and simple weapons.'),
(11, 'Extra Attack', 6, 'Starting at 6th level, you can attack twice, instead of once, whenever you take the Attack action on your turn.'),
(11, 'Divine Wings', 14, 'At 14th level, you gain the ability to sprout a pair of wings from your back (feathered or bat-like, your choice), gaining a flying speed equal to your current walking speed. You can create these wings as a bonus action on your turn. They last until you dismiss them as a bonus action on your turn. You can’t manifest your wings while wearing armor unless the armor is made to accommodate them, and clothing not made to accommodate your wings might be destroyed when you manifest them.'),
(11, 'Power of the Chosen', 18, 'Starting at 18th level, when you cast one of the spells you learned from your Chosen of the Gods class feature, you regain hit points equal to your Charisma modifier (minimum +1) + the spell’s level.');
-- =============================================================================
-- WIZARD SUBCLASSES
-- =============================================================================

-- =============================================================================
-- WARLOCK SUBCLASSES
-- =============================================================================

-- Subclasse: Ghost In The Machine (UA) (ID: 14)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(14, 'Information Surge', 1, 'At 1st level, you gain the ability to temporarily render computerized devices inoperable. As an action, you can target a computerized device within 30 feet of you. If the targeted device is held or otherwise actively used by a living creature, that creature must make an Intelligence saving throw against your spell save DC. On a failed save, the targeted device ceases to function until the end of your next turn. If the targeted device is not held or used by a creature, the DM makes a special saving throw for the device with disadvantage and a +0 modifier. Certain shielded devices might negate the disadvantage, at the DM’s determination. Once you use this feature, you can’t use it again until you finish a short or long rest.'),
(14, 'Wire Walk', 6, 'Starting at 6th level, you gain the ability to travel short distances over electrical wires, data lines, or telephone cables. As a bonus action, you can touch a device or socket connected to a hardwired network and teleport along this network to another device or socket within your line of sight. Once you use this feature, you can’t use it again until you finish a short or long rest.'),
(14, 'Personal Encryption', 10, 'Beginning at 10th level, you have learned to apply your innate knowledge of encryption to your thoughts, memories, and presence. You have advantage on saving throws against scrying, thought detection, or any other method of magically learning your whereabouts or reading your thoughts. For any such effect that does not grant you a saving throw but which requires the creature targeting you to make an ability check, the check is made with disadvantage.'),
(14, 'Technovirus', 14, 'At 14th level, you gain the ability to infect a humanoid’s body with living circuitry. You can use an action to make a melee attack against a humanoid creature using your spell attack modifier. The target must make a Constitution saving throw against your spell save DC as a techno-organic virus quickly spreads through its body. On a failed save, the target takes 8d10 psychic damage, or half as much damage on a successful one. Additionally, if the target fails the saving throw, you can use an action to issue it a single command, as if you were casting the Command spell. The target makes its saving throw against your command with disadvantage. You can issue this command at any time while the target remains infected. Once you use this feature, you can’t use it again until you finish a long rest, at which point the target is cured of the technovirus. The infection can also be removed with a Lesser Restoration spell.');
-- =============================================================================
-- WIZARD SUBCLASSES
-- =============================================================================

-- Subclasse: Artificer (UA) (ID: 16)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(16, 'Infuse Potions', 2, 'Starting at 2nd level, you can produce magic potions. You spend 10 minutes focusing your magic on a vial of mundane water and expend a spell slot to transform it into a potion. Once you have expended a spell slot to create a potion, you cannot regain that slot until the potion is consumed or after 1 week, at which time the potion loses its effectiveness. You can create up to three potions at a time; creating a fourth potion causes the oldest currently active one to immediately lose its potency. If that potion has been consumed, its effects immediately end. The spell slot you expend determines the type of potion you can create. See chapter 7 of the Dungeon Master’s Guide for complete rules on potions. Spell Slot Potion Created 1st Climbing, Growth, or Healing 2nd Mind Reading or Greater Healing 3rd Invisibility, Superior Healing, or Water Breathing 4th Resistance'),
(16, 'Infuse Scrolls', 2, 'At 2nd level, you can also tap into your reserves of magical energy to create spell scrolls. You can use your Arcane Recovery ability to create a scroll instead of regaining expended spell slots. You must finish a short rest, then spend 10 minutes with parchment, quill, and ink to create a spell scroll containing one spell chosen from those you know. Subtract the spell’s level from the total levels worth of slots you regain using Arcane Recovery. This reduction to your Arcane Recovery applies until you use the scroll and then finish a long rest.'),
(16, 'Infuse Weapons and Armor', 6, 'Beginning at 6th level, you can produce magic weapons and armor. You spend 10 minutes focusing your magic on a mundane weapon, suit of armor, shield, or bundle of twenty pieces of ammunition, and expend a spell slot to infuse it with magical energy. The magic item retains its enhancement for 8 hours or until used (in the case of magic ammunition). You can infuse only one item at a time; if you infuse a second one, the first immediately loses its potency. Once you have expended a spell slot to create such an item, you cannot regain that slot until the item becomes nonmagical. The spell slot you expend determines the type of weapon, armor, or shield you can create. Spell Slot Item Created 2nd +1 ammunition (20 pieces) 3rd +1 weapon or +1 shield 4th +1 armor 5th +2 weapon or +2 ammunition (20 pieces) 6th +2 armor'),
(16, 'Superior Artificer', 10, 'Starting at 10th level, you can create a second magic weapon, suit of armor, shield, or bundle of ammunition using your Infuse Weapons and Armor ability. Attempting to infuse a third item causes the oldest one to immediately lose its potency. You can also create one additional potion or scroll using Infuse Potions or Infuse Scrolls.');
