DROP TABLE IF EXISTS lineage_features;
CREATE TABLE lineage_features (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    lineage_id INTEGER NOT NULL,
    available_at_level INTEGER NOT NULL DEFAULT 1,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (lineage_id) REFERENCES lineages(id) ON DELETE CASCADE
);

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'Accustomed to life underground, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'dwarf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Dwarven Resilience', 'You have advantage on saving throws against poison, and you have resistance against poison damage.'
FROM lineages l WHERE l.slug = 'dwarf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Dwarven Combat Training', 'You have proficiency with the battleaxe, handaxe, light hammer, and warhammer.'
FROM lineages l WHERE l.slug = 'dwarf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Tool Proficiency', 'You gain proficiency with the artisan''s tools of your choice: smith''s tools, brewer''s supplies, or mason''s tools.'
FROM lineages l WHERE l.slug = 'dwarf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Stonecunning', 'Whenever you make an Intelligence (History) check related to the origin of stonework, you are considered proficient in the History skill and add double your proficiency bonus to the check, instead of your normal proficiency bonus.'
FROM lineages l WHERE l.slug = 'dwarf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'Accustomed to twilit forests and the night sky, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws against being charmed, and magic can''t put you to sleep.'
FROM lineages l WHERE l.slug = 'elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Trance', 'Elves do not sleep. Instead they meditate deeply, remaining semi-conscious, for 4 hours a day. The Common word for this meditation is "trance." While meditating, you dream after a fashion; such dreams are actually mental exercises that have become reflexive after years of practice. After resting in this way, you gain the same benefit a human would from 8 hours of sleep.'
FROM lineages l WHERE l.slug = 'elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Keen Senses', 'You have proficiency in the Perception skill.'
FROM lineages l WHERE l.slug = 'elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Lucky', 'When you roll a 1 on the d20 for an attack roll, ability check, or saving throw, you can reroll the die and must use the new roll.'
FROM lineages l WHERE l.slug = 'halfling';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Brave', 'You have advantage on saving throws against being frightened.'
FROM lineages l WHERE l.slug = 'halfling';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Nimble', 'You can move through the space of any creature that is of a size larger than yours.'
FROM lineages l WHERE l.slug = 'halfling';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'Thanks to your infernal heritage, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'tiefling';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hellish Resistance', 'You have resistance to fire damage.'
FROM lineages l WHERE l.slug = 'tiefling';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hellish Resistance', 'You have resistance to fire damage.'
FROM lineages l WHERE l.slug = 'tiefling';

-- Dragonborn features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Draconic Ancestry', 'You have draconic ancestry. Choose one type of dragon from the Draconic Ancestry table. Your breath weapon and damage resistance are determined by the dragon type, as shown in the table.'
FROM lineages l WHERE l.slug = 'dragonborn';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Breath Weapon', 'You can use your action to exhale destructive energy. Your draconic ancestry determines the size, shape, and damage type of the exhalation.'
FROM lineages l WHERE l.slug = 'dragonborn';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Damage Resistance', 'You have resistance to the damage type associated with your draconic ancestry.'
FROM lineages l WHERE l.slug = 'dragonborn';

-- Gnome features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'Accustomed to life underground, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'gnome';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Gnome Cunning', 'You have advantage on all Intelligence, Wisdom, and Charisma saving throws against magic.'
FROM lineages l WHERE l.slug = 'gnome';

-- Half-Elf features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'Thanks to your elf blood, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'half-elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws against being charmed, and magic can''t put you to sleep.'
FROM lineages l WHERE l.slug = 'half-elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Skill Versatility', 'You gain proficiency in two skills of your choice.'
FROM lineages l WHERE l.slug = 'half-elf';

-- Half-Orc features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'Thanks to your orc blood, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'half-orc';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Menacing', 'You gain proficiency in the Intimidation skill.'
FROM lineages l WHERE l.slug = 'half-orc';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Relentless Endurance', 'When you are reduced to 0 hit points but not killed outright, you can drop to 1 hit point instead. You can''t use this feature again until you finish a long rest.'
FROM lineages l WHERE l.slug = 'half-orc';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Savage Attacks', 'When you score a critical hit with a melee weapon attack, you can roll one of the weapon''s damage dice one additional time and add it to the extra damage of the critical hit.'
FROM lineages l WHERE l.slug = 'half-orc';

-- Aasimar features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'Blessed with a radiant soul, your vision can easily cut through darkness. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'aasimar';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Celestial Resistance', 'You have resistance to necrotic damage and radiant damage.'
FROM lineages l WHERE l.slug = 'aasimar';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Healing Hands', 'As an action, you can touch a creature and cause it to regain a number of hit points equal to your level. Once you use this trait, you can''t use it again until you finish a long rest.'
FROM lineages l WHERE l.slug = 'aasimar';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Light Bearer', 'You know the light cantrip. Charisma is your spellcasting ability for it.'
FROM lineages l WHERE l.slug = 'aasimar';

-- Firbolg features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Firbolg Magic', 'You can cast detect magic and disguise self with this trait, using Wisdom as your spellcasting ability for them. Once you cast either spell, you can''t cast it again with this trait until you finish a short or long rest. When you use this version of disguise self, you can seem up to 3 feet shorter than normal, allowing you to more easily blend in with humans and elves.'
FROM lineages l WHERE l.slug = 'firbolg';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hidden Step', 'As a bonus action, you can magically turn invisible until the start of your next turn or until you attack, make a damage roll, or force someone to make a saving throw. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l WHERE l.slug = 'firbolg';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l WHERE l.slug = 'firbolg';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Speech of Beast and Leaf', 'You have the ability to communicate in a limited manner with beasts and plants. They can understand the meaning of your words, though you have no special ability to understand them in return. You have advantage on all Charisma checks you make to influence them.'
FROM lineages l WHERE l.slug = 'firbolg';

-- Goliath features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Stone''s Endurance', 'You can focus yourself to occasionally shrug off injury. When you take damage, you can use your reaction to roll a d12. Add your Constitution modifier to the number rolled, and reduce the damage by that total. After you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l WHERE l.slug = 'goliath';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l WHERE l.slug = 'goliath';

-- Kenku features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Expert Forgery', 'You can duplicate other creatures'' handwriting and craftwork. You have advantage on all checks made to produce forgeries or duplicates of existing objects.'
FROM lineages l WHERE l.slug = 'kenku';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Kenku Training', 'You are proficient in your choice of two of the following skills: Acrobatics, Deception, Stealth, and Sleight of Hand.'
FROM lineages l WHERE l.slug = 'kenku';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mimicry', 'You can mimic sounds you have heard, including voices. A creature that hears the sounds can tell they are imitations with a successful Wisdom (Insight) check opposed by your Charisma (Deception) check.'
FROM lineages l WHERE l.slug = 'kenku';

