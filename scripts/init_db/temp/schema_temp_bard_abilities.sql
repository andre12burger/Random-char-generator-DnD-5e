-- =============================================================================
-- BARD SUBCLASSES 
-- =============================================================================

-- Subclasse: College of Creation (ID: 19)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(19, 'Mote of Potential', 3, 'Whenever you give a creature a Bardic Inspiration die, you can create a Tiny mote of potential, which provides an additional effect when the die is used on an ability check, attack roll, or saving throw.'),
(19, 'Performance of Creation', 3, 'As an action, you can create one nonmagical item of your choice in an unoccupied space within 10 feet of you. The gp value of the item can’t be more than 20 times your bard level.'),
(19, 'Animating Performance', 6, 'As an action, you can animate one Large or smaller nonmagical item, which becomes a Dancing Item under your control for 1 hour.'),
(19, 'Creative Crescendo', 14, 'When you use your Performance of Creation, you can create more than one item at once, equal to your Charisma modifier. You are no longer limited by gp value.');

-- Subclasse: College of Eloquence (ID: 20)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(20, 'Silver Tongue', 3, 'When you make a Charisma (Persuasion) or Charisma (Deception) check, you can treat a d20 roll of 9 or lower as a 10.'),
(20, 'Unsettling Words', 3, 'As a bonus action, you can expend one use of your Bardic Inspiration to cause a creature to subtract your Bardic Inspiration die from its next saving throw.'),
(20, 'Unfailing Inspiration', 6, 'When a creature adds one of your Bardic Inspiration dice to a roll and fails, the creature can keep the Bardic Inspiration die.'),
(20, 'Universal Speech', 6, 'As an action, you can choose creatures up to your Charisma modifier to magically understand you, regardless of the language you speak, for 1 hour.'),
(20, 'Infectious Inspiration', 14, 'When a creature succeeds on a roll using one of your Bardic Inspiration dice, you can use your reaction to give a Bardic Inspiration die to a different creature without expending a use.');

-- Subclasse: College of Glamour (ID: 21)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(21, 'Mantle of Inspiration', 3, 'As a bonus action, you can expend a Bardic Inspiration use to grant yourself a wondrous appearance and give temporary hit points to allies who can also use their reaction to move.'),
(21, 'Enthralling Performance', 3, 'If you perform for at least 1 minute, you can attempt to charm a number of humanoids up to your Charisma modifier.'),
(21, 'Mantle of Majesty', 6, 'As a bonus action, you can cast Command without a spell slot. For the next minute, you can continue to cast Command as a bonus action each turn.'),
(21, 'Unbreakable Majesty', 14, 'As a bonus action, you can assume a majestic presence. For 1 minute, any creature trying to attack you for the first time on a turn must make a Charisma saving throw or fail the attack.');

-- Subclasse: College of Lore (ID: 22)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(22, 'Bonus Proficiencies', 3, 'You gain proficiency with three skills of your choice.'),
(22, 'Cutting Words', 3, 'When a creature you can see makes an attack roll, ability check, or damage roll, you can use your reaction to expend a Bardic Inspiration, roll the die, and subtract the number from the creature''s roll.'),
(22, 'Additional Magical Secrets', 6, 'You learn two spells of your choice from any class. The spells count as bard spells for you.'),
(22, 'Peerless Skill', 14, 'When you make an ability check, you can expend one use of Bardic Inspiration, roll the die, and add the number to your ability check.');

-- Subclasse: College of Spirits (ID: 23)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(23, 'Guiding Whispers', 3, 'You learn the Guidance cantrip, and its range is 60 feet for you.'),
(23, 'Spiritual Focus', 3, 'You can use a candle, crystal ball, skull, spirit board, or tarokka deck as a spellcasting focus.'),
(23, 'Tales from Beyond', 3, 'As a bonus action, you can expend a Bardic Inspiration to roll on the Spirit Tales table and gain a random effect that you can bestow on a creature.'),
(23, 'Spirit Session', 6, 'As an hour-long ritual, you can learn one spell of your choice from any class, which must be from the school of divination or necromancy.'),
(23, 'Mystical Connection', 14, 'Whenever you roll on the Spirit Tales table, you can roll the die twice and choose which of the two effects to bestow.');

