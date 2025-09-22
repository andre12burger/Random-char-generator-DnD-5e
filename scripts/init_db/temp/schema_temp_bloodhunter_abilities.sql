-- =============================================================================
-- BLOOD HUNTER SUBCLASSES
-- =============================================================================

-- Subclasse: Order of the Ghostslayer (ID: 32)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(32, 'Rite of the Dawn', 3, 'You learn the Rite of the Dawn. Your weapon sheds bright light, you have resistance to necrotic damage, and you deal additional damage to undead creatures.'),
(32, 'Curse Specialist', 3, 'You gain an additional use of your Blood Maledict feature, and your blood curses can target any creature, whether it has blood or not.'),
(32, 'Aether Walk', 7, 'You can magically step into the veil between the planes, allowing you to move through other creatures and objects as if they were difficult terrain.'),
(32, 'Brand of Sundering', 11, 'Your Brand of Castigation exposes a fragment of your foe’s essence, causing them to take additional damage from your Crimson Rite.'),
(32, 'Blood Curse of the Exorcist', 15, 'You gain the Blood Curse of the Exorcist for your Blood Maledict feature.'),
(32, 'Rite Revival', 18, 'If you have one or more crimson rites active and you are reduced to 0 hit points, you can choose to have all your active crimson rites end and drop to 1 hit point instead.');

-- Subclasse: Order of the Lycan (ID: 33)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(33, 'Heightened Senses', 3, 'You have advantage on Wisdom (Perception) checks that rely on hearing or smell.'),
(33, 'Hybrid Transformation', 3, 'As a bonus action, you transform into a special hybrid form for up to 1 hour, gaining feral might, resilient hide, and predatory strikes.'),
(33, 'Stalker''s Prowess', 7, 'Your speed increases by 10 feet, and you gain a bonus to attack rolls with your unarmed strikes.'),
(33, 'Advanced Transformation', 11, 'You can use your Hybrid Transformation feature twice per rest. You also gain Lycan Regeneration, healing at the start of your turns.'),
(33, 'Brand of the Voracious', 15, 'You have advantage on the saving throw for your bloodlust. While in your hybrid form, you have advantage on attack rolls against a creature branded by you.'),
(33, 'Hybrid Transformation Mastery', 18, 'You can use your Hybrid Transformation feature an unlimited number of times. You also gain the Blood Curse of the Howl.');

-- Subclasse: Order of the Mutant (ID: 34)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(34, 'Mutagencraft', 3, 'You learn to master forbidden alchemical formulas known as mutagens that can temporarily alter your mental and physical abilities.'),
(34, 'Formulas', 3, 'You learn four mutagen formulas and can concoct one mutagen when you finish a short or long rest.'),
(34, 'Strange Metabolism', 7, 'You gain immunity to poison damage and the poisoned condition. You can also temporarily ignore the negative side effect of a mutagen.'),
(34, 'Brand of Axiom', 11, 'Your Brand of Castigation can end illusion or invisibility effects on a creature and force shapechangers to revert to their true form.'),
(34, 'Blood Curse of Corrosion', 15, 'You gain the Blood Curse of Corrosion for your Blood Maledict feature.'),
(34, 'Exalted Mutation', 18, 'As a bonus action, you can end one mutagen affecting you and immediately have another take effect.');

-- Subclasse: Order of the Profane Soul (ID: 35)
INSERT INTO subclass_features (subclass_id, feature_name, level, description) VALUES
(35, 'Otherworldly Patron', 3, 'You strike a bargain with an otherworldly being of your choice (The Archfey, The Fiend, The Great Old One, etc.).'),
(35, 'Pact Magic', 3, 'You can augment your combat techniques with the ability to cast warlock spells.'),
(35, 'Rite Focus', 3, 'Your weapon becomes a conduit for your patron''s power, granting a specific benefit based on your chosen pact.'),
(35, 'Mystic Frenzy', 7, 'When you use your action to cast a cantrip, you can immediately make one weapon attack as a bonus action.'),
(35, 'Revealed Arcana', 7, 'Your patron grants you the use of a distinctive spell based on your pact.'),
(35, 'Brand of the Sapping Scar', 11, 'A creature branded by you has disadvantage on saving throws against your warlock spells.'),
(35, 'Unsealed Arcana', 15, 'Your patron grants you the use of an additional spell based on your pact.'),
(35, 'Blood Curse of the Souleater', 18, 'You gain the Blood Curse of the Soul Eater for your Blood Maledict feature.');