-- Lizardfolk features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Bite', 'Your fanged maw is a natural weapon, which you can use to make unarmed strikes. If you hit with it, you deal piercing damage equal to 1d6 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l WHERE l.slug = 'lizardfolk';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Cunning Artisan', 'As part of a short rest, you can harvest bone and hide from a slain beast, construct, dragon, monstrosity, or plant creature of size Small or larger to create one of the following items: a shield, a club, a javelin, or 1d4 darts or blowgun needles. To use this trait, you need a blade, such as a dagger, or appropriate artisan''s tools, such as leatherworker''s tools.'
FROM lineages l WHERE l.slug = 'lizardfolk';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hold Breath', 'You can hold your breath for up to 15 minutes at a time.'
FROM lineages l WHERE l.slug = 'lizardfolk';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hunter''s Lore', 'You gain proficiency with two of the following: Animal Handling, Nature, Perception, Stealth, or Survival.'
FROM lineages l WHERE l.slug = 'lizardfolk';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Natural Armor', 'When you aren''t wearing armor, your AC is 13 + your Dexterity modifier. You can use a shield and still gain this benefit.'
FROM lineages l WHERE l.slug = 'lizardfolk';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hungry Jaws', 'In battle, you can throw yourself into a vicious feeding frenzy. As a bonus action, you can make a special attack with your bite. If the attack hits, it deals its normal damage, and you gain temporary hit points equal to your Constitution modifier (minimum of 1). You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l WHERE l.slug = 'lizardfolk';

-- Tabaxi features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You have a cat''s keen senses, especially in the dark. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'tabaxi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Feline Agility', 'Your reflexes and agility allow you to move with a burst of speed. When you move on your turn in combat, you can double your speed until the end of the turn. Once you use this trait, you can''t use it again until you move 0 feet on one of your turns.'
FROM lineages l WHERE l.slug = 'tabaxi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Cat''s Claws', 'Because of your claws, you have a climbing speed of 20 feet. In addition, your claws are natural weapons, which you can use to make unarmed strikes. If you hit with them, you deal slashing damage equal to 1d4 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l WHERE l.slug = 'tabaxi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Cat''s Talent', 'You have proficiency in the Perception and Stealth skills.'
FROM lineages l WHERE l.slug = 'tabaxi';

-- Triton features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Amphibious', 'You can breathe air and water.'
FROM lineages l WHERE l.slug = 'triton';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Control Air and Water', 'A child of the sea, you can call on the magic of elemental air and water. You can cast fog cloud with this trait. Starting at 3rd level, you can cast gust of wind with it, and starting at 5th level, you can also cast wall of sand with it (see chapter 2 for the sand wall spell). Once you cast a spell with this trait, you can''t cast that spell with it again until you finish a long rest. Charisma is your spellcasting ability for these spells.'
FROM lineages l WHERE l.slug = 'triton';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Emissary of the Sea', 'Aquatic beasts have an extraordinary affinity with your people. You can communicate simple ideas with any of them. In battle, they are unlikely to attack you unless you attack them first.'
FROM lineages l WHERE l.slug = 'triton';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Guardians of the Depths', 'Adapted to even the most extreme ocean depths, you have resistance to cold damage, and you ignore any of the drawbacks caused by a deep, underwater environment.'
FROM lineages l WHERE l.slug = 'triton';

-- Bugbear features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'bugbear';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Long-Limbed', 'When you make a melee attack on your turn, your reach for it is 5 feet greater than normal.'
FROM lineages l WHERE l.slug = 'bugbear';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l WHERE l.slug = 'bugbear';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sneaky', 'You are proficient in the Stealth skill.'
FROM lineages l WHERE l.slug = 'bugbear';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Surprise Attack', 'If you hit a creature with an attack roll, the creature takes an extra 2d6 damage if it hasn''t taken a turn yet in the current combat.'
FROM lineages l WHERE l.slug = 'bugbear';

-- Goblin features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'goblin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fury of the Small', 'When you damage a creature with an attack or a spell and the creature''s size is larger than yours, you can cause the attack or spell to deal extra damage to the creature. The extra damage equals your level. Once you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l WHERE l.slug = 'goblin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Nimble Escape', 'You can take the Disengage or Hide action as a bonus action on each of your turns.'
FROM lineages l WHERE l.slug = 'goblin';

-- Hobgoblin features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'hobgoblin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Martial Training', 'You are proficient with two martial weapons of your choice and with light armor.'
FROM lineages l WHERE l.slug = 'hobgoblin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Saving Face', 'Hobgoblins are careful not to show weakness in front of their allies, for fear of losing status. If you miss with an attack roll or fail an ability check or a saving throw, you can gain a bonus to the roll equal to the number of allies you can see within 30 feet of you (maximum bonus of +5). Once you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l WHERE l.slug = 'hobgoblin';

-- Kobold features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'kobold';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Grovel, Cower, and Beg', 'As an action on your turn, you can cower pathetically to distract nearby foes. Until the end of your next turn, your allies gain advantage on attack rolls against enemies within 10 feet of you that can see you. Once you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l WHERE l.slug = 'kobold';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Pack Tactics', 'You have advantage on an attack roll against a creature if at least one of your allies is within 5 feet of the creature and the ally isn''t incapacitated.'
FROM lineages l WHERE l.slug = 'kobold';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sunlight Sensitivity', 'You have disadvantage on attack rolls and on Wisdom (Perception) checks that rely on sight when you, the target of your attack, or whatever you are trying to perceive is in direct sunlight.'
FROM lineages l WHERE l.slug = 'kobold';

-- Orc features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'orc';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Aggressive', 'As a bonus action, you can move up to your speed toward an enemy of your choice that you can see or hear. You must end this move closer to the enemy than you started.'
FROM lineages l WHERE l.slug = 'orc';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l WHERE l.slug = 'orc';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Menacing', 'You gain proficiency in the Intimidation skill.'
FROM lineages l WHERE l.slug = 'orc';

-- Centaur features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey', 'Your creature type is fey, rather than humanoid.'
FROM lineages l WHERE l.slug = 'centaur';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Charge', 'If you move at least 30 feet straight toward a target and then hit it with a melee weapon attack on the same turn, you can make another attack with the same weapon as a bonus action.'
FROM lineages l WHERE l.slug = 'centaur';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hooves', 'Your hooves are natural weapons, which you can use to make unarmed strikes. If you hit with a hoof, you deal bludgeoning damage equal to 1d6 + your Strength modifier (instead of the bludgeoning damage normal for an unarmed strike).'
FROM lineages l WHERE l.slug = 'centaur';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Equine Build', 'You count as one size larger when determining your carrying capacity and the weight you can push or drag.'
FROM lineages l WHERE l.slug = 'centaur';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Survivor', 'You have proficiency in the Survival skill.'
FROM lineages l WHERE l.slug = 'centaur';

-- Merfolk features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Amphibious', 'You can breathe air and water.'
FROM lineages l WHERE l.slug = 'merfolk';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Swim Speed', 'You have a swimming speed of 40 feet.'
FROM lineages l WHERE l.slug = 'merfolk';

-- Minotaur features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Horns', 'Your horns are natural weapons, which you can use to make unarmed strikes. If you hit with them, you deal piercing damage equal to 1d8 + your Strength modifier (instead of the bludgeoning damage normal for an unarmed strike).'
FROM lineages l WHERE l.slug = 'minotaur';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Goring Rush', 'Immediately after you use the Dash action on your turn and move at least 20 feet, you can make one melee attack with your horns as a bonus action.'
FROM lineages l WHERE l.slug = 'minotaur';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hammering Horns', 'When you hit with a melee attack using your horns, you can attempt to shove the target with your horns as a bonus action. You can''t use this ability if you aren''t proficient with your horns.'
FROM lineages l WHERE l.slug = 'minotaur';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Imposing Presence', 'You have proficiency in the Intimidation skill.'
FROM lineages l WHERE l.slug = 'minotaur';

