DROP TABLE IF EXISTS sublineage_features;
CREATE TABLE sublineage_features (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sublineage_id INTEGER NOT NULL,
    available_at_level INTEGER NOT NULL DEFAULT 1,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (sublineage_id) REFERENCES sublineages(id) ON DELETE CASCADE
);

-- Dwarf sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Dwarven Toughness', 'Your hit point maximum increases by 1, and it increases by 1 every time you gain a level.'
FROM sublineages s WHERE s.slug = 'hill-dwarf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Dwarven Armor Training', 'You have proficiency with light and medium armor.'
FROM sublineages s WHERE s.slug = 'mountain-dwarf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Warder''s Intuition', 'Whenever you make an Intelligence (Investigation) check or an Ability Check involving Thieves'' Tools, you can roll a d4 and add the number rolled to the total ability check.'
FROM sublineages s WHERE s.slug = 'mark-of-warding';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Wards and Seals', 'You can cast the Alarm and Mage Armor spells with this trait. Starting at 3rd level, you can also cast the Arcane Lock spell with it. Once you cast either spell with this trait, you can''t cast that spell again until you finish a Long Rest. Intelligence is your Spellcasting Ability for these spells, and you don''t require material components when you cast them with this trait.'
FROM sublineages s WHERE s.slug = 'mark-of-warding';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Spells of the Mark', 'If you have the Spellcasting or Pact Magic class feature, the spells on the Mark of Warding Spells table are added to the spell list of your Spellcasting class. (1st: Alarm, Armor of Agathys; 2nd: Arcane Lock, Knock; 3rd: Glyph of Warding, Magic Circle; 4th: Leomund''s Secret Chest, Mordenkainen''s Faithful Hound; 5th: Antilife Shell)'
FROM sublineages s WHERE s.slug = 'mark-of-warding';

-- Elf sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Cantrip', 'You know one cantrip of your choice from the Wizard spell list. Intelligence is your spellcasting ability for it.'
FROM sublineages s WHERE s.slug = 'high-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Elf Weapon Training', 'You have proficiency with the longsword, shortsword, shortbow, and longbow.'
FROM sublineages s WHERE s.slug = 'high-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Extra Language', 'You can read, speak, and write one additional language of your choice.'
FROM sublineages s WHERE s.slug = 'high-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Elf Weapon Training', 'You have proficiency with the longsword, shortsword, shortbow, and longbow.'
FROM sublineages s WHERE s.slug = 'wood-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Fleet of Foot', 'Your base walking speed increases to 35 feet.'
FROM sublineages s WHERE s.slug = 'wood-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Mask of the Wild', 'You can attempt to hide even when you are only lightly obscured by foliage, heavy rain, falling snow, mist, and other natural phenomena.'
FROM sublineages s WHERE s.slug = 'wood-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Mask of the Wild', 'You can attempt to hide even when you are only lightly obscured by foliage, heavy rain, falling snow, mist, and other natural phenomena.'
FROM sublineages s WHERE s.slug = 'wood-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Naturally Stealthy', 'You can attempt to hide even when you are obscured only by a creature that is at least one size larger than you.'
FROM sublineages s WHERE s.slug = 'lightfoot-halfling';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Stout Resilience', 'You have advantage on saving throws against poison, and you have resistance against poison damage.'
FROM sublineages s WHERE s.slug = 'stout-halfling';
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Infernal Legacy', 'You know the thaumaturgy cantrip. When you reach 3rd level, you can cast the hellish rebuke spell as a 2nd-level spell once with this trait and regain the ability to do so when you finish a long rest. When you reach 5th level, you can cast the darkness spell once with this trait and regain the ability to do so when you finish a long rest. Charisma is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'asmodeus-tiefling';

