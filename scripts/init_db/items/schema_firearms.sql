-- ================================================================================================
-- SISTEMA DE ARMAS DE FOGO D&D 5e
-- ================================================================================================

CREATE TABLE IF NOT EXISTS item_firearms (
    firearm_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    firearm_category_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL, -- Relação com items(id=6) para firearms
    damage_dice TEXT NOT NULL,
    damage_type_id INTEGER,
    cost DECIMAL(10,2) NOT NULL,
    cost_currency_id INTEGER NOT NULL,
    weight DECIMAL(10,2) NOT NULL,
    weight_unit_id INTEGER NOT NULL,
    range_normal INTEGER,
    range_max INTEGER,
    unit_id INTEGER,
    reload_shots INTEGER, -- Número de tiros antes de recarregar (para propriedade reload)
    book_id INTEGER NOT NULL,
    special_notes TEXT,
    
    FOREIGN KEY (firearm_category_id) REFERENCES item_firearm_categories(firearm_category_id),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (damage_type_id) REFERENCES core_damage_types(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- ================================================================================================
-- SISTEMA DE FIREARMS COMPLETO - D&D 5E
-- ================================================================================================
-- Schema completo com TODAS as firearms (Renaissance, Modern, Futuristic)
-- Baseado no Dungeon Master's Guide

-- ================================================================================================
-- FIREARMS CATEGORIES - Categorias de armas de fogo por período
-- ================================================================================================

CREATE TABLE IF NOT EXISTS item_firearm_categories (
    firearm_category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL UNIQUE,
    category_description TEXT,
    book_id INTEGER NOT NULL,
    time_period TEXT NOT NULL, -- 'Renaissance', 'Modern', 'Futuristic'
    
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- ================================================================================================
-- WEAPON PROPERTIES ADICIONAIS - Burst Fire e Reload
-- ================================================================================================

INSERT OR IGNORE INTO item_weapons_properties (id, name, description) VALUES
(12, 'Burst Fire', 'A weapon that has the burst fire property can make a normal single-target attack, or it can spray a 10-foot-cube area within normal range with shots. Each creature in the area must succeed on a DC 15 Dexterity saving throw or take the weapon''s normal damage. This action uses ten pieces of ammunition.'),
(13, 'Reload', 'A limited number of shots can be made with a weapon that has the reload property. A character must then reload it using an action or a bonus action (the character''s choice).');

-- ================================================================================================
-- FIREARMS - Armas de fogo individuais (ESTRUTURA OTIMIZADA)
-- ================================================================================================

CREATE TABLE IF NOT EXISTS item_firearms (
    firearm_id INTEGER PRIMARY KEY AUTOINCREMENT,
    firearm_category_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL, -- Relação com items(id=6) para firearms
    name TEXT NOT NULL,
    cost TEXT,
    damage TEXT NOT NULL,
    damage_type_id INTEGER,
    weight TEXT,
    range_normal INTEGER,
    range_max INTEGER,
    reload_shots INTEGER, -- Número de tiros antes de recarregar (para propriedade reload)
    special_notes TEXT,
    
    FOREIGN KEY (firearm_category_id) REFERENCES item_firearm_categories(firearm_category_id),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (damage_type_id) REFERENCES core_damage_types(id)
);

-- ================================================================================================
-- FIREARM PROPERTIES RELATIONS - Relação entre firearms e suas propriedades
-- ================================================================================================

CREATE TABLE IF NOT EXISTS item_firearm_property_relations (
    firearm_id INTEGER NOT NULL,
    property_id INTEGER NOT NULL,
    
    PRIMARY KEY (firearm_id, property_id),
    FOREIGN KEY (firearm_id) REFERENCES item_firearms(firearm_id),
    FOREIGN KEY (property_id) REFERENCES item_weapons_properties(id)
);

-- ================================================================================================
-- AMMUNITION ADICIONAL - Bullets e Energy Cells
-- ================================================================================================

INSERT OR IGNORE INTO item_ammunition (name, cost, cost_currency_id, weight, weight_unit_id, quantity, compatible_weapons, item_id, book_id, description) VALUES
('Bullets (Renaissance)', 3.00, 4, 2.0, 1, 10, 'Pistol, Musket', 2, 5, 'Pack of 10 bullets for Renaissance firearms'),
('Bullets (Modern)', 0.00, 4, 1.0, 1, 10, 'Modern firearms', 2, 5, 'Pack of 10 bullets for Modern firearms - Priceless'),
('Energy Cell', 0.00, 4, 5.0, 2, 1, 'Futuristic firearms', 2, 5, 'Energy cell that powers all shots for futuristic firearms - Priceless');

-- ================================================================================================
-- ÍNDICES PARA PERFORMANCE
-- ================================================================================================

CREATE INDEX IF NOT EXISTS idx_firearms_category ON item_firearms(firearm_category_id);
CREATE INDEX IF NOT EXISTS idx_firearms_item ON item_firearms(item_id);
CREATE INDEX IF NOT EXISTS idx_firearm_properties ON item_firearm_property_relations(firearm_id);

-- ================================================================================================
-- DADOS DAS CATEGORIAS (ESTRUTURA OTIMIZADA)
-- ================================================================================================

INSERT OR IGNORE INTO item_firearm_categories VALUES
(1, 'Renaissance Firearms', 'Firearms from the Renaissance period, associated with swashbuckling tales', 5, 'Renaissance'),
(2, 'Modern Firearms', 'Firearms from modern times, when spaceship crash or modern Earth elements are present', 5, 'Modern'),
(3, 'Futuristic Firearms', 'Advanced firearms powered by energy cells from futuristic settings', 5, 'Futuristic');

-- ================================================================================================
-- TODAS AS FIREARMS - DADOS COMPLETOS
-- ================================================================================================

-- Renaissance Firearms
INSERT OR IGNORE INTO item_firearms (name, firearm_category_id, item_id, damage_dice, damage_type_id, cost, cost_currency_id, weight, weight_unit_id, range_normal, range_max, unit_id, reload_shots, book_id, special_notes) VALUES
('Pistol', 1, 6, '1d10', 2, 250.00, 4, 3.0, 1, 30, 90, 3, NULL, 5, 'Renaissance firearm'),
('Musket', 1, 6, '1d12', 2, 500.00, 4, 10.0, 1, 40, 120, 3, NULL, 5, 'Renaissance firearm');

-- Modern Firearms (Priceless = 0 cost)
INSERT OR IGNORE INTO item_firearms (name, firearm_category_id, item_id, damage_dice, damage_type_id, cost, cost_currency_id, weight, weight_unit_id, range_normal, range_max, unit_id, reload_shots, book_id, special_notes) VALUES
('Pistol, automatic', 2, 6, '2d6', 2, 0.00, 4, 3.0, 1, 50, 150, 3, 15, 5, 'Modern automatic pistol - Priceless'),
('Revolver', 2, 6, '2d8', 2, 0.00, 4, 3.0, 1, 40, 120, 3, 6, 5, 'Modern revolver - Priceless'),
('Rifle, hunting', 2, 6, '2d10', 2, 0.00, 4, 8.0, 1, 80, 240, 3, 5, 5, 'Modern hunting rifle - Priceless'),
('Rifle, automatic', 2, 6, '2d8', 2, 0.00, 4, 8.0, 1, 80, 240, 3, 30, 5, 'Modern automatic rifle with burst fire - Priceless'),
('Shotgun', 2, 6, '2d8', 2, 0.00, 4, 7.0, 1, 30, 90, 3, 2, 5, 'Modern shotgun - Priceless');

-- Futuristic Firearms (Priceless = 0 cost)
INSERT OR IGNORE INTO item_firearms (name, firearm_category_id, item_id, damage_dice, damage_type_id, cost, cost_currency_id, weight, weight_unit_id, range_normal, range_max, unit_id, reload_shots, book_id, special_notes) VALUES
('Laser pistol', 3, 6, '3d6', 12, 0.00, 4, 2.0, 1, 40, 120, 3, 50, 5, 'Futuristic laser pistol powered by energy cells - Priceless'),
('Antimatter rifle', 3, 6, '6d8', 10, 0.00, 4, 10.0, 1, 120, 360, 3, 2, 5, 'Futuristic antimatter rifle - Priceless'),
('Laser rifle', 3, 6, '3d8', 12, 0.00, 4, 7.0, 1, 100, 300, 3, 30, 5, 'Futuristic laser rifle - Priceless');

-- ================================================================================================
-- RELAÇÕES ENTRE FIREARMS E PROPRIEDADES
-- ================================================================================================

-- Renaissance Firearms Properties
INSERT OR IGNORE INTO item_firearm_property_relations (firearm_id, property_id) VALUES
-- Pistol (Renaissance)
(1, 1),  -- Ammunition
(1, 5),  -- Loading
-- Musket (Renaissance)
(2, 1),  -- Ammunition
(2, 5),  -- Loading
(2, 10), -- Two-handed

-- Modern Firearms Properties
-- Pistol, automatic
(3, 1),  -- Ammunition
(3, 13), -- Reload
-- Revolver
(4, 1),  -- Ammunition
(4, 13), -- Reload
-- Rifle, hunting
(5, 1),  -- Ammunition
(5, 13), -- Reload
(5, 10), -- Two-handed
-- Rifle, automatic
(6, 1),  -- Ammunition
(6, 12), -- Burst fire
(6, 13), -- Reload
(6, 10), -- Two-handed
-- Shotgun
(7, 1),  -- Ammunition
(7, 13), -- Reload
(7, 10), -- Two-handed

-- Futuristic Firearms Properties
-- Laser pistol
(8, 1),  -- Ammunition
(8, 13), -- Reload
-- Antimatter rifle
(9, 1),  -- Ammunition
(9, 13), -- Reload
(9, 10), -- Two-handed
-- Laser rifle
(10, 1), -- Ammunition
(10, 13), -- Reload
(10, 10); -- Two-handed

-- ================================================================================================
-- VIEWS PARA CONSULTA FÁCIL
-- ================================================================================================

CREATE VIEW IF NOT EXISTS firearms_complete AS
SELECT 
    f.firearm_id,
    f.name,
    fc.category_name,
    fc.time_period,
    f.cost || ' ' || cc.code as cost_display,
    f.damage_dice,
    dt.name as damage_type,
    f.weight || ' ' || mu.name as weight_display,
    f.range_normal || '/' || f.range_max || ' ' || ru.name as range_text,
    f.reload_shots,
    GROUP_CONCAT(wp.name, ', ') as properties,
    f.special_notes
FROM item_firearms f
JOIN item_firearm_categories fc ON f.firearm_category_id = fc.firearm_category_id
LEFT JOIN core_damage_types dt ON f.damage_type_id = dt.id
LEFT JOIN core_currency_types cc ON f.cost_currency_id = cc.id
LEFT JOIN core_measurement_units mu ON f.weight_unit_id = mu.id
LEFT JOIN core_measurement_units ru ON f.unit_id = ru.id
LEFT JOIN item_firearm_property_relations fpr ON f.firearm_id = fpr.firearm_id
LEFT JOIN item_weapons_properties wp ON fpr.property_id = wp.id
GROUP BY f.firearm_id, f.name, fc.category_name, fc.time_period, f.cost, cc.code, f.damage_dice, dt.name, f.weight, mu.name, f.range_normal, f.range_max, ru.name, f.reload_shots, f.special_notes
ORDER BY fc.firearm_category_id, f.name;

CREATE VIEW IF NOT EXISTS firearms_by_period AS
SELECT 
    fc.time_period,
    COUNT(*) as firearm_count,
    GROUP_CONCAT(f.name, ', ') as firearms
FROM item_firearms f
JOIN item_firearm_categories fc ON f.firearm_category_id = fc.firearm_category_id
GROUP BY fc.time_period
ORDER BY 
    CASE fc.time_period 
        WHEN 'Renaissance' THEN 1
        WHEN 'Modern' THEN 2
        WHEN 'Futuristic' THEN 3
    END;