-- Satyr features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey', 'Your creature type is fey, rather than humanoid.'
FROM lineages l WHERE l.slug = 'satyr';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Ram', 'You can use your head and horns to make unarmed strikes. If you hit with them, you deal bludgeoning damage equal to 1d4 + your Strength modifier (instead of the bludgeoning damage normal for an unarmed strike).'
FROM lineages l WHERE l.slug = 'satyr';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Magic Resistance', 'You have advantage on saving throws against spells and other magical effects.'
FROM lineages l WHERE l.slug = 'satyr';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mirthful Leaps', 'Whenever you make a long or high jump, you can roll a d8 and add the number rolled to the number of feet you cover, even if you''re not proficient in Athletics. When you make a standing jump, you can use the bonus without making an ability check.'
FROM lineages l WHERE l.slug = 'satyr';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Reveler', 'You have proficiency in the Performance and Persuasion skills, and you have proficiency with one musical instrument of your choice.'
FROM lineages l WHERE l.slug = 'satyr';

-- Grung features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Amphibious', 'You can breathe air and water.'
FROM lineages l WHERE l.slug = 'grung';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Poison Immunity', 'You are immune to poison damage and the poisoned condition.'
FROM lineages l WHERE l.slug = 'grung';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Standing Leap', 'Your long jump is up to 25 feet and your high jump is up to 15 feet, with or without a running start.'
FROM lineages l WHERE l.slug = 'grung';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Water Dependency', 'If you fail to immerse yourself in water for at least 1 hour during a long rest, you suffer one level of exhaustion at the end of that rest. You can only recover from this exhaustion through magic or by immersing yourself in water for at least 1 hour.'
FROM lineages l WHERE l.slug = 'grung';

-- Vedalken features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Vedalken Dispassion', 'You have advantage on all Intelligence, Wisdom, and Charisma saving throws against magic.'
FROM lineages l WHERE l.slug = 'vedalken';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Tireless Precision', 'You don''t need to sleep, and magic can''t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in a trancelike meditation, during which you remain conscious.'
FROM lineages l WHERE l.slug = 'vedalken';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Partially Amphibious', 'By spending 1 hour in water, you can adapt your body to breathe underwater for 24 hours. Your skin also becomes slick, giving you advantage on checks made to escape a grapple.'
FROM lineages l WHERE l.slug = 'vedalken';

-- Removed Infernal Legacy from base Tiefling race - it belongs to subraces

-- Aarakocra features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Flight', 'You have a flying speed of 50 feet. To use this speed, you can''t be wearing medium or heavy armor.'
FROM lineages l WHERE l.slug = 'aarakocra';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Talons', 'You are proficient with your unarmed strikes, which deal 1d4 slashing damage on a hit.'
FROM lineages l WHERE l.slug = 'aarakocra';

-- Changeling features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shapechanger', 'As an action, you can change your appearance and your voice. You determine the specifics of the changes, including your coloration, hair length, and sex. You can also adjust your height and weight, but not so much that your size changes. You can make yourself appear as a member of another race, though none of your game statistics change. You can''t duplicate the appearance of a creature you''ve never seen, and you must adopt a form that has the same basic arrangement of limbs that you have. Your clothing and equipment aren''t changed by this trait. You stay in the new form until you use an action to revert to your true form or until you die.'
FROM lineages l WHERE l.slug = 'changeling';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Changeling Instincts', 'You gain proficiency with two of the following skills of your choice: Deception, Insight, Intimidation, and Persuasion.'
FROM lineages l WHERE l.slug = 'changeling';

-- Warforged features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Constructed Resilience', 'You were created to have remarkable fortitude, represented by the following benefits: You have advantage on saving throws against being poisoned, and you have resistance to poison damage. You don''t need to eat, drink, or breathe. You are immune to disease. You don''t need to sleep, and magic can''t put you to sleep.'
FROM lineages l WHERE l.slug = 'warforged';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sentry''s Rest', 'When you take a long rest, you must spend at least six hours in an inactive, motionless state, rather than sleeping. In this state, you appear inert, but it doesn''t render you unconscious, and you can see and hear as normal.'
FROM lineages l WHERE l.slug = 'warforged';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Integrated Protection', 'Your body has built-in defensive layers, which can be enhanced with armor: You gain a +1 bonus to Armor Class. You can don only armor with which you have proficiency. To don armor, you must incorporate it into your body over the course of 1 hour, during which you remain in contact with the armor. To doff armor, you must spend 1 hour removing it. You can rest while donning or doffing armor in this way. While you live, your armor can''t be removed from your body against your will.'
FROM lineages l WHERE l.slug = 'warforged';

-- Tortle features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Natural Armor', 'Due to your shell and the shape of your body, you are ill-suited to wearing armor. Your shell provides ample protection, however; it gives you a base AC of 17 (your Dexterity modifier doesn''t affect this number). You gain no benefit from wearing armor, but if you are using a shield, you can apply the shield''s bonus as normal.'
FROM lineages l WHERE l.slug = 'tortle';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shell Defense', 'You can withdraw into your shell as an action. Until you emerge, you gain a +4 bonus to AC, and you have advantage on Strength and Constitution saving throws. While in your shell, you are prone, your speed is 0 and can''t increase, you have disadvantage on Dexterity saving throws, you can''t take reactions, and the only action you can take is a bonus action to emerge from your shell.'
FROM lineages l WHERE l.slug = 'tortle';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hold Breath', 'You can hold your breath for up to 1 hour at a time. Tortles aren''t natural swimmers, but they can remain underwater for some time before needing to come up for air.'
FROM lineages l WHERE l.slug = 'tortle';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Survival Instinct', 'You gain proficiency in the Survival skill. Tortles have finely honed survival instincts.'
FROM lineages l WHERE l.slug = 'tortle';

-- Yuan-ti Pureblood features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'yuan-ti-pureblood';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Innate Spellcasting', 'You know the poison spray cantrip. You can cast animal friendship an unlimited number of times with this trait, but you can target only snakes with it. Starting at 3rd level, you can also cast suggestion with this trait. Once you cast it, you can''t do so again until you finish a long rest. Charisma is your spellcasting ability for these spells.'
FROM lineages l WHERE l.slug = 'yuan-ti-pureblood';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Magic Resistance', 'You have advantage on saving throws against spells and other magical effects.'
FROM lineages l WHERE l.slug = 'yuan-ti-pureblood';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Poison Immunity', 'You are immune to poison damage and the poisoned condition.'
FROM lineages l WHERE l.slug = 'yuan-ti-pureblood';

-- Genasi features (base - sublineages will add more)
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Elemental Legacy', 'Your connection to one of the elemental planes determines which sublineage you belong to: Air Genasi, Earth Genasi, Fire Genasi, or Water Genasi.'
FROM lineages l WHERE l.slug = 'genasi';

-- Githyanki features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Astral Knowledge', 'You can mystically access a reservoir of experiences of entities connected to the Astral Plane. Whenever you finish a long rest, you gain proficiency in one skill of your choice and with one weapon or tool of your choice, selected from the Player''s Handbook, as you momentarily project your consciousness into the Astral Plane. These proficiencies last until the end of your next long rest.'
FROM lineages l WHERE l.slug = 'githyanki';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Githyanki Psionics', 'You know the mage hand cantrip, and the hand is invisible when you cast the cantrip with this trait. Starting at 3rd level, you can cast the jump spell with this trait. Starting at 5th level, you can also cast the misty step spell with it. Once you cast jump or misty step with this trait, you can''t cast that spell with it again until you finish a long rest. You can also cast either of those spells using any spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l WHERE l.slug = 'githyanki';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Psychic Resilience', 'You have resistance to psychic damage.'
FROM lineages l WHERE l.slug = 'githyanki';