-- Dragonborn sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Acid Breath Weapon', 'When you use your Breath Weapon, each creature in the area of the exhalation must make a Dexterity saving throw. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 acid damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level.'
FROM sublineages s WHERE s.slug = 'black-dragonborn';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Lightning Breath Weapon', 'When you use your Breath Weapon, each creature in the area of the exhalation must make a Dexterity saving throw. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 lightning damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level.'
FROM sublineages s WHERE s.slug = 'blue-dragonborn';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Fire Breath Weapon', 'When you use your Breath Weapon, each creature in the area of the exhalation must make a Dexterity saving throw. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 fire damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level.'
FROM sublineages s WHERE s.slug = 'brass-dragonborn';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Lightning Breath Weapon', 'When you use your Breath Weapon, each creature in the area of the exhalation must make a Dexterity saving throw. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 lightning damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level.'
FROM sublineages s WHERE s.slug = 'bronze-dragonborn';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Acid Breath Weapon', 'When you use your Breath Weapon, each creature in the area of the exhalation must make a Dexterity saving throw. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 acid damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level.'
FROM sublineages s WHERE s.slug = 'copper-dragonborn';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Fire Breath Weapon', 'When you use your Breath Weapon, each creature in the area of the exhalation must make a Dexterity saving throw. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 fire damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level.'
FROM sublineages s WHERE s.slug = 'gold-dragonborn';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Poison Breath Weapon', 'When you use your Breath Weapon, each creature in the area of the exhalation must make a Dexterity saving throw. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 poison damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level.'
FROM sublineages s WHERE s.slug = 'green-dragonborn';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Fire Breath Weapon', 'When you use your Breath Weapon, each creature in the area of the exhalation must make a Dexterity saving throw. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 fire damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level.'
FROM sublineages s WHERE s.slug = 'red-dragonborn';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Cold Breath Weapon', 'When you use your Breath Weapon, each creature in the area of the exhalation must make a Dexterity saving throw. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 cold damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level.'
FROM sublineages s WHERE s.slug = 'silver-dragonborn';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Cold Breath Weapon', 'When you use your Breath Weapon, each creature in the area of the exhalation must make a Dexterity saving throw. The DC for this saving throw equals 8 + your Constitution modifier + your proficiency bonus. A creature takes 2d6 cold damage on a failed save, and half as much damage on a successful one. The damage increases to 3d6 at 6th level, 4d6 at 11th level, and 5d6 at 16th level.'
FROM sublineages s WHERE s.slug = 'white-dragonborn';

-- Gnome sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Natural Illusionist', 'You know the minor illusion cantrip. Intelligence is your spellcasting ability for it.'
FROM sublineages s WHERE s.slug = 'forest-gnome';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Speak with Small Beasts', 'Through sounds and gestures, you can communicate simple ideas with Small or smaller beasts. Forest gnomes love animals and often keep squirrels, badgers, rabbits, moles, woodpeckers, and other creatures as beloved pets.'
FROM sublineages s WHERE s.slug = 'forest-gnome';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Artificer''s Lore', 'Whenever you make an Intelligence (History) check related to magic items, alchemical objects, or technological devices, you can add twice your proficiency bonus, instead of any proficiency bonus you normally apply.'
FROM sublineages s WHERE s.slug = 'rock-gnome';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Tinker', 'You have proficiency with artisan''s tools (tinker''s tools). Using those tools, you can spend 1 hour and 10 gp worth of materials to construct a Tiny clockwork device (AC 5, 1 hp). The device ceases to function after 24 hours (unless you spend 1 hour repairing it to keep the device functioning), or when you use your action to dismantle it; at that time, you can reclaim the materials used to create it. You can have up to three such devices active at a time. When you create a device, choose one of the following options: Clockwork Toy, Fire Starter, Music Box.'
FROM sublineages s WHERE s.slug = 'rock-gnome';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Gifted Scribe', 'You are proficient in the Calligrapher''s Supplies and Cartographer''s tools. You can create three special inks with the following properties:'
FROM sublineages s WHERE s.slug = 'mark-of-scribing';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Scribe''s Insight', 'Whenever you make an Intelligence (Investigation) check or an Ability Check involving Calligrapher''s Supplies or Cartographer''s tools, you can roll a d4 and add the number rolled to the total ability check.'
FROM sublineages s WHERE s.slug = 'mark-of-scribing';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Spells of the Mark', 'If you have the Spellcasting or Pact Magic class feature, the spells on the Mark of Scribing Spells table are added to the spell list of your Spellcasting class. (1st: Comprehend Languages, Identify; 2nd: Locate Object, Magic Mouth; 3rd: Glyph of Warding, Nondetection; 4th: Arcane Eye, Confusion; 5th: Legend Lore)'
FROM sublineages s WHERE s.slug = 'mark-of-scribing';

