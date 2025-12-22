-- ============================================
-- FEATURES (traits/abilities)
-- ============================================

-- Aarakocra (EEPC) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Dexterity score increases by 2, and your Wisdom score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Aarakocra (EEPC) - Flight
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Flight', 'You have a flying speed of 50 feet. To use this speed, you can’t be wearing medium or heavy armor.'
FROM lineages l, core_books b
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Aarakocra (EEPC) - Talons
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Talons', 'You are proficient with your unarmed strikes, which deal 1d4 slashing damage on a hit.'
FROM lineages l, core_books b
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Aarakocra (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aarakocra (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aarakocra (MOOT) - Flight
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Flight', 'Because of your wings, you have a flying speed equal to your walking speed. You can’t use this flying speed if you’re wearing medium or heavy armor.'
FROM lineages l, core_books b
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aarakocra (MOOT) - Talons
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Talons', 'You have talons that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aarakocra (MOOT) - Wind Caller
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Wind Caller', 'Starting at 3rd level, you can cast the Gust of Wind spell with this trait, without requiring a material component. Once you cast the spell with this trait, you can’t do so again until you finish a long rest. You can also cast the spell using any spell slots you have of 2nd level or higher. Intellig'
FROM lineages l, core_books b
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aasimar (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aasimar (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aasimar (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aasimar (MOOT) - Celestial Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Celestial Resistance', 'You have resistance to necrotic damage and radiant damage.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aasimar (MOOT) - Healing Hands
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Healing Hands', 'As an action, you can touch a creature and roll a number of d4s equal to your proficiency bonus. The creature regains a number of hit points equal to the total rolled. Once you use this trait, you can’t use it again until you finish a long rest.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aasimar (MOOT) - Light Bearer
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Light Bearer', 'You know the Light cantrip. Charisma is your spellcasting ability for it.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aasimar (MOOT) - Celestial Revelation
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Celestial Revelation', 'When you reach 3rd level, choose one of the revelation options below. Thereafter, you can use a bonus action to unleash the celestial energy within yourself, gaining the benefits of that revelation. Your transformation lasts for 1 minute or until you end it as a bonus action. Once you transform usin'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Aasimar (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Charisma score increases by 2.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Aasimar (VGTM) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'Blessed with a radiant soul, your vision can easily cut through darkness. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Aasimar (VGTM) - Celestial Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Celestial Resistance', 'You have resistance to necrotic damage and radiant damage.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Aasimar (VGTM) - Healing Hands
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Healing Hands', 'As an action, you can touch a creature and cause it to regain a number of hit points equal to your level. Once you use this trait, you can''t use it again until you finish a long rest.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Aasimar (VGTM) - Light Bearer
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Light Bearer', 'You know the Light cantrip. Charisma is your spellcasting ability for it.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Aasimar (VGTM) - Subrace
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Subrace', 'Three subraces of aasimar exist: protector aasimar, scourge aasimar, and fallen aasimar. Choose one of them for your character.'
FROM lineages l, core_books b
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Bugbear (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Bugbear (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid. You are also considered a goblinoid for any prerequisite or effect that requires you to be a goblinoid.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Bugbear (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Bugbear (MOOT) - Fey Ancestry
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Bugbear (MOOT) - Long-Limbed
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Long-Limbed', 'When you make a melee attack on your turn, your reach for it is 5 feet greater than normal.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Bugbear (MOOT) - Powerful Build
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Bugbear (MOOT) - Sneaky
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Sneaky', 'You are proficient in the Stealth skill. In addition, without squeezing, you can move through and stop in a space large enough for a Small creature.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Bugbear (MOOT) - Surprise Attack
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Surprise Attack', 'If you hit a creature with an attack roll, the creature takes an extra 2d6 damage if it hasn’t taken a turn yet in the current combat.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Bugbear (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Strength score increases by 2, and your Dexterity score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Bugbear (VGTM) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Bugbear (VGTM) - Long-Limbed
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Long-Limbed', 'When you make a melee attack on your turn, your reach for it is 5 feet greater than normal.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Bugbear (VGTM) - Powerful Build
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Bugbear (VGTM) - Sneaky
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Sneaky', 'You are proficient in the Stealth skill.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Bugbear (VGTM) - Surprise Attack
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Surprise Attack', 'If you surprise a creature and hit it with an attack on your first turn in combat, the attack deals an extra 2d6 damage to it. You can use this trait only once per combat.'
FROM lineages l, core_books b
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Centaur (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Centaur (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Fey.'
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Centaur (MOOT) - Charge
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Charge', 'If you move at least 30 feet straight toward a target and then hit it with a melee weapon attack on the same turn, you can immediately follow that attack with a bonus action, making one attack against the target with your hooves.'
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Centaur (MOOT) - Equine Build
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Equine Build', 'You count as one size larger when determining your carrying capacity and the weight you can push or drag. In addition, any climb that requires hands and feet is especially difficult for you because of your equine legs. When you make such a climb, each foot of movement costs you 4 extra feet instead '
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Centaur (MOOT) - Hooves
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hooves', 'You have hooves that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier bludgeoning damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Centaur (MOOT) - Natural Affinity
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Natural Affinity', 'Your fey connection to nature gives you an intuitive connection to the natural world and the animals within it. You therefore have proficiency in one of the following skills of your choice: Animal Handling, Medicine, Nature, or Survival.'
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Centaur (MOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Strength score increases by 2, and your Wisdom score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Centaur (MOT) - Fey
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fey', 'Your creature type is fey, rather than humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Centaur (MOT) - Charge
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Charge', 'If you move at least 30 feet straight toward a target and then hit it with a melee weapon attack on the same turn, you can immediately follow that attack with a bonus action, making one attack against the target with your hooves.'
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Centaur (MOT) - Hooves
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hooves', 'Your hooves are natural melee weapons, which you can use to make unarmed strikes. If you hit with them, you deal bludgeoning damage equal to 1d4 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Centaur (MOT) - Equine Build
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Equine Build', 'You count as one size larger when determining your carrying capacity and the weight you can push or drag. In addition, any climb that requires hands and feet is especially difficult for you because of your equine legs. When you make such a climb, each foot of movement costs you 4 extra feet, instead'
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Centaur (MOT) - Survivor
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Survivor', 'You have proficiency in one of the following skills: Animal Handling, Medicine, Nature, or Survival.'
FROM lineages l, core_books b
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Changeling (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Changeling (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Fey.'
FROM lineages l, core_books b
WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Changeling (MOOT) - Changeling Instincts
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Changeling Instincts', 'Thanks to your connection to the fey realm, you gain proficiency with two of the following skills of your choice: Deception, Insight, Intimidation, Performance, or Persuasion.'
FROM lineages l, core_books b
WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Changeling (MOOT) - Shapechanger
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Shapechanger', 'As an action, you can change your appearance and your voice. You determine the specifics of the changes, including your coloration, hair length, and sex. You can also adjust your height and weight and can change your size between Medium and Small. You can make yourself appear as a member of another '
FROM lineages l, core_books b
WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Deep Gnome (EEPC) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Intelligence score increases by 2, and your Dexterity score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Deep Gnome (EEPC) - Superior Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Superior Darkvision', 'Your darkvision has a radius of 120 feet.'
FROM lineages l, core_books b
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Deep Gnome (EEPC) - Gnome Cunning
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Gnome Cunning', 'You have advantage on all Intelligence, Wisdom, and Charisma saves against magic.'
FROM lineages l, core_books b
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Deep Gnome (EEPC) - Stone Camouflage
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Stone Camouflage', 'You have advantage on Dexterity (stealth) checks to hide in rocky terrain.'
FROM lineages l, core_books b
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Deep Gnome (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Deep Gnome (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid. You are also considered a gnome for any prerequisite or effect that requires you to be a gnome.'
FROM lineages l, core_books b
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Deep Gnome (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 120 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Deep Gnome (MOOT) - Gift of the Svirfneblin
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Gift of the Svirfneblin', 'Starting at 3rd level, you can cast the Disguise Self spell with this trait. Starting at 5th level, you can also cast the Nondetection spell with it, without requiring a material component. Once you cast either of these spells with this trait, you can’t cast that spell with it again until you finish'
FROM lineages l, core_books b
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Deep Gnome (MOOT) - Gnomish Magic Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Gnomish Magic Resistance', 'You have advantage on Intelligence, Wisdom, and Charisma saving throws against spells.'
FROM lineages l, core_books b
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Deep Gnome (MOOT) - Svirfneblin Camouflage
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Svirfneblin Camouflage', 'When you make a Dexterity (Stealth) check, you can make the check with advantage. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Duergar (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Duergar (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid. You are also considered a dwarf for any prerequisite or effect that requires you to be a dwarf.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Duergar (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 120 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Duergar (MOOT) - Duergar Magic
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Duergar Magic', 'Starting at 3rd level, you can cast the Enlarge/Reduce spell with this trait, without requiring a material component. Starting at 5th level, you can also cast the Invisibility spell with it, without requiring a material component. Once you cast either of these spells with this trait, you can’t cast '
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Duergar (MOOT) - Dwarven Resilience
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Dwarven Resilience', 'You have advantage on saving throws you make to avoid or end the poisoned condition on yourself. You also have resistance to poison damage.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Duergar (MOOT) - Psionic Fortitude
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Psionic Fortitude', 'You have advantage on saving throws you make to avoid or end the charmed or stunned condition on yourself.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Duergar (SCAG) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Constitution score increases by 2, and your Strength score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';

-- Duergar (SCAG) - Superior Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Superior Darkvision', 'You can see in dim light within 120 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';

-- Duergar (SCAG) - Dwarven Resilience
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Dwarven Resilience', 'You have advantage on saving throws against poison, and you have resistance against poison damage.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';

-- Duergar (SCAG) - Duergar Resilience
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Duergar Resilience', 'You have advantage on saving throws against illusions and against being charmed or paralyzed.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';

-- Duergar (SCAG) - Dwarven Combat Training
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Dwarven Combat Training', 'You have proficiency with the battleaxe, handaxe, light hammer, and warhammer.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';

-- Duergar (SCAG) - Tool Proficiency
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Tool Proficiency', 'You gain proficiency with the artisan''s tools of your choice: smith''s tools, brewer''s supplies, or mason''s tools.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';

-- Duergar (SCAG) - Stonecunning
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Stonecunning', 'Whenever you make an Intelligence (History) check related to the origin of stonework, you are considered proficient in the History skill and add double your proficiency bonus to the check, instead of your normal proficiency bonus.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';

-- Duergar (SCAG) - Duergar Magic

-- Duergar (SCAG) - Sunlight Sensitivity
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Sunlight Sensitivity', 'You have disadvantage on Attack rolls and Wisdom (Perception) checks that rely on sight when you, the target of your attack, or whatever you are trying to perceive is in direct sunlight.'
FROM lineages l, core_books b
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';

-- Eladrin (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Eladrin (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid. You are also considered an elf for any prerequisite or effect that requires you to be an elf.'
FROM lineages l, core_books b
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Eladrin (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Eladrin (MOOT) - Fey Ancestry
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Eladrin (MOOT) - Fey Step
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fey Step', 'As a bonus action, you can magically teleport up to 30 feet to an unoccupied space you can see. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. When you reach 3rd level, your Fey Step gains an additional effect b'
FROM lineages l, core_books b
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Eladrin (MOOT) - Keen Senses
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Keen Senses', 'You have proficiency in the Perception skill.'
FROM lineages l, core_books b
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Eladrin (MOOT) - Trance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Trance', 'You don’t need to sleep, and magic can’t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in a trancelike meditation, during which you retain consciousness. Whenever you finish this trance, you can change your season, and you can gain two proficiencies that you don’t '
FROM lineages l, core_books b
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Fairy (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Fairy (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Fey.'
FROM lineages l, core_books b
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Fairy (MOOT) - Fairy Magic
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fairy Magic', 'You know the Druidcraft cantrip. Starting at 3rd level, you can cast the Faerie Fire spell with this trait. Starting at 5th level, you can also cast the Enlarge/Reduce spell with this trait. Once you cast Faerie Fire or Enlarge/Reduce with this trait, you can’t cast that spell with it again until yo'
FROM lineages l, core_books b
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Fairy (MOOT) - Flight
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Flight', 'Because of your wings, you have a flying speed equal to your walking speed. You can’t use this flying speed if you’re wearing medium or heavy armor.'
FROM lineages l, core_books b
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Fairy (WBW) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Increase one ability score by 2, and increase a different one by 1, or increase three different scores by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Fairy (WBW) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Fey.'
FROM lineages l, core_books b
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Fairy (WBW) - Life Span
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Life Span', 'Fairies have a life span of about a century.'
FROM lineages l, core_books b
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Fairy (WBW) - Fairy Magic
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fairy Magic', 'You know the Druidcraft cantrip. Starting at 3rd level, you can cast the Faerie Fire spell with this trait. Starting at 5th level, you can also cast the Enlarge/Reduce spell with this trait. Once you cast Faerie Fire or Enlarge/Reduce with this trait, you can''t cast that spell with it again until y'
FROM lineages l, core_books b
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Fairy (WBW) - Flight
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Flight', 'Because of your wings, you have a flying speed equal to your walking speed. You can''t use this flying speed if you''re wearing medium or heavy armor.'
FROM lineages l, core_books b
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Firbolg (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Firbolg (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Firbolg (MOOT) - Firbolg Magic
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Firbolg Magic', 'You can cast the Detect Magic and Disguise Self spells with this trait. When you use this version of Disguise Self, you can seem up to 3 feet shorter or taller. Once you cast either of these spells with this trait, you can’t cast that spell with it again until you finish a long rest. You can also ca'
FROM lineages l, core_books b
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Firbolg (MOOT) - Hidden Step
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hidden Step', 'As a bonus action, you can magically turn invisible until the start of your next turn or until you attack, make a damage roll, or force someone to make a saving throw. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long re'
FROM lineages l, core_books b
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Firbolg (MOOT) - Powerful Build
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Firbolg (MOOT) - Speech of Beast and Leaf
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Speech of Beast and Leaf', 'You have the ability to communicate in a limited manner with Beasts, Plants, and vegetation. They can understand the meaning of your words, though you have no special ability to understand them in return. You have advantage on all Charisma checks you make to influence them.'
FROM lineages l, core_books b
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Firbolg (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Wisdom score increases by 2, and your Strength score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Firbolg (VGTM) - Firbolg Magic
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Firbolg Magic', 'You can cast Detect Magic and Disguise Self with this trait, using Wisdom as your spellcasting ability for them. Once you cast either spell, you can''t cast it again with this trait until you finish a short or long rest. When you use this version of disguise self, you can seem up to 3 feet shorter t'
FROM lineages l, core_books b
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Firbolg (VGTM) - Hidden Step
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hidden Step', 'As a bonus action, you can magically turn invisible until the start of your next turn or until you attack, make a damage roll, or force someone to make a saving throw. Once you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l, core_books b
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Firbolg (VGTM) - Powerful Build
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Firbolg (VGTM) - Speech of Beast and Leaf
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Speech of Beast and Leaf', 'You have the ability to communicate in a limited manner with beasts and plants. They can understand the meaning of your words, though you have no special ability to understand them in return. You have advantage on all Charisma checks you make to influence them.'
FROM lineages l, core_books b
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Genasi Air (EEPC) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Constitution score increases by 2, and Dexterity score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Air (EEPC) - Unending Breath
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Unending Breath', 'You can hold your breath indefinitely while you’re not incapacitated.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Air (EEPC) - Mingle with the Wind
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Mingle with the Wind', 'You can cast the Levitate spell once with this trait, requiring no material components, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for this spell.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Air (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Air (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Air (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Air (MOOT) - Unending Breath
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Unending Breath', 'You can hold your breath indefinitely while you’re not incapacitated.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Air (MOOT) - Lightning Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Lightning Resistance', 'You have resistance to lightning damage.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Air (MOOT) - Mingle with the Wind
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Mingle with the Wind', 'You know the Shocking Grasp cantrip. Starting at 3rd level, you can cast the Feather Fall spell with this trait, without requiring a material component. Starting at 5th level, you can also cast the Levitate spell with this trait, without requiring a material component. Once you cast Feather Fall or '
FROM lineages l, core_books b
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Earth (EEPC) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Constitution score increases by 2, and your Strength score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Earth (EEPC) - Earth Walk
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Earth Walk', 'You can move across difficult terrain made of earth or stone without expending extra movement.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Earth (EEPC) - Merge with Stone
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Merge with Stone', 'You can cast the Pass without Trace spell once with this trait, requiring no material components, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for this spell.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Earth (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Earth (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Earth (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Earth (MOOT) - Earth Walk
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Earth Walk', 'You can move across difficult terrain without expending extra movement if you are using your walking speed on the ground or a floor.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Earth (MOOT) - Merge with Stone
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Merge with Stone', 'You know the Blade Ward cantrip. You can cast it as normal, and you can also cast it as a bonus action a number of times equal to your proficiency bonus, regaining all expended uses when you finish a long rest. Starting at 5th level, you can cast the Pass Without Trace spell with this trait, without'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Fire (EEPC) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Constitution score increases by 2, and your Intelligence score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Fire (EEPC) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. Your ties to the Elemental Plane of Fire make your darkvision unusual: everything you see in darkness is in a shade of red.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Fire (EEPC) - Fire Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fire Resistance', 'You have resistance to fire damage.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Fire (EEPC) - Reach to the Blaze
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Reach to the Blaze', 'You know the Produce Flame cantrip. Once you reach 3rd level, you can cast the Burning Hands spell once with this trait as a 1st-level spell, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for these spells.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Fire (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Fire (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Fire (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Fire (MOOT) - Fire Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fire Resistance', 'You have resistance to fire damage.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Fire (MOOT) - Reach to the Blaze
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Reach to the Blaze', 'You know the Produce Flame cantrip. Starting at 3rd level, you can cast the Burning Hands spell with this trait. Starting at 5th level, you can also cast the Flame Blade spell with this trait, without requiring a material component. Once you cast Burning Hands or Flame Blade with this trait, you can'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Water (EEPC) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Wisdom score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Water (EEPC) - Swim
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Swim', 'You have a swimming speed of 30 feet.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Water (EEPC) - Acid Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Acid Resistance', 'You have resistance to acid damage.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Water (EEPC) - Amphibious
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Amphibious', 'You can breathe air and water.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Water (EEPC) - Call to the Wave
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Call to the Wave', 'You know the Shape Water cantrip. When you reach 3rd level, you can cast the Create or Destroy Water spell as a 2nd-level spell once with this trait, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for these spells.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'EEPC';

-- Genasi Water (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Water (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Water (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Water (MOOT) - Acid Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Acid Resistance', 'You have resistance to acid damage.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Water (MOOT) - Amphibious
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Amphibious', 'You can breathe air and water.'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Genasi Water (MOOT) - Call to the Wave
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Call to the Wave', 'You know the Acid Splash cantrip. Starting at 3rd level, you can cast the Create or Destroy Water spell with this trait. Starting at 5th level, you can also cast the Water Walk spell with this trait, without requiring a material component. Once you cast Create or Destroy Water or Water Walk with thi'
FROM lineages l, core_books b
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Githyanki (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Githyanki (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Githyanki (MOOT) - Astral Knowledge
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Astral Knowledge', 'You can mystically access a reservoir of experiences of entities connected to the Astral Plane. Whenever you finish a long rest, you gain proficiency in one skill of your choice and with one weapon or tool of your choice, selected from the Player’s Handbook, as you momentarily project your conscious'
FROM lineages l, core_books b
WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Githyanki (MOOT) - Githyanki Psionics
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Githyanki Psionics', 'You know the Mage Hand cantrip, and the hand is invisible when you cast the cantrip with this trait. Starting at 3rd level, you can cast the Jump spell with this trait. Starting at 5th level, you can also cast the Misty Step spell with it. Once you cast Jump or Misty Step with this trait, you can’t '
FROM lineages l, core_books b
WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Githyanki (MOOT) - Psychic Resilience
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Psychic Resilience', 'You have resistance to psychic damage.'
FROM lineages l, core_books b
WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Githzerai (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Githzerai (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Githzerai (MOOT) - Githzerai Psionics
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Githzerai Psionics', 'You know the Mage Hand cantrip, and the hand is invisible when you cast the cantrip with this trait. Starting at 3rd level, you can cast the Shield spell with this trait. Starting at 5th level, you can also cast the Detect Thoughts spell with it. Once you cast Shield or Detect Thoughts with this tra'
FROM lineages l, core_books b
WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Githzerai (MOOT) - Mental Discipline
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Mental Discipline', 'Your innate psychic defenses grant you advantage on saving throws you make to avoid or end the charmed and frightened conditions on yourself.'
FROM lineages l, core_books b
WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Githzerai (MOOT) - Psychic Resilience
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Psychic Resilience', 'You have resistance to psychic damage.'
FROM lineages l, core_books b
WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Goblin (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Goblin (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid. You are also considered a goblinoid for any prerequisite or effect that requires you to be a goblinoid.'
FROM lineages l, core_books b
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Goblin (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Goblin (MOOT) - Fey Ancestry
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Goblin (MOOT) - Fury of the Small
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fury of the Small', 'When you damage a creature with an attack or a spell and the creature’s size is larger than yours, you can cause the attack or spell to deal extra damage to the creature. The extra damage equals your proficiency bonus. You can use this trait a number of times equal to your proficiency bonus, regaini'
FROM lineages l, core_books b
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Goblin (MOOT) - Nimble Escape
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Nimble Escape', 'You can take the Disengage or Hide action as a bonus action on each of your turns.'
FROM lineages l, core_books b
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Goblin (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Dexterity score increases by 2, and your Constitution score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Goblin (VGTM) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Goblin (VGTM) - Fury of the Small
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fury of the Small', 'When you damage a creature with an attack or a spell and the creature''s size is larger than yours, you can cause the attack or spell to deal extra damage to the creature. The extra damage equals your level. Once you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l, core_books b
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Goblin (VGTM) - Nimble Escape
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Nimble Escape', 'You can take the Disengage or Hide action as a bonus action on each of your turns.'
FROM lineages l, core_books b
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Goliath (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Goliath (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Goliath (MOOT) - Little Giant
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Little Giant', 'You have proficiency in the Athletics skill, and you count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b
WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Goliath (MOOT) - Mountain Born
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Mountain Born', 'You have resistance to cold damage. You also naturally acclimate to high altitudes, even if you’ve never been to one. This includes elevations above 20,000 feet.'
FROM lineages l, core_books b
WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Goliath (MOOT) - Stone's Endurance

-- Harengon (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Harengon (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Harengon (MOOT) - Hare-Trigger
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hare-Trigger', 'You can add your proficiency bonus to your initiative rolls.'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Harengon (MOOT) - Leporine Senses
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Leporine Senses', 'You have proficiency in the Perception skill.'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Harengon (MOOT) - Lucky Footwork
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Lucky Footwork', 'When you fail a Dexterity saving throw, you can use your reaction to roll a d4 and add it to the save, potentially turning the failure into a success. You can''t use this reaction if you''re prone or your speed is 0.'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Harengon (MOOT) - Rabbit Hop
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Rabbit Hop', 'As a bonus action, you can jump a number of feet equal to five times your proficiency bonus, without provoking opportunity attacks. You can use this trait only if your speed is greater than 0. You can use it a number of times equal to your proficiency bonus, and you regain all expended uses when you'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Harengon (WBW) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Increase one ability score by 2, and increase a different one by 1, or increase three different scores by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Harengon (WBW) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Harengon (WBW) - Life Span
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Life Span', 'Harengons have a life span of about a century.'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Harengon (WBW) - Hare-Trigger
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hare-Trigger', 'You can add your proficiency bonus to your initiative rolls.'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Harengon (WBW) - Leporine Senses
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Leporine Senses', 'You have proficiency in the Perception skill.'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Harengon (WBW) - Lucky Footwork
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Lucky Footwork', 'When you fail a Dexterity saving throw, you can use your reaction to roll a d4 and add it to the save, potentially turning the failure into a success. You can''t use this reaction if you''re prone or your speed is 0.'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Harengon (WBW) - Rabbit Hop
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Rabbit Hop', 'As a bonus action, you can jump a number of feet equal to five times your proficiency bonus, without provoking opportunity attacks. You can use this trait only if your speed is greater than 0. You can use it a number of times equal to your proficiency bonus, and you regain all expended uses when you'
FROM lineages l, core_books b
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';

-- Hobgoblin (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Hobgoblin (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid. You are also considered a goblinoid for any prerequisite or effect that requires you to be a goblinoid.'
FROM lineages l, core_books b
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Hobgoblin (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Hobgoblin (MOOT) - Fey Ancestry
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Hobgoblin (MOOT) - Fey Gift
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fey Gift', 'You can use this trait to take the Help action as a bonus action, and you can do so a number of times equal to your proficiency bonus. You regain all expended uses when you finish a long rest. Starting at 3rd level, choose one of the options below each time you take the Help action with this trait: '
FROM lineages l, core_books b
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Hobgoblin (MOOT) - Fortune from the Many
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fortune from the Many', 'If you miss with an attack roll or fail an ability check or a saving throw, you can draw on your bonds of reciprocity to gain a bonus to the roll equal to the number of allies you can see within 30 feet of you (maximum bonus of +3). You can use this trait a number of times equal to your proficiency '
FROM lineages l, core_books b
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Hobgoblin (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Constitution score increases by 2, and your Intelligence score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Hobgoblin (VGTM) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Hobgoblin (VGTM) - Martial Training
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Martial Training', 'You are proficient with two martial weapons of your choice and with light armor.'
FROM lineages l, core_books b
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Hobgoblin (VGTM) - Saving Face
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Saving Face', 'Hobgoblins are careful not to show weakness in front of their allies, for fear of losing status. If you miss with an attack roll or fail an ability check or a saving throw, you can gain a bonus to the roll equal to the number of allies you can see within 30 feet of you (maximum bonus of +5). Once yo'
FROM lineages l, core_books b
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Kenku (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Kenku (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Kenku (MOOT) - Expert Duplication
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Expert Duplication', 'When you copy writing or craftwork produced by yourself or someone else, you have advantage on any ability checks you make to produce an exact duplicate.'
FROM lineages l, core_books b
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Kenku (MOOT) - Kenku Recall
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Kenku Recall', 'Thanks to your supernaturally good memory, you have proficiency in two skills of your choice. Moreover, when you make an ability check using any skill in which you have proficiency, you can give yourself advantage on the check before rolling the d20. You can give yourself advantage in this way a num'
FROM lineages l, core_books b
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Kenku (MOOT) - Mimicry
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Mimicry', 'You can accurately mimic sounds you have heard, including voices. A creature that hears the sounds you make can tell they are imitations only with a successful Wisdom (Insight) check against a DC of 8 + your proficiency bonus + your Charisma modifier.'
FROM lineages l, core_books b
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Kenku (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Dexterity score increases by 2, and your Wisdom score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Kenku (VGTM) - Expert Forgery
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Expert Forgery', 'You can duplicate other creatures'' handwriting and craftwork. You have advantage on all checks made to produce forgeries or duplicates of existing objects.'
FROM lineages l, core_books b
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Kenku (VGTM) - Kenku Training
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Kenku Training', 'You are proficient in your choice of two of the following skills: Acrobatics, Deception, Stealth, and Sleight of Hand.'
FROM lineages l, core_books b
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Kenku (VGTM) - Mimicry
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Mimicry', 'You can mimic sounds you have heard, including voices. A creature that hears the sounds you make can tell they are imitations with a successful Wisdom (Insight) check opposed by your Charisma (Deception) check.'
FROM lineages l, core_books b
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Kobold (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Kobold (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Kobold (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Kobold (MOOT) - Draconic Cry
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Draconic Cry', 'As a bonus action, you let out a cry at your enemies within 10 feet of you. Until the start of your next turn, you and your allies have advantage on attack rolls against any of those enemies who could hear you. You can use this trait a number of times equal to your proficiency bonus, and you regain '
FROM lineages l, core_books b
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Kobold (MOOT) - Kobold Legacy
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Kobold Legacy', 'Kobolds’ connection to dragons can manifest in unpredictable ways in an individual kobold. Choose one of the following legacy options for your kobold: Craftiness. You have proficiency in one of the following skills of your choice: Arcana, Investigation, Medicine, Sleight of Hand, or Survival. Defian'
FROM lineages l, core_books b
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Kobold (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Dexterity score increases by 2.'
FROM lineages l, core_books b
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Kobold (VGTM) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Kobold (VGTM) - Grovel, Cower, and Beg
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Grovel, Cower, and Beg', 'As an action on your turn, you can cower pathetically to distract nearby foes. Until the end of your next turn, your allies gain advantage on attack rolls against enemies within 10 feet of you that can see you. Once you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l, core_books b
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Kobold (VGTM) - Pack Tactics
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Pack Tactics', 'You have advantage on an attack roll against a creature if at least one of your allies is within 5 feet of the creature and the ally isn''t incapacitated.'
FROM lineages l, core_books b
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Kobold (VGTM) - Sunlight Sensitivity
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Sunlight Sensitivity', 'You have disadvantage on attack rolls and on Wisdom (Perception) checks that rely on sight when you, the target of your attack, or whatever you are trying to perceive is in direct sunlight.'
FROM lineages l, core_books b
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Lizardfolk (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Lizardfolk (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Lizardfolk (MOOT) - Bite
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Bite', 'You have a fanged maw that you can use to make unarmed strikes. When you hit with it, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Lizardfolk (MOOT) - Hold Breath
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hold Breath', 'You can hold your breath for up to 15 minutes at a time.'
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Lizardfolk (MOOT) - Hungry Jaws
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hungry Jaws', 'You can throw yourself into a feeding frenzy. As a bonus action, you can make a special attack with your Bite. If the attack hits, it deals its normal damage, and you gain temporary hit points equal to your proficiency bonus. You can use this trait a number of times equal to your proficiency bonus, '
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Lizardfolk (MOOT) - Natural Armor
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Natural Armor', 'You have tough, scaly skin. When you aren’t wearing armor, your base AC is 13 + your Dexterity modifier. You can use your natural armor to determine your AC if the armor you wear would leave you with a lower AC. A shield’s benefits apply as normal while you use your natural armor.'
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Lizardfolk (MOOT) - Nature's Intuition

-- Lizardfolk (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Constitution score increase by 2, and your Wisdom score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Lizardfolk (VGTM) - Bite
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Bite', 'Your fanged maw is a natural weapon, which you can use to make unarmed strikes. If you hit with it, you deal piercing damage equal to 1d6 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Lizardfolk (VGTM) - Cunning Artisan
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Cunning Artisan', 'As part of a short rest, you can harvest bone and hide from a slain beast, construct, dragon, monstrosity, or plant creature of size Small or larger to create one of the following items: a shield, a club, a javelin, or 1d4 darts or blowgun needles. To use this trait, you need a blade, such as a dagg'
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Lizardfolk (VGTM) - Hold Breath
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hold Breath', 'You can hold your breath for up to 15 minutes at a time.'
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Lizardfolk (VGTM) - Hunter's Lore

-- Lizardfolk (VGTM) - Natural Armor
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Natural Armor', 'You have tough, scaly skin. When you aren''t wearing armor, your AC is 13 + your Dexterity modifier. You can use your natural armor to determine your AC if the armor you wear would leave you with a lower AC. A shield''s benefits apply as normal while you use your natural armor.'
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Lizardfolk (VGTM) - Hungry Jaws
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hungry Jaws', 'In battle, you can throw yourself into a vicious feeding frenzy. As a bonus action, you can make a special attack with your bite. If the attack hits, it deals its normal damage, and you gain temporary hit points (minimum of 1) equal to your Constitution modifier, and you can''t use this trait again '
FROM lineages l, core_books b
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Minotaur (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Minotaur (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Minotaur (MOOT) - Horns
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Horns', 'You have horns that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier piercing damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Minotaur (MOOT) - Goring Rush
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Goring Rush', 'Immediately after you take the Dash action on your turn and move at least 20 feet, you can make one melee attack with your Horns as a bonus action.'
FROM lineages l, core_books b
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Minotaur (MOOT) - Hammering Horns
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hammering Horns', 'Immediately after you hit a creature with a melee attack as part of the Attack action on your turn, you can use a bonus action to attempt to push that target with your horns. The target must be within 5 feet of you and no more than one size larger than you. Unless it succeeds on a Strength saving th'
FROM lineages l, core_books b
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Minotaur (MOOT) - Labyrinthine Recall
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Labyrinthine Recall', 'You always know which direction is north, and you have advantage on any Wisdom (Survival) check you make to navigate or track.'
FROM lineages l, core_books b
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Orc (EGW) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Strength score increases by 2 and your Constitution score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW';

-- Orc (EGW) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW';

-- Orc (EGW) - Aggressive
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Aggressive', 'As a bonus action, you can move up to your speed toward an enemy of your choice that you can see or hear. You must end this move closer to the enemy than you started.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW';

-- Orc (EGW) - Powerful Build
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW';

-- Orc (EGW) - Primal Intuition
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Primal Intuition', 'You have proficiency in two of the following skills of your choice: Animal Handling, Insight, Intimidation, Medicine, Nature, Perception, and Survival.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW';

-- Orc (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Orc (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Orc (MOOT) - Adrenaline Rush
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Adrenaline Rush', 'You can take the Dash action as a bonus action. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. Whenever you use this trait, you gain a number of temporary hit points equal to your proficiency bonus.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Orc (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Orc (MOOT) - Powerful Build
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Orc (MOOT) - Relentless Endurance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Relentless Endurance', 'When you are reduced to 0 hit points but not killed outright, you can drop to 1 hit point instead. Once you use this trait, you can’t do so again until you finish a long rest.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Orc (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Strength score increases by 2 and your Constitution score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Orc (VGTM) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Orc (VGTM) - Aggressive
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Aggressive', 'As a bonus action, you can move up to your speed toward an enemy of your choice that you can see or hear. You must end this move closer to the enemy than you started.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Orc (VGTM) - Primal Intuition
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Primal Intuition', 'You have proficiency in two of the following skills of your choice: Animal Handling, Insight, Intimidation, Medicine, Nature, Perception, and Survival.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Orc (VGTM) - Powerful Build
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Satyr (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Satyr (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Fey.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Satyr (MOOT) - Ram
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ram', 'You can use your head and horns to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier bludgeoning damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Satyr (MOOT) - Magic Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Magic Resistance', 'You have advantage on saving throws against spells.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Satyr (MOOT) - Mirthful Leaps
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Mirthful Leaps', 'Whenever you make a long jump or a high jump, you can roll a d8 and add the number rolled to the number of feet you cover, even when making a standing jump. This extra distance costs movement as normal.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Satyr (MOOT) - Reveler
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Reveler', 'As an embodiment of revelry, you have proficiency in the Performance and Persuasion skills, and you have proficiency with one musical instrument of your choice.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Satyr (MOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Charisma score increases by 2, and your Dexterity score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Satyr (MOT) - Fey
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fey', 'Your creature type is fey, rather than humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Satyr (MOT) - Ram
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ram', 'You can use your head and horns to make unarmed strikes. If you hit with them, you deal bludgeoning damage equal to 1d4 + your Strength modifier.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Satyr (MOT) - Magic Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Magic Resistance', 'You have advantage on saving throws against spells and other magical effects.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Satyr (MOT) - Mirthful Leaps
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Mirthful Leaps', 'Whenever you make a long or high jump, you can roll a d8 and add the number to the number of feet you cover, even when making a standing jump. This extra distance costs movement as normal.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Satyr (MOT) - Reveler
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Reveler', 'You have proficiency in the Performance and Persuasion skills, and you have proficiency with one musical instrument of your choice.'
FROM lineages l, core_books b
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';

-- Sea Elf (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Sea Elf (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid. You are also considered an elf for any prerequisite or effect that requires you to be an elf.'
FROM lineages l, core_books b
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Sea Elf (MOOT) - Child of the Sea
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Child of the Sea', 'You can breathe air and water, and you have resistance to cold damage.'
FROM lineages l, core_books b
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Sea Elf (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Sea Elf (MOOT) - Fey Ancestry
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Sea Elf (MOOT) - Friend of the Sea
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Friend of the Sea', 'Aquatic animals have an extraordinary affinity with your people. You can communicate simple ideas to any Beast that has a swimming speed. It can understand your words, though you have no special ability to understand it in return.'
FROM lineages l, core_books b
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Sea Elf (MOOT) - Keen Senses
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Keen Senses', 'You have proficiency in the Perception skill.'
FROM lineages l, core_books b
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Sea Elf (MOOT) - Trance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Trance', 'You don’t need to sleep, and magic can’t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in a trancelike meditation, during which you retain consciousness. Whenever you finish this trance, you can gain two proficiencies that you don’t have, each one with a weapon or '
FROM lineages l, core_books b
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shadar Kai (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shadar Kai (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid. You are also considered an elf for any prerequisite or effect that requires you to be an elf.'
FROM lineages l, core_books b
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shadar Kai (MOOT) - Blessing of the Raven Queen
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Blessing of the Raven Queen', 'As a bonus action, you can magically teleport up to 30 feet to an unoccupied space you can see. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. Starting at 3rd level, you also gain resistance to all damage when y'
FROM lineages l, core_books b
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shadar Kai (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shadar Kai (MOOT) - Fey Ancestry
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shadar Kai (MOOT) - Keen Senses
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Keen Senses', 'You have proficiency in the Perception skill.'
FROM lineages l, core_books b
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shadar Kai (MOOT) - Necrotic Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Necrotic Resistance', 'You have resistance to necrotic damage.'
FROM lineages l, core_books b
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shadar Kai (MOOT) - Trance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Trance', 'You don’t need to sleep, and magic can’t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in a trancelike meditation, during which you retain consciousness. Whenever you finish this trance, you can gain two proficiencies that you don’t have, each one with a weapon or '
FROM lineages l, core_books b
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shifter (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shifter (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shifter (MOOT) - Bestial Instincts
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Bestial Instincts', 'Channeling the beast within, you have proficiency in one of the following skills of your choice: Acrobatics, Athletics, Intimidation, or Survival.'
FROM lineages l, core_books b
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shifter (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Shifter (MOOT) - Shifting
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Shifting', 'As a bonus action, you can assume a more bestial appearance. This transformation lasts for 1 minute, until you die, or until you revert to your normal appearance as a bonus action. When you shift, you gain temporary hit points equal to 2 x your proficiency bonus. You can shift a number of times equa'
FROM lineages l, core_books b
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Tabaxi (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Tabaxi (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Tabaxi (MOOT) - Cat's Claws

-- Tabaxi (MOOT) - Cat's Talent

-- Tabaxi (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Tabaxi (MOOT) - Feline Agility
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Feline Agility', 'Your reflexes and agility allow you to move with a burst of speed. When you move on your turn in combat, you can double your speed until the end of the turn. Once you use this trait, you can’t use it again until you move 0 feet on one of your turns.'
FROM lineages l, core_books b
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Tabaxi (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Dexterity score increases by 2, and your Charisma score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Tabaxi (VGTM) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You have a cat''s keen senses, especially in the dark. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Tabaxi (VGTM) - Feline Agility
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Feline Agility', 'Your reflexes and agility allow you to move with a burst of speed. When you move on your tum in combat, you can double your speed until the end of the tum. Once you use this trait, you can''t use it again until you move 0 feet on one of your turns.'
FROM lineages l, core_books b
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Tabaxi (VGTM) - Cat's Claws

-- Tabaxi (VGTM) - Cat's Talent

-- Tortle (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Tortle (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Tortle (MOOT) - Claws
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Claws', 'You have claws that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Tortle (MOOT) - Hold Breath
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Hold Breath', 'You can hold your breath for up to 1 hour.'
FROM lineages l, core_books b
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Tortle (MOOT) - Natural Armor
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Natural Armor', 'Your shell provides you a base AC of 17 (your Dexterity modifier doesn’t affect this number). You can’t wear light, medium, or heavy armor, but if you are using a shield, you can apply the shield’s bonus as normal.'
FROM lineages l, core_books b
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Tortle (MOOT) - Nature's Intuition

-- Tortle (MOOT) - Shell Defense
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Shell Defense', 'You can withdraw into your shell as an action. Until you emerge, you gain a +4 bonus to your AC, and you have advantage on Strength and Constitution saving throws. While in your shell, you are prone, your speed is 0 and can’t increase, you have disadvantage on Dexterity saving throws, you can’t take'
FROM lineages l, core_books b
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Triton (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Triton (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Triton (MOOT) - Amphibious
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Amphibious', 'You can breathe air and water.'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Triton (MOOT) - Control Air and Water
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Control Air and Water', 'You can cast Fog Cloud with this trait. Starting at 3rd level, you can cast the Gust of Wind spell with this trait. Starting at 5th level, you can also cast the Water Walk spell with it. Once you cast any of these spells with this trait, you can’t cast that spell with it again until you finish a lon'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Triton (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Triton (MOOT) - Emissary of the Sea
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Emissary of the Sea', 'You can communicate simple ideas to any Beast, Elemental, or Monstrosity that has a swimming speed. It can understand your words, though you have no special ability to understand it in return.'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Triton (MOOT) - Guardian of the Depths
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Guardian of the Depths', 'Adapted to the frigid ocean depths, you have resistance to cold damage.'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Triton (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Strength, Constitution, and Charisma scores each increase by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Triton (VGTM) - Amphibious
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Amphibious', 'You can breathe air and water.'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Triton (VGTM) - Control Air and Water
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Control Air and Water', 'A child of the sea, you can call on the magic of elemental air and water. You can cast Fog Cloud with this trait. Starting at 3rd level, you can cast Gust of Wind with it, and starting at 5th level, you can also cast Wall of Water with it. Once you cast a spell with this trait, you can’t cast that s'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Triton (VGTM) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You can’t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Triton (VGTM) - Emissary of the Sea
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Emissary of the Sea', 'Aquatic beasts have an extraordinary affinity with your people. You can communicate simple ideas with beasts that can breathe water. They can understand the meaning of your words, though you have no special ability to understand them in return.'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Triton (VGTM) - Guardians of the Depths
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Guardians of the Depths', 'Adapted to even the most extreme ocean depths, you have resistance to cold damage.'
FROM lineages l, core_books b
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Yuan Ti (MOOT) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Yuan Ti (MOOT) - Creature Type
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Creature Type', 'You are a Humanoid.'
FROM lineages l, core_books b
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Yuan Ti (MOOT) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Yuan Ti (MOOT) - Magic Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Magic Resistance', 'You have advantage on saving throws against spells.'
FROM lineages l, core_books b
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Yuan Ti (MOOT) - Poison Resilience
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Poison Resilience', 'You have advantage on saving throws you make to avoid or end the poisoned condition on yourself. You also have resistance to poison damage.'
FROM lineages l, core_books b
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Yuan Ti (MOOT) - Serpentine Spellcasting
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Serpentine Spellcasting', 'You know the Poison Spray cantrip. You can cast Animal Friendship an unlimited number of times with this trait, but you can target only snakes with it. Starting at 3rd level, you can also cast Suggestion with this trait. Once you cast it, you can’t do so again until you finish a long rest. You can a'
FROM lineages l, core_books b
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT';

-- Yuan Ti (VGTM) - Ability Score Increase
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Ability Score Increase', 'Your Charisma score increases by 2, and your Intelligence score increases by 1.'
FROM lineages l, core_books b
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Yuan Ti (VGTM) - Darkvision
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Yuan Ti (VGTM) - Innate Spellcasting
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Innate Spellcasting', 'You know the Poison Spray cantrip. You can cast Animal Friendship an unlimited number of times with this trait, but you can target only snakes with it. Starting at 3rd level, you can also cast Suggestion with this trait. Once you cast it, you can''t do so again until you finish a long rest. Charisma'
FROM lineages l, core_books b
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Yuan Ti (VGTM) - Magic Resistance
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Magic Resistance', 'You have advantage on saving throws against spells and other magical effects.'
FROM lineages l, core_books b
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM';

-- Yuan Ti (VGTM) - Poison Immunity
INSERT OR IGNORE INTO lineage_features (lineage_id, name, description)
SELECT l.id, 'Poison Immunity', 'You are immune to poison damage and the poisoned condition.'
FROM lineages l, core_books b
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM';
