-- schema_units.sql

-- Apaga tabelas se existirem
DROP TABLE IF EXISTS currency_types;
DROP TABLE IF EXISTS measurement_units;

-- Tipos de moeda (cp é a moeda base para conversões)
CREATE TABLE currency_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,         -- 'cp', 'sp', 'ep', 'gp', 'pp'
    name TEXT NOT NULL,               -- 'Copper', 'Silver', 'Electrum', 'Gold', 'Platinum'
    conversion_rate INTEGER NOT NULL   -- Quantas moedas de cobre (cp) equivalem a 1 desta moeda
);

-- Unidades de medida
CREATE TABLE measurement_units (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,         -- 'lb', 'oz'
    name TEXT NOT NULL                -- 'Pounds', 'Ounces'
);

-- Inserir tipos de moeda e suas taxas de conversão
INSERT INTO currency_types (code, name, conversion_rate) VALUES
('cp', 'Copper', 1),        -- Base: 1 cp = 1 cp
('sp', 'Silver', 10),       -- 1 sp = 10 cp
('ep', 'Electrum', 50),     -- 1 ep = 50 cp
('gp', 'Gold', 100),        -- 1 gp = 100 cp
('pp', 'Platinum', 1000);   -- 1 pp = 1000 cp

-- Inserir unidades de medida
INSERT INTO measurement_units (code, name) VALUES
('lb', 'Pounds'),
('oz', 'Ounces');