-- Half-Elf sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Cantrip', 'You know one cantrip of your choice from the wizard spell list. Intelligence is your spellcasting ability for it.'
FROM sublineages s WHERE s.slug = 'high-half-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Elf Weapon Training', 'You have proficiency with the longsword, shortsword, shortbow, and longbow.'
FROM sublineages s WHERE s.slug = 'high-half-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Fleet of Foot', 'Your base walking speed increases to 35 feet.'
FROM sublineages s WHERE s.slug = 'wood-half-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Mask of the Wild', 'You can attempt to hide even when you are only lightly obscured by foliage, heavy rain, falling snow, mist, and other natural phenomena.'
FROM sublineages s WHERE s.slug = 'wood-half-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Superior Darkvision', 'Your darkvision has a radius of 120 feet.'
FROM sublineages s WHERE s.slug = 'drow-half-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Sunlight Sensitivity', 'You have disadvantage on attack rolls and on Wisdom (Perception) checks that rely on sight when you, the target of your attack, or whatever you are trying to perceive is in direct sunlight.'
FROM sublineages s WHERE s.slug = 'drow-half-elf';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Drow Magic', 'You know the dancing lights cantrip. When you reach 3rd level, you can cast the faerie fire spell once per day. When you reach 5th level, you can also cast the darkness spell once per day. Charisma is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'drow-half-elf';

-- Half-Orc sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Hunter''s Intuition', 'When you roll a 1 or 2 on a d6 after making an attack roll, ability check, or saving throw, you can reroll the die and must use the new roll.'
FROM sublineages s WHERE s.slug = 'mark-of-finding';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Spells of the Mark', 'If you have the Spellcasting or Pact Magic class feature, the spells on the Mark of Finding Spells table are added to the spell list of your Spellcasting class. (1st: Hunter''s Mark, Identify; 2nd: Locate Animals or Plants, Locate Object; 3rd: Clairvoyance, Speak with Animals; 4th: Locate Creature, Stone Shape; 5th: Commune with Nature)'
FROM sublineages s WHERE s.slug = 'mark-of-finding';

-- Aasimar sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Radiant Soul', 'Starting at 3rd level, you can use your action to unleash the divine energy within yourself, causing your eyes to glimmer and two luminous, incorporeal wings to sprout from your back. Your transformation lasts for 1 minute or until you end it as a bonus action. During it, you have a flying speed of 30 feet, and once on each of your turns, you can deal extra radiant damage to one target when you deal damage with an attack or a spell. The extra radiant damage equals your level. Once you use this trait, you can''t use it again until you finish a long rest.'
FROM sublineages s WHERE s.slug = 'protector-aasimar';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Radiant Consumption', 'Starting at 3rd level, you can use your action to unleash the divine energy within yourself, causing a searing light to radiate from you. For 1 minute, bright light shines from you in a 10-foot radius, and dim light shines 10 feet beyond that. Whenever an enemy creature starts its turn in the bright light, the creature takes radiant damage equal to half your level (rounded up). In addition, for the duration, you have advantage on saving throws against spells cast by creatures in the bright light. Once you use this trait, you can''t use it again until you finish a long rest.'
FROM sublineages s WHERE s.slug = 'scourge-aasimar';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Necrotic Shroud', 'Starting at 3rd level, you can use your action to unleash the divine energy within yourself, causing your eyes to turn into pools of darkness and two skeletal, ghostly, flightless wings to sprout from your back. The instant you transform, other creatures within 10 feet of you that can see you must each succeed on a Charisma saving throw (DC 8 + your proficiency bonus + your Charisma modifier) or become frightened of you until the end of your next turn. Your transformation lasts for 1 minute or until you end it as a bonus action. During it, once on each of your turns, you can deal extra necrotic damage to one target when you deal damage with an attack or a spell. The extra necrotic damage equals your level. Once you use this trait, you can''t use it again until you finish a long rest.'
FROM sublineages s WHERE s.slug = 'fallen-aasimar';

