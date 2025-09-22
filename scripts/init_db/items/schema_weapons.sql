-- Removendo tabelas na ordem correta (respeitando dependências)
DROP TABLE IF EXISTS item_weapons_relations;
DROP TABLE IF EXISTS item_weapons_alt_damage;
DROP TABLE IF EXISTS item_weapons_ranges;
DROP TABLE IF EXISTS item_weapons;
DROP TABLE IF EXISTS item_weapons_properties;
DROP TABLE IF EXISTS item_weapons_types;
DROP TABLE IF EXISTS item_weapons_categories;

-- Tipos de armas (Melee/Ranged)
CREATE TABLE item_weapons_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,        -- Nome do tipo em inglês (Melee/Ranged)
    description TEXT                  -- Descrição em inglês
);

-- Propriedades das armas (Versatile, Finesse, etc)
CREATE TABLE item_weapons_properties (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,        -- Nome da propriedade em inglês
    description TEXT                  -- Descrição em inglês exata da página
);

-- Categorias de armas (Simple/Martial)
CREATE TABLE item_weapons_categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,        -- Nome da categoria em inglês (Simple/Martial)
    description TEXT                  -- Descrição em inglês
);

-- Alcances das armas (apenas armas com alcance terão registros aqui)
CREATE TABLE item_weapons_ranges (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    weapon_id INTEGER NOT NULL UNIQUE, -- Uma arma só pode ter um conjunto de alcances
    normal_range INTEGER NOT NULL,     -- Alcance normal em pés
    maximum_range INTEGER NOT NULL,    -- Alcance máximo em pés
    unit_id INTEGER NOT NULL,          -- Unidade de medida (referência a measurement_units)
    FOREIGN KEY (weapon_id) REFERENCES item_weapons(id),
    FOREIGN KEY (unit_id) REFERENCES core_measurement_units(id)
);

-- Tabela principal de armas
CREATE TABLE item_weapons (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,        -- Nome da arma em inglês
    category_id INTEGER NOT NULL,     -- Categoria (Simple/Martial)
    type_id INTEGER NOT NULL,         -- Tipo (melee/ranged)
    damage_dice TEXT NOT NULL,        -- Dado de dano (1d6, 2d6, etc)
    damage_type_id INTEGER,           -- Tipo de dano principal (NULL para armas improvisadas)
    cost DECIMAL(10,2) NOT NULL,      -- Valor base
    cost_currency_id INTEGER NOT NULL, -- Tipo de moeda (referência a currency_types)
    weight DECIMAL(10,2) NOT NULL,    -- Valor do peso
    weight_unit_id INTEGER NOT NULL,  -- Unidade de medida do peso (referência a measurement_units)
    item_id INTEGER NOT NULL,         -- Referência à tabela items para categoria
    book_id INTEGER NOT NULL,         -- Livro onde a arma é descrita
    special_rules TEXT,               -- Regras especiais (NULL se não tiver)
    FOREIGN KEY (category_id) REFERENCES item_weapons_categories(id),
    FOREIGN KEY (type_id) REFERENCES item_weapons_types(id),
    FOREIGN KEY (damage_type_id) REFERENCES core_damage_types(id),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id)
);

-- Relação many-to-many entre armas e suas propriedades
CREATE TABLE item_weapons_relations (
    weapon_id INTEGER NOT NULL,
    property_id INTEGER NOT NULL,
    property_value TEXT,  -- Para propriedades que precisam de um valor (ex: alcance para armas de alcance)
    PRIMARY KEY (weapon_id, property_id),
    FOREIGN KEY (weapon_id) REFERENCES item_weapons(id),
    FOREIGN KEY (property_id) REFERENCES item_weapons_properties(id)
);

-- Danos alternativos para armas (para casos como Hoopak)
CREATE TABLE item_weapons_alt_damage (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    weapon_id INTEGER NOT NULL,
    damage_dice TEXT NOT NULL,        -- Dado de dano alternativo
    damage_type_id INTEGER NOT NULL,  -- Tipo de dano alternativo
    condition_text TEXT NOT NULL,     -- Descrição de quando usar esse dano
    FOREIGN KEY (weapon_id) REFERENCES item_weapons(id),
    FOREIGN KEY (damage_type_id) REFERENCES core_damage_types(id)
);