-- Subclasse: College of Swords (ID: 24)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(24, 'Bonus Proficiencies', 3, 'You gain proficiency with medium armor and the scimitar. You can use any simple or martial melee weapon you are proficient with as a spellcasting focus.'),
(24, 'Fighting Style', 3, 'You adopt a particular style of fighting. Choose between Dueling and Two-Weapon Fighting.'),
(24, 'Blade Flourish', 3, 'When you take the Attack action, your walking speed increases by 10 feet, and you can use a Blade Flourish option (Defensive, Slashing, or Mobile) by expending a Bardic Inspiration die.'),
(24, 'Extra Attack', 6, 'You can attack twice, instead of once, whenever you take the Attack action on your turn.'),
(24, 'Master''s Flourish', 14, 'Whenever you use a Blade Flourish option, you can roll a d6 and use it instead of expending a Bardic Inspiration die.');

-- Subclasse: College of Valor (ID: 25)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(25, 'Bonus Proficiencies', 3, 'You gain proficiency with medium armor, shields, and martial weapons.'),
(25, 'Combat Inspiration', 3, 'A creature with your Bardic Inspiration die can add it to a weapon damage roll or to its AC against an attack.'),
(25, 'Extra Attack', 6, 'You can attack twice, instead of once, whenever you take the Attack action on your turn.'),
(25, 'Battle Magic', 14, 'When you use your action to cast a bard spell, you can make one weapon attack as a bonus action.');

-- Subclasse: College of Whispers (ID: 26)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(26, 'Psychic Blades', 3, 'When you hit a creature with a weapon attack, you can expend one use of your Bardic Inspiration to deal additional psychic damage.'),
(26, 'Words of Terror', 3, 'If you speak to a humanoid alone for at least 1 minute, you can attempt to seed paranoia and fear into its mind, frightening it.'),
(26, 'Mantle of Whispers', 6, 'When a humanoid dies within 30 feet of you, you can use your reaction to magically capture its shadow and adopt its persona as a disguise.'),
(26, 'Shadow Lore', 14, 'As an action, you can magically whisper a phrase that only one creature of your choice can hear, forcing it to make a Wisdom saving throw or be charmed by you for 8 hours.');

-- Subclasse: College of Creation (UA) (ID: 27)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(27, 'Note of Potential', 3, 'When you give a creature a Bardic Inspiration die, you can create a Note of Potential, an intangible mote that provides an additional effect when the die is used.'),
(27, 'Animating Performance', 6, 'As an action, you can animate a Large or smaller nonmagical item, which becomes a Dancing Item under your control for 1 hour.'),
(27, 'Performance of Creation', 14, 'As an action, you can create one nonmagical item of your choice in an unoccupied space within 10 feet of you. The item can''t be worth more than 20 times your bard level.');

-- Subclasse: College of Spirits (UA) (ID: 28)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(28, 'Guiding Whispers', 3, 'You learn the Guidance cantrip, and its range is 60 feet for you.'),
(28, 'Spiritual Focus', 3, 'You can use a candle, crystal ball, talking board, tarokka deck, or a skull as a spellcasting focus.'),
(28, 'Tales from Beyond', 3, 'As a bonus action, you can expend a Bardic Inspiration to roll on the Spirits’ Tales table and gain a random effect that you can bestow on a creature.'),
(28, 'Spirit Session', 6, 'You can conduct an hour-long ritual to learn one spell of your choice from any class, which must be from the school of divination or necromancy.'),
(28, 'Mystical Connection', 14, 'Whenever you use your Tales from Beyond feature, you can roll a d6 and use it instead of expending a Bardic Inspiration die.');

-- Subclasse: College of Satire (UA) (ID: 29)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(29, 'Bonus Proficiencies', 3, 'You gain proficiency with thieves’ tools, Sleight of Hand, and one additional skill of your choice.'),
(29, 'Tumbling Fool', 3, 'As a bonus action, you can tumble, gaining the benefits of the Dash and Disengage actions, a climbing speed, and resistance to falling damage for the turn.'),
(29, 'Fool''s Insight', 6, 'You can cast Detect Thoughts a number of times equal to your Charisma modifier.'),
(29, 'Fool''s Luck', 14, 'You can expend one use of Bardic Inspiration to add the roll to a failed ability check, saving throw, or attack roll, potentially turning it into a success.');