-- Goliath sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Heads Up', 'When you are hit by an attack, you can use your reaction to reduce the damage by an amount equal to your proficiency bonus (minimum of 1).'
FROM sublineages s WHERE s.slug = 'cloud-goliath';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Fire''s Burn', 'When you are hit by a melee attack, you can use your reaction to deal fire damage to the attacker equal to your proficiency bonus (minimum of 1).'
FROM sublineages s WHERE s.slug = 'fire-goliath';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Frost''s Chill', 'When you are hit by a melee attack, you can use your reaction to deal cold damage to the attacker equal to your proficiency bonus (minimum of 1).'
FROM sublineages s WHERE s.slug = 'frost-goliath';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Hill''s Toughness', 'Your hit point maximum increases by 1, and it increases by 1 every time you gain a level.'
FROM sublineages s WHERE s.slug = 'hill-goliath';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Stone''s Endurance', 'You can focus yourself to occasionally shrug off injury. When you take damage, you can use your reaction to roll a d12. Add your Constitution modifier to the number rolled, and reduce the damage by that total. After you use this trait, you can''t use it again until you finish a short or long rest.'
FROM sublineages s WHERE s.slug = 'stone-goliath';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Storm''s Thunder', 'When you are hit by a melee attack, you can use your reaction to deal thunder damage to the attacker equal to your proficiency bonus (minimum of 1).'
FROM sublineages s WHERE s.slug = 'storm-goliath';

-- Lizardfolk sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Swamp Camouflage', 'You have advantage on Dexterity (Stealth) checks made to hide in swampy terrain.'
FROM sublineages s WHERE s.slug = 'green-lizardfolk';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Hold Breath', 'You can hold your breath for up to 15 minutes at a time.'
FROM sublineages s WHERE s.slug = 'black-lizardfolk';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Underwater Adaptation', 'You can breathe underwater, and you have a swimming speed equal to your walking speed.'
FROM sublineages s WHERE s.slug = 'gray-lizardfolk';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Desert Camouflage', 'You have advantage on Dexterity (Stealth) checks made to hide in desert terrain.'
FROM sublineages s WHERE s.slug = 'poison-dusk-lizardfolk';

-- Tabaxi sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Skill Versatility', 'You gain proficiency in two skills of your choice.'
FROM sublineages s WHERE s.slug = 'leopard-tabaxi';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Skill Versatility', 'You gain proficiency in two skills of your choice.'
FROM sublineages s WHERE s.slug = 'tiger-tabaxi';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Skill Versatility', 'You gain proficiency in two skills of your choice.'
FROM sublineages s WHERE s.slug = 'jaguar-tabaxi';

-- Triton sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Emissary of the Sea', 'Aquatic beasts have an extraordinary affinity with your people. You can communicate simple ideas with any of them. In battle, they are unlikely to attack you unless you attack them first.'
FROM sublineages s WHERE s.slug = 'blue-triton';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Emissary of the Sea', 'Aquatic beasts have an extraordinary affinity with your people. You can communicate simple ideas with any of them. In battle, they are unlikely to attack you unless you attack them first.'
FROM sublineages s WHERE s.slug = 'black-triton';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Emissary of the Sea', 'Aquatic beasts have an extraordinary affinity with your people. You can communicate simple ideas with any of them. In battle, they are unlikely to attack you unless you attack them first.'
FROM sublineages s WHERE s.slug = 'green-triton';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Emissary of the Sea', 'Aquatic beasts have an extraordinary affinity with your people. You can communicate simple ideas with any of them. In battle, they are unlikely to attack you unless you attack them first.'
FROM sublineages s WHERE s.slug = 'white-triton';

-- Additional Tiefling sublineage features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Legacy of Maladomini', 'You know the ray of sickness cantrip. Once you reach 3rd level, you can cast the bestow curse spell once per day as a 3rd-level spell. Once you reach 5th level, you can also cast the vampiric touch spell once per day. Charisma is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'baalzebul-tiefling';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Legacy of Dis', 'You know the false life cantrip. Once you reach 3rd level, you can cast the disguise self spell once per day. Once you reach 5th level, you can also cast the invisibility spell once per day. Charisma is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'dispater-tiefling';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Legacy of Phlegethos', 'You know the charm person cantrip. Once you reach 3rd level, you can cast the enthrall spell once per day. Once you reach 5th level, you can also cast the suggestion spell once per day. Charisma is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'fierna-tiefling';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Legacy of Malbolge', 'You know the minor illusion cantrip. Once you reach 3rd level, you can cast the alter self spell once per day. Once you reach 5th level, you can also cast the major image spell once per day. Charisma is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'glasya-tiefling';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Legacy of Stygia', 'You know the ray of frost cantrip. Once you reach 3rd level, you can cast the protection from evil and good spell once per day. Once you reach 5th level, you can also cast the cone of cold spell once per day. Charisma is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'levistus-tiefling';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Legacy of Minauros', 'You know the mage hand cantrip. Once you reach 3rd level, you can cast the animate dead spell once per day. Once you reach 5th level, you can also cast the bestow curse spell once per day. Charisma is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'mammon-tiefling';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Legacy of Cania', 'You know the chill touch cantrip. Once you reach 3rd level, you can cast the ray of sickness spell once per day. Once you reach 5th level, you can also cast the cone of cold spell once per day. Charisma is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'mephistopheles-tiefling';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Legacy of Avernus', 'You know the searing smite cantrip. Once you reach 3rd level, you can cast the branding smite spell once per day. Once you reach 5th level, you can also cast the fireball spell once per day. Charisma is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'zariel-tiefling';

