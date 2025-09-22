-- =============================================================================
-- BARBARIAN SUBCLASSES
-- =============================================================================

INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(7, 'Ancestral Protectors', 3, 'Starting when you choose this path at 3rd level, spectral warriors appear when you enter your rage. While you''re raging, the first creature you hit with an attack on your turn becomes the target of the warriors, which hinder its attacks. Until the start of your next turn, that target has disadvantage on any attack roll that isn''t against you, and when the target hits a creature other than you with an attack, that creature has resistance to the damage dealt by the attack. The effect on the target ends early if your rage ends.'),
(7, 'Spirit Shield', 6, 'Beginning at 6th level, the guardian spirits that aid you can provide supernatural protection to those you defend. If you are raging and another creature you can see within 30 feet of you takes damage, you can use your reaction to reduce that damage by 2d6. When you reach certain levels in this class, you can reduce the damage by more: by 3d6 at 10th level and by 4d6 at 14th level.'),
(7, 'Consult the Spirits', 10, 'At 10th level, you gain the ability to consult with your ancestral spirits. When you do so, you cast the Augury or Clairvoyance spell, without using a spell slot or material components. Rather than creating a spherical sensor, this use of clairvoyance invisibly summons one of your ancestral spirits to the chosen location. Wisdom is your spellcasting ability for these spells. After you cast either spell in this way, you can''t use this feature again until you finish a short or long rest.'),
(7, 'Vengeful Ancestors', 14, 'At 14th level, your ancestral spirits grow powerful enough to retaliate. When you use your Spirit Shield to reduce the damage of an attack, the attacker takes an amount of force damage that your Spirit Shield prevents.');
-- End of file: single ordered set of barbarian subclass sections

-- Subclasse: Path of the Battlerager (ID: 8)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(8, 'Restriction: Dwarves Only', 3, 'Only dwarves can follow the Path of the Battlerager. The battlerager fills a particular niche in dwarven society and culture. Your DM can lift this restriction to better suit the campaign. The restriction exists for the Forgotten Realms. It might not apply to your DM''s setting or your DM''s version of the Realms.'),
(8, 'Battlerager Armor', 3, 'When you choose this path at 3rd level, you gain the ability to use spiked armor as a weapon. While you are wearing spiked armor and are raging, you can use a bonus action to make one melee weapon attack with your armor spikes against a target within 5 feet of you. If the attack hits, the spikes deal 1d4 piercing damage. You use your Strength modifier for the attack and damage rolls. Additionally, when you use the Attack action to grapple a creature, the target takes 3 piercing damage if your grapple check succeeds.'),
(8, 'Reckless Abandon', 6, 'Beginning at 6th level, when you use Reckless Attack while raging, you also gain temporary hit points equal to your Constitution modifier (minimum of 1). They vanish if any of them are left when your rage ends.'),
(8, 'Battlerager Charge', 10, 'Beginning at 10th level, you can take the Dash action as a bonus action while you are raging.'),
(8, 'Spiked Retribution', 14, 'Starting at 14th level, when a creature within 5 feet of you hits you with a melee attack, the attacker takes 3 piercing damage if you are raging, aren''t incapacitated, and are wearing spiked armor.');

-- Subclasse: Path Of The Beast (ID: 9)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(9, 'Form of the Beast', 3, 'When you enter your rage, you manifest a natural weapon. You choose the weapon’s form each time you rage: Bite, Claws, or Tail.'),
(9, 'Bestial Soul', 6, 'The feral power within you increases, causing your natural weapons to count as magical. You can also alter your form to adapt to your surroundings (swimming, climbing, or jumping).'),
(9, 'Infectious Fury', 10, 'When you hit a creature with your natural weapons while raging, you can curse your target. The target must succeed on a Wisdom saving throw or either use its reaction to make a melee attack against another creature of your choice, or take 2d12 psychic damage.'),
(9, 'Call the Hunt', 14, 'When you enter your rage, you can choose a number of other willing creatures you can see. You gain 5 temporary hit points for each creature that accepts this feature. Until the rage ends, the chosen creatures can add a d6 to one damage roll on each of their turns.');

