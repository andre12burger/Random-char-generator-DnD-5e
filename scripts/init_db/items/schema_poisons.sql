-- =============================================
-- SISTEMA DE VENENOS (POISONS) - D&D 5E
-- =============================================

-- Tabela de tipos de veneno
CREATE TABLE IF NOT EXISTS item_poison_types (
    poison_type_id INTEGER PRIMARY KEY AUTOINCREMENT,
    type_name TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL
);

-- Tabela principal de venenos
CREATE TABLE IF NOT EXISTS item_poisons (
    poison_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    poison_type_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    cost_currency_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    
    FOREIGN KEY (poison_type_id) REFERENCES item_poison_types(poison_type_id),
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_poisons_type ON item_poisons(poison_type_id);
CREATE INDEX IF NOT EXISTS idx_poisons_item ON item_poisons(item_id);
CREATE INDEX IF NOT EXISTS idx_poisons_book ON item_poisons(book_id);

-- Inserir tipos de veneno
INSERT OR IGNORE INTO item_poison_types (type_name, description) VALUES
('Contact', 'Contact poison can be smeared on an object and remains potent until it is touched or washed off. A creature that touches contact poison with exposed skin suffers its effects.'),
('Ingested', 'A creature must swallow an entire dose of ingested poison to suffer its effects. The dose can be delivered in food or a liquid.'),
('Inhaled', 'These poisons are powders or gases that take effect when inhaled. Blowing the powder or releasing the gas subjects creatures in a 5-foot cube to its effect.'),
('Injury', 'Injury poison can be applied to weapons, ammunition, trap components, and other objects that deal piercing or slashing damage and remains potent until delivered through a wound or washed off.');

-- Inserir venenos (baseado no DMG)
-- item_id = 7 (poisons), cost_currency_id = 4 (gp), book_id = 5 (DMG)
INSERT OR IGNORE INTO item_poisons (name, poison_type_id, item_id, cost, cost_currency_id, book_id, description) VALUES
('Assassin''s Blood', 2, 7, 150.00, 4, 5, 'A creature subjected to this poison must make a DC 10 Constitution saving throw. On a failed save, it takes 6 (1d12) poison damage and is poisoned for 24 hours. On a successful save, the creature takes half damage and isn''t poisoned.'),

('Burnt Othur Fumes', 3, 7, 500.00, 4, 5, 'A creature subjected to this poison must succeed on a DC 13 Constitution saving throw or take 10 (3d6) poison damage, and must repeat the saving throw at the start of each of its turns. On each successive failed save, the character takes 3 (1d6) poison damage. After three successful saves, the poison ends.'),

('Carrion Crawler Mucus', 1, 7, 200.00, 4, 5, 'This poison must be harvested from a dead or incapacitated carrion crawler. A creature subjected to this poison must succeed on a DC 13 Constitution saving throw or be poisoned for 1 minute. The poisoned creature is paralyzed. The creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success.'),

('Drow Poison', 4, 7, 200.00, 4, 5, 'This poison is typically made only by the drow, and only in a place far removed from sunlight. A creature subjected to this poison must succeed on a DC 13 Constitution saving throw or be poisoned for 1 hour. If the saving throw fails by 5 or more, the creature is also unconscious while poisoned in this way. The creature wakes up if it takes damage or if another creature takes an action to shake it awake.'),

('Essence of Ether', 3, 7, 300.00, 4, 5, 'A creature subjected to this poison must succeed on a DC 15 Constitution saving throw or become poisoned for 8 hours. The poisoned creature is unconscious. The creature wakes up if it takes damage or if another creature takes an action to shake it awake.'),

('Malice', 3, 7, 250.00, 4, 5, 'A creature subjected to this poison must succeed on a DC 15 Constitution saving throw or become poisoned for 1 hour. The poisoned creature is blinded.'),

('Midnight Tears', 2, 7, 1500.00, 4, 5, 'A creature that ingests this poison suffers no effect until the stroke of midnight. If the poison has not been neutralized before then, the creature must succeed on a DC 17 Constitution saving throw, taking 31 (9d6) poison damage on a failed save, or half as much damage on a successful one.'),

('Oil of Taggit', 1, 7, 400.00, 4, 5, 'A creature subjected to this poison must succeed on a DC 13 Constitution saving throw or become poisoned for 24 hours. The poisoned creature is unconscious. The creature wakes up if it takes damage.'),

('Pale Tincture', 2, 7, 250.00, 4, 5, 'A creature subjected to this poison must succeed on a DC 16 Constitution saving throw or take 3 (1d6) poison damage and become poisoned. The poisoned creature must repeat the saving throw every 24 hours, taking 3 (1d6) poison damage on a failed save. Until this poison ends, the damage the poison deals can''t be healed by any means. After seven successful saving throws, the effect ends and the creature can heal normally.'),

('Purple Worm Poison', 4, 7, 2000.00, 4, 5, 'This poison must be harvested from a dead or incapacitated purple worm. A creature subjected to this poison must make a DC 19 Constitution saving throw, taking 42 (12d6) poison damage on a failed save, or half as much damage on a successful one.'),

('Serpent Venom', 4, 7, 200.00, 4, 5, 'This poison must be harvested from a dead or incapacitated giant poisonous snake. A creature subjected to this poison must succeed on a DC 11 Constitution saving throw, taking 10 (3d6) poison damage on a failed save, or half as much damage on a successful one.'),

('Torpor', 2, 7, 600.00, 4, 5, 'A creature subjected to this poison must succeed on a DC 15 Constitution saving throw or become poisoned for 4d6 hours. The poisoned creature is incapacitated.'),

('Truth Serum', 2, 7, 150.00, 4, 5, 'A creature subjected to this poison must succeed on a DC 11 Constitution saving throw or become poisoned for 1 hour. The poisoned creature can''t knowingly speak a lie, as if under the effect of a zone of truth spell.'),

('Wyvern Poison', 4, 7, 1200.00, 4, 5, 'This poison must be harvested from a dead or incapacitated wyvern. A creature subjected to this poison must make a DC 15 Constitution saving throw, taking 24 (7d6) poison damage on a failed save, or half as much damage on a successful one.');

-- Views para consulta facilitada
CREATE VIEW IF NOT EXISTS v_poisons_complete AS
SELECT 
    p.poison_id,
    p.name,
    pt.type_name as poison_type,
    p.cost || ' ' || cc.code as price_per_dose,
    cb.name as source_book,
    p.description
FROM item_poisons p
JOIN item_poison_types pt ON p.poison_type_id = pt.poison_type_id
JOIN core_currency_types cc ON p.cost_currency_id = cc.id
JOIN core_books cb ON p.book_id = cb.id
ORDER BY p.cost;

CREATE VIEW IF NOT EXISTS v_poisons_by_type AS
SELECT 
    pt.type_name,
    pt.description as type_description,
    COUNT(*) as poison_count,
    ROUND(AVG(p.cost), 2) as avg_cost_gp,
    MIN(p.cost) as min_cost_gp,
    MAX(p.cost) as max_cost_gp
FROM item_poison_types pt
JOIN item_poisons p ON pt.poison_type_id = p.poison_type_id
GROUP BY pt.poison_type_id, pt.type_name, pt.description
ORDER BY avg_cost_gp;