-- Subclasse: Mage of Lorehold (UA) Bard (ID: 30)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(30, 'Lorehold Primer', 2, 'At 2nd level, you gain proficiency in the History skill, if you don''t already have it. Additionally, you learn the comprehend languages and identify spells, which don''t count against the number of wizard spells you know.'),
(30, 'Lorehold Manifestation', 2, 'Starting at 2nd level, you can channel the power of ancient knowledge to manifest a spectral tome. As a bonus action, you can cause a spectral tome to appear in your hand. The tome has the following properties: The tome contains a number of pages equal to your wizard level. As an action, you can expend 1 page to cast a wizard cantrip that you know. The tome vanishes if you are incapacitated or if you dismiss it as a bonus action. You can use this feature a number of times equal to your Intelligence modifier (minimum of once). You regain all expended uses when you finish a long rest.'),
(30, 'Archivist''s Insight', 6, 'Beginning at 6th level, you can draw on the knowledge of ancient archivists. When you make an Intelligence check to recall lore about a person, place, or thing, you can add your proficiency bonus to the check even if you''re not proficient in the skill used. Additionally, when you cast a spell that deals damage, you can expend 1 page from your Lorehold Manifestation to deal an extra 1d6 force damage to one target of the spell.'),
(30, 'Lorehold Legacy', 10, 'Starting at 10th level, you can tap into the legacy of Lorehold to empower your spells. When you cast a spell, you can expend 1 page from your Lorehold Manifestation to cast the spell as if it were cast using a spell slot one level higher. Additionally, you can use your action to cause the spectral tome to unleash a burst of knowledge. Each creature of your choice within 30 feet of you must make an Intelligence saving throw against your spell save DC. A creature takes 2d6 psychic damage on a failed save, or half as much on a successful one. You can use this feature a number of times equal to your Intelligence modifier (minimum of once). You regain all expended uses when you finish a long rest.'),
(30, 'Archmage of Lorehold', 14, 'At 14th level, your connection to the ancient knowledge of Lorehold allows you to manifest powerful effects. When you cast a spell, you can expend 2 pages from your Lorehold Manifestation to cause the spell to affect an additional target. Additionally, you can use your action to cause the spectral tome to unleash a wave of knowledge. Each creature in a 30-foot cone must make an Intelligence saving throw against your spell save DC. A creature takes 4d6 psychic damage on a failed save, or half as much on a successful one. You can use this feature a number of times equal to your Intelligence modifier (minimum of once). You regain all expended uses when you finish a long rest.');

-- Subclasse: Mage of Silverquill (UA) Bard (ID: 31)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(31, 'Silverquill Primer', 2, 'At 2nd level, you gain proficiency in the Persuasion skill, if you don''t already have it. Additionally, you learn the vicious mockery and friends cantrips, which don''t count against the number of wizard cantrips you know.'),
(31, 'Silverquill Manifestation', 2, 'Starting at 2nd level, you can channel the power of words to manifest a silverquill quill. As a bonus action, you can cause a silverquill quill to appear in your hand. The quill has the following properties: The quill has 10 charges. When you hit with a spell attack, you can expend 1 charge to deal an extra 1d6 psychic damage. As an action, you can expend 1 charge to cast a wizard cantrip that you know. The quill vanishes if you are incapacitated or if you dismiss it as a bonus action. You can use this feature a number of times equal to your Intelligence modifier (minimum of once). You regain all expended uses when you finish a long rest.'),
(31, 'Rhetorical Flourish', 6, 'Beginning at 6th level, you can use your words to enhance your spells. When you cast a spell that requires a saving throw, you can add your Intelligence modifier to the spell''s save DC. Additionally, when you cast a spell that deals damage, you can expend 1 charge from your Silverquill Manifestation to deal an extra 1d6 psychic damage to one target of the spell. You can use this feature a number of times equal to your Intelligence modifier (minimum of once). You regain all expended uses when you finish a long rest.'),
(31, 'Silverquill Legacy', 10, 'Starting at 10th level, you can tap into the legacy of Silverquill to empower your spells. When you cast a spell, you can expend 1 charge from your Silverquill Manifestation to cast the spell as if it were cast using a spell slot one level higher. Additionally, you can use your action to cause the silverquill quill to unleash a burst of words. Each creature of your choice within 30 feet of you must make a Charisma saving throw against your spell save DC. A creature takes 2d6 psychic damage on a failed save, or half as much on a successful one. You can use this feature a number of times equal to your Intelligence modifier (minimum of once). You regain all expended uses when you finish a long rest.'),
(31, 'Archmage of Silverquill', 14, 'At 14th level, your connection to the eloquent words of Silverquill allows you to manifest powerful effects. When you cast a spell, you can expend 2 charges from your Silverquill Manifestation to cause the spell to affect an additional target. Additionally, you can use your action to cause the silverquill quill to unleash a wave of words. Each creature in a 30-foot cone must make a Charisma saving throw against your spell save DC. A creature takes 4d6 psychic damage on a failed save, or half as much on a successful one. You can use this feature a number of times equal to your Intelligence modifier (minimum of once). You regain all expended uses when you finish a long rest.');
