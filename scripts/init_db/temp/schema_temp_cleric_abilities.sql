-- =============================================================================
-- CLERIC SUBCLASSES 
-- =============================================================================

-- Subclasse: Arcana Domain (ID: 36)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(36, 'Arcane Initiate', 1, 'You gain proficiency in the Arcana skill, and you gain two cantrips of your choice from the wizard spell list.'),
(36, 'Channel Divinity: Arcane Abjuration', 2, 'As an action, you can use your Channel Divinity to abjure otherworldly creatures. One celestial, elemental, fey, or fiend of your choice within 30 feet must make a Wisdom saving throw or be turned for 1 minute.'),
(36, 'Spell Breaker', 6, 'When you restore hit points to an ally with a spell of 1st level or higher, you can also end one spell of your choice on that creature.'),
(36, 'Potent Spellcasting', 8, 'You add your Wisdom modifier to the damage you deal with any cleric cantrip.'),
(36, 'Arcane Mastery', 17, 'You choose four spells from the wizard spell list, one from each of the following levels: 6th, 7th, 8th, and 9th. You add them to your list of domain spells.');

-- Subclasse: Death Domain (ID: 37)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(37, 'Bonus Proficiency', 1, 'You gain proficiency with martial weapons.'),
(37, 'Reaper', 1, 'You learn one necromancy cantrip from any spell list. When you cast a necromancy cantrip that normally targets only one creature, it can instead target two creatures within 5 feet of each other.'),
(37, 'Channel Divinity: Touch of Death', 2, 'When you hit a creature with a melee attack, you can use Channel Divinity to deal extra necrotic damage equal to 5 + twice your cleric level.'),
(37, 'Inescapable Destruction', 6, 'Necrotic damage dealt by your cleric spells and Channel Divinity options ignores resistance to necrotic damage.'),
(37, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 necrotic damage.'),
(37, 'Improved Reaper', 17, 'When you cast a necromancy spell of 1st through 5th level that targets only one creature, the spell can instead target two creatures within 5 feet of each other.');

-- Subclasse: Forge Domain (ID: 38)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(38, 'Bonus Proficiencies', 1, 'You gain proficiency with heavy armor and smith''s tools.'),
(38, 'Blessing of the Forge', 1, 'At the end of a long rest, you can touch one nonmagical weapon or suit of armor and grant it a +1 bonus.'),
(38, 'Channel Divinity: Artisan''s Blessing', 2, 'You can use your Channel Divinity to conduct an hour-long ritual to create a nonmagical item that includes some metal.'),
(38, 'Soul of the Forge', 6, 'You gain resistance to fire damage and a +1 bonus to AC while wearing heavy armor.'),
(38, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 fire damage.'),
(38, 'Saint of Forge and Fire', 17, 'You gain immunity to fire damage and resistance to bludgeoning, piercing, and slashing damage from nonmagical attacks while wearing heavy armor.');

-- Subclasse: Grave Domain (ID: 39)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(39, 'Circle of Mortality', 1, 'When you restore hit points to a creature at 0 hit points, you instead use the highest number possible for each die. You also learn the Spare the Dying cantrip.'),
(39, 'Eyes of the Grave', 1, 'As an action, you can magically detect undead within 60 feet.'),
(39, 'Channel Divinity: Path to the Grave', 2, 'As an action, you can curse a creature. The next time you or an ally hits the cursed creature with an attack, the creature has vulnerability to all of that attack''s damage.'),
(39, 'Sentinel at Death''s Door', 6, 'As a reaction when you or an ally within 30 feet suffers a critical hit, you can turn that attack into a normal hit.'),
(39, 'Potent Spellcasting', 8, 'You add your Wisdom modifier to the damage you deal with any cleric cantrip.'),
(39, 'Keeper of Souls', 17, 'When an enemy you can see dies within 30 feet of you, you or an ally of your choice regains hit points equal to the enemy’s number of Hit Dice.');

-- Subclasse: Knowledge Domain (ID: 40)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(40, 'Blessings of Knowledge', 1, 'You learn two languages of your choice and gain proficiency with two skills from a specific list, with double proficiency bonus for those skills.'),
(40, 'Channel Divinity: Knowledge of the Ages', 2, 'As an action, you can use your Channel Divinity to gain proficiency with one skill or tool for 10 minutes.'),
(40, 'Channel Divinity: Read Thoughts', 6, 'As an action, you can use your Channel Divinity to read a creature''s thoughts and cast Suggestion on it without a spell slot.'),
(40, 'Potent Spellcasting', 8, 'You add your Wisdom modifier to the damage you deal with any cleric cantrip.'),
(40, 'Visions of the Past', 17, 'You can call up visions of the past related to an object you hold or your immediate surroundings.');

-- Subclasse: Life Domain (ID: 41)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(41, 'Bonus Proficiency', 1, 'You gain proficiency with heavy armor.'),
(41, 'Disciple of Life', 1, 'Your healing spells are more effective. When you use a spell of 1st level or higher to restore hit points, the creature regains additional hit points equal to 2 + the spell''s level.'),
(41, 'Channel Divinity: Preserve Life', 2, 'As an action, you can use your Channel Divinity to restore a number of hit points equal to five times your cleric level, divided among creatures within 30 feet.'),
(41, 'Blessed Healer', 6, 'When you cast a spell of 1st level or higher that restores hit points to a creature other than you, you regain hit points equal to 2 + the spell''s level.'),
(41, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 radiant damage.'),
(41, 'Supreme Healing', 17, 'When you would normally roll one or more dice to restore hit points with a spell, you instead use the highest number possible for each die.');

-- Subclasse: Light Domain (ID: 42)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(42, 'Bonus Cantrip', 1, 'You gain the Light cantrip if you don''t already know it.'),
(42, 'Warding Flare', 1, 'When you are attacked by a creature within 30 feet, you can use your reaction to impose disadvantage on the attack roll.'),
(42, 'Channel Divinity: Radiance of the Dawn', 2, 'As an action, you can use your Channel Divinity to dispel any magical darkness within 30 feet and deal radiant damage to hostile creatures.'),
(42, 'Improved Flare', 6, 'You can use your Warding Flare feature when a creature you can see attacks a creature other than you.'),
(42, 'Potent Spellcasting', 8, 'You add your Wisdom modifier to the damage you deal with any cleric cantrip.'),
(42, 'Corona of Light', 17, 'You can use your action to activate an aura of sunlight for 1 minute, emitting bright light and causing enemies in the light to have disadvantage on saving throws against spells that deal fire or radiant damage.');

-- Subclasse: Nature Domain (ID: 43)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(43, 'Acolyte of Nature', 1, 'You learn one druid cantrip of your choice and gain proficiency in one skill from a specific list.'),
(43, 'Bonus Proficiency', 1, 'You gain proficiency with heavy armor.'),
(43, 'Channel Divinity: Charm Animals and Plants', 2, 'As an action, you can use your Channel Divinity to charm each beast or plant creature that can see you within 30 feet.'),
(43, 'Dampen Elements', 6, 'When you or a creature within 30 feet takes acid, cold, fire, lightning, or thunder damage, you can use your reaction to grant resistance against that instance of damage.'),
(43, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 cold, fire, or lightning damage.'),
(43, 'Master of Nature', 17, 'While creatures are charmed by your Charm Animals and Plants feature, you can use a bonus action to verbally command what each of those creatures will do on its next turn.');

-- Subclasse: Order Domain (ID: 44)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(44, 'Bonus Proficiencies', 1, 'You gain proficiency with heavy armor and either Intimidation or Persuasion.'),
(44, 'Voice of Authority', 1, 'If you cast a spell of 1st level or higher targeting an ally, that ally can use their reaction to make one weapon attack.'),
(44, 'Channel Divinity: Order''s Demand', 2, 'As an action, you can use your Channel Divinity to charm creatures of your choice within 30 feet, and can cause them to drop what they are holding.'),
(44, 'Embodiment of the Law', 6, 'If you cast an enchantment spell of 1st level or higher with a casting time of 1 action, you can change the casting time to 1 bonus action.'),
(44, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 psychic damage.'),
(44, 'Order''s Wrath', 17, 'If you deal your Divine Strike damage to a creature, you can curse it. The next time an ally hits the cursed creature, it takes an extra 2d8 psychic damage.');

-- Subclasse: Peace Domain (ID: 45)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(45, 'Implement of Peace', 1, 'You gain proficiency in the Insight, Performance, or Persuasion skill.'),
(45, 'Emboldening Bond', 1, 'As an action, you can create a magical bond among a number of willing creatures equal to your proficiency bonus. While bonded, a creature can add a d4 to an attack roll, ability check, or saving throw once per turn.'),
(45, 'Channel Divinity: Balm of Peace', 2, 'As an action, you can move up to your speed, and when you move within 5 feet of any other creature, you can restore 2d6 + your Wisdom modifier hit points to it.'),
(45, 'Protective Bond', 6, 'When a creature affected by your Emboldening Bond is about to take damage, another bonded creature can use its reaction to teleport and take the damage instead.'),
(45, 'Potent Spellcasting', 8, 'You add your Wisdom modifier to the damage you deal with any cleric cantrip.'),
(45, 'Expansive Bond', 17, 'The range of your Emboldening Bond and Protective Bond features increases to 60 feet. When a creature uses Protective Bond, it has resistance to the damage taken.');

-- Subclasse: Tempest Domain (ID: 46)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(46, 'Bonus Proficiencies', 1, 'You gain proficiency with martial weapons and heavy armor.'),
(46, 'Wrath of the Storm', 1, 'When a creature within 5 feet of you hits you with an attack, you can use your reaction to cause the creature to make a Dexterity saving throw, taking 2d8 lightning or thunder damage on a failed save.'),
(46, 'Channel Divinity: Destructive Wrath', 2, 'When you roll lightning or thunder damage, you can use your Channel Divinity to deal maximum damage, instead of rolling.'),
(46, 'Thunderous Strike', 6, 'When you deal lightning damage to a Large or smaller creature, you can also push it up to 10 feet away from you.'),
(46, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 thunder damage.'),
(46, 'Stormborn', 17, 'You have a flying speed equal to your current walking speed whenever you are not underground or indoors.');

-- Subclasse: Trickery Domain (ID: 47)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(47, 'Blessing of the Trickster', 1, 'You can use your action to touch a willing creature other than yourself to give it advantage on Dexterity (Stealth) checks for 1 hour.'),
(47, 'Channel Divinity: Invoke Duplicity', 2, 'As an action, you can create a perfect illusion of yourself that lasts for 1 minute. You can cast spells as though you were in the illusion''s space.'),
(47, 'Channel Divinity: Cloak of Shadows', 6, 'As an action, you can use your Channel Divinity to become invisible until the end of your next turn.'),
(47, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 poison damage.'),
(47, 'Improved Duplicity', 17, 'You can create up to four duplicates of yourself when you use Invoke Duplicity.');

-- Subclasse: Twilight Domain (ID: 48)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(48, 'Bonus Proficiencies', 1, 'You gain proficiency with martial weapons and heavy armor.'),
(48, 'Eyes of Night', 1, 'You have darkvision with no maximum range. You can magically share this darkvision with other creatures.'),
(48, 'Vigilant Blessing', 1, 'As an action, you give one creature you touch advantage on its next initiative roll.'),
(48, 'Channel Divinity: Twilight Sanctuary', 2, 'As an action, you create a 30-foot radius sphere of twilight for 1 minute. When a creature ends its turn in the sphere, you can grant it 1d8 temporary hit points or end a charm or frighten effect on it.'),
(48, 'Steps of the Brave', 6, 'You have advantage on saving throws against being frightened. If you are in dim light or darkness, you can use a bonus action to gain a flying speed equal to your walking speed for 1 minute.'),
(48, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 psychic damage.'),
(48, 'Midnight Shroud', 17, 'When you cast the Darkness spell, you can choose a number of creatures to see through the darkness.');

-- Subclasse: War Domain (ID: 49)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(49, 'Bonus Proficiency', 1, 'You gain proficiency with martial weapons and heavy armor.'),
(49, 'War Priest', 1, 'When you use the Attack action, you can make one weapon attack as a bonus action. You can use this feature a number of times equal to your Wisdom modifier.'),
(49, 'Channel Divinity: Guided Strike', 2, 'When you make an attack roll, you can use your Channel Divinity to gain a +10 bonus to the roll.'),
(49, 'Channel Divinity: War God''s Blessing', 6, 'When a creature within 30 feet of you makes an attack roll, you can use your reaction to grant that creature a +10 bonus to the roll.'),
(49, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 damage of the same type dealt by the weapon.'),
(49, 'Avatar of Battle', 17, 'You gain resistance to bludgeoning, piercing, and slashing damage from nonmagical attacks.');

-- Subclasse: Solidarity Domain (Amonkhet) (ID: 50)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(50, 'Solidarity Domain Spells', 1, 'You get domain spells at cleric levels 1, 3, 5, 7, and 9.'),
(50, 'Bonus Proficiency', 1, 'You gain proficiency with heavy armor.'),
(50, 'Solidarity''s Action', 1, 'When you take the Help action to aid an ally’s attack, you can make one weapon attack as a bonus action.'),
(50, 'Channel Divinity: Preserve Life', 2, 'As an action, you can use your Channel Divinity to heal the badly injured, restoring a number of hit points equal to five times your cleric level.'),
(50, 'Channel Divinity: Oketra''s Blessing', 6, 'When a creature within 30 feet of you makes an attack roll, you can use your reaction to grant that creature a +10 bonus to the roll.'),
(50, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 psychic damage.'),
(50, 'Supreme Healing', 17, 'When you would normally roll one or more dice to restore hit points with a spell, you instead use the highest number possible for each die.');

-- Subclasse: Strength Domain (Amonkhet) (ID: 51)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(51, 'Strength Domain Spells', 1, 'You get domain spells at cleric levels 1, 3, 5, 7, and 9.'),
(51, 'Bonus Proficiency', 1, 'You gain proficiency with heavy armor.'),
(51, 'Acolyte of Strength', 1, 'You learn one druid cantrip of your choice and gain proficiency in one of the following skills: Animal Handling, Athletics, Nature, or Survival.'),
(51, 'Channel Divinity: Feat of Strength', 2, 'When you make an attack roll, ability check, or saving throw using Strength, you can use your Channel Divinity to gain a +10 bonus to the roll.'),
(51, 'Channel Divinity: Rhonas''s Blessing', 6, 'When a creature within 30 feet of you makes an attack roll, ability check, or saving throw using Strength, you can use your reaction to grant that creature a +10 bonus to the roll.'),
(51, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 damage of the same type dealt by the weapon to the target.'),
(51, 'Avatar of Battle', 17, 'You gain resistance to bludgeoning, piercing, and slashing damage from nonmagical attacks.');

-- Subclasse: Ambition Domain (Amonkhet) (ID: 52)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(52, 'Ambition Domain Spells', 1, 'You get domain spells at cleric levels 1, 3, 5, 7, and 9.'),
(52, 'Warding Flare', 1, 'When you are attacked by a creature within 30 feet of you that you can see, you can use your reaction to impose disadvantage on the attack roll.'),
(52, 'Channel Divinity: Invoke Duplicity', 2, 'As an action, you can use your Channel Divinity to create an illusory duplicate of yourself for 1 minute.'),
(52, 'Channel Divinity: Cloak of Shadows', 6, 'As an action, you can use your Channel Divinity to vanish, becoming invisible until the end of your next turn.'),
(52, 'Potent Spellcasting', 8, 'You add your Wisdom modifier to the damage you deal with any cleric cantrip.'),
(52, 'Improved Duplicity', 17, 'You can create up to four duplicates of yourself, instead of one, when you use Invoke Duplicity.');

-- Subclasse: Zeal Domain (Amonkhet) (ID: 53)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(53, 'Zeal Domain Spells', 1, 'You get domain spells at cleric levels 1, 3, 5, 7, and 9.'),
(53, 'Bonus Proficiencies', 1, 'You gain proficiency with martial weapons and heavy armor.'),
(53, 'Priest of Zeal', 1, 'When you use the Attack action, you can make one weapon attack as a bonus action.'),
(53, 'Channel Divinity: Consuming Fervor', 2, 'When you roll fire or thunder damage, you can use your Channel Divinity to deal maximum damage instead of rolling.'),
(53, 'Resounding Strike', 6, 'When you deal thunder damage to a Large or smaller creature, you can also push it up to 10 feet away from you.'),
(53, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 damage of the same type dealt by the weapon to the target.'),
(53, 'Blaze of Glory', 17, 'When you are reduced to 0 hit points, you can use your reaction to move up to your speed and make one final melee weapon attack.');

-- Subclasse: Fate Domain (UA) (ID: 54)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(54, 'Omens and Portents', 1, 'You can cast Augury without a spell slot and without components. When you cast divination spells with a chance of a random reading, you reduce that chance by 25 percent.'),
(54, 'Ties That Bind', 1, 'As an action, you can magically tie a strand of fate to a creature or object for 1 hour. You can sense the direction to the target, and once per turn when you cast a spell on it, it takes extra damage or healing.'),
(54, 'Channel Divinity: Strands of Fate', 2, 'As a bonus action, for 1 minute, you can use your reaction to give advantage or disadvantage to an attack roll or ability check made by another creature you can see.'),
(54, 'Insightful Striking', 6, 'As a bonus action, you can choose a creature and gain a brief vision of its defenses, adding a d6 to your next attack roll against it or forcing it to subtract a d6 from its next saving throw against your spell.'),
(54, 'Potent Spellcasting', 8, 'You add your Wisdom modifier to the damage you deal with any cleric cantrip.'),
(54, 'Visions of the Future', 17, 'You can cast Foresight once without a spell slot, with a duration of 1 minute.');

-- Subclasse: City Domain (UA) (ID: 55)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(55, 'Bonus Cantrip', 1, 'You gain the On/Off cantrip.'),
(55, 'Bonus Proficiencies', 1, 'You gain proficiency with sidearms and vehicles (land).'),
(55, 'Heart of the City', 1, 'While within any city, you can gain advantage on a single Charisma (Deception, Intimidation, or Persuasion) check.'),
(55, 'Channel Divinity: Spirits of the City', 2, 'As an action, you can cause any city utility within 30 feet to work perfectly or shut down for 1 minute. Hostile creatures within 30 feet must make a Charisma saving throw or be knocked prone or restrained.'),
(55, 'Block Watch', 6, 'While in an urban environment, you are considered proficient in Insight and Perception, and you add double your proficiency bonus to those checks.'),
(55, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 psychic damage.'),
(55, 'Express Transit', 17, 'You can use mass transit routes to teleport instantaneously to other points in the city.');

-- Subclasse: Protection Domain (UA) (ID: 56)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(56, 'Bonus Proficiency', 1, 'You gain proficiency with heavy armor.'),
(56, 'Shield of the Faithful', 1, 'When a creature attacks a target other than you that is within 5 feet of you, you can use your reaction to impose disadvantage on the attack roll.'),
(56, 'Channel Divinity: Radiant Defense', 2, 'As an action, you can channel blessed energy into an ally. The first time that ally is hit by an attack within the next minute, the attacker takes radiant damage.'),
(56, 'Blessed Healer', 6, 'When you cast a spell of 1st level or higher that restores hit points to a creature other than you, you regain hit points equal to 2 + the spell’s level.'),
(56, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 radiant damage.'),
(56, 'Indomitable Defense', 17, 'You gain resistance to two damage types. You can temporarily transfer this resistance to a creature you touch.');

-- Subclasse: Twilight Domain (UA) (ID: 57)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(57, 'Bonus Proficiencies', 1, 'You gain proficiency with martial weapons and heavy armor.'),
(57, 'Eyes of Night', 1, 'You have darkvision with no maximum range. You can magically share this darkvision with other creatures.'),
(57, 'Vigilant Blessing', 1, 'As an action, you give one creature you touch advantage on its next initiative roll.'),
(57, 'Channel Divinity: Twilight Sanctuary', 2, 'As an action, you create a 30-foot radius sphere of twilight for 1 minute. When a creature ends its turn in the sphere, you can grant it 1d8 temporary hit points or end a charm or frighten effect on it.'),
(57, 'Steps of the Brave', 6, 'You have advantage on saving throws against being frightened. If you are in dim light or darkness, you can use a bonus action to gain a flying speed equal to your walking speed for 1 minute.'),
(57, 'Divine Strike', 8, 'Once on each of your turns when you hit a creature with a weapon attack, you can cause the attack to deal an extra 1d8 psychic damage.'),
(57, 'Midnight Shroud', 17, 'When you cast the Darkness spell, you can choose a number of creatures to see through the darkness.');

-- Subclasse: Unity Domain (UA) (ID: 58)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(58, 'Emboldening Bond', 1, 'As an action, you can choose two willing creatures and create a magical bond between them. While either bonded creature is within 30 feet of the other, it can add a d4 to an attack roll, ability check, or saving throw once per turn.'),
(58, 'Channel Divinity: Shared Burden', 2, 'When a creature you can see takes damage, you can use your reaction to choose other willing creatures to distribute the damage among the original target and the chosen creatures.'),
(58, 'Protective Bond', 6, 'While either creature chosen for your Emboldening Bond is within 30 feet of the other, it can use its reaction to grant resistance to all damage to the other creature when that other creature takes damage.'),
(58, 'Potent Spellcasting', 8, 'You add your Wisdom modifier to the damage you deal with any cleric cantrip.'),
(58, 'Enduring Unity', 17, 'Creatures affected by your Emboldening Bond gain its benefits while they are on the same plane of existence. Additionally, when a bonded creature is reduced to 0 hit points, its partner gains several benefits for 1 minute.');
