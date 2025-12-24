-- schema_units.sql

-- Tipos de moeda (cp é a moeda base para conversões)
DROP TABLE IF EXISTS core_currency_types;
CREATE TABLE core_currency_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,         -- 'cp', 'sp', 'ep', 'gp', 'pp'
    name TEXT NOT NULL,               -- 'Copper', 'Silver', 'Electrum', 'Gold', 'Platinum'
    conversion_rate INTEGER NOT NULL   -- Quantas moedas de cobre (cp) equivalem a 1 desta moeda
);

-- Unidades de medida
DROP TABLE IF EXISTS core_measurement_units;
CREATE TABLE core_measurement_units (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,         -- 'lb', 'oz'
    name TEXT NOT NULL                -- 'Pounds', 'Ounces'
);

-- Inserir tipos de moeda e suas taxas de conversão
INSERT INTO core_currency_types (code, name, conversion_rate) VALUES
('cp', 'Copper', 1),        -- Base: 1 cp = 1 cp
('sp', 'Silver', 10),       -- 1 sp = 10 cp
('ep', 'Electrum', 50),     -- 1 ep = 50 cp
('gp', 'Gold', 100),        -- 1 gp = 100 cp
('pp', 'Platinum', 1000);   -- 1 pp = 1000 cp

-- Inserir unidades de medida
INSERT INTO core_measurement_units (code, name) VALUES
('lb', 'Pounds'),
('oz', 'Ounces'),
('ft', 'Feet');
