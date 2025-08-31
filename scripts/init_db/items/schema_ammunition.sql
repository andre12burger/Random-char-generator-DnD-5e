-- ================================================
-- MUNIÇÕES D&D 5e
-- ================================================
-- Script para adicionar munições para armas que usam a propriedade "Ammunition"
-- Fonte: data/raw_pages/items/weapons.html
-- 
-- NOTA: Munições são adventuring gear, não armas!

-- ================================================
-- ESTRUTURA PARA MUNIÇÕES
-- ================================================

-- Remove tabela existente se houver
DROP TABLE IF EXISTS item_ammunition;

-- Criar tabela específica para munições (adventuring gear)
CREATE TABLE item_ammunition (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,              -- Nome da munição
    cost DECIMAL(10,2) NOT NULL,            -- Custo
    cost_currency_id INTEGER NOT NULL,      -- Moeda
    weight DECIMAL(10,2) NOT NULL,          -- Peso
    weight_unit_id INTEGER NOT NULL,        -- Unidade de peso
    quantity INTEGER NOT NULL DEFAULT 1,    -- Quantidade no pacote (20, 50, etc)
    compatible_weapons TEXT,                 -- Descrição de compatibilidade
    item_id INTEGER NOT NULL,               -- Categoria: adventuring-gear
    book_id INTEGER NOT NULL,               -- Livro fonte
    description TEXT,                        -- Descrição
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- ================================================
-- MUNIÇÕES (AMMUNITION)
-- ================================================

-- ARROWS (20) - Para Longbow e Shortbow
INSERT INTO item_ammunition (
    name, cost, cost_currency_id, weight, weight_unit_id, quantity,
    compatible_weapons, item_id, book_id, description
) VALUES (
    'Arrows',
    1.00,                                                             -- 1 gp cost
    (SELECT id FROM core_currency_types WHERE name = 'Gold'),         -- Currency: GP
    1.00,                                                             -- 1 lb weight
    (SELECT id FROM core_measurement_units WHERE name = 'Pounds'),    -- Weight unit: Pound
    20,                                                               -- 20 arrows per bundle
    'longbow, shortbow',                                              -- Compatible weapons
    (SELECT id FROM items WHERE name = 'ammunitions'),               -- Item category: ammunitions
    (SELECT id FROM core_books WHERE code = 'PHB'),                   -- Book: Player's Handbook
    'A bundle of 20 arrows for use with longbows and shortbows. Made of wood with steel tips and fletched with feathers.'
);

-- BLOWGUN NEEDLES (50) - Para Blowgun
INSERT INTO item_ammunition (
    name, cost, cost_currency_id, weight, weight_unit_id, quantity,
    compatible_weapons, item_id, book_id, description
) VALUES (
    'Blowgun needles',
    1.00,                                                             -- 1 gp cost
    (SELECT id FROM core_currency_types WHERE name = 'Gold'),         -- Currency: GP
    1.00,                                                             -- 1 lb weight
    (SELECT id FROM core_measurement_units WHERE name = 'Pounds'),    -- Weight unit: Pound
    50,                                                               -- 50 needles per bundle
    'blowgun',                                                        -- Compatible weapons
    (SELECT id FROM items WHERE name = 'ammunitions'),           -- Item category: ammunitions
    (SELECT id FROM core_books WHERE code = 'PHB'),                   -- Book: Player's Handbook
    'A bundle of 50 small needles for use with blowguns. Often used for delivering poisons or sleep agents.'
);

-- CROSSBOW BOLTS (20) - Para todas as bestas (light, hand, heavy)
INSERT INTO item_ammunition (
    name, cost, cost_currency_id, weight, weight_unit_id, quantity,
    compatible_weapons, item_id, book_id, description
) VALUES (
    'Crossbow bolts',
    1.00,                                                             -- 1 gp cost
    (SELECT id FROM core_currency_types WHERE name = 'Gold'),         -- Currency: GP
    1.50,                                                             -- 1½ lb weight
    (SELECT id FROM core_measurement_units WHERE name = 'Pounds'),    -- Weight unit: Pound
    20,                                                               -- 20 bolts per bundle
    'crossbow (light, hand, heavy)',                                  -- Compatible weapons
    (SELECT id FROM items WHERE name = 'ammunitions'),           -- Item category: adventuring gear
    (SELECT id FROM core_books WHERE code = 'PHB'),                   -- Book: Player's Handbook
    'A bundle of 20 crossbow bolts for use with all types of crossbows. Heavier and shorter than arrows.'
);

-- SLING BULLETS (20) - Para Sling e Hoopak (modo ranged)
INSERT INTO item_ammunition (
    name, cost, cost_currency_id, weight, weight_unit_id, quantity,
    compatible_weapons, item_id, book_id, description
) VALUES (
    'Sling bullets',
    4.00,                                                             -- 4 cp cost
    (SELECT id FROM core_currency_types WHERE name = 'Copper'),       -- Currency: CP
    1.50,                                                             -- 1½ lb weight
    (SELECT id FROM core_measurement_units WHERE name = 'Pounds'),    -- Weight unit: Pound
    20,                                                               -- 20 bullets per bundle
    'sling, hoopak',                                                  -- Compatible weapons
    (SELECT id FROM items WHERE name = 'ammunitions'),           -- Item category: adventuring gear
    (SELECT id FROM core_books WHERE code = 'PHB'),                   -- Book: Player's Handbook
    'A bundle of 20 sling bullets made of clay or lead. Used with slings and hoopaks in ranged mode.'
);

-- ================================================
-- RELAÇÕES DE COMPATIBILIDADE
-- ================================================
-- Vamos criar uma tabela de compatibilidade entre armas e munições
-- Esta seria uma extensão futura para mapear quais munições funcionam com quais armas

-- Comentário: 
-- Arrows (20) -> Longbow, Shortbow
-- Crossbow bolts (20) -> Crossbow light, Crossbow hand, Crossbow heavy
-- Sling bullets (20) -> Sling, Hoopak (modo ranged)
-- Blowgun needles (50) -> Blowgun