-- Air Genasi features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Unending Breath', 'You can hold your breath indefinitely while you''re not incapacitated.'
FROM sublineages s WHERE s.slug = 'air-genasi';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Mingle with the Wind', 'You can cast the levitate spell once with this trait, requiring no material components, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for this spell.'
FROM sublineages s WHERE s.slug = 'air-genasi';

-- Earth Genasi features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Earth Walk', 'You can move across difficult terrain made of earth or stone without expending extra movement.'
FROM sublineages s WHERE s.slug = 'earth-genasi';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Merge with Stone', 'You can cast the pass without trace spell once with this trait, requiring no material components, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for this spell.'
FROM sublineages s WHERE s.slug = 'earth-genasi';

-- Fire Genasi features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM sublineages s WHERE s.slug = 'fire-genasi';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Fire Resistance', 'You have resistance to fire damage.'
FROM sublineages s WHERE s.slug = 'fire-genasi';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Reach to the Blaze', 'You know the produce flame cantrip. Once you reach 3rd level, you can cast the burning hands spell once with this trait as a 1st-level spell, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'fire-genasi';

-- Water Genasi features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Acid Resistance', 'You have resistance to acid damage.'
FROM sublineages s WHERE s.slug = 'water-genasi';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Amphibious', 'You can breathe air and water.'
FROM sublineages s WHERE s.slug = 'water-genasi';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Swim', 'You have a swimming speed of 30 feet.'
FROM sublineages s WHERE s.slug = 'water-genasi';

INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Call to the Wave', 'You know the shape water cantrip. When you reach 3rd level, you can cast the create or destroy water spell as a 2nd-level spell once with this trait, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for these spells.'
FROM sublineages s WHERE s.slug = 'water-genasi';

-- Beasthide Shifter features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Shifting Feature', 'Whenever you shift, you gain 1d6 additional temporary hit points. While shifted, you have a +1 bonus to your Armor Class.'
FROM sublineages s WHERE s.slug = 'beasthide-shifter';

-- Longtooth Shifter features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Shifting Feature', 'While shifted, you can use your elongated fangs to make an unarmed strike as a bonus action. If you hit with your fangs, you can deal piercing damage equal to 1d6 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.'
FROM sublineages s WHERE s.slug = 'longtooth-shifter';

-- Swiftstride Shifter features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Shifting Feature', 'While shifted, your walking speed increases by 10 feet. Additionally, you can move up to 10 feet as a reaction when a creature ends its turn within 5 feet of you. This reactive movement doesn''t provoke opportunity attacks.'
FROM sublineages s WHERE s.slug = 'swiftstride-shifter';

-- Wildhunt Shifter features
INSERT INTO sublineage_features (sublineage_id, available_at_level, name, description)
SELECT s.id, 1, 'Shifting Feature', 'While shifted, you have advantage on Wisdom checks, and no creature within 30 feet of you can make an attack roll with advantage against you unless you''re incapacitated.'
FROM sublineages s WHERE s.slug = 'wildhunt-shifter';

CREATE INDEX IF NOT EXISTS idx_sublineage_features_sublineage ON sublineage_features(sublineage_id);
CREATE INDEX IF NOT EXISTS idx_sublineage_features_level ON sublineage_features(available_at_level);

DROP VIEW IF EXISTS v_sublineage_features;
CREATE VIEW v_sublineage_features AS
SELECT s.id AS sublineage_id, s.parent_lineage_slug, s.name AS sublineage_name, sf.name AS feature_name, sf.available_at_level, sf.description
FROM sublineages s
JOIN sublineage_features sf ON s.id = sf.sublineage_id
ORDER BY s.parent_lineage_slug, s.id, sf.available_at_level, sf.id;