-- Subclasse: Path of the Berserker (ID: 10)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(10, 'Frenzy', 3, 'You can go into a frenzy when you rage, allowing you to make a single melee weapon attack as a bonus action on each of your turns. When your rage ends, you suffer one level of exhaustion.'),
(10, 'Mindless Rage', 6, 'You can''t be charmed or frightened while raging.'),
(10, 'Intimidating Presence', 10, 'You can use your action to frighten a creature.'),
(10, 'Retaliation', 14, 'When you take damage from a creature within 5 feet of you, you can use your reaction to make a melee weapon attack against that creature.');

-- Subclasse: Path of the Giant (ID: 11)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(11, 'Giant''s Power', 3, 'You learn to speak, read, and write Giant or one other language. You also learn either the druidcraft or thaumaturgy cantrip.'),
(11, 'Giant''s Havoc', 3, 'While raging, your reach increases by 5 feet, and if you are smaller than Large, you become Large. You can also add your Rage Damage bonus to thrown weapon attacks using Strength.'),
(11, 'Elemental Cleaver', 6, 'When you enter your rage, you can infuse a weapon with acid, cold, fire, thunder, or lightning damage. The weapon deals an extra 1d6 damage of the chosen type and gains the thrown property.'),
(11, 'Mighty Impel', 10, 'As a bonus action while raging, you can move one Medium or smaller creature within your reach to an unoccupied space within 30 feet.'),
(11, 'Demiurgic Colossus', 14, 'When you rage, your reach increases by 10 feet, your size can increase to Large or Huge, and you can move Large or smaller creatures with Mighty Impel. Your Elemental Cleaver damage increases to 2d6.');

-- Subclasse: Path of the Storm Herald (ID: 12)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(12, 'Storm Aura', 3, 'You emanate a stormy, magical aura while you rage. Choose desert, sea, or tundra. Your aura has an effect that activates when you enter your rage and as a bonus action.'),
(12, 'Storm Soul', 6, 'The storm grants you benefits even when your aura isn''t active, based on the environment you chose for your Storm Aura (resistance to fire, lightning, or cold).'),
(12, 'Shielding Storm', 10, 'Each creature of your choice has the damage resistance you gained from the Storm Soul feature while the creature is in your Storm Aura.'),
(12, 'Raging Storm', 14, 'The power of the storm you channel grows mightier, lashing out at your foes based on the environment you chose for your Storm Aura.');

-- Subclasse: Path of the Totem Warrior (ID: 13)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(13, 'Spirit Seeker', 3, 'You gain the ability to cast the Beast Sense and Speak with Animals spells, but only as rituals.'),
(13, 'Totem Spirit', 3, 'You choose a totem spirit (Bear, Eagle, Elk, Tiger, or Wolf) and gain its feature.'),
(13, 'Aspect of the Beast', 6, 'You gain a magical benefit based on the totem animal of your choice.'),
(13, 'Spirit Walker', 10, 'You can cast the Commune with Nature spell, but only as a ritual.'),
(13, 'Totemic Attunement', 14, 'You gain a magical benefit based on a totem animal of your choice.');

-- Subclasse: Path of Wild Magic (ID: 14)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(14, 'Magic Awareness', 3, 'As an action, you can open your awareness to the presence of concentrated magic.'),
(14, 'Wild Surge', 3, 'When you enter your rage, roll on the Wild Magic table to determine the magical effect produced.'),
(14, 'Bolstering Magic', 6, 'As an action, you can touch one creature and confer a benefit to it, such as adding a d3 to attack rolls or ability checks, or restoring a spell slot.'),
(14, 'Unstable Backlash', 10, 'Immediately after you take damage or fail a saving throw while raging, you can use your reaction to roll on the Wild Magic table and immediately produce the effect rolled.'),
(14, 'Controlled Surge', 14, 'Whenever you roll on the Wild Magic table, you can roll the die twice and choose which of the two effects to unleash.');

