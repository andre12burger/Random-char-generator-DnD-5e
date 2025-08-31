-- schema_armors.sql

-- Apaga tabelas se existirem (ordem importa por causa das foreign keys)
DROP TABLE IF EXISTS armors;
DROP TABLE IF EXISTS armor_types;
DROP TABLE IF EXISTS item_armors;
DROP TABLE IF EXISTS item_armor_types;

-- Tipos específicos de armadura
CREATE TABLE item_armor_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,     -- 'Light Armor', 'Medium Armor', 'Heavy Armor', 'Shield'
    don_time TEXT NOT NULL,
    doff_time TEXT NOT NULL
);

-- Armaduras específicas
CREATE TABLE item_armors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_id INTEGER NOT NULL,
    armor_type_id INTEGER NOT NULL,
    name TEXT NOT NULL UNIQUE,
    base_ac INTEGER NOT NULL,
    cost_value DECIMAL(10,2),
    cost_currency_id INTEGER,
    weight_value DECIMAL(5,2),
    weight_unit_id INTEGER,
    dex_bonus_allowed BOOLEAN DEFAULT 1,
    max_dex_bonus INTEGER,
    strength_requirement INTEGER,
    stealth_disadvantage BOOLEAN DEFAULT 0,
    book_id INTEGER NOT NULL,
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (category_id) REFERENCES items(id),
    FOREIGN KEY (armor_type_id) REFERENCES item_armor_types(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Inserir tipos de armadura
INSERT INTO item_armor_types (name, don_time, doff_time) VALUES
('Light Armor', '1 minute', '1 minute'),
('Medium Armor', '5 minutes', '1 minute'),
('Heavy Armor', '10 minutes', '5 minutes'),
('Shield', '1 action', '1 action');

-- Inserção das armaduras leves (Light Armor)
INSERT INTO item_armors (
    category_id, armor_type_id, name, base_ac,
    cost_value, cost_currency_id, weight_value, weight_unit_id,
    dex_bonus_allowed, max_dex_bonus, strength_requirement, stealth_disadvantage,
    book_id
) VALUES 
-- Padded
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Light Armor'),
    'Padded',
    11,
    5.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    8.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    1,
    NULL,
    NULL,
    1,
    (SELECT id FROM core_books WHERE code = 'PHB')
),
-- Leather
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Light Armor'),
    'Leather',
    11,
    10.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    10.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    1,
    NULL,
    NULL,
    0,
    (SELECT id FROM core_books WHERE code = 'PHB')
),
-- Studded Leather
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Light Armor'),
    'Studded Leather',
    12,
    45.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    13.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    1,
    NULL,
    NULL,
    0,
    (SELECT id FROM core_books WHERE code = 'PHB')
);

-- Inserção das armaduras médias (Medium Armor)
INSERT INTO item_armors (
    category_id, armor_type_id, name, base_ac,
    cost_value, cost_currency_id, weight_value, weight_unit_id,
    dex_bonus_allowed, max_dex_bonus, strength_requirement, stealth_disadvantage,
    book_id
) VALUES 
-- Hide
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Medium Armor'),
    'Hide',
    12,
    10.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    12.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    1,
    2,
    NULL,
    0,
    (SELECT id FROM core_books WHERE code = 'PHB')
),
-- Chain Shirt
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Medium Armor'),
    'Chain Shirt',
    13,
    50.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    20.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    1,
    2,
    NULL,
    0,
    (SELECT id FROM core_books WHERE code = 'PHB')
),
-- Scale Mail
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Medium Armor'),
    'Scale Mail',
    14,
    50.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    45.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    1,
    2,
    NULL,
    1,
    (SELECT id FROM core_books WHERE code = 'PHB')
),
-- Spiked Armor
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Medium Armor'),
    'Spiked Armor',
    14,
    75.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    45.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    1,
    2,
    NULL,
    1,
    (SELECT id FROM core_books WHERE code = 'PHB')
),
-- Breastplate
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Medium Armor'),
    'Breastplate',
    14,
    400.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    20.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    1,
    2,
    NULL,
    0,
    (SELECT id FROM core_books WHERE code = 'PHB')
),
-- Half Plate
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Medium Armor'),
    'Half Plate',
    15,
    750.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    40.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    1,
    2,
    NULL,
    1,
    (SELECT id FROM core_books WHERE code = 'PHB')
);

-- Inserção das armaduras pesadas (Heavy Armor)
INSERT INTO item_armors (
    category_id, armor_type_id, name, base_ac,
    cost_value, cost_currency_id, weight_value, weight_unit_id,
    dex_bonus_allowed, max_dex_bonus, strength_requirement, stealth_disadvantage,
    book_id
) VALUES 
-- Ring Mail
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Heavy Armor'),
    'Ring Mail',
    14,
    30.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    40.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    0,
    NULL,
    NULL,
    1,
    (SELECT id FROM core_books WHERE code = 'PHB')
),
-- Chain Mail
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Heavy Armor'),
    'Chain Mail',
    16,
    75.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    55.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    0,
    NULL,
    13,
    1,
    (SELECT id FROM core_books WHERE code = 'PHB')
),
-- Splint
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Heavy Armor'),
    'Splint',
    17,
    200.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    60.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    0,
    NULL,
    15,
    1,
    (SELECT id FROM core_books WHERE code = 'PHB')
),
-- Plate
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Heavy Armor'),
    'Plate',
    18,
    1500.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    65.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    0,
    NULL,
    15,
    1,
    (SELECT id FROM core_books WHERE code = 'PHB')
);

-- Inserção do escudo (Shield)
INSERT INTO item_armors (
    category_id, armor_type_id, name, base_ac,
    cost_value, cost_currency_id, weight_value, weight_unit_id,
    dex_bonus_allowed, max_dex_bonus, strength_requirement, stealth_disadvantage,
    book_id
) VALUES 
(
    (SELECT id FROM items WHERE name = 'armor'),
    (SELECT id FROM item_armor_types WHERE name = 'Shield'),
    'Shield',
    2,
    10.00,
    (SELECT id FROM core_currency_types WHERE code = 'gp'),
    6.0,
    (SELECT id FROM core_measurement_units WHERE code = 'lb'),
    0,
    NULL,
    NULL,
    0,
    (SELECT id FROM core_books WHERE code = 'PHB')
);
