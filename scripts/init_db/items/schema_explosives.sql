-- =============================================
-- SISTEMA DE EXPLOSIVOS - D&D 5E
-- =============================================
-- Schema completo com todos os explosivos
-- Baseado no Dungeon Master's Guide
-- Integrado com a arquitetura principal do banco

-- ================================================================================================
-- EXPLOSIVE CATEGORIES - Categorias de explosivos (Renaissance/Modern)
-- ================================================================================================

CREATE TABLE IF NOT EXISTS item_explosive_categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE, -- 'Renaissance' ou 'Modern'
    description TEXT,
    item_id INTEGER NOT NULL, -- Relação com items(id=5) para explosivos
    
    FOREIGN KEY (item_id) REFERENCES items(id)
);

-- ================================================================================================
-- EXPLOSIVES - Explosivos individuais (ESTRUTURA INTEGRADA CORRIGIDA)
-- ================================================================================================

CREATE TABLE IF NOT EXISTS item_explosives (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    category_id INTEGER NOT NULL,
    cost DECIMAL(10,2), -- Custo (NULL para itens modernos)
    cost_currency_id INTEGER, -- Referência à moeda
    weight DECIMAL(10,2) NOT NULL, -- Peso
    weight_unit_id INTEGER NOT NULL, -- Referência à unidade
    damage_dice TEXT, -- Dados de dano (ex: "3d6")
    damage_type_id INTEGER, -- Referência ao tipo de dano
    save_dc INTEGER, -- DC do teste de resistência
    save_attribute_id INTEGER, -- Referência ao atributo (Dexterity, etc.)
    range_value INTEGER, -- Valor do alcance
    range_unit_id INTEGER, -- Unidade do alcance (feet)
    area_value INTEGER, -- Valor da área de efeito
    area_unit_id INTEGER, -- Unidade da área (feet)
    book_id INTEGER NOT NULL, -- Livro de origem
    description TEXT NOT NULL, -- Descrição completa com regras e efeitos
    
    FOREIGN KEY (category_id) REFERENCES item_explosive_categories(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (damage_type_id) REFERENCES core_damage_types(id),
    FOREIGN KEY (save_attribute_id) REFERENCES core_attributes(id),
    FOREIGN KEY (range_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (area_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- ================================================================================================
-- ÍNDICES PARA PERFORMANCE
-- ================================================================================================

CREATE INDEX IF NOT EXISTS idx_explosives_category ON item_explosives(category_id);
CREATE INDEX IF NOT EXISTS idx_explosives_cost ON item_explosives(cost);
CREATE INDEX IF NOT EXISTS idx_explosive_categories_item ON item_explosive_categories(item_id);

-- ================================================================================================
-- DADOS DAS CATEGORIAS (RELACIONADAS COM ITEMS)
-- ================================================================================================

INSERT OR IGNORE INTO item_explosive_categories (id, name, description, item_id) VALUES
(1, 'Renaissance', 'Explosives from the Renaissance period with established costs', 5),
(2, 'Modern', 'Modern explosives that are considered priceless in fantasy settings', 5);

-- ================================================================================================
-- DADOS DOS EXPLOSIVOS (ESTRUTURA INTEGRADA CORRIGIDA)
-- ================================================================================================

-- EXPLOSIVOS RENAISSANCE
INSERT OR IGNORE INTO item_explosives VALUES
(1, 'Bomb', 1, 150.00, 4, 1.0, 1, '3d6', 6, 12, 2, 60, 3, 5, 3, 3,
 'As an action, a character can light this bomb and throw it at a point up to 60 feet away. Each creature within 5 feet of that point must succeed on a DC 12 Dexterity saving throw or take 3d6 fire damage.'),

(2, 'Gunpowder, keg', 1, 250.00, 4, 20.0, 1, '7d6', 6, 12, 2, 0, NULL, 10, 3, 3,
 'Gunpowder is chiefly used to propel a bullet out of the barrel of a pistol or rifle, or it is formed into a bomb. Setting fire to a container full of gunpowder can cause it to explode, dealing fire damage to creatures within 10 feet of it (7d6 for a keg). A successful DC 12 Dexterity saving throw halves the damage.'),

(3, 'Gunpowder, powder horn', 1, 35.00, 4, 2.0, 1, '3d6', 6, 12, 2, 0, NULL, 10, 3, 3,
 'Gunpowder is sold in small wooden kegs and in water-resistant powder horns. Setting fire to a container full of gunpowder can cause it to explode, dealing fire damage to creatures within 10 feet of it (3d6 for a powder horn). A successful DC 12 Dexterity saving throw halves the damage. Setting fire to an ounce of gunpowder causes it to flare for 1 round, shedding bright light in a 30-foot radius and dim light for an additional 30 feet.'),

-- EXPLOSIVOS MODERNOS (SEM PREÇO)
(4, 'Dynamite (stick)', 2, NULL, NULL, 1.0, 1, '3d6', 1, 12, 2, 60, 3, 5, 3, 3,
 'As an action, a creature can light a stick of dynamite and throw it at a point up to 60 feet away. Each creature within 5 feet of that point must make a DC 12 Dexterity saving throw, taking 3d6 bludgeoning damage on a failed save, or half as much damage on a successful one. A character can bind sticks of dynamite together so they explode at the same time. Each additional stick increases the damage by 1d6 (to a maximum of 10d6) and the burst radius by 5 feet (to a maximum of 20 feet). Dynamite can be rigged with a longer fuse to explode after a set amount of time, usually 1 to 6 rounds. Roll initiative for the dynamite. After the set number of rounds goes by, the dynamite explodes on that initiative.'),

(5, 'Grenade, fragmentation', 2, NULL, NULL, 1.0, 1, '5d6', 2, 15, 2, 60, 3, 20, 3, 3,
 'As an action, a character can throw a grenade at a point up to 60 feet away. With a grenade launcher, the character can propel the grenade up to 120 feet away. Each creature within 20 feet of an exploding fragmentation grenade must make a DC 15 Dexterity saving throw, taking 5d6 piercing damage on a failed save, or half as much damage on a successful one.'),

(6, 'Grenade, smoke', 2, NULL, NULL, 2.0, 1, NULL, NULL, NULL, NULL, 60, 3, 20, 3, 3,
 'As an action, a character can throw a grenade at a point up to 60 feet away. With a grenade launcher, the character can propel the grenade up to 120 feet away. One round after a smoke grenade lands, it emits a cloud of smoke that creates a heavily obscured area in a 20-foot radius. A moderate wind (at least 10 miles per hour) disperses the smoke in 4 rounds; a strong wind (20 or more miles per hour) disperses it in 1 round.'),

(7, 'Grenade Launcher', 2, NULL, NULL, 7.0, 1, NULL, NULL, NULL, NULL, 120, 3, NULL, NULL, 3,
 'A weapon used to propel grenades up to 120 feet away instead of the normal 60 feet throwing range. As an action, a character can throw a grenade at a point up to 60 feet away. With a grenade launcher, the character can propel the grenade up to 120 feet away.');

-- ================================================================================================
-- VIEWS PARA CONSULTAS FACILITADAS
-- ================================================================================================

CREATE VIEW IF NOT EXISTS v_explosives_complete AS
SELECT 
    e.id,
    e.name,
    ec.name as category,
    i.name as item_type,
    CASE 
        WHEN e.cost IS NULL THEN 'Priceless'
        ELSE printf('%.0f %s', e.cost, cc.abbreviation) 
    END as cost_display,
    printf('%.1f %s', e.weight, wu.abbreviation) as weight_display,
    CASE 
        WHEN e.damage_dice IS NOT NULL THEN e.damage_dice || ' ' || dt.name
        ELSE 'No damage'
    END as damage,
    CASE 
        WHEN e.save_dc IS NOT NULL THEN 'DC ' || e.save_dc || ' ' || e.save_ability
        ELSE 'No save'
    END as saving_throw,
    CASE 
        WHEN e.range_feet IS NOT NULL THEN e.range_feet || ' feet'
        ELSE 'Contact'
    END as range,
    CASE 
        WHEN e.area_feet IS NOT NULL THEN e.area_feet || ' feet radius'
        ELSE 'No area'
    END as area_effect,
    e.description,
    cb.name as source_book
FROM item_explosives e
JOIN item_explosive_categories ec ON e.category_id = ec.id
JOIN items i ON e.item_id = i.id
LEFT JOIN core_currency_types cc ON e.cost_currency_id = cc.id
JOIN core_measurement_units wu ON e.weight_unit_id = wu.id
LEFT JOIN core_damage_types dt ON e.damage_type_id = dt.id
JOIN core_books cb ON e.book_id = cb.book_id;

CREATE VIEW IF NOT EXISTS v_explosives_by_category AS
SELECT 
    ec.name as category,
    COUNT(*) as total_explosives,
    printf('%.2f', AVG(e.cost)) as avg_cost,
    printf('%.2f', AVG(e.weight)) as avg_weight
FROM item_explosives e
JOIN item_explosive_categories ec ON e.category_id = ec.id
GROUP BY ec.id, ec.name;

-- ================================================================================================
-- COMENTÁRIOS SOBRE O SISTEMA INTEGRADO
-- ================================================================================================
/*
SISTEMA INTEGRADO DE EXPLOSIVOS D&D 5E:

✅ ARQUITETURA INTEGRADA:
- Relacionado com items(id=5) para explosivos
- Usa core_currency_types para moedas (gp = 4)
- Usa core_measurement_units para pesos (lb = 1)
- Usa core_damage_types para tipos de dano
- Usa core_books para referência de livros

🧨 DADOS INCLUÍDOS:
- 7 explosivos total
- 3 explosivos Renaissance (com preço em gp)
- 4 itens modernos (sem preço - "priceless")

📊 ESTRUTURA:
Renaissance Items:
- Bomb (150gp, 1lb) - 3d6 fire damage, DC 12 Dex, 60ft range, 5ft radius
- Gunpowder Keg (250gp, 20lb) - 7d6 fire damage, DC 12 Dex, 10ft radius
- Gunpowder Horn (35gp, 2lb) - 3d6 fire damage, DC 12 Dex, 10ft radius + light

Modern Items (Priceless):
- Dynamite (1lb) - 3d6 bludgeoning, stackable, timer fuse
- Frag Grenade (1lb) - 5d6 piercing, DC 15 Dex, 20ft radius
- Smoke Grenade (2lb) - no damage, obscures vision, wind effects
- Grenade Launcher (7lb) - extends range to 120ft for grenades

🎲 FUNCIONALIDADES:
- Relacionamentos íntegros com tabelas core
- Descrições completas com todas as regras
- Views para consultas facilitadas
- Suporte a mecânicas especiais (empilhamento, timer, etc.)

📋 CONSULTAS ÚTEIS:
- SELECT * FROM v_explosives_complete; -- Visão completa
- SELECT * FROM v_explosives_by_category; -- Resumo por categoria
- SELECT * FROM item_explosives WHERE cost IS NOT NULL; -- Apenas com preço
- SELECT * FROM item_explosives WHERE damage_dice IS NOT NULL; -- Apenas com dano
*/

-- ================================================================================================
-- FIM DO SISTEMA INTEGRADO DE EXPLOSIVOS
-- ================================================================================================
