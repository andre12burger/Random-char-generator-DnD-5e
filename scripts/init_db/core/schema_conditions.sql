-- =============================================================================
-- DND 5E CONDITIONS AND CONDITION EFFECTS TABLES
-- =============================================================================

-- Conditions Table
-- Stores the basic status conditions in the game.
DROP TABLE IF EXISTS core_condition_effects;
DROP TABLE IF EXISTS core_conditions;

CREATE TABLE core_conditions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT
);

-- Condition Effects Table
-- Details each individual effect and links it to a condition.
CREATE TABLE core_condition_effects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    condition_id INTEGER NOT NULL,
    effect_description TEXT NOT NULL,
    FOREIGN KEY (condition_id) REFERENCES core_conditions(id)
);

-- =============================================================================
-- POPULATING THE TABLES
-- =============================================================================

-- Inserting Conditions into the 'core_conditions' Table
INSERT INTO core_conditions (name, description) VALUES
('Blinded', 'A blinded creature can’t see and automatically fails any ability check that requires sight.'),
('Charmed', 'A charmed creature can’t attack or target the charmer with harmful abilities or magical effects.'),
('Deafened', 'A deafened creature can’t hear and automatically fails any ability check that requires hearing.'),
('Frightened', 'A frightened creature has disadvantage on ability checks and attack rolls while the source of its fear is within line of sight.'),
('Grappled', 'A grappled creature’s speed becomes 0, and it can’t benefit from any bonus to its speed.'),
('Incapacitated', 'An incapacitated creature can’t take actions or reactions.'),
('Invisible', 'An invisible creature is impossible to see without the aid of magic or a special sense. For the purpose of hiding, the creature is heavily obscured.'),
('Paralyzed', 'A paralyzed creature is incapacitated and can’t move or speak.'),
('Petrified', 'A petrified creature, along with any nonmagical objects it is wearing or carrying, is transformed into a solid inanimate substance (typically stone).'),
('Poisoned', 'A poisoned creature has disadvantage on attack rolls and ability checks.'),
('Prone', 'A prone creature is lying facedown on the ground.'),
('Restrained', 'A restrained creature’s speed becomes 0, and it has disadvantage on attack rolls.'),
('Stunned', 'A stunned creature is incapacitated, can’t move, and can speak only falteringly.'),
('Unconscious', 'An unconscious creature is incapacitated, can’t move or speak, and is unaware of its surroundings.');

-- Inserting Effects into the 'core_condition_effects' Table
-- Blinded (id = 1)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(1, 'Has disadvantage on attack rolls.'),
(1, 'Attack rolls against the creature have advantage.'),
(1, 'Automatically fails any ability check that requires sight.');

-- Charmed (id = 2)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(2, 'Can’t attack the charmer or target them with harmful abilities.'),
(2, 'The charmer has advantage on any social checks made against the creature.');

-- Deafened (id = 3)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(3, 'Can’t hear.'),
(3, 'Automatically fails any ability check that requires hearing.');

-- Frightened (id = 4)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(4, 'Has disadvantage on ability checks and attack rolls while the source of its fear is within line of sight.'),
(4, 'Can’t willingly move closer to the source of its fear.');

-- Grappled (id = 5)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(5, 'Its speed becomes 0.'),
(5, 'Can’t benefit from any bonus to its speed.');

-- Incapacitated (id = 6)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(6, 'Can’t take actions or reactions.');

-- Invisible (id = 7)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(7, 'Can’t be seen without the aid of magic or a special sense.'),
(7, 'Is heavily obscured for the purpose of hiding.'),
(7, 'Has advantage on attack rolls.'),
(7, 'Attack rolls against the creature have disadvantage.');

-- Paralyzed (id = 8)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(8, 'Is incapacitated and can’t move or speak.'),
(8, 'Automatically fails Strength and Dexterity saving throws.'),
(8, 'Attack rolls against the creature have advantage.'),
(8, 'Any attack that hits the creature within 5 feet is a critical hit.');

-- Petrified (id = 9)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(9, 'Is incapacitated.'),
(9, 'Can’t move or speak.'),
(9, 'Is immune to poison and disease.'),
(9, 'Has resistance to all damage.'),
(9, 'Automatically fails Strength and Dexterity saving throws.'),
(9, 'Attack rolls against the creature have advantage.');

-- Poisoned (id = 10)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(10, 'Has disadvantage on attack rolls and ability checks.');

-- Prone (id = 11)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(11, 'Its only movement option is to crawl, unless it stands up.'),
(11, 'Has disadvantage on attack rolls.'),
(11, 'Attack rolls against the creature have advantage if the attacker is within 5 feet.'),
(11, 'Attack rolls against the creature have disadvantage if the attacker is more than 5 feet away.');

-- Restrained (id = 12)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(12, 'Its speed becomes 0.'),
(12, 'Has disadvantage on attack rolls.'),
(12, 'Attack rolls against the creature have advantage.'),
(12, 'Has disadvantage on Dexterity saving throws.');

-- Stunned (id = 13)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(13, 'Is incapacitated.'),
(13, 'Can’t move.'),
(13, 'Can speak only falteringly.'),
(13, 'Automatically fails Strength and Dexterity saving throws.'),
(13, 'Attack rolls against the creature have advantage.');

-- Unconscious (id = 14)
INSERT INTO core_condition_effects (condition_id, effect_description) VALUES
(14, 'Is incapacitated.'),
(14, 'Can’t move or speak.'),
(14, 'Is unaware of its surroundings.'),
(14, 'Drops whatever it is holding.'),
(14, 'Automatically fails Strength and Dexterity saving throws.'),
(14, 'Attack rolls against the creature have advantage.'),
(14, 'Any attack that hits the creature within 5 feet is a critical hit.');