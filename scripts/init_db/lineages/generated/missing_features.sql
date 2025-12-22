-- FEATURES FALTANTES
-- Gerado automaticamente a partir do JSON extraído


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Flight', 'Because of your wings, you have a flying speed equal to your walking speed. You can’t use this flying speed if you’re wearing medium or heavy armor.'
FROM lineages l, core_books b WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Talons', 'You have talons that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Wind Caller', 'Starting at 3rd level, you can cast the Gust of Wind spell with this trait, without requiring a material component. Once you cast the spell with this trait, you can’t do so again until you finish a long rest. You can also cast the spell using any spell slots you have of 2nd level or higher. Intelligence, Wisdom, or Charisma is your spellcasting ability for it when you cast Gust of Wind with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Most aarakocra are good and rarely choose sides when it comes to law and chaos. Tribal leaders and warriors might be lawful, while explorers and adventurers might tend toward chaotic.'
FROM lineages l, core_books b WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Flight', 'You have a flying speed of 50 feet. To use this speed, you can’t be wearing medium or heavy armor.'
FROM lineages l, core_books b WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Talons', 'You are proficient with your unarmed strikes, which deal 1d4 slashing damage on a hit.'
FROM lineages l, core_books b WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Celestial Resistance', 'You have resistance to necrotic damage and radiant damage.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Healing Hands', 'As an action, you can touch a creature and roll a number of d4s equal to your proficiency bonus. The creature regains a number of hit points equal to the total rolled. Once you use this trait, you can’t use it again until you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Light Bearer', 'You know the Light cantrip. Charisma is your spellcasting ability for it.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Celestial Revelation', 'When you reach 3rd level, choose one of the revelation options below. Thereafter, you can use a bonus action to unleash the celestial energy within yourself, gaining the benefits of that revelation. Your transformation lasts for 1 minute or until you end it as a bonus action. Once you transform using your revelation below, you can’t use it again until you finish a long rest: Necrotic Shroud. Your eyes briefly become pools of darkness, and ghostly, flightless wings sprout from your back temporarily. Creatures other than your allies within 10 feet of you that can see you must succeed on a Charisma saving throw (DC 8 + your proficiency bonus + your Charisma modifier) or become frightened of you until the end of your next turn. Until the transformation ends, once on each of your turns, you can deal extra necrotic damage to one target when you deal damage to it with an attack or a spell. The extra damage equals your proficiency bonus. Radiant Consumption. Searing light temporarily radiates from your eyes and mouth. For the duration, you shed bright light in a 10-foot radius and dim light for an additional 10 feet, and at the end of each of your turns, each creature within 10 feet of you takes radiant damage equal to your proficiency bonus. Until the transformation ends, once on each of your turns, you can deal extra radiant damage to one target when you deal damage to it with an attack or a spell. The extra damage equals your proficiency bonus. Radiant Soul. Two luminous, spectral wings sprout from your back temporarily. Until the transformation ends, you have a flying speed equal to your walking speed, and once on each of your turns, you can deal extra radiant damage to one target when you deal damage to it with an attack or a spell. The extra damage equals your proficiency bonus.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Imbued with celestial power, most aasimar are good. Outcast aasimar are most often neutral or even evil.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'Blessed with a radiant soul, your vision can easily cut through darkness. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Celestial Resistance', 'You have resistance to necrotic damage and radiant damage.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Healing Hands', 'As an action, you can touch a creature and cause it to regain a number of hit points equal to your level. Once you use this trait, you can''t use it again until you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Light Bearer', 'You know the Light cantrip. Charisma is your spellcasting ability for it.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Subrace', 'Three subraces of aasimar exist: protector aasimar, scourge aasimar, and fallen aasimar. Choose one of them for your character.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Radiant Soul', 'Starting at 3rd level, you can use your action to unleash the divine energy within yourself, causing your eyes to glimmer and two luminous, incorporeal wings to sprout from your back. Your transformation lasts for 1 minute or until you end it as a bonus action. During it, you have a flying speed of 30 feet, and once on each of your turns, you can deal extra radiant damage to one target when you deal damage to it with an attack or a spell. The extra radiant damage equals your level. Once you use this trait, you can''t use it again until you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Radiant Consumption', 'Starting at 3rd level, you can use your action to unleash the divine energy within yourself, causing a searing light to radiate from you, pour out of your eyes and mouth, and threaten to char you. Your transformation lasts for 1 minute or until you end it as a bonus action. During it, you shed bright light in a 10-foot radius and dim light for an additional 10 feet, and at the end of each of your turns, you and each creature within 10 feet of you take radiant damage equal to half your level (rounded up). In addition, once on each of your turns, you can deal extra radiant damage to one target when you deal damage to it with an attack or a spell. The extra radiant damage equals your level. Once you use this trait, you can''t use it again until you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Necrotic Shroud', 'Starting at 3rd level, you can use your action to unleash the divine energy within yourself, causing your eyes to turn into pools of darkness and two skeletal, ghostly, flightless wings to sprout from your back. The instant you transform, other creatures within 10 feet of you that can see you must each succeed on a Charisma saving throw (DC 8 + your proficiency bonus + your Charisma modifier) or become frightened of you until the end of your next turn. Your transformation lasts for 1 minute or until you end it as a bonus action. During it, once on each of your turns, you can deal extra necrotic damage to one target when you deal damage to it with an attack or a spell. The extra necrotic damage equals your level. Once you use this trait, you can''t use it again until you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Kefnet's Blessing', 'You can add half your proficiency bonus, rounded down, to any Intelligence check you make that doesn’t already include your proficiency bonus.'
FROM lineages l, core_books b WHERE l.slug = 'aven' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hawkeyed', 'You have proficiency in the Perception skill. In addition, attacking at long range doesn’t impose disadvantage on your ranged weapon attack rolls.'
FROM lineages l, core_books b WHERE l.slug = 'aven' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Long-Limbed', 'When you make a melee attack on your turn, your reach for it is 5 feet greater than normal.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sneaky', 'You are proficient in the Stealth skill. In addition, without squeezing, you can move through and stop in a space large enough for a Small creature.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Surprise Attack', 'If you hit a creature with an attack roll, the creature takes an extra 2d6 damage if it hasn’t taken a turn yet in the current combat.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Bugbears endure a harsh existence that demands each of them to remain self-sufficient, even at the expense of their fellows. They tend to be chaotic evil.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Long-Limbed', 'When you make a melee attack on your turn, your reach for it is 5 feet greater than normal.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sneaky', 'You are proficient in the Stealth skill.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Surprise Attack', 'If you surprise a creature and hit it with an attack on your first turn in combat, the attack deals an extra 2d6 damage to it. You can use this trait only once per combat.'
FROM lineages l, core_books b WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Charge', 'If you move at least 30 feet straight toward a target and then hit it with a melee weapon attack on the same turn, you can immediately follow that attack with a bonus action, making one attack against the target with your hooves.'
FROM lineages l, core_books b WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Equine Build', 'You count as one size larger when determining your carrying capacity and the weight you can push or drag. In addition, any climb that requires hands and feet is especially difficult for you because of your equine legs. When you make such a climb, each foot of movement costs you 4 extra feet instead of the normal 1 extra foot.'
FROM lineages l, core_books b WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hooves', 'You have hooves that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier bludgeoning damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Natural Affinity', 'Your fey connection to nature gives you an intuitive connection to the natural world and the animals within it. You therefore have proficiency in one of the following skills of your choice: Animal Handling, Medicine, Nature, or Survival.'
FROM lineages l, core_books b WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Centaurs are inclined toward neutrality. Lagonna centaurs tend to be more lawful, while Pheres centaurs are more often chaotic.'
FROM lineages l, core_books b WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey', 'Your creature type is fey, rather than humanoid.'
FROM lineages l, core_books b WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Charge', 'If you move at least 30 feet straight toward a target and then hit it with a melee weapon attack on the same turn, you can immediately follow that attack with a bonus action, making one attack against the target with your hooves.'
FROM lineages l, core_books b WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hooves', 'Your hooves are natural melee weapons, which you can use to make unarmed strikes. If you hit with them, you deal bludgeoning damage equal to 1d4 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Equine Build', 'You count as one size larger when determining your carrying capacity and the weight you can push or drag. In addition, any climb that requires hands and feet is especially difficult for you because of your equine legs. When you make such a climb, each foot of movement costs you 4 extra feet, instead of the normal 1 extra foot.'
FROM lineages l, core_books b WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Survivor', 'You have proficiency in one of the following skills: Animal Handling, Medicine, Nature, or Survival.'
FROM lineages l, core_books b WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Changeling Instincts', 'Thanks to your connection to the fey realm, you gain proficiency with two of the following skills of your choice: Deception, Insight, Intimidation, Performance, or Persuasion.'
FROM lineages l, core_books b WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shapechanger', 'As an action, you can change your appearance and your voice. You determine the specifics of the changes, including your coloration, hair length, and sex. You can also adjust your height and weight and can change your size between Medium and Small. You can make yourself appear as a member of another race, though none of your game statistics change. You can’t duplicate the appearance of an individual you’ve never seen, and you must adopt a form that has the same basic arrangement of limbs that you have. Your clothing and equipment aren’t changed by this trait. You stay in the new form until you use an action to revert to your true form or until you die.'
FROM lineages l, core_books b WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 120 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Gift of the Svirfneblin', 'Starting at 3rd level, you can cast the Disguise Self spell with this trait. Starting at 5th level, you can also cast the Nondetection spell with it, without requiring a material component. Once you cast either of these spells with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast these spells using spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Gnomish Magic Resistance', 'You have advantage on Intelligence, Wisdom, and Charisma saving throws against spells.'
FROM lineages l, core_books b WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Svirfneblin Camouflage', 'When you make a Dexterity (Stealth) check, you can make the check with advantage. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Superior Darkvision', 'Your darkvision has a radius of 120 feet.'
FROM lineages l, core_books b WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Gnome Cunning', 'You have advantage on all Intelligence, Wisdom, and Charisma saves against magic.'
FROM lineages l, core_books b WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Stone Camouflage', 'You have advantage on Dexterity (stealth) checks to hide in rocky terrain.'
FROM lineages l, core_books b WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Ancestral Legacy', 'If you replace a race with this lineage, you can keep the following elements of that race: any skill proficiencies you gained from it and any climbing, flying, or swimming speed you gained from it. If you don''t keep any of those elements or you choose this lineage at character creation, you gain proficency in two skills of your choice.'
FROM lineages l, core_books b WHERE l.slug = 'dhampir' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'dhampir' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Deathless Nature', 'You don''t need to breathe.'
FROM lineages l, core_books b WHERE l.slug = 'dhampir' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Spider Climb', 'You have a climbing speed equal to your walking speed. In addition, at 3rd level, you can move up, down, and across vertical surfaces and upside down along ceilings, while leaving your hands free.'
FROM lineages l, core_books b WHERE l.slug = 'dhampir' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Vampiric Bite', 'Your fanged bite is a natural weapon, which counts as a simple melee weapon with which you are proficient. You add your Constitution modifier, instead of your Strength modifier, to the attack and damage rolls when you attack with this bite. It deals 1d4 piercing damage on a hit. While you are missing half or more of your hit points, you have advantage on attack rolls you make with this bite. When you attack with this bite and hit a creature that isn’t a Construct or an Undead, you can empower yourself in one of the following ways of your choice: You regain hit points equal to the piercing damage dealt by the bite. You gain a bonus to the next ability check or attack roll you make; the bonus equals the piercing damage dealt by the bite. You can empower yourself with this bite a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'dhampir' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Type', 'Humanoid and Undead'
FROM lineages l, core_books b WHERE l.slug = 'dhampir' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light.'
FROM lineages l, core_books b WHERE l.slug = 'dhampir' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Spider Climb', 'You have a climbing speed equal to your walking speed. In addition, at 3rd level, you can move up, down, and across vertical surfaces and upside down along ceilings, while leaving your hands free.'
FROM lineages l, core_books b WHERE l.slug = 'dhampir' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Vampiric Bite', 'Your fanged bite is a natural weapon, which counts as a simple melee weapon with which you are proficient. You add your Constitution modifier to the attack and damage rolls when you attack with your bite. Your bite deals 1d4 piercing damage on a hit. While you are missing half or more of your hit points, you have advantage on attack rolls you make with this bite. When you use your bite and hit a creature that isn’t a Construct or an Undead, you can empower yourself in one of the following ways of your choice: regain hit points equal to the damage dealt by the bite gain a bonus to the next ability check or attack roll you make; the bonus equals the damage dealt by the bite You can empower yourself with your bite a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'dhampir' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 120 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Duergar Magic', 'Starting at 3rd level, you can cast the Enlarge/Reduce spell with this trait, without requiring a material component. Starting at 5th level, you can also cast the Invisibility spell with it, without requiring a material component. Once you cast either of these spells with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast these spells using spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Dwarven Resilience', 'You have advantage on saving throws you make to avoid or end the poisoned condition on yourself. You also have resistance to poison damage.'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Psionic Fortitude', 'You have advantage on saving throws you make to avoid or end the charmed or stunned condition on yourself.'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Superior Darkvision', 'You can see in dim light within 120 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Dwarven Resilience', 'You have advantage on saving throws against poison, and you have resistance against poison damage.'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Duergar Resilience', 'You have advantage on saving throws against illusions and against being charmed or paralyzed.'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Dwarven Combat Training', 'You have proficiency with the battleaxe, handaxe, light hammer, and warhammer.'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Tool Proficiency', 'You gain proficiency with the artisan''s tools of your choice: smith''s tools, brewer''s supplies, or mason''s tools.'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Stonecunning', 'Whenever you make an Intelligence (History) check related to the origin of stonework, you are considered proficient in the History skill and add double your proficiency bonus to the check, instead of your normal proficiency bonus.'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Duergar Magic', 'When you reach 3rd level, you can cast the Enlarge/Reduce spell on yourself once with this trait, using only the spell''s enlarge option. When you reach 5th level, you can cast the Invisibility spell on yourself once with this trait. You don''t need material components for either spell, and you can''t cast them while you''re in direct sunlight, although sunlight has no effect on them once cast. You regain the ability to cast these spells with this trait when you finish a long rest. Intelligence is your spellcasting ability for these spells.'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sunlight Sensitivity', 'You have disadvantage on Attack rolls and Wisdom (Perception) checks that rely on sight when you, the target of your attack, or whatever you are trying to perceive is in direct sunlight.'
FROM lineages l, core_books b WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Step', 'As a bonus action, you can magically teleport up to 30 feet to an unoccupied space you can see. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. When you reach 3rd level, your Fey Step gains an additional effect based on your season; if the effect requires a saving throw, the DC equals 8 + your proficiency bonus + your Intelligence, Wisdom, or Charisma modifier (choose when you select this race): Autumn. Immediately after you use your Fey Step, up to two creatures of your choice that you can see within 10 feet of you must succeed on a Wisdom saving throw or be charmed by you for 1 minute, or until you or your companions deal any damage to the creatures. Winter. When you use your Fey Step, one creature of your choice that you can see within 5 feet of you before you teleport must succeed on a Wisdom saving throw or be frightened of you until the end of your next turn. Spring. When you use your Fey Step, you can touch one willing creature within 5 feet of you. That creature then teleports instead of you, appearing in an unoccupied space of your choice that you can see within 30 feet of you. Summer. Immediately after you use your Fey Step, each creature of your choice that you can see within 5 feet of you takes fire damage equal to your proficiency bonus.'
FROM lineages l, core_books b WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Keen Senses', 'You have proficiency in the Perception skill.'
FROM lineages l, core_books b WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Trance', 'You don’t need to sleep, and magic can’t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in a trancelike meditation, during which you retain consciousness. Whenever you finish this trance, you can change your season, and you can gain two proficiencies that you don’t have, each one with a weapon or a tool of your choice selected from the Player’s Handbook. You mystically acquire these proficiencies by drawing them from shared elven memory, and you retain them until you finish your next long rest.'
FROM lineages l, core_books b WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fairy Magic', 'You know the Druidcraft cantrip. Starting at 3rd level, you can cast the Faerie Fire spell with this trait. Starting at 5th level, you can also cast the Enlarge/Reduce spell with this trait. Once you cast Faerie Fire or Enlarge/Reduce with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast either of those spells using any spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Flight', 'Because of your wings, you have a flying speed equal to your walking speed. You can’t use this flying speed if you’re wearing medium or heavy armor.'
FROM lineages l, core_books b WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Life Span', 'Fairies have a life span of about a century.'
FROM lineages l, core_books b WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fairy Magic', 'You know the Druidcraft cantrip. Starting at 3rd level, you can cast the Faerie Fire spell with this trait. Starting at 5th level, you can also cast the Enlarge/Reduce spell with this trait. Once you cast Faerie Fire or Enlarge/Reduce with this trait, you can''t cast that spell with it again until you finish a long rest. You can also cast either of those spells using any spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Flight', 'Because of your wings, you have a flying speed equal to your walking speed. You can''t use this flying speed if you''re wearing medium or heavy armor.'
FROM lineages l, core_books b WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Firbolg Magic', 'You can cast the Detect Magic and Disguise Self spells with this trait. When you use this version of Disguise Self, you can seem up to 3 feet shorter or taller. Once you cast either of these spells with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast these spells using any spell slots you have. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hidden Step', 'As a bonus action, you can magically turn invisible until the start of your next turn or until you attack, make a damage roll, or force someone to make a saving throw. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Speech of Beast and Leaf', 'You have the ability to communicate in a limited manner with Beasts, Plants, and vegetation. They can understand the meaning of your words, though you have no special ability to understand them in return. You have advantage on all Charisma checks you make to influence them.'
FROM lineages l, core_books b WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'As people who follow the rhythm of nature and see themselves as its caretakers, firbolg are typically neutral good. Evil firbolg are rare and are usually the sworn enemies of the rest of their kind.'
FROM lineages l, core_books b WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Firbolg Magic', 'You can cast Detect Magic and Disguise Self with this trait, using Wisdom as your spellcasting ability for them. Once you cast either spell, you can''t cast it again with this trait until you finish a short or long rest. When you use this version of disguise self, you can seem up to 3 feet shorter than normal, allowing you to more easily blend in with humans and elves.'
FROM lineages l, core_books b WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hidden Step', 'As a bonus action, you can magically turn invisible until the start of your next turn or until you attack, make a damage roll, or force someone to make a saving throw. Once you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l, core_books b WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Speech of Beast and Leaf', 'You have the ability to communicate in a limited manner with beasts and plants. They can understand the meaning of your words, though you have no special ability to understand them in return. You have advantage on all Charisma checks you make to influence them.'
FROM lineages l, core_books b WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Unending Breath', 'You can hold your breath indefinitely while you’re not incapacitated.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Lightning Resistance', 'You have resistance to lightning damage.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mingle with the Wind', 'You know the Shocking Grasp cantrip. Starting at 3rd level, you can cast the Feather Fall spell with this trait, without requiring a material component. Starting at 5th level, you can also cast the Levitate spell with this trait, without requiring a material component. Once you cast Feather Fall or Levitate with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast either of those spells using any spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Independent and self-reliant, genasi tend toward a neutral alignment.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Unending Breath', 'You can hold your breath indefinitely while you’re not incapacitated.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mingle with the Wind', 'You can cast the Levitate spell once with this trait, requiring no material components, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for this spell.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Earth Walk', 'You can move across difficult terrain without expending extra movement if you are using your walking speed on the ground or a floor.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Merge with Stone', 'You know the Blade Ward cantrip. You can cast it as normal, and you can also cast it as a bonus action a number of times equal to your proficiency bonus, regaining all expended uses when you finish a long rest. Starting at 5th level, you can cast the Pass Without Trace spell with this trait, without requiring a material component. Once you cast that spell with this trait, you can’t do so again until you finish a long rest. You can also cast it using any spell slots you have of 2nd level or higher. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Independent and self-reliant, genasi tend toward a neutral alignment.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Earth Walk', 'You can move across difficult terrain made of earth or stone without expending extra movement.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Merge with Stone', 'You can cast the Pass without Trace spell once with this trait, requiring no material components, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for this spell.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fire Resistance', 'You have resistance to fire damage.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Reach to the Blaze', 'You know the Produce Flame cantrip. Starting at 3rd level, you can cast the Burning Hands spell with this trait. Starting at 5th level, you can also cast the Flame Blade spell with this trait, without requiring a material component. Once you cast Burning Hands or Flame Blade with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast either of those spells using any spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Independent and self-reliant, genasi tend toward a neutral alignment.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. Your ties to the Elemental Plane of Fire make your darkvision unusual: everything you see in darkness is in a shade of red.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fire Resistance', 'You have resistance to fire damage.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Reach to the Blaze', 'You know the Produce Flame cantrip. Once you reach 3rd level, you can cast the Burning Hands spell once with this trait as a 1st-level spell, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for these spells.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Acid Resistance', 'You have resistance to acid damage.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Amphibious', 'You can breathe air and water.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Call to the Wave', 'You know the Acid Splash cantrip. Starting at 3rd level, you can cast the Create or Destroy Water spell with this trait. Starting at 5th level, you can also cast the Water Walk spell with this trait, without requiring a material component. Once you cast Create or Destroy Water or Water Walk with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast either of those spells using any spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Independent and self-reliant, genasi tend toward a neutral alignment.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Swim', 'You have a swimming speed of 30 feet.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Acid Resistance', 'You have resistance to acid damage.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Amphibious', 'You can breathe air and water.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Call to the Wave', 'You know the Shape Water cantrip. When you reach 3rd level, you can cast the Create or Destroy Water spell as a 2nd-level spell once with this trait, and you regain the ability to cast it this way when you finish a long rest. Constitution is your spellcasting ability for these spells.'
FROM lineages l, core_books b WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'EEPC';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Astral Knowledge', 'You can mystically access a reservoir of experiences of entities connected to the Astral Plane. Whenever you finish a long rest, you gain proficiency in one skill of your choice and with one weapon or tool of your choice, selected from the Player’s Handbook, as you momentarily project your consciousness into the Astral Plane. These proficiencies last until the end of your next long rest.'
FROM lineages l, core_books b WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Githyanki Psionics', 'You know the Mage Hand cantrip, and the hand is invisible when you cast the cantrip with this trait. Starting at 3rd level, you can cast the Jump spell with this trait. Starting at 5th level, you can also cast the Misty Step spell with it. Once you cast Jump or Misty Step with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast either of those spells using any spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race). None of these spells require spell components when you cast them with this trait.'
FROM lineages l, core_books b WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Psychic Resilience', 'You have resistance to psychic damage.'
FROM lineages l, core_books b WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Githzerai Psionics', 'You know the Mage Hand cantrip, and the hand is invisible when you cast the cantrip with this trait. Starting at 3rd level, you can cast the Shield spell with this trait. Starting at 5th level, you can also cast the Detect Thoughts spell with it. Once you cast Shield or Detect Thoughts with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast either of those spells using any spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race). None of these spells require spell components when you cast them with this trait.'
FROM lineages l, core_books b WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mental Discipline', 'Your innate psychic defenses grant you advantage on saving throws you make to avoid or end the charmed and frightened conditions on yourself.'
FROM lineages l, core_books b WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Psychic Resilience', 'You have resistance to psychic damage.'
FROM lineages l, core_books b WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fury of the Small', 'When you damage a creature with an attack or a spell and the creature’s size is larger than yours, you can cause the attack or spell to deal extra damage to the creature. The extra damage equals your proficiency bonus. You can use this trait a number of times equal to your proficiency bonus, regaining all expended uses when you finish a long rest, and you can use it no more than once per turn.'
FROM lineages l, core_books b WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Nimble Escape', 'You can take the Disengage or Hide action as a bonus action on each of your turns.'
FROM lineages l, core_books b WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Goblins are typically neutral evil, as they care only for their own needs. A few goblins might tend toward good or neutrality, but only rarely.'
FROM lineages l, core_books b WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fury of the Small', 'When you damage a creature with an attack or a spell and the creature''s size is larger than yours, you can cause the attack or spell to deal extra damage to the creature. The extra damage equals your level. Once you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l, core_books b WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Nimble Escape', 'You can take the Disengage or Hide action as a bonus action on each of your turns.'
FROM lineages l, core_books b WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Little Giant', 'You have proficiency in the Athletics skill, and you count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mountain Born', 'You have resistance to cold damage. You also naturally acclimate to high altitudes, even if you’ve never been to one. This includes elevations above 20,000 feet.'
FROM lineages l, core_books b WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Stone's Endurance', 'You can supernaturally draw on unyielding stone to shrug off harm. When you take damage, you can use your reaction to roll a d12. Add your Constitution modifier to the number rolled and reduce the damage by that total. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hare-Trigger', 'You can add your proficiency bonus to your initiative rolls.'
FROM lineages l, core_books b WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Leporine Senses', 'You have proficiency in the Perception skill.'
FROM lineages l, core_books b WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Lucky Footwork', 'When you fail a Dexterity saving throw, you can use your reaction to roll a d4 and add it to the save, potentially turning the failure into a success. You can''t use this reaction if you''re prone or your speed is 0.'
FROM lineages l, core_books b WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Rabbit Hop', 'As a bonus action, you can jump a number of feet equal to five times your proficiency bonus, without provoking opportunity attacks. You can use this trait only if your speed is greater than 0. You can use it a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Life Span', 'Harengons have a life span of about a century.'
FROM lineages l, core_books b WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hare-Trigger', 'You can add your proficiency bonus to your initiative rolls.'
FROM lineages l, core_books b WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Leporine Senses', 'You have proficiency in the Perception skill.'
FROM lineages l, core_books b WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Lucky Footwork', 'When you fail a Dexterity saving throw, you can use your reaction to roll a d4 and add it to the save, potentially turning the failure into a success. You can''t use this reaction if you''re prone or your speed is 0.'
FROM lineages l, core_books b WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Rabbit Hop', 'As a bonus action, you can jump a number of feet equal to five times your proficiency bonus, without provoking opportunity attacks. You can use this trait only if your speed is greater than 0. You can use it a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Ancestral Legacy', 'If you replace a race with this lineage, you can keep the following elements of that race: any skill proficiencies you gained from it and any climbing, flying, or swimming speed you gained from it. If you don''t keep any of those elements or you choose this lineage at character creation, you gain proficiency in two skills of your choice.'
FROM lineages l, core_books b WHERE l.slug = 'hexblood' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'hexblood' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Eerie Token', 'As a bonus action, you can harmlessly remove a lock of your hair, one of your nails, or one of your teeth. This token is imbued with magic until you finish a long rest. While the token is imbued this way, you can take these actions: Telepathic Message. As an action, you can send a telepathic message to the creature holding or carrying the token, as long as you are within 10 miles of it. The message can contain up to twenty-five words. Remote Viewing. If you are within 10 miles of the token, you can enter a trance as an action. The trance lasts for 1 minute, but it ends early if you dismiss it (no action required) or are incapacitated. During this trance, you can see and hear from the token as if you were located where it is. While you are using your senses at the token''s location, you are blinded and deafened in regard to your own surroundings. When the trance ends, the token is harmlessly destroyed. Once you create a token using this feature, you can''t do so again until you finish a long rest, at which point your missing part regrows.'
FROM lineages l, core_books b WHERE l.slug = 'hexblood' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hex Magic', 'You can cast the Disguise Self and Hex spells with this trait. Once you cast either of these spells with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast these spells using any spell slots you have. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells (choose the ability when you gain this lineage).'
FROM lineages l, core_books b WHERE l.slug = 'hexblood' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Type', 'Fey and Humanoid'
FROM lineages l, core_books b WHERE l.slug = 'hexblood' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light.'
FROM lineages l, core_books b WHERE l.slug = 'hexblood' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Resilience', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b WHERE l.slug = 'hexblood' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hex Magic', 'You can cast the Disguise Self and Hex spells with this trait. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells (choose when you gain this lineage). Once you cast either of these spells with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast these spells using any spells slots you have.'
FROM lineages l, core_books b WHERE l.slug = 'hexblood' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Magic Token', 'As an action, you can harmlessly pull out one of your nails, a tooth, or a lock of hair. This token is imbued with magic until you finish a long rest. While the token is imbued in this way, you can use an action to send a telepathic message to the creature holding or carrying the token, as long as you are on the same plane of existence and are within 10 miles of it. The message can contain up to twenty-five words. In addition, while you are within 10 miles of the token, you can use an action to enter a trance for 1 minute, during which you can see and hear from the token as if you were located where it is. While you are using your senses at the token’s location, you are blinded and deafened in regard to your own surroundings. Afterward, the token is harmlessly destroyed. Once you create a token using this feature, you can’t do so again until you finish a long rest, at which point your missing part regrows.'
FROM lineages l, core_books b WHERE l.slug = 'hexblood' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Gift', 'You can use this trait to take the Help action as a bonus action, and you can do so a number of times equal to your proficiency bonus. You regain all expended uses when you finish a long rest. Starting at 3rd level, choose one of the options below each time you take the Help action with this trait: Hospitality. You and the creature you help each gain a number of temporary hit points equal to 1d6 plus your proficiency bonus. Passage. You and the creature you help each increase your walking speeds by 10 feet until the start of your next turn. Spite. Until the start of your next turn, the first time the creature you help hits a target with an attack roll, that target has disadvantage on the next attack roll it makes within the next minute.'
FROM lineages l, core_books b WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fortune from the Many', 'If you miss with an attack roll or fail an ability check or a saving throw, you can draw on your bonds of reciprocity to gain a bonus to the roll equal to the number of allies you can see within 30 feet of you (maximum bonus of +3). You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Hobgoblin society is built on fidelity to a rigid, unforgiving code of conduct. As such, they tend toward lawful evil.'
FROM lineages l, core_books b WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Martial Training', 'You are proficient with two martial weapons of your choice and with light armor.'
FROM lineages l, core_books b WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Saving Face', 'Hobgoblins are careful not to show weakness in front of their allies, for fear of losing status. If you miss with an attack roll or fail an ability check or a saving throw, you can gain a bonus to the roll equal to the number of allies you can see within 30 feet of you (maximum bonus of +5). Once you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l, core_books b WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fearless', 'You are immune to the frightened condition.'
FROM lineages l, core_books b WHERE l.slug = 'kender-ua-revised' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Kender Curiosity', 'Thanks to the mystical origin of your people, you gain proficiency with one of the following skills of your choice: Insight, Investigation, Sleight of Hand, Stealth, or Survival.'
FROM lineages l, core_books b WHERE l.slug = 'kender-ua-revised' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Taunt', 'You have an extraordinary ability to fluster creatures. As a bonus action, you can unleash a string of provoking words at a creature within 60 feet of you that can hear and understand you. The target must succeed on a Wisdom saving throw or it has disadvantage on attack rolls against targets other than you until the start of your next turn. The DC equals 8 + your proficiency bonus + your Intelligence, Wisdom, or Charisma modifier (choose when you select this race). You can use this bonus action a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'kender-ua-revised' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Brave', 'You have advantage on saving throws you make to avoid or end the frightened condition on yourself.'
FROM lineages l, core_books b WHERE l.slug = 'kender-ua' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Kender Ace', 'Starting at 3rd level, you possess a magical ability to pull an item out of a bag or another container; as a bonus action, you can reach into a container you’re carrying and roll on the Kender Aces table to determine what item you pull out. The object glimmers softly and disappears after 1 hour. You can use this bonus action a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'kender-ua' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Taunt', 'You have a supernatural ability to home in on a creature’s emotional raw nerves and craft a taunt that flusters that creature. As a bonus action, you can unleash a barrage of insults at a creature within 60 feet of you that can hear and understand you. The target must succeed on a Wisdom saving throw (DC equal to 8 + your proficiency bonus + your Charisma modifier), or it has disadvantage on attack rolls until the start of your next turn. You can use this bonus action a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'kender-ua' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fearless', 'You have advantage on saving throws you make to avoid or end the frightened condition on yourself. When you fail a saving throw to avoid or end the frighted condition on yourself, you can choose to succeed instead. Once you succeed on a saving throw in this way, you can''t do so again until you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'kender' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Kender Aptitude', 'Thanks to the mystical origin of your people, you gain proficiency with one of the following skills of your choice: Insight, Investigation, Sleight of Hand, Stealth, or Survival.'
FROM lineages l, core_books b WHERE l.slug = 'kender' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Taunt', 'You have an extraordinary ability to fluster creatures. As a bonus action, you can unleash a string of provoking words at a creature within 60 feet of yourself that can hear and understand you. The target must succeed on a Wisdom saving throw or it has disadvantage on attack rolls against targets other than you until the start of your next turn. The DC equals 8 + your proficiency bonus + your Intelligence, Wisdom, or Charisma modifier (choose when you select this race). You can use this bonus action a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'kender' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Expert Duplication', 'When you copy writing or craftwork produced by yourself or someone else, you have advantage on any ability checks you make to produce an exact duplicate.'
FROM lineages l, core_books b WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Kenku Recall', 'Thanks to your supernaturally good memory, you have proficiency in two skills of your choice. Moreover, when you make an ability check using any skill in which you have proficiency, you can give yourself advantage on the check before rolling the d20. You can give yourself advantage in this way a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mimicry', 'You can accurately mimic sounds you have heard, including voices. A creature that hears the sounds you make can tell they are imitations only with a successful Wisdom (Insight) check against a DC of 8 + your proficiency bonus + your Charisma modifier.'
FROM lineages l, core_books b WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Kenku are chaotic creatures, rarely making enduring commitments, and they care mostly for preserving their own hides. They are generally chaotic neutral in outlook.'
FROM lineages l, core_books b WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Expert Forgery', 'You can duplicate other creatures'' handwriting and craftwork. You have advantage on all checks made to produce forgeries or duplicates of existing objects.'
FROM lineages l, core_books b WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Kenku Training', 'You are proficient in your choice of two of the following skills: Acrobatics, Deception, Stealth, and Sleight of Hand.'
FROM lineages l, core_books b WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mimicry', 'You can mimic sounds you have heard, including voices. A creature that hears the sounds you make can tell they are imitations with a successful Wisdom (Insight) check opposed by your Charisma (Deception) check.'
FROM lineages l, core_books b WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Draconic Cry', 'As a bonus action, you let out a cry at your enemies within 10 feet of you. Until the start of your next turn, you and your allies have advantage on attack rolls against any of those enemies who could hear you. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Kobold Legacy', 'Kobolds’ connection to dragons can manifest in unpredictable ways in an individual kobold. Choose one of the following legacy options for your kobold: Craftiness. You have proficiency in one of the following skills of your choice: Arcana, Investigation, Medicine, Sleight of Hand, or Survival. Defiance. You have advantage on saving throws to avoid or end the frightened condition on yourself. Draconic Sorcery. You know one cantrip of your choice from the sorcerer spell list. Intelligence, Wisdom, or Charisma is your spellcasting ability for that cantrip (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Kobolds are fundamentally selfish, making them evil, but their reliance on the strength of their group makes them trend toward law.'
FROM lineages l, core_books b WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Grovel, Cower, and Beg', 'As an action on your turn, you can cower pathetically to distract nearby foes. Until the end of your next turn, your allies gain advantage on attack rolls against enemies within 10 feet of you that can see you. Once you use this trait, you can''t use it again until you finish a short or long rest.'
FROM lineages l, core_books b WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Pack Tactics', 'You have advantage on an attack roll against a creature if at least one of your allies is within 5 feet of the creature and the ally isn''t incapacitated.'
FROM lineages l, core_books b WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sunlight Sensitivity', 'You have disadvantage on attack rolls and on Wisdom (Perception) checks that rely on sight when you, the target of your attack, or whatever you are trying to perceive is in direct sunlight.'
FROM lineages l, core_books b WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Bite', 'You have a fanged maw that you can use to make unarmed strikes. When you hit with it, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hold Breath', 'You can hold your breath for up to 15 minutes at a time.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hungry Jaws', 'You can throw yourself into a feeding frenzy. As a bonus action, you can make a special attack with your Bite. If the attack hits, it deals its normal damage, and you gain temporary hit points equal to your proficiency bonus. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Natural Armor', 'You have tough, scaly skin. When you aren’t wearing armor, your base AC is 13 + your Dexterity modifier. You can use your natural armor to determine your AC if the armor you wear would leave you with a lower AC. A shield’s benefits apply as normal while you use your natural armor.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Nature's Intuition', 'Thanks to your mystical connection to nature, you gain proficiency with two of the following skills of your choice: Animal Handling, Medicine, Nature, Perception, Stealth, or Survival.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Most lizardfolk are neutral. They see the world as a place of predators and prey, where life and death are natural processes. They wish only to survive, and prefer to leave other creatures to their own devices.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Bite', 'Your fanged maw is a natural weapon, which you can use to make unarmed strikes. If you hit with it, you deal piercing damage equal to 1d6 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Cunning Artisan', 'As part of a short rest, you can harvest bone and hide from a slain beast, construct, dragon, monstrosity, or plant creature of size Small or larger to create one of the following items: a shield, a club, a javelin, or 1d4 darts or blowgun needles. To use this trait, you need a blade, such as a dagger, or appropriate artisan''s tools, such as leatherworker''s tools.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hold Breath', 'You can hold your breath for up to 15 minutes at a time.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hunter's Lore', 'You gain proficiency with two of the following skills of your choice: Animal Handling, Nature, Perception, Stealth, and Survival.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Natural Armor', 'You have tough, scaly skin. When you aren''t wearing armor, your AC is 13 + your Dexterity modifier. You can use your natural armor to determine your AC if the armor you wear would leave you with a lower AC. A shield''s benefits apply as normal while you use your natural armor.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hungry Jaws', 'In battle, you can throw yourself into a vicious feeding frenzy. As a bonus action, you can make a special attack with your bite. If the attack hits, it deals its normal damage, and you gain temporary hit points (minimum of 1) equal to your Constitution modifier, and you can''t use this trait again until you finish a short or long rest.'
FROM lineages l, core_books b WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Horns', 'You have horns that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier piercing damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Goring Rush', 'Immediately after you take the Dash action on your turn and move at least 20 feet, you can make one melee attack with your Horns as a bonus action.'
FROM lineages l, core_books b WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hammering Horns', 'Immediately after you hit a creature with a melee attack as part of the Attack action on your turn, you can use a bonus action to attempt to push that target with your horns. The target must be within 5 feet of you and no more than one size larger than you. Unless it succeeds on a Strength saving throw against a DC equal to 8 + your proficiency bonus + your Strength modifier, you push it up to 10 feet away from you.'
FROM lineages l, core_books b WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Labyrinthine Recall', 'You always know which direction is north, and you have advantage on any Wisdom (Survival) check you make to navigate or track.'
FROM lineages l, core_books b WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Adrenaline Rush', 'You can take the Dash action as a bonus action. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. Whenever you use this trait, you gain a number of temporary hit points equal to your proficiency bonus.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Relentless Endurance', 'When you are reduced to 0 hit points but not killed outright, you can drop to 1 hit point instead. Once you use this trait, you can’t do so again until you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Orcs are vicious raiders, who believe that the world should be theirs. They also respect strength above all else and believe the strong must bully the weak to ensure that weakness does not spread like a disease. They are usually chaotic evil.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Aggressive', 'As a bonus action, you can move up to your speed toward an enemy of your choice that you can see or hear. You must end this move closer to the enemy than you started.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Primal Intuition', 'You have proficiency in two of the following skills of your choice: Animal Handling, Insight, Intimidation, Medicine, Nature, Perception, and Survival.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Orcs fear the curse of ruin that is said to plague their race, and tend strongly toward either chaos (accepting their fate), or toward law (rejecting it).'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Aggressive', 'As a bonus action, you can move up to your speed toward an enemy of your choice that you can see or hear. You must end this move closer to the enemy than you started.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Primal Intuition', 'You have proficiency in two of the following skills of your choice: Animal Handling, Insight, Intimidation, Medicine, Nature, Perception, and Survival.'
FROM lineages l, core_books b WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Ancestral Legacy', 'If you replace a race with this lineage, you can keep the following elements of that race: any skill proficiencies you gained from it and any climbing, flying, or swimming speed you gained from it. If you don''t keep any of those elements or you choose this lineage at character creation, you gain proficiency in two skills of your choice.'
FROM lineages l, core_books b WHERE l.slug = 'reborn' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Deathless Nature', 'You have escaped death, a fact represented by the following benefits: You have advantage on saving throws against disease and being poisoned, and you have resistance to poison damage. You have advantage on death saving throws. You don’t need to eat, drink, or breathe. You don’t need to sleep, and magic can’t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in an inactive, motionless state, during which you retain consciousness.'
FROM lineages l, core_books b WHERE l.slug = 'reborn' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Knowledge from a Past Life', 'You temporarily remember glimpses of the past, perhaps faded memories from ages ago or a previous life. When you make an ability check that uses a skill, you can roll a d6 immediately after seeing the number on the d20 and add the number on the d6 to the check. You can use this feature a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'reborn' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Type', 'Humanoid, as well as Construct or Undead (choose when you gain this lineage)'
FROM lineages l, core_books b WHERE l.slug = 'reborn' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light.'
FROM lineages l, core_books b WHERE l.slug = 'reborn' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Deathless Nature', 'You have escaped death, a fact represented by the following benefits: You have advantage on saving throws against disease and being poisoned, and you have resistance to poison damage. You have advantage on death saving throws. You don’t need to eat, drink, or breathe. You don’t need to sleep, and magic can’t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in an inactive, motionless state, during which you retain consciousness.'
FROM lineages l, core_books b WHERE l.slug = 'reborn' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Knowledge from a Past Life', 'You temporarily remember sporadic glimpses of the past, perhaps faded memories from ages ago or a previous life. When you make an ability check that uses a skill, you can roll a d6 and add the number rolled to the check. You can use this feature a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest.'
FROM lineages l, core_books b WHERE l.slug = 'reborn' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Ram', 'You can use your head and horns to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier bludgeoning damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Magic Resistance', 'You have advantage on saving throws against spells.'
FROM lineages l, core_books b WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mirthful Leaps', 'Whenever you make a long jump or a high jump, you can roll a d8 and add the number rolled to the number of feet you cover, even when making a standing jump. This extra distance costs movement as normal.'
FROM lineages l, core_books b WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Reveler', 'As an embodiment of revelry, you have proficiency in the Performance and Persuasion skills, and you have proficiency with one musical instrument of your choice.'
FROM lineages l, core_books b WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Satyrs delight in living a life free of the mantle of law. They gravitate toward being good, but some have devious streaks and enjoy causing dismay.'
FROM lineages l, core_books b WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey', 'Your creature type is fey, rather than humanoid.'
FROM lineages l, core_books b WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Ram', 'You can use your head and horns to make unarmed strikes. If you hit with them, you deal bludgeoning damage equal to 1d4 + your Strength modifier.'
FROM lineages l, core_books b WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Magic Resistance', 'You have advantage on saving throws against spells and other magical effects.'
FROM lineages l, core_books b WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mirthful Leaps', 'Whenever you make a long or high jump, you can roll a d8 and add the number to the number of feet you cover, even when making a standing jump. This extra distance costs movement as normal.'
FROM lineages l, core_books b WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Reveler', 'You have proficiency in the Performance and Persuasion skills, and you have proficiency with one musical instrument of your choice.'
FROM lineages l, core_books b WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Child of the Sea', 'You can breathe air and water, and you have resistance to cold damage.'
FROM lineages l, core_books b WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Friend of the Sea', 'Aquatic animals have an extraordinary affinity with your people. You can communicate simple ideas to any Beast that has a swimming speed. It can understand your words, though you have no special ability to understand it in return.'
FROM lineages l, core_books b WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Keen Senses', 'You have proficiency in the Perception skill.'
FROM lineages l, core_books b WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Trance', 'You don’t need to sleep, and magic can’t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in a trancelike meditation, during which you retain consciousness. Whenever you finish this trance, you can gain two proficiencies that you don’t have, each one with a weapon or a tool of your choice selected from the Player’s Handbook. You mystically acquire these proficiencies by drawing them from shared elven memory, and you retain them until you finish your next long rest.'
FROM lineages l, core_books b WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Blessing of the Raven Queen', 'As a bonus action, you can magically teleport up to 30 feet to an unoccupied space you can see. You can use this trait a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. Starting at 3rd level, you also gain resistance to all damage when you teleport using this trait. The resistance lasts until the start of your next turn. During that time, you appear ghostly and translucent.'
FROM lineages l, core_books b WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fey Ancestry', 'You have advantage on saving throws you make to avoid or end the charmed condition on yourself.'
FROM lineages l, core_books b WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Keen Senses', 'You have proficiency in the Perception skill.'
FROM lineages l, core_books b WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Necrotic Resistance', 'You have resistance to necrotic damage.'
FROM lineages l, core_books b WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Trance', 'You don’t need to sleep, and magic can’t put you to sleep. You can finish a long rest in 4 hours if you spend those hours in a trancelike meditation, during which you retain consciousness. Whenever you finish this trance, you can gain two proficiencies that you don’t have, each one with a weapon or a tool of your choice selected from the Player’s Handbook. You mystically acquire these proficiencies by drawing them from shared elven memory, and you retain them until you finish your next long rest.'
FROM lineages l, core_books b WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Bestial Instincts', 'Channeling the beast within, you have proficiency in one of the following skills of your choice: Acrobatics, Athletics, Intimidation, or Survival.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shifting', 'As a bonus action, you can assume a more bestial appearance. This transformation lasts for 1 minute, until you die, or until you revert to your normal appearance as a bonus action. When you shift, you gain temporary hit points equal to 2 x your proficiency bonus. You can shift a number of times equal to your proficiency bonus, and you regain all expended uses when you finish a long rest. Whenever you shift, you gain an additional benefit based on one of the following options (choose when you select this race): Beasthide. You gain 1d6 additional temporary hit points. While shifted, you have a +1 bonus to your Armor Class. Longtooth. When you shift and as a bonus action on your other turns while shifted, you can use your elongated fangs to make an unarmed strike. If you hit with your fangs, you can deal piercing damage equal to 1d6 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike. Swiftstride. While shifted, your walking speed increases by 10 feet. Additionally, you can move up to 10 feet as a reaction when a creature ends its turn within 5 feet of you. This reactive movement doesn’t provoke opportunity attacks. Wildhunt. While shifted, you have advantage on Wisdom checks, and no creature within 30 feet of you can make an attack roll with advantage against you unless you’re incapacitated.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Natural Athlete', 'You have proficiency in the Athletics skill.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shifting Feature', 'Whenever you shift, you gain 1d6 additional temporary hit points, and while shifted, you have a +1 bonus to your Armor Class.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Fierce', 'You have proficiency in the Intimidation skill.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shifting Feature', 'While shifted, you can use your elongated fangs to make an unarmed strike as a bonus action. If you hit with your fangs, you can deal piercing damage equal to 1d6 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Graceful', 'You have proficiency in the Acrobatics skill.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shifting Feature', 'While shifted, your walking speed increases by 10 feet. Additionally, you can move up to 10 feet as a reaction when an enemy ends its turn within 5 feet of you. This reactive movement doesn’t provoke opportunity attacks.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Natural Tracker', 'You have proficiency in the Survival skill.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Mark the Scent', 'As a bonus action, you can mark one creature you can see within 10 feet of you. Until the end of your next long rest, your proficiency bonus is doubled for any ability check you make to find the marked creature, and you always know the location of that creature if it is within 60 feet of you. You can’t use this trait again until you finish a short or long rest.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shifting Feature', 'While shifted, you have advantage on Wisdom checks.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shifting Feature', 'While shifting, you gain a climb speed of 30 feet.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shifting Feature', 'While shifting, you can make an unarmed strike as a bonus action. You can use your Dexterity for its attack roll and damage bonus, and this attack deals slashing damage.'
FROM lineages l, core_books b WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Cat's Claws', 'You can use your claws to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Cat's Talent', 'You have proficiency in the Perception and Stealth skills.'
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Feline Agility', 'Your reflexes and agility allow you to move with a burst of speed. When you move on your turn in combat, you can double your speed until the end of the turn. Once you use this trait, you can’t use it again until you move 0 feet on one of your turns.'
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Tabaxi tend toward chaotic alignments, as they let impulse and fancy guide their decisions. They are rarely evil, with most of them driven by curiosity rather than greed or other dark impulses.'
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You have a cat''s keen senses, especially in the dark. You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Feline Agility', 'Your reflexes and agility allow you to move with a burst of speed. When you move on your tum in combat, you can double your speed until the end of the tum. Once you use this trait, you can''t use it again until you move 0 feet on one of your turns.'
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Cat's Claws', 'Because of your claws, you have a climbing speed of 20 feet. In addition, your claws are natural weapons, which you can use to make unarmed strikes. If you hit with them, you deal slashing damage equal to 1d4 + your Strength modifier, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Cat's Talent', 'You have proficiency in the Perception and Stealth skills.'
FROM lineages l, core_books b WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Claws', 'You have claws that you can use to make unarmed strikes. When you hit with them, the strike deals 1d6 + your Strength modifier slashing damage, instead of the bludgeoning damage normal for an unarmed strike.'
FROM lineages l, core_books b WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Hold Breath', 'You can hold your breath for up to 1 hour.'
FROM lineages l, core_books b WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Natural Armor', 'Your shell provides you a base AC of 17 (your Dexterity modifier doesn’t affect this number). You can’t wear light, medium, or heavy armor, but if you are using a shield, you can apply the shield’s bonus as normal.'
FROM lineages l, core_books b WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Nature's Intuition', 'Thanks to your mystical connection to nature, you gain proficiency with one of the following skills of your choice: Animal Handling, Medicine, Nature, Perception, Stealth, or Survival.'
FROM lineages l, core_books b WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Shell Defense', 'You can withdraw into your shell as an action. Until you emerge, you gain a +4 bonus to your AC, and you have advantage on Strength and Constitution saving throws. While in your shell, you are prone, your speed is 0 and can’t increase, you have disadvantage on Dexterity saving throws, you can’t take reactions, and the only action you can take is a bonus action to emerge from your shell.'
FROM lineages l, core_books b WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Amphibious', 'You can breathe air and water.'
FROM lineages l, core_books b WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Control Air and Water', 'You can cast Fog Cloud with this trait. Starting at 3rd level, you can cast the Gust of Wind spell with this trait. Starting at 5th level, you can also cast the Water Walk spell with it. Once you cast any of these spells with this trait, you can’t cast that spell with it again until you finish a long rest. You can also cast these spells using any spell slots you have of the appropriate level. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Emissary of the Sea', 'You can communicate simple ideas to any Beast, Elemental, or Monstrosity that has a swimming speed. It can understand your words, though you have no special ability to understand it in return.'
FROM lineages l, core_books b WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Guardian of the Depths', 'Adapted to the frigid ocean depths, you have resistance to cold damage.'
FROM lineages l, core_books b WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Tritons tend toward lawful good. As guardians of the darkest reaches of the sea, their culture pushes them toward order and benevolence.'
FROM lineages l, core_books b WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Amphibious', 'You can breathe air and water.'
FROM lineages l, core_books b WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Control Air and Water', 'A child of the sea, you can call on the magic of elemental air and water. You can cast Fog Cloud with this trait. Starting at 3rd level, you can cast Gust of Wind with it, and starting at 5th level, you can also cast Wall of Water with it. Once you cast a spell with this trait, you can’t cast that spell with it again until you finish a long rest. Charisma is your spellcasting ability for these spells.'
FROM lineages l, core_books b WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You can’t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Emissary of the Sea', 'Aquatic beasts have an extraordinary affinity with your people. You can communicate simple ideas with beasts that can breathe water. They can understand the meaning of your words, though you have no special ability to understand them in return.'
FROM lineages l, core_books b WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Guardians of the Depths', 'Adapted to even the most extreme ocean depths, you have resistance to cold damage.'
FROM lineages l, core_books b WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Most warforged take comfort in order and discipline, tending toward law and neutrality. But some have absorbed the morality – or lack thereof – of the beings with which they served.'
FROM lineages l, core_books b WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Warforged Resilience', 'You were created to have remarkable fortitude, represented by the following benefits. You have advantage on saving throws against being poisoned, and you have resistance to poison damage. You are immune to disease. You don’t need to eat, drink, or breathe. You don''t need to sleep and don''t suffer the effects of exhaustion due to lack of rest, and magic can’t put you to sleep.'
FROM lineages l, core_books b WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Sentry's Rest', 'When you take a long rest, you must spend at least six hours in an inactive, motionless state, rather than sleeping. In this state, you appear inert, but it doesn’t render you unconscious, and you can see and hear as normal.'
FROM lineages l, core_books b WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Integrated Protection', 'Your body has built-in defensive layers, which determine your armor class. You gain no benefit from wearing armor, but if you are using a shield, you apply its bonus as normal. You can alter your body to enter different defensive modes; each time you finish a long rest, choose one mode to adopt from the Integrated Protection table, provided you meet the mode’s prerequisite.'
FROM lineages l, core_books b WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Specialized Design', 'You gain one skill proficiency of your choice, one tool proficiency of your choice, and fluency in one language of your choice.'
FROM lineages l, core_books b WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Integrated Tool', 'Choose one tool you’re proficient with. This tool is integrated into your body, and you double your proficiency bonus for any ability checks you make with it. You must have your hands free to use this integrated tool.'
FROM lineages l, core_books b WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Iron Fists', 'When you make an unarmed strike, you can deal 1d4 + your Strength modifier bludgeoning damage instead of the normal damage.'
FROM lineages l, core_books b WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Powerful Build', 'You count as one size larger when determining your carrying capacity and the weight you can push, drag, or lift.'
FROM lineages l, core_books b WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Swift', 'Your walking speed is increased by 5 feet.'
FROM lineages l, core_books b WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Light Step', 'When you are traveling alone for an extended period of time (one hour or more), you can move stealthily at a normal pace.'
FROM lineages l, core_books b WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light and in darkness as if it were dim light. You discern colors in that darkness only as shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Magic Resistance', 'You have advantage on saving throws against spells.'
FROM lineages l, core_books b WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Poison Resilience', 'You have advantage on saving throws you make to avoid or end the poisoned condition on yourself. You also have resistance to poison damage.'
FROM lineages l, core_books b WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Serpentine Spellcasting', 'You know the Poison Spray cantrip. You can cast Animal Friendship an unlimited number of times with this trait, but you can target only snakes with it. Starting at 3rd level, you can also cast Suggestion with this trait. Once you cast it, you can’t do so again until you finish a long rest. You can also cast it using any spell slots you have of 2nd level or higher. Intelligence, Wisdom, or Charisma is your spellcasting ability for these spells when you cast them with this trait (choose when you select this race).'
FROM lineages l, core_books b WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Alignment', 'Purebloods are devoid of emotion and see others as tools to manipulate. They care little for law or chaos and are typically neutral evil.'
FROM lineages l, core_books b WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Darkvision', 'You can see in dim light within 60 feet of you as if it were bright light, and in darkness as if it were dim light. You can''t discern color in darkness, only shades of gray.'
FROM lineages l, core_books b WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Innate Spellcasting', 'You know the Poison Spray cantrip. You can cast Animal Friendship an unlimited number of times with this trait, but you can target only snakes with it. Starting at 3rd level, you can also cast Suggestion with this trait. Once you cast it, you can''t do so again until you finish a long rest. Charisma is your spellcasting ability for these spells.'
FROM lineages l, core_books b WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Magic Resistance', 'You have advantage on saving throws against spells and other magical effects.'
FROM lineages l, core_books b WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM';


INSERT INTO lineage_features (lineage_id, available_at_level, name, description)
SELECT l.id, 1, 'Poison Immunity', 'You are immune to poison damage and the poisoned condition.'
FROM lineages l, core_books b WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM';
