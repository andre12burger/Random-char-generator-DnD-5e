-- ================================================================================================
-- GEMSTONES - D&D 5e (Player's Handbook)
-- ================================================================================================
-- Pedras preciosas organizadas por valor conforme D&D 5e oficial
-- Gemstones are small, lightweight, and easily secured compared to their same value in coins.

-- Drop da tabela existente para recriação
DROP TABLE IF EXISTS item_gemstones;

-- ================================================================================================
-- TABELA: GEMSTONES (PEDRAS PRECIOSAS)
-- ================================================================================================

CREATE TABLE item_gemstones (
    gemstone_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    item_id INTEGER NOT NULL DEFAULT 4, -- currency
    value DECIMAL(10,2) NOT NULL,
    value_currency_id INTEGER NOT NULL DEFAULT 4, -- gold
    description TEXT,
    book_id INTEGER NOT NULL DEFAULT 2, -- Player's Handbook
    
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (value_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_gemstones_value ON item_gemstones(value);

-- ================================================================================================
-- DADOS: 10 GP GEMSTONES
-- ================================================================================================

INSERT INTO item_gemstones (name, value, description) VALUES
('Azurite', 10.00, 'Opaque mottled deep blue'),
('Banded agate', 10.00, 'Translucent striped brown, blue, white, or red'),
('Blue quartz', 10.00, 'Transparent pale blue'),
('Eye agate', 10.00, 'Translucent circles of gray, white, brown, blue, or green'),
('Hematite', 10.00, 'Opaque gray-black'),
('Lapis lazuli', 10.00, 'Opaque light and dark blue with yellow flecks'),
('Malachite', 10.00, 'Opaque striated light and dark green'),
('Moss agate', 10.00, 'Translucent pink or yellow-white with mossy gray or green markings'),
('Obsidian', 10.00, 'Opaque black'),
('Rhodochrosite', 10.00, 'Opaque light pink'),
('Tiger eye', 10.00, 'Translucent brown with golden center'),
('Turquoise', 10.00, 'Opaque light blue-green');

-- ================================================================================================
-- DADOS: 50 GP GEMSTONES
-- ================================================================================================

INSERT INTO item_gemstones (name, value, description) VALUES
('Bloodstone', 50.00, 'Opaque dark gray with red flakes'),
('Carnelian', 50.00, 'Opaque orange to red-brown'),
('Chalcedony', 50.00, 'Opaque white'),
('Chrysoprase', 50.00, 'Translucent green'),
('Citrine', 50.00, 'Transparent pale yellow-brown'),
('Jasper', 50.00, 'Opaque blue, black, or brown'),
('Moonstone', 50.00, 'Translucent white with pale blue glow'),
('Onyx', 50.00, 'Opaque bands of black and white, or pure black and white'),
('Quartz', 50.00, 'Transparent white, smoky gray, or yellow'),
('Sardonyx', 50.00, 'Opaque bands of red and white'),
('Star rose quartz', 50.00, 'Translucent rosy stone with white star-shaped center'),
('Zircon', 50.00, 'Transparent pale blue-green');

-- ================================================================================================
-- DADOS: 100 GP GEMSTONES
-- ================================================================================================

INSERT INTO item_gemstones (name, value, description) VALUES
('Amber', 100.00, 'Transparent watery gold to rich gold'),
('Amethyst', 100.00, 'Transparent deep purple'),
('Coral', 100.00, 'Opaque crimson'),
('Garnet', 100.00, 'Transparent red, brown-green, or violet'),
('Jade', 100.00, 'Translucent light green, deep green, or white'),
('Jet', 100.00, 'Opaque deep black'),
('Pearl', 100.00, 'Opaque lustrous white, yellow, or silver'),
('Spinel', 100.00, 'Transparent red, red-brown, or deep green'),
('Tourmaline', 100.00, 'Transparent pale green, blue, brown, or red');

-- ================================================================================================
-- DADOS: 500 GP GEMSTONES
-- ================================================================================================

INSERT INTO item_gemstones (name, value, description) VALUES
('Alexandrite', 500.00, 'Transparent dark green'),
('Aquamarine', 500.00, 'Transparent pale blue-green'),
('Black pearl', 500.00, 'Opaque pure black'),
('Blue spinel', 500.00, 'Transparent deep blue'),
('Peridot', 500.00, 'Transparent rich olive green'),
('Topaz', 500.00, 'Transparent golden yellow');

-- ================================================================================================
-- DADOS: 1000 GP GEMSTONES
-- ================================================================================================

INSERT INTO item_gemstones (name, value, description) VALUES
('Black opal', 1000.00, 'Translucent dark green with black mottling and golden flecks'),
('Blue sapphire', 1000.00, 'Transparent blue-white to medium blue'),
('Emerald', 1000.00, 'Transparent deep bright green'),
('Fire opal', 1000.00, 'Translucent fiery red'),
('Opal', 1000.00, 'Translucent pale blue with green and golden mottling'),
('Star ruby', 1000.00, 'Translucent ruby red with white star-shaped center'),
('Star sapphire', 1000.00, 'Translucent blue sapphire with white star-shaped center'),
('Yellow sapphire', 1000.00, 'Transparent fiery yellow or yellow-green');

-- ================================================================================================
-- DADOS: 5000 GP GEMSTONES
-- ================================================================================================

INSERT INTO item_gemstones (name, value, description) VALUES
('Black sapphire', 5000.00, 'Translucent lustrous black with glowing highlights'),
('Diamond', 5000.00, 'Transparent blue-white, canary, pink, brown, or blue'),
('Jacinth', 5000.00, 'Transparent fiery orange'),
('Ruby', 5000.00, 'Transparent clear red to deep crimson');