-- Githzerai features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mental Discipline', 'You have advantage on saving throws against the charmed and frightened conditions. Under the tutelage of monastic masters, githzerai learn to govern their own minds.'
FROM lineages l WHERE l.slug = 'githzerai';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Githzerai Psionics', 'You know the mage hand cantrip, and the hand is invisible when you cast the cantrip with this trait. Starting at 3rd level, you can cast the shield spell with this trait. Starting at 5th level, you can also cast the detect thoughts spell with it. Once you cast shield or detect thoughts with this trait, you can''t cast that spell with it again until you finish a long rest. You can also cast either of those spells using any spell slots you have of the appropriate level. Wisdom is your spellcasting ability for these spells.'
FROM lineages l WHERE l.slug = 'githzerai';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Psychic Resilience', 'You have resistance to psychic damage.'
FROM lineages l WHERE l.slug = 'githzerai';

-- Kalashtar features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Dual Mind', 'You have advantage on all Wisdom saving throws.'
FROM lineages l WHERE l.slug = 'kalashtar';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mental Discipline', 'You have resistance to psychic damage.'
FROM lineages l WHERE l.slug = 'kalashtar';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mind Link', 'You can speak telepathically to any creature you can see, provided the creature is within a number of feet of you equal to 10 times your level. You don''t need to share a language with the creature for it to understand your telepathic utterances, but the creature must be able to understand at least one language. When you''re using this trait to speak telepathically to a creature, you can use your action to give that creature the ability to speak telepathically with you for 1 hour or until you end this effect as an action. To use this ability, the creature must be able to see you and must be within this trait''s range. You can give this ability to only one creature at a time; giving it to a creature takes it away from another creature who has it.'
FROM lineages l WHERE l.slug = 'kalashtar';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Severed from Dreams', 'Kalashtar sleep, but they don''t connect to the plane of dreams as other creatures do. Instead, their minds draw from the memories of their otherworldly spirit while they sleep. As such, you are immune to spells and other magical effects that require you to dream, like dream, but not to spells and other magical effects that put you to sleep, like sleep.'
FROM lineages l WHERE l.slug = 'kalashtar';

-- Shifter features (base - sublineages will add more)
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'shifter';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Keen Senses', 'You have proficiency in the Perception skill.'
FROM lineages l WHERE l.slug = 'shifter';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shifting', 'As a bonus action, you can assume a more bestial appearance. This transformation lasts for 1 minute, until you die, or until you revert to your normal appearance as a bonus action. When you shift, you gain temporary hit points equal to your level + your Constitution modifier (minimum of 1 temporary hit point). You also gain additional benefits that depend on your shifter sublineage. Once you shift, you can''t do so again until you finish a short or long rest.'
FROM lineages l WHERE l.slug = 'shifter';

-- Loxodon features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l WHERE l.slug = 'loxodon';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Loxodon Serenity', 'You have advantage on saving throws against being charmed or frightened.'
FROM lineages l WHERE l.slug = 'loxodon';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Natural Armor', 'You have thick, leathery skin. When you aren''t wearing armor, your AC is 12 + your Constitution modifier. You can use your natural armor to determine your AC if the armor you wear would leave you with a lower AC. A shield''s benefits apply as normal while you use your natural armor.'
FROM lineages l WHERE l.slug = 'loxodon';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Trunk', 'You can grasp things with your trunk, and you can use it as a snorkel. It has a reach of 5 feet, and it can lift a number of pounds equal to five times your Strength score. You can use it to do the following simple tasks: lift, drop, hold, push, or pull an object or a creature; open or close a door or a container; grapple someone; or make an unarmed strike. Your DM might allow other simple tasks to be added to that list of options. Your trunk can''t wield weapons or shields or do anything that requires manual precision, such as using tools or magic items or performing the somatic components of a spell.'
FROM lineages l WHERE l.slug = 'loxodon';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Keen Smell', 'Thanks to your sensitive trunk, you have advantage on Wisdom (Perception), Wisdom (Survival), and Intelligence (Investigation) checks that involve smell.'
FROM lineages l WHERE l.slug = 'loxodon';

-- Simic Hybrid features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'simic-hybrid';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Animal Enhancement', 'Your body has been altered to incorporate certain animal characteristics. You choose one animal enhancement now and a second enhancement at 5th level. At 1st level, choose one of the following options: Manta Glide, Nimble Climber, or Underwater Adaptation.'
FROM lineages l WHERE l.slug = 'simic-hybrid';

-- Leonin features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'leonin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Claws', 'Your claws are natural weapons, which you can use to make unarmed strikes. If you hit with them, you deal slashing damage equal to 1d4 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l WHERE l.slug = 'leonin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hunter''s Instincts', 'You have proficiency in one of the following skills of your choice: Athletics, Intimidation, Perception, or Survival.'
FROM lineages l WHERE l.slug = 'leonin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Daunting Roar', 'As a bonus action, you can let out an especially menacing roar. Creatures of your choice within 10 feet of you that can hear you must succeed on a Wisdom saving throw or become frightened of you until the end of your next turn. The DC of the save equals 8 + your proficiency bonus + your Constitution modifier. Once you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l WHERE l.slug = 'leonin';

-- Fairy features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fairy Flight', 'You have a flying speed equal to your walking speed and can hover. This flight is magical and does not function in an antimagic field.'
FROM lineages l WHERE l.slug = 'fairy';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fairy Magic', 'You know the druidcraft cantrip. Starting at 3rd level, you can cast the faerie fire spell with this trait. Starting at 5th level, you can also cast the enlarge/reduce spell with this trait. Once you cast faerie fire or enlarge/reduce with this trait, you can''t cast that spell with it again until you finish a long rest. You can also cast either of those spells using any spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l WHERE l.slug = 'fairy';

-- Harengon features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hare-Trigger', 'You can add your proficiency bonus to your initiative rolls.'
FROM lineages l WHERE l.slug = 'harengon';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Leporine Senses', 'You have proficiency in the Perception skill.'
FROM lineages l WHERE l.slug = 'harengon';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Lucky Footwork', 'When you fail a Dexterity saving throw, you can use your reaction to roll a d4 and add it to the save, potentially turning the failure into a success. You can''t use this reaction if you''re prone or your speed is 0.'
FROM lineages l WHERE l.slug = 'harengon';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Rabbit Hop', 'As a bonus action, you can jump a number of feet equal to five times your proficiency bonus, without provoking opportunity attacks. You can use this trait only if your speed is greater than 0. You can use it a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l WHERE l.slug = 'harengon';

-- Owlin features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 120 feet of yourself as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l WHERE l.slug = 'owlin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Flight', 'You have a flying speed equal to your walking speed. When you fall, you can use your reaction to make a Dexterity saving throw (DC 10) to stop falling and fly in place until the start of your next turn.'
FROM lineages l WHERE l.slug = 'owlin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Silent Feathers', 'You have proficiency in the Stealth skill.'
FROM lineages l WHERE l.slug = 'owlin';

