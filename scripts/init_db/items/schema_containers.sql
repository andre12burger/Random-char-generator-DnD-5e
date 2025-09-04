-- ================================================================================================
-- SISTEMA DE CONTAINERS - D&D 5e (SIMPLIFICADO)
-- ================================================================================================

-- Drop da tabela existente para recriação
DROP TABLE IF EXISTS item_containers;

-- Tabela principal de containers (estrutura simples baseada no HTML)
CREATE TABLE item_containers (
    container_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    item_id INTEGER NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    cost_currency_id INTEGER NOT NULL,
    capacity TEXT,
    weight DECIMAL(10,2),
    weight_unit_id INTEGER,
    book_id INTEGER NOT NULL,
    
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_containers_item ON item_containers(item_id);

-- ================================================================================================
-- DADOS: CONTAINERS (baseado no HTML original)
-- ================================================================================================

-- item_id = 18 (containers), cost_currency_id = 1 (cp), 2 (sp), 4 (gp), weight_unit_id = 1 (lb), book_id = 2 (PHB)
INSERT INTO item_containers (name, item_id, cost, cost_currency_id, capacity, weight, weight_unit_id, book_id) VALUES
('Backpack', 18, 2.00, 4, '1 cubic foot/30 pounds of gear', 5.0, 1, 2),
('Barrel', 18, 2.00, 4, '40 gallons liquid, 4 cubic feet solid', 70.0, 1, 2),
('Basket', 18, 4.00, 2, '2 cubic feet/40 pounds of gear', 2.0, 1, 2),
('Bucket', 18, 5.00, 1, '3 gallons liquid, 1/2 cubic foot solid', 2.0, 1, 2),
('Case, Crossbow Bolt', 18, 1.00, 4, '20 crossbow bolts', 1.0, 1, 2),
('Case, Map/Scroll', 18, 1.00, 4, 'ten rolled-up sheets of paper or five rolled-up sheets of parchment', 1.0, 1, 2),
('Chest', 18, 5.00, 4, '12 cubic feet/300 pounds of gear', 25.0, 1, 2),
('Flask or Tankard', 18, 2.00, 1, '1 pint liquid', 1.0, 1, 2),
('Glass Bottle', 18, 2.00, 4, '1.5 pints liquid', 2.0, 1, 2),
('Jug or Pitcher', 18, 2.00, 1, '1 gallon liquid', 4.0, 1, 2),
('Pot, Iron', 18, 2.00, 4, '1 gallon liquid', 10.0, 1, 2),
('Pouch', 18, 5.00, 2, '1/5 cubic foot/6 pounds of gear', 1.0, 1, 2),
('Quiver', 18, 1.00, 4, '20 arrows', 1.0, 1, 2),
('Sack', 18, 2.00, 1, '1 cubic foot/30 pounds of gear', 0.5, 1, 2),
('Vial', 18, 1.00, 4, '4 ounces liquid', 0.0, 1, 2),
('Waterskin', 18, 2.00, 4, '4 pints liquid', 5.0, 1, 2);
