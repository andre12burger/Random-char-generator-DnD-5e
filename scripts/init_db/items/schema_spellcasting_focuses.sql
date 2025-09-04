-- ================================================================================================
-- SISTEMA DE SPELLCASTING FOCUSES - D&D 5e
-- ================================================================================================

-- Drop das tabelas existentes para recriação com IDs corretos
DROP TABLE IF EXISTS item_arcane_focus;
DROP TABLE IF EXISTS item_holy_symbol;
DROP TABLE IF EXISTS item_druid_focus;
DROP TABLE IF EXISTS item_druidcraft_focus;

-- ================================================================================================
-- ARCANE FOCUS - Focos arcanos para conjuradores arcanos
-- ================================================================================================

-- Tabela de arcane focus
CREATE TABLE item_arcane_focus (
    focus_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    item_id INTEGER NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    cost_currency_id INTEGER NOT NULL,
    weight DECIMAL(10,2),
    weight_unit_id INTEGER,
    book_id INTEGER NOT NULL,
    description TEXT,
    special_properties TEXT,
    
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_arcane_focus_item ON item_arcane_focus(item_id);
CREATE INDEX IF NOT EXISTS idx_arcane_focus_book ON item_arcane_focus(book_id);

-- ================================================================================================
-- HOLY SYMBOLS - Símbolos sagrados para conjuradores divinos
-- ================================================================================================

-- Tabela de holy symbols
CREATE TABLE item_holy_symbol (
    symbol_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    item_id INTEGER NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    cost_currency_id INTEGER NOT NULL,
    weight DECIMAL(10,2),
    weight_unit_id INTEGER,
    book_id INTEGER NOT NULL,
    description TEXT,
    special_properties TEXT,
    
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_holy_symbol_item ON item_holy_symbol(item_id);
CREATE INDEX IF NOT EXISTS idx_holy_symbol_book ON item_holy_symbol(book_id);

-- ================================================================================================
-- DRUID FOCUS - Focos druídicos para druidas
-- ================================================================================================

-- Tabela de druid focus
CREATE TABLE item_druid_focus (
    focus_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    item_id INTEGER NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    cost_currency_id INTEGER NOT NULL,
    weight DECIMAL(10,2),
    weight_unit_id INTEGER,
    book_id INTEGER NOT NULL,
    description TEXT,
    special_properties TEXT,
    
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_druid_focus_item ON item_druid_focus(item_id);
CREATE INDEX IF NOT EXISTS idx_druid_focus_book ON item_druid_focus(book_id);

-- ================================================================================================
-- DADOS: ARCANE FOCUS
-- ================================================================================================

-- item_id = 13 (arcane-focus), cost_currency_id = 4 (gp), weight_unit_id = 1 (lb), book_id = 2 (PHB)
INSERT INTO item_arcane_focus (name, item_id, cost, cost_currency_id, weight, weight_unit_id, book_id, description, special_properties) VALUES
('Crystal', 13, 10.00, 4, 1.0, 1, 2, 'A crystal used as an arcane focus, allowing spellcasters to channel their magic.', 'Can be used as a spellcasting focus for sorcerers, warlocks, and wizards.'),
('Orb', 13, 20.00, 4, 3.0, 1, 2, 'A carved orb used as an arcane focus, often made of crystal or precious stone.', 'Can be used as a spellcasting focus for sorcerers, warlocks, and wizards.'),
('Rod', 13, 10.00, 4, 2.0, 1, 2, 'A rod used as an arcane focus, typically made of wood or metal.', 'Can be used as a spellcasting focus for sorcerers, warlocks, and wizards.'),
('Staff', 13, 5.00, 4, 4.0, 1, 2, 'A staff used as an arcane focus, often carved with mystical symbols.', 'Can be used as a spellcasting focus for sorcerers, warlocks, and wizards. Can also be used as a quarterstaff.'),
('Wand', 13, 10.00, 4, 1.0, 1, 2, 'A wand used as an arcane focus, typically made of wood with mystical properties.', 'Can be used as a spellcasting focus for sorcerers, warlocks, and wizards.');

-- ================================================================================================
-- DADOS: HOLY SYMBOLS
-- ================================================================================================

-- item_id = 15 (holy-symbol), cost_currency_id = 4 (gp), weight_unit_id = 1 (lb), book_id = 2 (PHB)
INSERT INTO item_holy_symbol (name, item_id, cost, cost_currency_id, weight, weight_unit_id, book_id, description, special_properties) VALUES
('Amulet', 15, 5.00, 4, 1.0, 1, 2, 'A holy symbol worn as an amulet, depicting the symbol of a deity or pantheon.', 'Can be used as a spellcasting focus for clerics and paladins.'),
('Emblem', 15, 5.00, 4, 0.0, 1, 2, 'A holy symbol embossed or engraved on a shield or other item.', 'Can be used as a spellcasting focus for clerics and paladins. Must be emblazoned on a shield or other item.'),
('Reliquary', 15, 5.00, 4, 2.0, 1, 2, 'A tiny box or container holding a fragment of a sacred relic or blessed item.', 'Can be used as a spellcasting focus for clerics and paladins.');

-- ================================================================================================
-- DADOS: DRUID FOCUS
-- ================================================================================================

-- item_id = 14 (druid-focus), cost_currency_id = 4 (gp), weight_unit_id = 1 (lb), book_id = 2 (PHB)
INSERT INTO item_druid_focus (name, item_id, cost, cost_currency_id, weight, weight_unit_id, book_id, description, special_properties) VALUES
('Sprig of Mistletoe', 14, 1.00, 4, 0.0, 1, 2, 'A sprig of mistletoe, one of the most traditional druidic focuses.', 'Can be used as a spellcasting focus for druids.'),
('Totem', 14, 1.00, 4, 0.0, 1, 2, 'A small carved totem representing nature spirits or animals.', 'Can be used as a spellcasting focus for druids.'),
('Wooden Staff', 14, 5.00, 4, 4.0, 1, 2, 'A staff made of wood that can serve as a druidic focus.', 'Can be used as a spellcasting focus for druids. Can also be used as a quarterstaff.'),
('Yew Wand', 14, 10.00, 4, 1.0, 1, 2, 'A wand made from yew wood, sacred to many druidic traditions.', 'Can be used as a spellcasting focus for druids.');

-- ================================================================================================
-- VIEWS PARA CONSULTA FACILITADA
-- ================================================================================================

-- View completa de arcane focus
CREATE VIEW IF NOT EXISTS v_arcane_focus_complete AS
SELECT 
    af.focus_id,
    af.name,
    af.cost || ' ' || cc.code as price,
    CASE 
        WHEN af.weight IS NOT NULL THEN af.weight || ' ' || mu.name
        ELSE 'Weightless'
    END as weight_display,
    cb.name as source_book,
    af.description,
    af.special_properties
FROM item_arcane_focus af
JOIN core_currency_types cc ON af.cost_currency_id = cc.id
LEFT JOIN core_measurement_units mu ON af.weight_unit_id = mu.id
JOIN core_books cb ON af.book_id = cb.id
ORDER BY af.cost, af.name;

-- View completa de holy symbols
CREATE VIEW IF NOT EXISTS v_holy_symbol_complete AS
SELECT 
    hs.symbol_id,
    hs.name,
    hs.cost || ' ' || cc.code as price,
    CASE 
        WHEN hs.weight IS NOT NULL THEN hs.weight || ' ' || mu.name
        ELSE 'Weightless'
    END as weight_display,
    cb.name as source_book,
    hs.description,
    hs.special_properties
FROM item_holy_symbol hs
JOIN core_currency_types cc ON hs.cost_currency_id = cc.id
LEFT JOIN core_measurement_units mu ON hs.weight_unit_id = mu.id
JOIN core_books cb ON hs.book_id = cb.id
ORDER BY hs.cost, hs.name;

-- View completa de druid focus
CREATE VIEW IF NOT EXISTS v_druid_focus_complete AS
SELECT 
    df.focus_id,
    df.name,
    df.cost || ' ' || cc.code as price,
    CASE 
        WHEN df.weight IS NOT NULL THEN df.weight || ' ' || mu.name
        ELSE 'Weightless'
    END as weight_display,
    cb.name as source_book,
    df.description,
    df.special_properties
FROM item_druid_focus df
JOIN core_currency_types cc ON df.cost_currency_id = cc.id
LEFT JOIN core_measurement_units mu ON df.weight_unit_id = mu.id
JOIN core_books cb ON df.book_id = cb.id
ORDER BY df.cost, df.name;

-- View unificada de todos os spellcasting focuses
CREATE VIEW IF NOT EXISTS v_spellcasting_focuses_all AS
SELECT 
    'Arcane Focus' as focus_type,
    af.name,
    af.cost || ' ' || cc1.code as price,
    CASE 
        WHEN af.weight IS NOT NULL THEN af.weight || ' ' || mu1.name
        ELSE 'Weightless'
    END as weight_display,
    cb1.name as source_book,
    af.description
FROM item_arcane_focus af
JOIN core_currency_types cc1 ON af.cost_currency_id = cc1.id
LEFT JOIN core_measurement_units mu1 ON af.weight_unit_id = mu1.id
JOIN core_books cb1 ON af.book_id = cb1.id

UNION ALL

SELECT 
    'Holy Symbol' as focus_type,
    hs.name,
    hs.cost || ' ' || cc2.code as price,
    CASE 
        WHEN hs.weight IS NOT NULL THEN hs.weight || ' ' || mu2.name
        ELSE 'Weightless'
    END as weight_display,
    cb2.name as source_book,
    hs.description
FROM item_holy_symbol hs
JOIN core_currency_types cc2 ON hs.cost_currency_id = cc2.id
LEFT JOIN core_measurement_units mu2 ON hs.weight_unit_id = mu2.id
JOIN core_books cb2 ON hs.book_id = cb2.id

UNION ALL

SELECT 
    'Druid Focus' as focus_type,
    df.name,
    df.cost || ' ' || cc3.code as price,
    CASE 
        WHEN df.weight IS NOT NULL THEN df.weight || ' ' || mu3.name
        ELSE 'Weightless'
    END as weight_display,
    cb3.name as source_book,
    df.description
FROM item_druid_focus df
JOIN core_currency_types cc3 ON df.cost_currency_id = cc3.id
LEFT JOIN core_measurement_units mu3 ON df.weight_unit_id = mu3.id
JOIN core_books cb3 ON df.book_id = cb3.id

ORDER BY focus_type, name;

-- View simples para seleção rápida por classe
CREATE VIEW IF NOT EXISTS v_spellcasting_focuses_by_class AS
SELECT 
    'Arcane' as caster_type,
    'Sorcerer, Warlock, Wizard' as classes,
    af.name,
    af.cost || ' ' || cc.code as price
FROM item_arcane_focus af
JOIN core_currency_types cc ON af.cost_currency_id = cc.id

UNION ALL

SELECT 
    'Divine' as caster_type,
    'Cleric, Paladin' as classes,
    hs.name,
    hs.cost || ' ' || cc.code as price
FROM item_holy_symbol hs
JOIN core_currency_types cc ON hs.cost_currency_id = cc.id

UNION ALL

SELECT 
    'Nature' as caster_type,
    'Druid' as classes,
    df.name,
    df.cost || ' ' || cc.code as price
FROM item_druid_focus df
JOIN core_currency_types cc ON df.cost_currency_id = cc.id

ORDER BY caster_type, name;