-- Dhampir features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Ancestral Legacy', 'If you replace a race with this lineage, you can keep the following elements of that race: any skill proficiencies you gained from it and any climbing, flying, or swimming speed you gained from it. If you don''t keep any of those elements or you choose this lineage at character creation, you gain proficiency in two skills of your choice.'
FROM lineages l WHERE l.slug = 'dhampir';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l WHERE l.slug = 'dhampir';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Deathless Nature', 'You don''t need to breathe.'
FROM lineages l WHERE l.slug = 'dhampir';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Spider Climb', 'You have a climbing speed equal to your walking speed. In addition, at 3rd level, you can move up, down, and across vertical surfaces and upside down along ceilings, while leaving your hands free.'
FROM lineages l WHERE l.slug = 'dhampir';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Vampiric Bite', 'Your fanged bite is a natural weapon, which counts as a simple melee weapon with which you are proficient. You add your Constitution modifier, instead of your Strength modifier, to the attack and damage rolls when you attack with this bite. It deals 1d4 piercing damage on a hit. While you are missing half or more of your hit points, you have advantage on attack rolls you make with this bite. When you use your bite and hit a creature that isn''t a Construct or an Undead, you can empower yourself in one of the following ways of your choice: You regain hit points equal to the piercing damage dealt by the bite OR You gain a bonus to the next ability check or attack roll you make; the bonus equals the piercing damage dealt by the bite. You can empower yourself with this bite a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l WHERE l.slug = 'dhampir';

-- Eladrin features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Step', 'As a bonus action, you can magically teleport up to 30 feet to an unoccupied space you can see. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. When you reach 3rd level, your Fey Step gains an additional effect based on your season; if the effect requires a saving throw, the DC equals 8 + your proficiency bonus + your Intelligence, Wisdom, or Charisma modifier (choose when you select this race).'
FROM lineages l WHERE l.slug = 'eladrin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Trance', 'You don''t need to sleep, and magic can''t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in a trancelike meditation, during which you remain conscious.'
FROM lineages l WHERE l.slug = 'eladrin';

-- Shadar-kai features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l WHERE l.slug = 'shadar-kai';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Necrotic Resistance', 'You have resistance to necrotic damage.'
FROM lineages l WHERE l.slug = 'shadar-kai';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Blessing of the Raven Queen', 'As a bonus action, you can magically teleport up to 30 feet to an unoccupied space you can see. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. Starting at 3rd level, you also gain resistance to all damage when you teleport using this trait. The resistance lasts until the start of your next turn. During that time, you appear ghostly and translucent.'
FROM lineages l WHERE l.slug = 'shadar-kai';

-- Kender features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fearless', 'You have advantage on saving throws you make to avoid or end the frightened condition on yourself. When you fail a saving throw to avoid or end the frightened condition on yourself, you can choose to succeed instead. Once you succeed on a saving throw in this way, you can''t do so again until you finish a long rest.'
FROM lineages l WHERE l.slug = 'kender';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Kender Curiosity', 'Thanks to your mystical connection to Krynn, you can use your action to make an object you can see within 30 feet of you teleport from where it is to your hand. The object can''t be worn or carried by another creature, and it can weigh no more than 20 pounds. Once you teleport an object with this trait, you can''t do so again until you finish a long rest.'
FROM lineages l WHERE l.slug = 'kender';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Taunt', 'You have an extraordinary ability to fluster creatures. As a bonus action, you can unleash a string of provoking words at a creature within 60 feet of yourself that can hear and understand you. The target must succeed on a Wisdom saving throw (DC 8 + your proficiency bonus + your Intelligence, Wisdom, or Charisma modifier [choose when you select this race]), or it has disadvantage on attack rolls against targets other than you until the start of your next turn. You can use this bonus action a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l WHERE l.slug = 'kender';

-- Thri-kreen features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Chameleon Carapace', 'While you aren''t wearing armor, your carapace gives you a base Armor Class of 13 + your Dexterity modifier. As an action, you can change the color of your carapace to match the color and texture of your surroundings, giving you advantage on Dexterity (Stealth) checks made to hide in those surroundings.'
FROM lineages l WHERE l.slug = 'thri-kreen';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l WHERE l.slug = 'thri-kreen';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Secondary Arms', 'You have two slightly smaller secondary arms below your primary pair of arms. The secondary arms can manipulate an object, open or close a door or container, pick up or set down a Tiny object, or wield a weapon that has the light property.'
FROM lineages l WHERE l.slug = 'thri-kreen';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sleepless', 'You do not require sleep and can choose to remain conscious during a long rest, though you must still refrain from strenuous activity to gain the benefit of the rest.'
FROM lineages l WHERE l.slug = 'thri-kreen';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Thri-kreen Telepathy', 'Without the assistance of magic, you can''t speak the non-thri-kreen languages you know. Instead, you use telepathy to convey your thoughts. You have the magical ability to transmit your thoughts mentally to willing creatures you can see within 120 feet of yourself. A contacted creature doesn''t need to share a language with you to understand your thoughts, but it must be able to understand at least one language. Your telepathic link to a creature is broken if you and the creature move more than 120 feet apart, if either of you is incapacitated, or if either of you mentally breaks the contact (no action required).'
FROM lineages l WHERE l.slug = 'thri-kreen';

-- Hexblood features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Ancestral Legacy', 'If you replace a race with this lineage, you can keep the following elements of that race: any skill proficiencies you gained from it and any climbing, flying, or swimming speed you gained from it. If you don''t keep any of those elements or you choose this lineage at character creation, you gain proficiency in two skills of your choice.'
FROM lineages l WHERE l.slug = 'hexblood';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l WHERE l.slug = 'hexblood';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Eerie Token', 'As a bonus action, you can harmlessly remove a lock of your hair, one of your nails, or one of your teeth. This token is imbued with magic until you finish a long rest. While the token is imbued in this way, you can take these actions: Telepathic Message (you can send a telepathic message to the creature holding or carrying the token, as long as you are within 10 miles of it), Remote Viewing (if you are within 10 miles of the token, you can enter a trance as an action), Spy (while in the trance, you can see and hear from the token as if you were located where it is).'
FROM lineages l WHERE l.slug = 'hexblood';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hex Magic', 'You can cast the disguise self and hex spells with this trait. Once you cast either of these spells with this trait, you can''t cast that spell with it again until you finish a long rest. You can also cast these spells using any spell slots you have. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this lineage).'
FROM lineages l WHERE l.slug = 'hexblood';

-- Reborn features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Ancestral Legacy', 'If you replace a race with this lineage, you can keep the following elements of that race: any skill proficiencies you gained from it and any climbing, flying, or swimming speed you gained from it. If you don''t keep any of those elements or you choose this lineage at character creation, you gain proficiency in two skills of your choice.'
FROM lineages l WHERE l.slug = 'reborn';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Deathless Nature', 'You have escaped death, a fact represented by the following benefits: You have advantage on saving throws against disease and being poisoned, and you have resistance to poison damage. You have advantage on death saving throws. You don''t need to eat, drink, or breathe. You don''t need to sleep, and magic can''t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in an inactive, motionless state, during which you retain consciousness.'
FROM lineages l WHERE l.slug = 'reborn';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Knowledge from a Past Life', 'You temporarily remember glimpses of the past, perhaps faded memories from ages ago or a previous life. When you make an ability check that uses a skill, you can roll a d6 immediately after seeing the number on the d20 and add the number on the d6 to the check. You can use this feature a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l WHERE l.slug = 'reborn';