-- Tipos de armas
INSERT INTO item_weapons_types (name, description) VALUES
    ('Melee Weapon', 'A melee weapon is used to attack a target within 5 feet of you'),
    ('Ranged Weapon', 'A ranged weapon is used to attack a target at a distance'),
    ('Improvised Weapon', 'Objects not designed as weapons but used in combat. Can be used as melee or thrown depending on the object and circumstances');

-- Categorias de armas
INSERT INTO item_weapons_categories (name, description) VALUES
    ('Simple Weapon', 'Basic weapons that are easy to use. Most characters are proficient with these weapons.'),
    ('Martial Weapon', 'Advanced weapons that require specialized training to use effectively.'),
    ('Improvised Weapon', 'Objects not designed as weapons but used in combat. Characters are not proficient with improvised weapons unless they resemble a weapon the character is proficient with.'),
    ('Unarmed Weapon', 'Natural attacks using fists, feet, elbows, knees, and head. All characters are proficient with unarmed attacks.');

-- Propriedades de armas
INSERT INTO item_weapons_properties (name, description) VALUES
    ('Ammunition', 'You can use a weapon that has the ammunition property to make a ranged attack only if you have ammunition to fire from the weapon. Each time you attack with the weapon, you expend one piece of ammunition. Drawing the ammunition from a quiver, case, or other container is part of the attack. Loading a one-handed weapon requires a free hand. At the end of the battle, you can recover half your expended ammunition by taking a minute to search the battlefield. If you use a weapon that has the ammunition property to make a melee attack, you treat the weapon as an improvised weapon. A sling must be loaded to deal any damage when used in this way.'),
    ('Finesse', 'When making an attack with a finesse weapon, you use your choice of your Strength or Dexterity modifier for the attack and damage rolls. You must use the same modifier for both rolls.'),
    ('Heavy', 'Creatures that are Small or Tiny have disadvantage on attack rolls with heavy weapons. A heavy weapon''s size and bulk make it too large for a Small or Tiny creature to use effectively.'),
    ('Light', 'A light weapon is small and easy to handle, making it ideal for use when fighting with two weapons.'),
    ('Loading', 'Because of the time required to load this weapon, you can fire only one piece of ammunition from it when you use an action, bonus action, or reaction to fire it, regardless of the number of attacks you can normally make.'),
    ('Range', 'A weapon that can be used to make a ranged attack has a range shown in parentheses after the ammunition or thrown property. The range lists two numbers. The first is the weapon''s normal range in feet, and the second indicates the weapon''s maximum range. When attacking a target beyond normal range, you have disadvantage on the attack roll. You can''t attack a target beyond the weapon''s long range.'),
    ('Reach', 'This weapon adds 5 feet to your reach when you attack with it. This property also determines your reach for opportunity attacks with a reach weapon.'),
    ('Special', 'A weapon with the special property has unusual rules governing its use, explained in the weapon''s description (See below)'),
    ('Thrown', 'If a weapon has the thrown property, you can throw the weapon to make a ranged attack. If the weapon is a melee weapon, you use the same ability modifier for that attack roll and damage roll that you would use for a melee attack with the weapon. For example, if you throw a handaxe, you use your Strength, but if you throw a dagger, you can use either your Strength or your Dexterity, since the dagger has the finesse property.'),
    ('Two-Handed', 'This weapon requires two hands to use. This property is relevant only when you attack with the weapon, not when you simply hold it.'),
    ('Versatile', 'This weapon can be used with one or two hands. A damage value in parentheses appears with the property—the damage when the weapon is used with two hands to make a melee attack.');

-- ========================================
-- SIMPLE MELEE WEAPONS (Ordem Alfabética)
-- ========================================

