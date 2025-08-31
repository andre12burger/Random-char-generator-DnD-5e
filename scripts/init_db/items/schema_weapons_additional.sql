-- ================================================
-- ARMAS DE OUTROS LIVROS D&D 5e
-- ================================================
-- Script para adicionar armas específicas de cenário de outros livros oficiais
-- Fonte: data/raw_pages/items/weapons.html

-- ================================================
-- ARMAS DE OUTROS LIVROS
-- ================================================

-- YKLWA (Forgotten Realms - Tomb of Annihilation)
INSERT INTO item_weapons (
    name, category_id, type_id, damage_dice, damage_type_id, 
    cost, cost_currency_id, weight, weight_unit_id, 
    item_id, book_id, special_rules
) VALUES (
    'Yklwa',
    (SELECT id FROM item_weapons_categories WHERE name = 'Simple'),  -- Simple weapon
    (SELECT id FROM item_weapons_types WHERE name = 'Melee'),        -- Melee weapon
    '1d8',                                                           -- Damage dice
    (SELECT id FROM core_damage_types WHERE name = 'Piercing'),      -- Piercing damage
    1.00,                                                            -- 1 gp cost
    (SELECT id FROM core_currency_types WHERE name = 'Gold'),    -- Currency: GP
    3.00,                                                            -- 3 lb weight
    (SELECT id FROM core_measurement_units WHERE name = 'Pounds'),    -- Weight unit: Pound
    (SELECT id FROM items WHERE name = 'weapons'),                   -- Item category: weapons
    (SELECT id FROM core_books WHERE code = 'ToA'),          -- Book: Tomb of Annihilation
    NULL                                                             -- No special rules text
);

-- HOOPAK (Dragonlance - Shadow of the Dragon Queen)
INSERT INTO item_weapons (
    name, category_id, type_id, damage_dice, damage_type_id, 
    cost, cost_currency_id, weight, weight_unit_id, 
    item_id, book_id, special_rules
) VALUES (
    'Hoopak',
    (SELECT id FROM item_weapons_categories WHERE name = 'Martial'),  -- Martial weapon
    (SELECT id FROM item_weapons_types WHERE name = 'Melee'),         -- Melee weapon (primary)
    '1d6',                                                            -- Damage dice (melee)
    (SELECT id FROM core_damage_types WHERE name = 'Piercing'),       -- Piercing damage (melee)
    1.00,                                                             -- 1 gp cost
    (SELECT id FROM core_currency_types WHERE name = 'Gold'),  -- Currency: GP
    2.00,                                                             -- 2 lb weight
    (SELECT id FROM core_measurement_units WHERE name = 'Pounds'),     -- Weight unit: Pound
    (SELECT id FROM items WHERE name = 'weapons'),                    -- Item category: weapons
    (SELECT id FROM core_books WHERE code = 'D:SDQ'),         -- Book: Dragonlance Shadow of the Dragon Queen
    'A hoopak is a sturdy stick with a sling at one end and a pointed tip at the other.'  -- Description
);

-- DOUBLE-BLADED SCIMITAR (Eberron - Rising from the Last War)
INSERT INTO item_weapons (
    name, category_id, type_id, damage_dice, damage_type_id, 
    cost, cost_currency_id, weight, weight_unit_id, 
    item_id, book_id, special_rules
) VALUES (
    'Double-Bladed Scimitar',
    (SELECT id FROM item_weapons_categories WHERE name = 'Martial'),  -- Martial weapon
    (SELECT id FROM item_weapons_types WHERE name = 'Melee'),         -- Melee weapon
    '2d4',                                                            -- Damage dice
    (SELECT id FROM core_damage_types WHERE name = 'Slashing'),       -- Slashing damage
    100.00,                                                           -- 100 gp cost
    (SELECT id FROM core_currency_types WHERE name = 'Gold'),  -- Currency: GP
    6.00,                                                             -- 6 lb weight
    (SELECT id FROM core_measurement_units WHERE name = 'Pounds'),     -- Weight unit: Pound
    (SELECT id FROM items WHERE name = 'weapons'),                    -- Item category: weapons
    (SELECT id FROM core_books WHERE code = 'E:RLW'),         -- Book: Eberron Rising from the Last War
    NULL                                                              -- No special rules text in main table
);

-- ================================================
-- ALCANCES (apenas para armas ranged/thrown)
-- ================================================

-- YKLWA: Thrown (10/30)
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT 
    w.id,
    10,   -- Normal range: 10 feet
    30,   -- Maximum range: 30 feet
    (SELECT id FROM core_measurement_units WHERE name = 'Feet')
FROM item_weapons w 
WHERE w.name = 'Yklwa';

-- HOOPAK: Ammunition (range 40/160) - quando usado como ranged
INSERT INTO item_weapons_ranges (weapon_id, normal_range, maximum_range, unit_id)
SELECT 
    w.id,
    40,   -- Normal range: 40 feet
    160,  -- Maximum range: 160 feet
    (SELECT id FROM core_measurement_units WHERE name = 'Feet')
FROM item_weapons w 
WHERE w.name = 'Hoopak';

-- ================================================
-- PROPRIEDADES DAS ARMAS
-- ================================================

-- YKLWA: Thrown
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, '(10/30)'
FROM item_weapons w, item_weapons_properties p 
WHERE w.name = 'Yklwa' AND p.name = 'Thrown';

-- HOOPAK: Ammunition, Finesse, Special, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, '(40/160)'
FROM item_weapons w, item_weapons_properties p 
WHERE w.name = 'Hoopak' AND p.name = 'Ammunition';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p 
WHERE w.name = 'Hoopak' AND p.name = 'Finesse';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p 
WHERE w.name = 'Hoopak' AND p.name = 'Special';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p 
WHERE w.name = 'Hoopak' AND p.name = 'Two-Handed';

-- DOUBLE-BLADED SCIMITAR: Special, Two-handed
INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p 
WHERE w.name = 'Double-Bladed Scimitar' AND p.name = 'Special';

INSERT INTO item_weapons_relations (weapon_id, property_id, property_value)
SELECT w.id, p.id, NULL
FROM item_weapons w, item_weapons_properties p 
WHERE w.name = 'Double-Bladed Scimitar' AND p.name = 'Two-Handed';

-- ================================================
-- DANOS ALTERNATIVOS
-- ================================================

-- HOOPAK: 1d4 bludgeoning quando usado como ranged
INSERT INTO item_weapons_alt_damage (weapon_id, damage_dice, damage_type_id, condition_text)
SELECT 
    w.id,
    '1d4',
    (SELECT id FROM core_damage_types WHERE name = 'Bludgeoning'),
    'ranged'
FROM item_weapons w 
WHERE w.name = 'Hoopak';