-- Plasmoid features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of yourself as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l WHERE l.slug = 'plasmoid';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hold Breath', 'You can hold your breath for 1 hour.'
FROM lineages l WHERE l.slug = 'plasmoid';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Natural Resilience', 'You have resistance to acid and poison damage, and you have advantage on saving throws against being poisoned.'
FROM lineages l WHERE l.slug = 'plasmoid';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shape Self', 'As an action, you can reshape your body to give yourself a head, one or two arms, one or two legs, and makeshift hands and feet, or you can revert to a limbless blob. While you have a humanlike shape, you can wear clothing and armor made for a Humanoid of your size. As a bonus action, you can extrude a pseudopod that is up to 6 inches wide and 10 feet long or reabsorb it into your body. You can use this pseudopod to manipulate an object, open an unlocked door or container, stow or retrieve an item from an open container, or pour out the contents of a container. The pseudopod can''t attack, activate magic items, or carry more than 10 pounds.'
FROM lineages l WHERE l.slug = 'plasmoid';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Amorphous', 'You can move through a space as narrow as 1 inch wide without squeezing.'
FROM lineages l WHERE l.slug = 'plasmoid';

-- Giff features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Astral Spark', 'Your psychic connection to the Astral Plane enables you to mystically access a reservoir of experiences. Whenever you make an ability check using a skill, you can give yourself advantage on the check. You can use this feature a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l WHERE l.slug = 'giff';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Firearms Mastery', 'You have a mystical connection to firearms that traces back to the gods of the giff, who delighted in such weapons. You have proficiency with all firearms and ignore the loading property of any firearm. In addition, attacking at long range with a firearm doesn''t impose disadvantage on your attack roll.'
FROM lineages l WHERE l.slug = 'giff';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hippo Build', 'You have advantage on Strength-based attack rolls. In addition, you count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l WHERE l.slug = 'giff';

-- Hadozee features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Dexterous Feet', 'You can take the Use an Object action as a bonus action.'
FROM lineages l WHERE l.slug = 'hadozee';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Glide', 'When you fall at least 10 feet, you can use your reaction to extend your skin membranes to glide horizontally a number of feet equal to your walking speed, and you take 0 damage from the fall. You determine the direction of the glide.'
FROM lineages l WHERE l.slug = 'hadozee';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hadozee Resilience', 'The magic that runs in your veins heightens your natural defenses. When you take damage, you can use your reaction to roll a d6. Add your proficiency bonus to the number rolled, and reduce the damage you take by an amount equal to that total (minimum of 0 damage). You can use this trait a number of times equal to your proficiency bonus. You regain all expended uses when you finish a long rest.'
FROM lineages l WHERE l.slug = 'hadozee';

-- Autognome features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Armored Casing', 'You are encased in thin metal or some other durable material. While you aren''t wearing armor, your base Armor Class is 13 + your Dexterity modifier.'
FROM lineages l WHERE l.slug = 'autognome';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Built for Success', 'You can add a d4 to one attack roll, ability check, or saving throw you make, and you can do so after seeing the d20 roll but before the effects of the roll are resolved. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l WHERE l.slug = 'autognome';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Healing Machine', 'If the mending spell is cast on you, you can expend a Hit Die, roll it, and regain a number of hit points equal to the roll plus your Constitution modifier (minimum of 1 hit point). In addition, your creator designed you to benefit from common spells that preserve life but that normally don''t affect Constructs: cure wounds, healing word, mass cure wounds, mass healing word, and spare the dying.'
FROM lineages l WHERE l.slug = 'autognome';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mechanical Nature', 'You have resistance to poison damage and immunity to disease, and you have advantage on saving throws against being paralyzed or poisoned. You don''t need to eat, drink, or breathe.'
FROM lineages l WHERE l.slug = 'autognome';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sentry''s Rest', 'When you take a long rest, you spend at least 6 hours in an inactive, motionless state, instead of sleeping. In this state, you appear inert, but you remain conscious.'
FROM lineages l WHERE l.slug = 'autognome';

-- Duergar features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Superior Darkvision', 'Your darkvision has a radius of 120 feet.'
FROM lineages l WHERE l.slug = 'duergar';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Duergar Resilience', 'You have advantage on saving throws against illusions and against being charmed or paralyzed.'
FROM lineages l WHERE l.slug = 'duergar';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Duergar Magic', 'When you reach 3rd level, you can cast the enlarge/reduce spell on yourself once with this trait, using only the spell''s enlarge option. When you reach 5th level, you can cast the invisibility spell on yourself once with this trait. You don''t need material components for either spell, and you can''t cast them while you''re in direct sunlight, although sunlight has no effect on them once cast. You regain the ability to cast these spells with this trait when you finish a long rest. Intelligence is your spellcasting ability for these spells.'
FROM lineages l WHERE l.slug = 'duergar';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sunlight Sensitivity', 'You have disadvantage on attack rolls and on Wisdom (Perception) checks that rely on sight when you, the target of your attack, or whatever you are trying to perceive is in direct sunlight.'
FROM lineages l WHERE l.slug = 'duergar';

-- Deep Gnome features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Superior Darkvision', 'Your darkvision has a radius of 120 feet.'
FROM lineages l WHERE l.slug = 'deep-gnome';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Gnome Cunning', 'You have advantage on Intelligence, Wisdom, and Charisma saving throws against magic.'
FROM lineages l WHERE l.slug = 'deep-gnome';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Stone Camouflage', 'You have advantage on Dexterity (Stealth) checks to hide in rocky terrain.'
FROM lineages l WHERE l.slug = 'deep-gnome';

-- Sea Elf features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'sea-elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws against being charmed, and magic can''t put you to sleep.'
FROM lineages l WHERE l.slug = 'sea-elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Trance', 'Elves don''t need to sleep. Instead, they meditate deeply, remaining semiconscious, for 4 hours a day. While meditating, you can dream after a fashion. After resting in this way, you gain the same benefit that a human does from 8 hours of sleep.'
FROM lineages l WHERE l.slug = 'sea-elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sea Elf Training', 'You have proficiency with the spear, trident, light crossbow, and net.'
FROM lineages l WHERE l.slug = 'sea-elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Child of the Sea', 'You have a swimming speed of 30 feet, and you can breathe air and water.'
FROM lineages l WHERE l.slug = 'sea-elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Friend of the Sea', 'Using gestures and sounds, you can communicate simple ideas with any Beast that has a swimming speed.'
FROM lineages l WHERE l.slug = 'sea-elf';

-- Astral Elf features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l WHERE l.slug = 'astral-elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l WHERE l.slug = 'astral-elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Astral Fire', 'You know one of the following cantrips of your choice: dancing lights, light, or sacred flame. Intelligence, Wisdom, or Charisma is your spellcasting ability for it (choose when you select this race).'
FROM lineages l WHERE l.slug = 'astral-elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Starlight Step', 'As a bonus action, you can magically teleport up to 30 feet to an unoccupied space you can see. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l WHERE l.slug = 'astral-elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Trance', 'You don''t need to sleep, and magic can''t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in a trancelike meditation, during which you retain consciousness.'
FROM lineages l WHERE l.slug = 'astral-elf';