-- Subclasse: Path of the Zealot (ID: 15)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(15, 'Divine Fury', 3, 'While you''re raging, the first creature you hit on each of your turns with a weapon attack takes extra damage equal to 1d6 + half your Barbarian level.'),
(15, 'Warrior of the Gods', 3, 'If a spell has the sole effect of restoring you to life, the caster doesn''t need material components to cast the spell on you.'),
(15, 'Fanatical Focus', 6, 'If you fail a saving throw while raging, you can reroll it, and you must use the new roll. You can use this ability only once per rage.'),
(15, 'Zealous Presence', 10, 'As a bonus action, you can unleash a battle cry to grant up to ten other creatures advantage on attack rolls and saving throws until the start of your next turn.'),
(15, 'Rage Beyond Death', 14, 'While you''re raging, having 0 hit points doesn''t knock you unconscious. You don’t die until your rage ends, and you die then only if you still have 0 hit points.');

-- Subclasse: Path of the Beast (UA) (ID: 16)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(16, 'Form of the Beast', 3, 'When you enter your rage, you can transform, manifesting a natural melee weapon (Bite, Claws, or Tail).'),
(16, 'Bestial Soul', 6, 'Your natural weapons count as magical. You can also adapt to your surroundings, gaining a swimming speed and ability to breathe underwater, a climbing speed, or an enhanced jump.'),
(16, 'Infectious Fury', 10, 'When you hit a creature with your natural weapons while raging, you can force the target to make a Wisdom saving throw or either use its reaction to attack another creature of your choice, or take 2d12 psychic damage.'),
(16, 'Call the Hunt', 14, 'When you enter your rage, you can choose a number of allies who gain the Reckless Attack feature. You also gain temporary hit points for each creature that accepts the benefit.');

-- Subclasse: Path of the Giant (UA) (ID: 17)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(17, 'Giant Power', 3, 'You learn to speak, read, and write Giant or one other language. You also learn either the druidcraft or thaumaturgy cantrip.'),
(17, 'Giant''s Havoc', 3, 'While raging, your reach increases by 5 feet, and if you are smaller than Large, you become Large. You can also add your Rage Damage bonus to thrown weapon attacks using Strength.'),
(17, 'Elemental Cleaver', 6, 'When you enter your rage, you can infuse a weapon with acid, cold, fire, thunder, or lightning damage. The weapon deals an extra 1d6 damage of the chosen type and gains the thrown property.'),
(17, 'Mighty Impel', 10, 'As a bonus action while raging, you can move one Medium or smaller creature within your reach to an unoccupied space within 30 feet.'),
(17, 'Demiurgic Collussus', 14, 'When you rage, your reach increases by 10 feet, your size can increase to Huge, and you can move Large or smaller creatures with Mighty Impel. Your Elemental Cleaver damage increases to 2d6.');

-- Subclasse: Path of the Wild Soul (UA) (ID: 18)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(18, 'Lingering Magic', 3, 'You can cast the detect magic spell without using a spell slot or components.'),
(18, 'Wild Surge', 3, 'When you enter your rage, roll on the Wild Surge table to determine the magical effect produced.'),
(18, 'Magic Reserves', 6, 'As an action, you can touch a creature and recover an expended spell slot for them, taking force damage in the process.'),
(18, 'Arcane Rebuke', 10, 'When a creature forces you to make a saving throw while you are raging, you can use your reaction to deal 3d6 force damage to that creature.'),
(18, 'Chaotic Fury', 14, 'As a bonus action while raging, you can reroll on the Wild Surge table, replacing your current effect with the new one.');