INSERT INTO item_weapons (
    name, category_id, type_id, damage_dice, damage_type_id, 
    cost, cost_currency_id, weight, weight_unit_id, item_id, book_id, special_rules
) VALUES
    -- CLUB
    ('Club',
        1 /* Simple */,
        1 /* Melee */,
        '1d4',
        2 /* Bludgeoning */,
        1.00,  -- 1 sp
        2 /* sp */,
        2.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- DAGGER
    ('Dagger',
        1 /* Simple */,
        1 /* Melee */,
        '1d4',
        8 /* Piercing */,
        2.00,
        4 /* gp */,
        1.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- GREATCLUB
    ('Greatclub',
        1 /* Simple */,
        1 /* Melee */,
        '1d8',
        2 /* Bludgeoning */,
        2.00,  -- 2 sp
        2 /* sp */,
        10.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- HANDAXE
    ('Handaxe',
        1 /* Simple */,
        1 /* Melee */,
        '1d6',
        12 /* Slashing */,
        5.00,
        4 /* gp */,
        2.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- JAVELIN
    ('Javelin',
        1 /* Simple */,
        1 /* Melee */,
        '1d6',
        8 /* Piercing */,
        5.00,  -- 5 sp
        2 /* sp */,
        2.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- LIGHT HAMMER
    ('Light hammer',
        1 /* Simple */,
        1 /* Melee */,
        '1d4',
        2 /* Bludgeoning */,
        2.00,
        4 /* gp */,
        2.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- MACE
    ('Mace',
        1 /* Simple */,
        1 /* Melee */,
        '1d6',
        2 /* Bludgeoning */,
        5.00,
        4 /* gp */,
        4.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- QUARTERSTAFF
    ('Quarterstaff',
        1 /* Simple */,
        1 /* Melee */,
        '1d6',
        2 /* Bludgeoning */,
        2.00,  -- 2 sp
        2 /* sp */,
        4.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- SICKLE
    ('Sickle',
        1 /* Simple */,
        1 /* Melee */,
        '1d4',
        12 /* Slashing */,
        1.00,
        4 /* gp */,
        2.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- SPEAR
    ('Spear',
        1 /* Simple */,
        1 /* Melee */,
        '1d6',
        8 /* Piercing */,
        1.00,
        4 /* gp */,
        3.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    );

-- ========================================
-- SIMPLE RANGED WEAPONS (Ordem Alfabética)
-- ========================================

INSERT INTO item_weapons (
    name, category_id, type_id, damage_dice, damage_type_id, 
    cost, cost_currency_id, weight, weight_unit_id, item_id, book_id, special_rules
) VALUES
    -- CROSSBOW, LIGHT
    ('Crossbow, light',
        1 /* Simple */,
        2 /* Ranged */,
        '1d8',
        8 /* Piercing */,
        25.00,
        4 /* gp */,
        5.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- DART
    ('Dart',
        1 /* Simple */,
        2 /* Ranged */,
        '1d4',
        8 /* Piercing */,
        5.00,
        1 /* cp */,
        0.25,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- SHORTBOW
    ('Shortbow',
        1 /* Simple */,
        2 /* Ranged */,
        '1d6',
        8 /* Piercing */,
        25.00,
        4 /* gp */,
        2.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- SLING
    ('Sling',
        1 /* Simple */,
        2 /* Ranged */,
        '1d4',
        2 /* Bludgeoning */,
        1.00,
        2 /* sp */,
        0.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    );

-- ========================================
-- MARTIAL MELEE WEAPONS
-- ========================================

INSERT INTO item_weapons (
    name, category_id, type_id, damage_dice, damage_type_id, 
    cost, cost_currency_id, weight, weight_unit_id, item_id, book_id, special_rules
) VALUES
    -- BATTLEAXE
    ('Battleaxe',
        2 /* Martial */,
        1 /* Melee */,
        '1d8',
        12 /* Slashing */,
        10.00,
        4 /* gp */,
        4.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- FLAIL
    ('Flail',
        2 /* Martial */,
        1 /* Melee */,
        '1d8',
        2 /* Bludgeoning */,
        10.00,
        4 /* gp */,
        2.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- GLAIVE
    ('Glaive',
        2 /* Martial */,
        1 /* Melee */,
        '1d10',
        12 /* Slashing */,
        20.00,
        4 /* gp */,
        6.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- GREATAXE
    ('Greataxe',
        2 /* Martial */,
        1 /* Melee */,
        '1d12',
        12 /* Slashing */,
        30.00,
        4 /* gp */,
        7.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- GREATSWORD
    ('Greatsword',
        2 /* Martial */,
        1 /* Melee */,
        '2d6',
        12 /* Slashing */,
        50.00,
        4 /* gp */,
        6.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- HALBERD
    ('Halberd',
        2 /* Martial */,
        1 /* Melee */,
        '1d10',
        12 /* Slashing */,
        20.00,
        4 /* gp */,
        6.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- LANCE
    ('Lance',
        2 /* Martial */,
        1 /* Melee */,
        '1d12',
        8 /* Piercing */,
        10.00,
        4 /* gp */,
        6.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        'You have disadvantage when you use a lance to attack a target within 5 feet of you. Also, a lance requires two hands to wield when you aren''t mounted.'
    ),
    -- LONGSWORD
    ('Longsword',
        2 /* Martial */,
        1 /* Melee */,
        '1d8',
        12 /* Slashing */,
        15.00,
        4 /* gp */,
        3.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- MAUL
    ('Maul',
        2 /* Martial */,
        1 /* Melee */,
        '2d6',
        2 /* Bludgeoning */,
        10.00,
        4 /* gp */,
        10.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- MORNINGSTAR
    ('Morningstar',
        2 /* Martial */,
        1 /* Melee */,
        '1d8',
        8 /* Piercing */,
        15.00,
        4 /* gp */,
        4.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- PIKE
    ('Pike',
        2 /* Martial */,
        1 /* Melee */,
        '1d10',
        8 /* Piercing */,
        5.00,
        4 /* gp */,
        18.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- RAPIER
    ('Rapier',
        2 /* Martial */,
        1 /* Melee */,
        '1d8',
        8 /* Piercing */,
        25.00,
        4 /* gp */,
        2.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- SCIMITAR
    ('Scimitar',
        2 /* Martial */,
        1 /* Melee */,
        '1d6',
        12 /* Slashing */,
        25.00,
        4 /* gp */,
        3.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- SHORTSWORD
    ('Shortsword',
        2 /* Martial */,
        1 /* Melee */,
        '1d6',
        8 /* Piercing */,
        10.00,
        4 /* gp */,
        2.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- TRIDENT
    ('Trident',
        2 /* Martial */,
        1 /* Melee */,
        '1d6',
        8 /* Piercing */,
        5.00,
        4 /* gp */,
        4.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- WAR PICK
    ('War pick',
        2 /* Martial */,
        1 /* Melee */,
        '1d8',
        8 /* Piercing */,
        5.00,
        4 /* gp */,
        2.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- WARHAMMER
    ('Warhammer',
        2 /* Martial */,
        1 /* Melee */,
        '1d8',
        2 /* Bludgeoning */,
        15.00,
        4 /* gp */,
        2.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    ),
    -- WHIP
    ('Whip',
        2 /* Martial */,
        1 /* Melee */,
        '1d4',
        12 /* Slashing */,
        2.00,
        4 /* gp */,
        3.00,
        2 /* lb */,
        1 /* weapons */,
        1 /* PHB */,
        NULL
    );

-- ========================================
-- WEAPON PROPERTIES - SIMPLE MELEE
-- ========================================

-- CLUB: Light
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Club' AND p.name = 'Light';

-- DAGGER: Finesse, Light, Thrown
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Dagger' AND p.name = 'Finesse';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Dagger' AND p.name = 'Light';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Dagger' AND p.name = 'Thrown';

-- GREATCLUB: Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Greatclub' AND p.name = 'Two-Handed';

-- HANDAXE: Light, Thrown
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Handaxe' AND p.name = 'Light';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Handaxe' AND p.name = 'Thrown';

-- JAVELIN: Thrown
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Javelin' AND p.name = 'Thrown';

-- LIGHT HAMMER: Light, Thrown
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Light hammer' AND p.name = 'Light';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Light hammer' AND p.name = 'Thrown';

-- MACE: (no properties)

-- QUARTERSTAFF: Versatile
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, '1d8'
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Quarterstaff' AND p.name = 'Versatile';

-- SICKLE: Light
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Sickle' AND p.name = 'Light';

-- SPEAR: Thrown, Versatile
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Spear' AND p.name = 'Thrown';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, '1d8'
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Spear' AND p.name = 'Versatile';

-- ========================================
-- WEAPON PROPERTIES - SIMPLE RANGED
-- ========================================

-- CROSSBOW, LIGHT: Ammunition, Loading, Range, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Crossbow, light' AND p.name = 'Ammunition';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Crossbow, light' AND p.name = 'Loading';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Crossbow, light' AND p.name = 'Range';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Crossbow, light' AND p.name = 'Two-Handed';

-- DART: Finesse, Range, Thrown
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Dart' AND p.name = 'Finesse';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Dart' AND p.name = 'Range';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Dart' AND p.name = 'Thrown';

-- SHORTBOW: Ammunition, Range, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Shortbow' AND p.name = 'Ammunition';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Shortbow' AND p.name = 'Range';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Shortbow' AND p.name = 'Two-Handed';

-- SLING: Ammunition, Range
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Sling' AND p.name = 'Ammunition';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Sling' AND p.name = 'Range';

-- ========================================
-- WEAPON PROPERTIES - MARTIAL MELEE
-- ========================================

-- BATTLEAXE: Versatile
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, '1d10'
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Battleaxe' AND p.name = 'Versatile';

-- FLAIL: (no properties)

-- GLAIVE: Heavy, Reach, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Glaive' AND p.name = 'Heavy';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Glaive' AND p.name = 'Reach';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Glaive' AND p.name = 'Two-Handed';

-- GREATAXE: Heavy, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Greataxe' AND p.name = 'Heavy';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Greataxe' AND p.name = 'Two-Handed';

-- GREATSWORD: Heavy, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Greatsword' AND p.name = 'Heavy';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Greatsword' AND p.name = 'Two-Handed';

-- HALBERD: Heavy, Reach, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Halberd' AND p.name = 'Heavy';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Halberd' AND p.name = 'Reach';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Halberd' AND p.name = 'Two-Handed';

-- LANCE: Reach, Special
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Lance' AND p.name = 'Reach';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Lance' AND p.name = 'Special';

-- LONGSWORD: Versatile
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, '1d10'
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Longsword' AND p.name = 'Versatile';

-- MAUL: Heavy, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Maul' AND p.name = 'Heavy';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Maul' AND p.name = 'Two-Handed';

-- MORNINGSTAR: (no properties)

-- PIKE: Heavy, Reach, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Pike' AND p.name = 'Heavy';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Pike' AND p.name = 'Reach';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Pike' AND p.name = 'Two-Handed';

-- RAPIER: Finesse
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Rapier' AND p.name = 'Finesse';

-- SCIMITAR: Finesse, Light
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Scimitar' AND p.name = 'Finesse';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Scimitar' AND p.name = 'Light';

-- SHORTSWORD: Finesse, Light
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Shortsword' AND p.name = 'Finesse';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Shortsword' AND p.name = 'Light';

-- TRIDENT: Thrown, Versatile
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Trident' AND p.name = 'Thrown';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, '1d8'
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Trident' AND p.name = 'Versatile';

-- WAR PICK: (no properties)

-- WARHAMMER: Versatile
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, '1d10'
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Warhammer' AND p.name = 'Versatile';

-- WHIP: Finesse, Reach
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Whip' AND p.name = 'Finesse';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Whip' AND p.name = 'Reach';

-- ========================================
-- WEAPON RANGES
-- ========================================

-- DAGGER: Thrown (20/60)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 20, 60, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Dagger' AND u.code = 'ft';

-- HANDAXE: Thrown (20/60)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 20, 60, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Handaxe' AND u.code = 'ft';

-- JAVELIN: Thrown (30/120)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 30, 120, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Javelin' AND u.code = 'ft';

-- LIGHT HAMMER: Thrown (20/60)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 20, 60, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Light hammer' AND u.code = 'ft';

-- SPEAR: Thrown (20/60)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 20, 60, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Spear' AND u.code = 'ft';

-- ========================================
-- WEAPON RANGES - MARTIAL MELEE
-- ========================================

-- TRIDENT: Thrown (20/60)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 20, 60, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Trident' AND u.code = 'ft';

-- ========================================
-- WEAPON RANGES - SIMPLE RANGED
-- ========================================

-- CROSSBOW, LIGHT: Range (80/320)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 80, 320, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Crossbow, light' AND u.code = 'ft';

-- DART: Thrown (20/60)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 20, 60, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Dart' AND u.code = 'ft';

-- SHORTBOW: Range (80/320)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 80, 320, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Shortbow' AND u.code = 'ft';

-- SLING: Range (30/120)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 30, 120, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Sling' AND u.code = 'ft';

-- ========================================
-- MARTIAL RANGED WEAPONS
-- ========================================

-- BLOWGUN
INSERT INTO item_weapons (name, category_id, type_id, damage_dice, damage_type_id, cost, cost_currency_id, weight, weight_unit_id, item_id, book_id)
SELECT 'Blowgun', c.id, t.id, '1', dt.id, 10, curr.id, 1, mu.id, i.id, b.id
FROM item_weapons_categories c, item_weapons_types t, core_damage_types dt, core_currency_types curr, core_measurement_units mu, items i, core_books b
WHERE c.name = 'Martial' AND t.name = 'Ranged' AND dt.name = 'Piercing' AND curr.name = 'Gold' AND mu.name = 'Pounds' AND i.name = 'weapons' AND b.code = 'PHB';

-- CROSSBOW, HAND
INSERT INTO item_weapons (name, category_id, type_id, damage_dice, damage_type_id, cost, cost_currency_id, weight, weight_unit_id, item_id, book_id)
SELECT 'Crossbow, hand', c.id, t.id, '1d6', dt.id, 75, curr.id, 3, mu.id, i.id, b.id
FROM item_weapons_categories c, item_weapons_types t, core_damage_types dt, core_currency_types curr, core_measurement_units mu, items i, core_books b
WHERE c.name = 'Martial' AND t.name = 'Ranged' AND dt.name = 'Piercing' AND curr.name = 'Gold' AND mu.name = 'Pounds' AND i.name = 'weapons' AND b.code = 'PHB';

-- CROSSBOW, HEAVY
INSERT INTO item_weapons (name, category_id, type_id, damage_dice, damage_type_id, cost, cost_currency_id, weight, weight_unit_id, item_id, book_id)
SELECT 'Crossbow, heavy', c.id, t.id, '1d10', dt.id, 50, curr.id, 18, mu.id, i.id, b.id
FROM item_weapons_categories c, item_weapons_types t, core_damage_types dt, core_currency_types curr, core_measurement_units mu, items i, core_books b
WHERE c.name = 'Martial' AND t.name = 'Ranged' AND dt.name = 'Piercing' AND curr.name = 'Gold' AND mu.name = 'Pounds' AND i.name = 'weapons' AND b.code = 'PHB';

-- LONGBOW
INSERT INTO item_weapons (name, category_id, type_id, damage_dice, damage_type_id, cost, cost_currency_id, weight, weight_unit_id, item_id, book_id)
SELECT 'Longbow', c.id, t.id, '1d8', dt.id, 50, curr.id, 2, mu.id, i.id, b.id
FROM item_weapons_categories c, item_weapons_types t, core_damage_types dt, core_currency_types curr, core_measurement_units mu, items i, core_books b
WHERE c.name = 'Martial' AND t.name = 'Ranged' AND dt.name = 'Piercing' AND curr.name = 'Gold' AND mu.name = 'Pounds' AND i.name = 'weapons' AND b.code = 'PHB';

-- NET (Special weapon with no damage)
INSERT INTO item_weapons (name, category_id, type_id, damage_dice, damage_type_id, cost, cost_currency_id, weight, weight_unit_id, item_id, book_id, special_rules)
SELECT 'Net', c.id, t.id, '0', dt.id, 2, curr.id, 3, mu.id, i.id, b.id, 'A Large or smaller creature hit by a net is restrained until it is freed. A net has no effect on creatures that are formless, or creatures that are Huge or larger. A creature can use its action to make a DC 10 Strength check, freeing itself or another creature within its reach on a success. Dealing 5 slashing damage to the net (AC 10) also frees the creature without harming it, ending the effect and destroying the net. When you use an action, bonus action, or reaction to attack with a net, you can make only one attack regardless of the number of attacks you can normally make.'
FROM item_weapons_categories c, item_weapons_types t, core_damage_types dt, core_currency_types curr, core_measurement_units mu, items i, core_books b
WHERE c.name = 'Martial' AND t.name = 'Ranged' AND dt.name = 'Piercing' AND curr.name = 'Gold' AND mu.name = 'Pounds' AND i.name = 'weapons' AND b.code = 'PHB';

-- ========================================
-- WEAPON PROPERTIES - MARTIAL RANGED
-- ========================================

-- BLOWGUN: Loading, Special
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Blowgun' AND p.name = 'Loading';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Blowgun' AND p.name = 'Special';

-- CROSSBOW, HAND: Light, Loading
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Crossbow, hand' AND p.name = 'Light';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Crossbow, hand' AND p.name = 'Loading';

-- CROSSBOW, HEAVY: Heavy, Loading, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Crossbow, heavy' AND p.name = 'Heavy';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Crossbow, heavy' AND p.name = 'Loading';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Crossbow, heavy' AND p.name = 'Two-handed';

-- LONGBOW: Heavy, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Longbow' AND p.name = 'Heavy';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Longbow' AND p.name = 'Two-handed';

-- NET: Special, Thrown
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Net' AND p.name = 'Special';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p
WHERE w.name = 'Net' AND p.name = 'Thrown';

-- ========================================
-- WEAPON RANGES - MARTIAL RANGED
-- ========================================

-- BLOWGUN: Range (25/100)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 25, 100, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Blowgun' AND u.code = 'ft';

-- CROSSBOW, HAND: Range (30/120)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 30, 120, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Crossbow, hand' AND u.code = 'ft';

-- CROSSBOW, HEAVY: Range (100/400)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 100, 400, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Crossbow, heavy' AND u.code = 'ft';

-- LONGBOW: Range (150/600)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 150, 600, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Longbow' AND u.code = 'ft';

-- NET: Thrown (5/15)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT w.id, 5, 15, u.id
FROM item_weapons w, core_measurement_units u
WHERE w.name = 'Net' AND u.code = 'ft';

-- ========================================
-- VIEWS DE COMPATIBILIDADE
-- Mantém nomes antigos funcionando
-- ========================================

DROP VIEW IF EXISTS weapon_categories;
DROP VIEW IF EXISTS weapon_types;
DROP VIEW IF EXISTS weapon_properties;
DROP VIEW IF EXISTS weapons;
DROP VIEW IF EXISTS weapon_ranges;
DROP VIEW IF EXISTS weapon_property_relations;
DROP VIEW IF EXISTS weapon_alternate_damage;

CREATE VIEW weapon_categories AS SELECT * FROM item_weapons_categories;
CREATE VIEW weapon_types AS SELECT * FROM item_weapons_types;
CREATE VIEW weapon_properties AS SELECT * FROM item_weapons_properties;
CREATE VIEW weapons AS SELECT * FROM item_weapons;
CREATE VIEW weapon_ranges AS SELECT * FROM item_weapons_ranges;
CREATE VIEW weapon_property_relations AS SELECT * FROM item_weapons_relations;
CREATE VIEW weapon_alternate_damage AS SELECT * FROM item_weapons_alt_damage;

-- ========================================
-- VIEWS ORGANIZACIONAIS
-- ========================================

DROP VIEW IF EXISTS v_weapons_complete;
DROP VIEW IF EXISTS v_weapons_by_category;

CREATE VIEW v_weapons_complete AS
SELECT 
    w.id,
    w.name,
    wc.name as category,
    wt.name as type,
    w.damage_dice,
    dt.name as damage_type,
    w.cost,
    cc.name as currency,
    w.weight,
    mu.name as weight_unit,
    GROUP_CONCAT(wp.name, ', ') as properties
FROM item_weapons w
LEFT JOIN item_weapons_categories wc ON w.category_id = wc.id
LEFT JOIN item_weapons_types wt ON w.type_id = wt.id
LEFT JOIN damage_types dt ON w.damage_type_id = dt.id
LEFT JOIN currency_types cc ON w.cost_currency_id = cc.id
LEFT JOIN measurement_units mu ON w.weight_unit_id = mu.id
LEFT JOIN item_weapons_relations wpr ON w.id = wpr.weapon_id
LEFT JOIN item_weapons_properties wp ON wpr.property_id = wp.id
GROUP BY w.id, w.name, wc.name, wt.name, w.damage_dice, dt.name, w.cost, cc.name, w.weight, mu.name;

-- ================================================
-- ARMA IMPROVISADA
-- ================================================

-- IMPROVISED WEAPON - Qualquer objeto usado como arma
INSERT INTO item_weapons (
    name, category_id, type_id, damage_dice, damage_type_id, 
    cost, cost_currency_id, weight, weight_unit_id, 
    item_id, book_id, special_rules
) VALUES (
    'Improvised Weapon',
    3 /* Improvised */,  -- Categoria: Improvised
    3 /* Improvised */,       -- Tipo: Improvised
    '1d4',                                                               -- Dano: 1d4
    NULL,                                                                -- Tipo de dano: NULL (DM decide)
    0.00,                                                                -- Custo: 0 (objetos encontrados)
    4 /* Gold */,            -- Moeda: Gold (padrão)
    1.00,                                                                -- Peso: 1 lb (média)
    2 /* Pounds */,       -- Unidade: Pounds
    1 /* weapons */,                      -- Categoria de item: weapons
    1 /* PHB */,                     -- Livro: Player's Handbook
    'Any object you can wield in one or two hands, such as broken glass, a table leg, a frying pan, a wagon wheel, or a dead goblin. An object that bears no resemblance to a weapon deals 1d4 damage (the DM assigns a damage type appropriate to the object). If a character uses a ranged weapon to make a melee attack, or throws a melee weapon that does not have the thrown property, it also deals 1d4 damage. An improvised thrown weapon has a normal range of 20 feet and a long range of 60 feet. In many cases, an improvised weapon is similar to an actual weapon and can be treated as such. For example, a table leg is akin to a club. At the DM''s option, a character proficient with a weapon can use a similar object as if it were that weapon and use his or her proficiency bonus.'
);

-- Adicionar alcance para arma improvisada quando arremessada (20/60 pés)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id) VALUES (
    1 /* Improvised Weapon */,
    20,                                                                  -- Alcance normal: 20 pés
    60,                                                                  -- Alcance máximo: 60 pés
    1 /* Feet */          -- Unidade: pés
);

-- ================================================
-- ATAQUE DESARMADO
-- ================================================

-- UNARMED STRIKE - Ataque com punhos, pés, cotovelos, joelhos, cabeça
INSERT INTO item_weapons (
    name, category_id, type_id, damage_dice, damage_type_id, 
    cost, cost_currency_id, weight, weight_unit_id, 
    item_id, book_id, special_rules
) VALUES (
    'Unarmed Strike',
    4 /* Unarmed */,      -- Categoria: Unarmed
    1 /* Melee */,             -- Tipo: Melee
    '1',                                                                  -- Dano: 1 (fixo)
    2 /* Bludgeoning */,        -- Tipo de dano: Bludgeoning
    0.00,                                                                 -- Custo: 0 (natural)
    4 /* Gold */,             -- Moeda: Gold (padrão)
    0.00,                                                                 -- Peso: 0 (sem peso)
    2 /* Pounds */,        -- Unidade: Pounds
    1 /* weapons */,                       -- Categoria de item: weapons
    1 /* PHB */,                      -- Livro: Player's Handbook
    'Instead of using a weapon to make a melee weapon attack, you can use an unarmed strike: a punch, kick, head-butt, or similar forceful blow (none of which count as weapons). On a hit, an unarmed strike deals bludgeoning damage equal to 1 + your Strength modifier. You are proficient with your unarmed strikes.'
);

CREATE VIEW v_weapons_by_category AS
SELECT 
    wc.name as category,
    COUNT(*) as weapon_count,
    GROUP_CONCAT(w.name, ', ') as weapons
FROM item_weapons w
JOIN item_weapons_categories wc ON w.category_id = wc.id
GROUP BY wc.name;