-- Locathah features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Natural Armor', 'You have tough, scaly skin. When you aren''t wearing armor, your AC is 12 + your Dexterity modifier. You can use your natural armor to determine your AC if the armor you wear would leave you with a lower AC. A shield''s benefits apply as normal while you use your natural armor.'
FROM lineages l WHERE l.slug = 'locathah';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Observant & Athletic', 'You have proficiency in the Athletics and Perception skills.'
FROM lineages l WHERE l.slug = 'locathah';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Leviathan Will', 'You have advantage on saving throws against being frightened.'
FROM lineages l WHERE l.slug = 'locathah';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Limited Amphibiousness', 'You can breathe air and water, but you need to be submerged at least once every 4 hours to avoid suffocating.'
FROM lineages l WHERE l.slug = 'locathah';

-- Verdan features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Black Blood Healing', 'The black blood that is a sign of your people''s connection to That-Which-Endures boosts your natural healing. When you roll a 1 or 2 on any Hit Die you spend at the end of a short rest, you can reroll the die and must use the new roll.'
FROM lineages l WHERE l.slug = 'verdan';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Limited Telepathy', 'You can telepathically speak to any creature you can see within 30 feet of you. You don''t need to share a language with the creature for it to understand your telepathic messages, but the creature must be able to understand at least one language. This process of communication is slow and limited, allowing you to transmit and receive only simple ideas and straightforward concepts.'
FROM lineages l WHERE l.slug = 'verdan';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Persuasive', 'You have proficiency in the Persuasion skill.'
FROM lineages l WHERE l.slug = 'verdan';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Telepathic Insight', 'Your mind''s connection to the world around you strengthens your will. You have advantage on all Wisdom and Charisma saving throws.'
FROM lineages l WHERE l.slug = 'verdan';

-- Aven features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Flight', 'You have a flying speed of 30 feet. To use this speed, you can''t be wearing medium or heavy armor.'
FROM lineages l WHERE l.slug = 'aven';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hawkeyed', 'You have proficiency in the Perception skill. In addition, attacking at long range doesn''t impose disadvantage on your ranged weapon attack rolls.'
FROM lineages l WHERE l.slug = 'aven';

-- Khenra features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Khenra Twins', 'If your twin is alive and you can see your twin, whenever you roll a 1 on an attack roll, ability check, or saving throw, you can reroll the die and must use the new roll. If your twin is dead (or if you were born without a twin), you can''t be frightened.'
FROM lineages l WHERE l.slug = 'khenra';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Khenra Weapon Training', 'You have proficiency with the khopesh, spear, and javelin.'
FROM lineages l WHERE l.slug = 'khenra';

-- Kor features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Kor Climbing', 'You have a climbing speed of 30 feet.'
FROM lineages l WHERE l.slug = 'kor';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Lucky', 'When you roll a 1 on an attack roll, ability check, or saving throw, you can reroll the die and must use the new roll.'
FROM lineages l WHERE l.slug = 'kor';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Brave', 'You have advantage on saving throws against being frightened.'
FROM lineages l WHERE l.slug = 'kor';

-- Naga features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Speed', 'Your base walking speed is 30 feet.'
FROM lineages l WHERE l.slug = 'naga';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Naga Weapon Training', 'You have proficiency with the shortsword, trident, and net.'
FROM lineages l WHERE l.slug = 'naga';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Poison Affinity', 'You have advantage on saving throws against being poisoned, and you have resistance to poison damage.'
FROM lineages l WHERE l.slug = 'naga';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Poison Immunity', 'You are immune to poison damage and the poisoned condition.'
FROM lineages l WHERE l.slug = 'naga';

-- Siren features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Flight', 'You have a flying speed of 30 feet. To use this speed, you can''t be wearing medium or heavy armor.'
FROM lineages l WHERE l.slug = 'siren';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Siren''s Song', 'You know the friends cantrip and can cast it without material components.'
FROM lineages l WHERE l.slug = 'siren';

-- Vampire features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l WHERE l.slug = 'vampire';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Deathless Nature', 'You don''t need to breathe.'
FROM lineages l WHERE l.slug = 'vampire';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Spider Climb', 'You have a climbing speed equal to your walking speed. In addition, at 3rd level, you can move up, down, and across vertical surfaces and upside down along ceilings, while leaving your hands free.'
FROM lineages l WHERE l.slug = 'vampire';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Vampiric Bite', 'Your fanged bite is a natural weapon with which you are proficient. You add your Constitution modifier, instead of your Strength modifier, to the attack and damage rolls when you attack with this bite. It deals 1d4 piercing damage on a hit. While you are missing half or more of your hit points, you have advantage on attack rolls you make with this bite. When you use your bite and hit a creature that isn''t a Construct or an Undead, you can empower yourself in one of the following ways: regain hit points equal to the damage dealt OR gain a bonus to the next ability check or attack roll equal to the damage dealt. You can empower yourself a number of times equal to your proficiency bonus, regaining uses on a long rest.'
FROM lineages l WHERE l.slug = 'vampire';

-- Aetherborn features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'aetherborn';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Born of Aether', 'You have resistance to necrotic damage.'
FROM lineages l WHERE l.slug = 'aetherborn';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Menacing', 'You have proficiency in the Intimidation skill.'
FROM lineages l WHERE l.slug = 'aetherborn';

-- Viashino features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Bite', 'Your fanged maw is a natural weapon, which you can use to make unarmed strikes. If you hit with it, you deal piercing damage equal to 1d4 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l WHERE l.slug = 'viashino';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Lashing Tail', 'Your tail is a natural weapon, which you can use to make unarmed strikes. If you hit with it, you deal bludgeoning damage equal to 1d4 + your Strength modifier.'
FROM lineages l WHERE l.slug = 'viashino';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Wiry Frame', 'Your lean frame and quick reflexes help you avoid harm. When you aren''t wearing armor, your AC is 13 + your Dexterity modifier. You can use your natural armor to determine your AC if the armor you wear would leave you with a lower AC. A shield''s benefits apply as normal while you use your natural armor.'
FROM lineages l WHERE l.slug = 'viashino';

-- Dwarf features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'Accustomed to life underground, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'dwarf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Dwarven Resilience', 'You have advantage on saving throws against poison, and you have resistance against poison damage.'
FROM lineages l WHERE l.slug = 'dwarf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Dwarven Combat Training', 'You have proficiency with the battleaxe, handaxe, light hammer, and warhammer.'
FROM lineages l WHERE l.slug = 'dwarf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Tool Proficiency', 'You gain proficiency with the artisan''s tools of your choice: smith''s tools, brewer''s supplies, or mason''s tools.'
FROM lineages l WHERE l.slug = 'dwarf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Stonecunning', 'Whenever you make an Intelligence (History) check related to the origin of stonework, you are considered proficient in the History skill and add double your proficiency bonus to the check, instead of your normal proficiency bonus.'
FROM lineages l WHERE l.slug = 'dwarf';

-- Elf features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'Accustomed to twilit forests and the night sky, you have superior vision in dark and dim conditions. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l WHERE l.slug = 'elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Keen Senses', 'You have proficiency in the Perception skill.'
FROM lineages l WHERE l.slug = 'elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws against being charmed, and magic can''t put you to sleep.'
FROM lineages l WHERE l.slug = 'elf';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Trance', 'Elves don''t need to sleep. Instead, they meditate deeply, remaining semiconscious, for 4 hours a day. While meditating, you can dream after a fashion. After resting in this way, you gain the same benefit that a human does from 8 hours of sleep.'
FROM lineages l WHERE l.slug = 'elf';

