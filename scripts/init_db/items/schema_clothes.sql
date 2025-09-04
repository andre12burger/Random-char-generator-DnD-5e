-- ================================================================================================
-- SISTEMA DE CLOTHES - D&D 5e (SIMPLIFICADO)
-- ================================================================================================

-- Drop da tabela existente para recriação
DROP TABLE IF EXISTS item_clothes;

-- Tabela principal de roupas (estrutura simples baseada no HTML)
CREATE TABLE item_clothes (
    clothing_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    item_id INTEGER NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    cost_currency_id INTEGER NOT NULL,
    weight DECIMAL(10,2),
    weight_unit_id INTEGER,
    book_id INTEGER NOT NULL,
    
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_clothes_item ON item_clothes(item_id);

-- ================================================================================================
-- DADOS: CLOTHES (baseado no HTML original)
-- ================================================================================================

-- item_id = 16 (clothes), cost_currency_id = 2 (sp), 4 (gp), weight_unit_id = 1 (lb), book_id = 2 (PHB)
INSERT INTO item_clothes (name, item_id, cost, cost_currency_id, weight, weight_unit_id, book_id) VALUES
('Common Clothes', 16, 5.00, 2, 3.0, 1, 2),
('Costume', 16, 5.00, 4, 4.0, 1, 2),
('Fine Clothes', 16, 15.00, 4, 6.0, 1, 2),
('Robes', 16, 1.00, 4, 4.0, 1, 2),
('Traveler''s Clothes', 16, 2.00, 4, 4.0, 1, 2);

-- ================================================================================================
-- VIEWS PARA CONSULTA FACILITADA
-- ================================================================================================

-- View completa de roupas
CREATE VIEW IF NOT EXISTS v_clothes_complete AS
SELECT 
    c.clothing_id,
    c.name,
    ct.type_name as clothing_type,
    c.cost || ' ' || cc.code as price,
    CASE 
        WHEN c.weight IS NOT NULL THEN c.weight || ' ' || mu.name
        ELSE 'Weightless'
    END as weight_display,
    c.social_status,
    c.climate_suitability,
    cb.name as source_book,
    c.description,
    c.special_properties
FROM item_clothes c
JOIN item_clothing_types ct ON c.clothing_type_id = ct.type_id
JOIN core_currency_types cc ON c.cost_currency_id = cc.id
LEFT JOIN core_measurement_units mu ON c.weight_unit_id = mu.id
JOIN core_books cb ON c.book_id = cb.id
ORDER BY ct.type_name, c.cost, c.name;

-- View por tipo de roupa
CREATE VIEW IF NOT EXISTS v_clothes_by_type AS
SELECT 
    ct.type_name,
    COUNT(c.clothing_id) as item_count,
    GROUP_CONCAT(c.name, ', ') as items
FROM item_clothing_types ct
LEFT JOIN item_clothes c ON ct.type_id = c.clothing_type_id
GROUP BY ct.type_id, ct.type_name
ORDER BY ct.type_name;

-- View por status social
CREATE VIEW IF NOT EXISTS v_clothes_by_social_status AS
SELECT 
    c.social_status,
    GROUP_CONCAT(c.name, ', ') as available_clothes,
    COUNT(*) as item_count
FROM item_clothes c
GROUP BY c.social_status
ORDER BY c.social_status;
