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
    3 /* armor */,
    1 /* Light Armor */,
    'Padded',
    11,
    5.00,
    4 /* gp */,
    8.0,
    2 /* lb */,
    1,
    NULL,
    NULL,
    1,
    1 /* PHB */
),
-- Leather
(
    3 /* armor */,
    1 /* Light Armor */,
    'Leather',
    11,
    10.00,
    4 /* gp */,
    10.0,
    2 /* lb */,
    1,
    NULL,
    NULL,
    0,
    1 /* PHB */
),
-- Studded Leather
(
    3 /* armor */,
    1 /* Light Armor */,
    'Studded Leather',
    12,
    45.00,
    4 /* gp */,
    13.0,
    2 /* lb */,
    1,
    NULL,
    NULL,
    0,
    1 /* PHB */
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
    3 /* armor */,
    2 /* Medium Armor */,
    'Hide',
    12,
    10.00,
    4 /* gp */,
    12.0,
    2 /* lb */,
    1,
    2,
    NULL,
    0,
    1 /* PHB */
),
-- Chain Shirt
(
    3 /* armor */,
    2 /* Medium Armor */,
    'Chain Shirt',
    13,
    50.00,
    4 /* gp */,
    20.0,
    2 /* lb */,
    1,
    2,
    NULL,
    0,
    1 /* PHB */
),
-- Scale Mail
(
    3 /* armor */,
    2 /* Medium Armor */,
    'Scale Mail',
    14,
    50.00,
    4 /* gp */,
    45.0,
    2 /* lb */,
    1,
    2,
    NULL,
    1,
    1 /* PHB */
),
-- Spiked Armor
(
    3 /* armor */,
    2 /* Medium Armor */,
    'Spiked Armor',
    14,
    75.00,
    4 /* gp */,
    45.0,
    2 /* lb */,
    1,
    2,
    NULL,
    1,
    1 /* PHB */
),
-- Breastplate
(
    3 /* armor */,
    2 /* Medium Armor */,
    'Breastplate',
    14,
    400.00,
    4 /* gp */,
    20.0,
    2 /* lb */,
    1,
    2,
    NULL,
    0,
    1 /* PHB */
),
-- Half Plate
(
    3 /* armor */,
    2 /* Medium Armor */,
    'Half Plate',
    15,
    750.00,
    4 /* gp */,
    40.0,
    2 /* lb */,
    1,
    2,
    NULL,
    1,
    1 /* PHB */
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
    3 /* armor */,
    3 /* Heavy Armor */,
    'Ring Mail',
    14,
    30.00,
    4 /* gp */,
    40.0,
    2 /* lb */,
    0,
    NULL,
    NULL,
    1,
    1 /* PHB */
),
-- Chain Mail
(
    3 /* armor */,
    3 /* Heavy Armor */,
    'Chain Mail',
    16,
    75.00,
    4 /* gp */,
    55.0,
    2 /* lb */,
    0,
    NULL,
    13,
    1,
    1 /* PHB */
),
-- Splint
(
    3 /* armor */,
    3 /* Heavy Armor */,
    'Splint',
    17,
    200.00,
    4 /* gp */,
    60.0,
    2 /* lb */,
    0,
    NULL,
    15,
    1,
    1 /* PHB */
),
-- Plate
(
    3 /* armor */,
    3 /* Heavy Armor */,
    'Plate',
    18,
    1500.00,
    4 /* gp */,
    65.0,
    2 /* lb */,
    0,
    NULL,
    15,
    1,
    1 /* PHB */
);

-- Inserção do escudo (Shield)
INSERT INTO item_armors (
    category_id, armor_type_id, name, base_ac,
    cost_value, cost_currency_id, weight_value, weight_unit_id,
    dex_bonus_allowed, max_dex_bonus, strength_requirement, stealth_disadvantage,
    book_id
) VALUES 
(
    3 /* armor */,
    4 /* Shield */,
    'Shield',
    2,
    10.00,
    4 /* gp */,
    6.0,
    2 /* lb */,
    0,
    NULL,
    NULL,
    0,
    1 /* PHB */
);