-- Halfling features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Lucky', 'When you roll a 1 on an attack roll, ability check, or saving throw, you can reroll the die and must use the new roll.'
FROM lineages l WHERE l.slug = 'halfling';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Brave', 'You have advantage on saving throws against being frightened.'
FROM lineages l WHERE l.slug = 'halfling';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Halfling Nimbleness', 'You can move through the space of any creature that is of a size larger than yours.'
FROM lineages l WHERE l.slug = 'halfling';

-- Human features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Extra Language', 'You can speak, read, and write one extra language of your choice. Humans typically learn the languages of other peoples they deal with, including obscure dialects.'
FROM lineages l WHERE l.slug = 'human';

-- Eladrin features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l WHERE l.slug = 'eladrin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l WHERE l.slug = 'eladrin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Step', 'As a bonus action, you can magically teleport up to 30 feet to an unoccupied space you can see. Once you use this trait, you can''t do so again until you finish a short or long rest. When you reach 3rd level, your Fey Step gains an additional effect based on your season.'
FROM lineages l WHERE l.slug = 'eladrin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Keen Senses', 'You have proficiency in the Perception skill.'
FROM lineages l WHERE l.slug = 'eladrin';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Trance', 'You don''t need to sleep, and magic can''t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in a trancelike meditation, during which you retain consciousness.'
FROM lineages l WHERE l.slug = 'eladrin';

-- Revenant features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Relentless Nature', 'Your DM assigns a goal to you or you choose one with your DM''s approval. You have advantage on saving throws to avoid or end any effect that turns you undead, and you have advantage on death saving throws.'
FROM lineages l WHERE l.slug = 'revenant-ua';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Vengeful Tracker', 'You know the distance to and direction of any creature against which you seek revenge, even if the creature and you are on different planes of existence. If the creature being tracked is destroyed, the revenant knows.'
FROM lineages l WHERE l.slug = 'revenant-ua';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Regeneration', 'At the start of each of your turns, if you have at least 1 hit point remaining, you regain 1 hit point.'
FROM lineages l WHERE l.slug = 'revenant-ua';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Rejuvenation', 'When your revenant body drops to 0 hit points, your soul lingers. After 24 hours, the soul inhabits and animates another humanoid corpse on the same plane of existence and regains all its hit points.'
FROM lineages l WHERE l.slug = 'revenant-ua';

-- Glitchling features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Reality Glitch', 'When you make an attack roll, ability check, or saving throw, you can roll an additional d20. You can choose which of the d20s is used for the attack roll, ability check, or saving throw. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l WHERE l.slug = 'glitchling-ua';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Planar Phasing', 'You can cast misty step without expending a spell slot. Once you cast the spell using this trait, you can''t cast it again until you finish a short or long rest.'
FROM lineages l WHERE l.slug = 'glitchling-ua';

-- Custom Lineage features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Creature Type', 'You are a humanoid. You determine your appearance and whether you resemble any of your kin.'
FROM lineages l WHERE l.slug = 'custom';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Size', 'You are Small or Medium (your choice).'
FROM lineages l WHERE l.slug = 'custom';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Feat', 'You gain one feat of your choice for which you qualify.'
FROM lineages l WHERE l.slug = 'custom';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Variable Trait', 'You gain either darkvision with a range of 60 feet or proficiency in one skill of your choice.'
FROM lineages l WHERE l.slug = 'custom';

-- Air Genasi features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. Your ties to the Elemental Plane of Air make your darkvision unusual: everything you see in darkness is in a shade of blue.'
FROM lineages l WHERE l.slug = 'air-genasi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Unending Breath', 'You can hold your breath indefinitely while you''re not incapacitated.'
FROM lineages l WHERE l.slug = 'air-genasi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Lightning Resistance', 'You have resistance to lightning damage.'
FROM lineages l WHERE l.slug = 'air-genasi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mingle with the Wind', 'You know the shocking grasp cantrip. Once you reach 3rd level, you can cast the feather fall spell once with this trait, and you regain the ability to cast it when you finish a long rest. Constitution is your spellcasting ability for these spells.'
FROM lineages l WHERE l.slug = 'air-genasi';

-- Earth Genasi features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. Your ties to the Elemental Plane of Earth make your darkvision unusual: everything you see in darkness is in a shade of brown.'
FROM lineages l WHERE l.slug = 'earth-genasi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Earth Walk', 'You can move across difficult terrain made of earth or stone without expending extra movement.'
FROM lineages l WHERE l.slug = 'earth-genasi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Merge with Stone', 'You know the blade ward cantrip. You can cast it as normal, and you can also cast it as a bonus action a number of times equal to your proficiency bonus, regaining all expended uses when you finish a long rest. Starting at 5th level, you can cast the pass without trace spell with this trait, without requiring a material component. Once you cast that spell with this trait, you can''t do so again until you finish a long rest. Constitution is your spellcasting ability for these spells.'
FROM lineages l WHERE l.slug = 'earth-genasi';

-- Fire Genasi features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. Your ties to the Elemental Plane of Fire make your darkvision unusual: everything you see in darkness is in a shade of red.'
FROM lineages l WHERE l.slug = 'fire-genasi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fire Resistance', 'You have resistance to fire damage.'
FROM lineages l WHERE l.slug = 'fire-genasi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Reach to the Blaze', 'You know the produce flame cantrip. Once you reach 3rd level, you can cast the burning hands spell once with this trait as a 1st-level spell, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for these spells.'
FROM lineages l WHERE l.slug = 'fire-genasi';

-- Water Genasi features
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. Your ties to the Elemental Plane of Water make your darkvision unusual: everything you see in darkness is in a shade of green.'
FROM lineages l WHERE l.slug = 'water-genasi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Acid Resistance', 'You have resistance to acid damage.'
FROM lineages l WHERE l.slug = 'water-genasi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Amphibious', 'You can breathe air and water.'
FROM lineages l WHERE l.slug = 'water-genasi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Swimming Speed', 'You have a swimming speed of 30 feet.'
FROM lineages l WHERE l.slug = 'water-genasi';

INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Call to the Wave', 'You know the acid splash cantrip. When you reach 3rd level, you can cast the create or destroy water spell as a 2nd-level spell once with this trait, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for these spells.'
FROM lineages l WHERE l.slug = 'water-genasi';

-- UA versions - basic features (playtest versions, features may differ from official) - same slugs but different book
INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'UA Playtest Version', 'This is an Unearthed Arcana playtest version. Features may differ from the official published version. Consult the UA document for full details.'
FROM lineages l, core_books b WHERE l.source_book_id = b.id AND b.code = 'UA' AND l.slug IN ('autognome', 'giff', 'hadozee', 'kender', 'owlin', 'plasmoid', 'harengon', 'thri-kreen', 'viashino');

CREATE INDEX IF NOT EXISTS idx_lineage_features_lineage ON lineage_features(lineage_id);
CREATE INDEX IF NOT EXISTS idx_lineage_features_level ON lineage_features(available_at_level);

DROP VIEW IF EXISTS v_lineage_features;
CREATE VIEW v_lineage_features AS
SELECT l.id AS lineage_id, l.name AS lineage_name, lf.name AS feature_name, lf.available_at_level, lf.description
FROM lineages l
JOIN lineage_features lf ON l.id = lf.lineage_id
ORDER BY l.id, lf.available_at_level, lf.id;
