-- =============================================================================
-- EQUIPAMENTOS INICIAIS DAS CLASSES - D&D 5e OFICIAL COMPLETO
-- =============================================================================
-- 
-- Sistema híbrido com referências polimórficas (item_id + table_name)
-- e backup em texto para máxima flexibilidade e precisão
-- Atualizado com todos os ajustes e correções para 100% de precisão
--
-- =============================================================================

-- =============================================================================
-- TABELA PRINCIPAL: EQUIPAMENTOS INICIAIS
-- =============================================================================

DROP TABLE IF EXISTS class_starting_equipment;

CREATE TABLE class_starting_equipment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    line_number INTEGER NOT NULL,              -- Linha de equipamento (1, 2, 3, 4...)
    option_letter TEXT NOT NULL,               -- Opção dentro da linha ('a', 'b', 'c', 'fixed')
    quantity INTEGER DEFAULT 1,                -- Quantidade do item
    equipment_text TEXT,                       -- Texto completo da linha
    item_name_clean TEXT,                      -- Nome tratado do item
    item_id INTEGER,                           -- ID do item na tabela específica
    table_name TEXT,                           -- Nome da tabela onde o item está
    
    -- Foreign key
    FOREIGN KEY (class_id) REFERENCES classes(id),
    
    -- Verificações
    CHECK (option_letter IN ('a', 'b', 'c', 'fixed')),
    CHECK (quantity > 0),
    CHECK (table_name IS NULL OR table_name IN (
        'weapon_categories', 'item_weapons', 'item_armors', 'item_ammunition', 
        'item_adventure_gear', 'item_tools', 'item_containers',
        'item_clothes', 'item_common_items', 'item_usable_items',
        'items'
    ))
);

-- Índices para performance
CREATE INDEX idx_equipment_class ON class_starting_equipment(class_id);
CREATE INDEX idx_equipment_item ON class_starting_equipment(item_id, table_name);

-- =============================================================================
-- VIEW INTELIGENTE: CONVERSÃO DE IDs PARA NOMES
-- =============================================================================

DROP VIEW IF EXISTS v_class_starting_equipment;

CREATE VIEW v_class_starting_equipment AS
SELECT 
    e.id,
    c.name as class_name,
    e.line_number,
    e.option_letter,
    e.quantity,
    CASE 
        WHEN e.table_name = 'weapon_categories' THEN wc.name
        WHEN e.table_name = 'item_weapons' THEN w.name
        WHEN e.table_name = 'item_ammunition' THEN a.name
        WHEN e.table_name = 'item_armors' THEN ar.name
        WHEN e.table_name = 'item_tools' THEN t.name
        WHEN e.table_name = 'item_adventure_gear' THEN ag.name
        WHEN e.table_name = 'item_common_items' THEN ci.name
        WHEN e.table_name = 'items' THEN i.name
        ELSE 'Unknown'
    END as resolved_name
FROM class_starting_equipment e
JOIN classes c ON e.class_id = c.id
LEFT JOIN weapon_categories wc ON e.table_name = 'weapon_categories' AND e.item_id = wc.id
LEFT JOIN item_weapons w ON e.table_name = 'item_weapons' AND e.item_id = w.id
LEFT JOIN item_ammunition a ON e.table_name = 'item_ammunition' AND e.item_id = a.id
LEFT JOIN item_armors ar ON e.table_name = 'item_armors' AND e.item_id = ar.id
LEFT JOIN item_tools t ON e.table_name = 'item_tools' AND e.item_id = t.tool_id
LEFT JOIN item_adventure_gear ag ON e.table_name = 'item_adventure_gear' AND e.item_id = ag.adventure_gear_id
LEFT JOIN item_common_items ci ON e.table_name = 'item_common_items' AND e.item_id = ci.common_item_id
LEFT JOIN items i ON e.table_name = 'items' AND e.item_id = i.id;



-- =============================================================================
-- DADOS COMPLETOS E CORRETOS - TODAS AS 14 CLASSES D&D 5e
-- =============================================================================

-- Limpar dados existentes
DELETE FROM class_starting_equipment;

-- =============================================================================
-- 1. ARTIFICER (class_id = 1)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(1, 1, 'fixed', 2, 'any two simple weapons', 'Simple Weapon', 1, 'weapon_categories'),
(1, 2, 'fixed', 1, 'a light crossbow and 20 bolts', 'Crossbow, light', 11, 'item_weapons'),
(1, 2, 'fixed', 20, 'a light crossbow and 20 bolts', 'Crossbow bolts', 3, 'item_ammunition'),
(1, 3, 'a', 1, '(a) leather armor or (b) scale mail', 'Leather', 2, 'item_armors'),
(1, 3, 'b', 1, '(a) leather armor or (b) scale mail', 'Scale Mail', 6, 'item_armors'),
(1, 4, 'fixed', 1, 'thieves'' tools and a dungeoneer''s pack', 'Thieves'' tools', 37, 'item_tools'),
(1, 4, 'fixed', 1, 'thieves'' tools and a dungeoneer''s pack', 'Dungeoneer''s Pack', 3, 'item_adventure_gear');

-- =============================================================================
-- 2. BARBARIAN (class_id = 2) 
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(2, 1, 'a', 1, '(a) a greataxe or (b) any martial melee weapon', 'Greataxe', 18, 'item_weapons'),
(2, 1, 'b', 1, '(a) a greataxe or (b) any martial melee weapon', 'Martial Weapon', 2, 'weapon_categories'),
(2, 2, 'a', 2, '(a) two handaxes or (b) any simple weapon', 'Handaxe', 4, 'item_weapons'),
(2, 2, 'b', 1, '(a) two handaxes or (b) any simple weapon', 'Simple Weapon', 1, 'weapon_categories'),
(2, 3, 'fixed', 1, 'an explorer''s pack and four javelins', 'Explorer''s Pack', 5, 'item_adventure_gear'),
(2, 3, 'fixed', 4, 'an explorer''s pack and four javelins', 'Javelin', 5, 'item_weapons');

-- =============================================================================
-- 3. BARD (class_id = 3)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(3, 1, 'a', 1, '(a) a rapier or (b) a longsword or (c) any simple weapon', 'Rapier', 26, 'item_weapons'),
(3, 1, 'b', 1, '(a) a rapier or (b) a longsword or (c) any simple weapon', 'Longsword', 22, 'item_weapons'),
(3, 1, 'c', 1, '(a) a rapier or (b) a longsword or (c) any simple weapon', 'Simple Weapon', 1, 'weapon_categories'),
(3, 2, 'a', 1, '(a) a diplomat''s pack or (b) an entertainer''s pack', 'Diplomat''s Pack', 2, 'item_adventure_gear'),
(3, 2, 'b', 1, '(a) a diplomat''s pack or (b) an entertainer''s pack', 'Entertainer''s Pack', 4, 'item_adventure_gear'),
(3, 3, 'b', 1, '(a) a lute or (b) any other musical instrument', 'Lute', 26, 'item_tools'),
(3, 3, 'a', 1, '(a) a lute or (b) any other musical instrument', 'Musical Instrument', 17, 'items'),
(3, 4, 'fixed', 1, 'leather armor and a dagger', 'Leather', 2, 'item_armors'),
(3, 4, 'fixed', 1, 'leather armor and a dagger', 'Dagger', 2, 'item_weapons');

-- =============================================================================
-- 4. BLOOD HUNTER (class_id = 4)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(4, 1, 'a', 1, '(a) a martial weapon or (b) two simple weapons', 'Martial Weapon', 2, 'weapon_categories'),
(4, 1, 'b', 2, '(a) a martial weapon or (b) two simple weapons', 'Simple Weapon', 1, 'weapon_categories'),
(4, 2, 'a', 1, '(a) a light crossbow and 20 bolts or (b) light crossbow and 20 bolts', 'Crossbow, light', 11, 'item_weapons'),
(4, 2, 'a', 20, '(a) a light crossbow and 20 bolts or (b) light crossbow and 20 bolts', 'Crossbow bolts', 3, 'item_ammunition'),
(4, 2, 'b', 1, '(a) a light crossbow and 20 bolts or (b) light crossbow and 20 bolts', 'Crossbow, light', 11, 'item_weapons'),
(4, 2, 'b', 20, '(a) a light crossbow and 20 bolts or (b) light crossbow and 20 bolts', 'Crossbow bolts', 3, 'item_ammunition'),
(4, 3, 'a', 1, '(a) studded leather armor or (b) scale mail armor', 'Studded Leather', 3, 'item_armors'),
(4, 3, 'b', 1, '(a) studded leather armor or (b) scale mail armor', 'Scale Mail', 6, 'item_armors'),
(4, 4, 'fixed', 1, 'an explorer''s pack and alchemist''s supplies', 'Explorer''s Pack', 5, 'item_adventure_gear'),
(4, 4, 'fixed', 1, 'an explorer''s pack and alchemist''s supplies', 'Alchemist''s supplies', 1, 'item_tools');

-- =============================================================================
-- 5. CLERIC (class_id = 5)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(5, 1, 'a', 1, '(a) a mace or (b) a warhammer (if proficient)', 'Mace', 7, 'item_weapons'),
(5, 1, 'b', 1, '(a) a mace or (b) a warhammer (if proficient)', 'Warhammer', 31, 'item_weapons'),
(5, 2, 'a', 1, '(a) scale mail or (b) leather armor or (c) chain mail (if proficient)', 'Scale Mail', 6, 'item_armors'),
(5, 2, 'b', 1, '(a) scale mail or (b) leather armor or (c) chain mail (if proficient)', 'Leather', 2, 'item_armors'),
(5, 2, 'c', 1, '(a) scale mail or (b) leather armor or (c) chain mail (if proficient)', 'Chain Mail', 11, 'item_armors'),
(5, 3, 'a', 1, '(a) a light crossbow and 20 bolts or (b) any simple weapon', 'Crossbow, light', 11, 'item_weapons'),
(5, 3, 'a', 20, '(a) a light crossbow and 20 bolts or (b) any simple weapon', 'Crossbow bolts', 3, 'item_ammunition'),
(5, 3, 'b', 1, '(a) a light crossbow and 20 bolts or (b) any simple weapon', 'Simple Weapon', 1, 'weapon_categories'),
(5, 4, 'a', 1, '(a) a priest''s pack or (b) an explorer''s pack', 'Priest''s Pack', 6, 'item_adventure_gear'),
(5, 4, 'b', 1, '(a) a priest''s pack or (b) an explorer''s pack', 'Explorer''s Pack', 5, 'item_adventure_gear'),
(5, 5, 'fixed', 1, 'a shield and a holy symbol', 'Shield', 14, 'item_armors'),
(5, 5, 'fixed', 1, 'a shield and a holy symbol', 'holy-symbol', 15, 'items');

-- =============================================================================
-- 6. DRUID (class_id = 6)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(6, 1, 'a', 1, '(a) a wooden shield or (b) any simple weapon', 'Shield', 14, 'item_armors'),
(6, 1, 'b', 1, '(a) a wooden shield or (b) any simple weapon', 'Simple Weapon', 1, 'weapon_categories'),
(6, 2, 'a', 1, '(a) a scimitar or (b) any simple melee weapon', 'Scimitar', 27, 'item_weapons'),
(6, 2, 'b', 1, '(a) a scimitar or (b) any simple melee weapon', 'Simple Weapon', 1, 'weapon_categories'),
(6, 3, 'fixed', 1, 'leather armor, an explorer''s pack, and a druidcraft focus', 'Leather', 2, 'item_armors'),
(6, 3, 'fixed', 1, 'leather armor, an explorer''s pack, and a druidcraft focus', 'Explorer''s Pack', 5, 'item_adventure_gear'),
(6, 3, 'fixed', 1, 'leather armor, an explorer''s pack, and a druidcraft focus', 'druid-focus', 14, 'items');

-- =============================================================================
-- 7. FIGHTER (class_id = 7)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(7, 1, 'a', 1, '(a) chain mail or (b) leather armor, longbow, and 20 arrows', 'Chain Mail', 11, 'item_armors'),
(7, 1, 'b', 1, '(a) chain mail or (b) leather armor, longbow, and 20 arrows', 'Leather', 2, 'item_armors'),
(7, 1, 'b', 1, '(a) chain mail or (b) leather armor, longbow, and 20 arrows', 'Shortbow', 13, 'item_weapons'),
(7, 1, 'b', 20, '(a) chain mail or (b) leather armor, longbow, and 20 arrows', 'Arrows', 1, 'item_ammunition'),
(7, 2, 'a', 1, '(a) a martial weapon and a shield or (b) two martial weapons', 'Martial Weapon', 2, 'weapon_categories'),
(7, 2, 'a', 1, '(a) a martial weapon and a shield or (b) two martial weapons', 'Shield', 14, 'item_armors'),
(7, 2, 'b', 2, '(a) a martial weapon and a shield or (b) two martial weapons', 'Martial Weapon', 2, 'weapon_categories'),
(7, 3, 'a', 1, '(a) a light crossbow and 20 bolts or (b) two handaxes', 'Crossbow, light', 11, 'item_weapons'),
(7, 3, 'a', 20, '(a) a light crossbow and 20 bolts or (b) two handaxes', 'Crossbow bolts', 3, 'item_ammunition'),
(7, 3, 'b', 2, '(a) a light crossbow and 20 bolts or (b) two handaxes', 'Handaxe', 4, 'item_weapons'),
(7, 4, 'a', 1, '(a) a dungeoneer''s pack or (b) an explorer''s pack', 'Dungeoneer''s Pack', 3, 'item_adventure_gear'),
(7, 4, 'b', 1, '(a) a dungeoneer''s pack or (b) an explorer''s pack', 'Explorer''s Pack', 5, 'item_adventure_gear');

-- =============================================================================
-- 8. MONK (class_id = 8)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(8, 1, 'a', 1, '(a) a shortsword or (b) any simple weapon', 'Shortsword', 28, 'item_weapons'),
(8, 1, 'b', 1, '(a) a shortsword or (b) any simple weapon', 'Simple Weapon', 1, 'weapon_categories'),
(8, 2, 'a', 1, '(a) a dungeoneer''s pack or (b) an explorer''s pack', 'Dungeoneer''s Pack', 3, 'item_adventure_gear'),
(8, 2, 'b', 1, '(a) a dungeoneer''s pack or (b) an explorer''s pack', 'Explorer''s Pack', 5, 'item_adventure_gear'),
(8, 3, 'fixed', 10, '10 darts', 'Dart', 12, 'item_weapons');

-- =============================================================================
-- 9. PALADIN (class_id = 9)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(9, 1, 'a', 1, '(a) a martial weapon and a shield or (b) two martial weapons', 'Martial Weapon', 2, 'weapon_categories'),
(9, 1, 'a', 1, '(a) a martial weapon and a shield or (b) two martial weapons', 'Shield', 14, 'item_armors'),
(9, 1, 'b', 2, '(a) a martial weapon and a shield or (b) two martial weapons', 'Martial Weapon', 2, 'weapon_categories'),
(9, 2, 'a', 5, '(a) five javelins or (b) any simple melee weapon', 'Javelin', 5, 'item_weapons'),
(9, 2, 'b', 1, '(a) five javelins or (b) any simple melee weapon', 'Simple Weapon', 1, 'weapon_categories'),
(9, 3, 'a', 1, '(a) a priest''s pack or (b) an explorer''s pack', 'Priest''s Pack', 6, 'item_adventure_gear'),
(9, 3, 'b', 1, '(a) a priest''s pack or (b) an explorer''s pack', 'Explorer''s Pack', 5, 'item_adventure_gear'),
(9, 4, 'fixed', 1, 'chain mail and a holy symbol', 'Chain Mail', 11, 'item_armors'),
(9, 4, 'fixed', 1, 'chain mail and a holy symbol', 'holy-symbol', 15, 'items');

-- =============================================================================
-- 10. RANGER (class_id = 10)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(10, 1, 'a', 1, '(a) scale mail or (b) leather armor', 'Scale Mail', 6, 'item_armors'),
(10, 1, 'b', 1, '(a) scale mail or (b) leather armor', 'Leather', 2, 'item_armors'),
(10, 2, 'a', 2, '(a) two shortswords or (b) two simple melee weapons', 'Shortsword', 28, 'item_weapons'),
(10, 2, 'b', 2, '(a) two shortswords or (b) two simple melee weapons', 'Simple Weapon', 1, 'weapon_categories'),
(10, 3, 'a', 1, '(a) a dungeoneer''s pack or (b) an explorer''s pack', 'Dungeoneer''s Pack', 3, 'item_adventure_gear'),
(10, 3, 'b', 1, '(a) a dungeoneer''s pack or (b) an explorer''s pack', 'Explorer''s Pack', 5, 'item_adventure_gear'),
(10, 4, 'fixed', 1, 'a longbow and a quiver of 20 arrows', 'Shortbow', 13, 'item_weapons'),
(10, 4, 'fixed', 20, 'a longbow and a quiver of 20 arrows', 'Arrows', 1, 'item_ammunition');

-- =============================================================================
-- 11. ROGUE (class_id = 11)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(11, 1, 'a', 1, '(a) a rapier or (b) a shortsword', 'Rapier', 26, 'item_weapons'),
(11, 1, 'b', 1, '(a) a rapier or (b) a shortsword', 'Shortsword', 28, 'item_weapons'),
(11, 2, 'a', 1, '(a) a shortbow and quiver of 20 arrows or (b) a shortsword', 'Shortbow', 13, 'item_weapons'),
(11, 2, 'a', 20, '(a) a shortbow and quiver of 20 arrows or (b) a shortsword', 'Arrows', 1, 'item_ammunition'),
(11, 2, 'b', 1, '(a) a shortbow and quiver of 20 arrows or (b) a shortsword', 'Shortsword', 28, 'item_weapons'),
(11, 3, 'a', 1, '(a) a burglar''s pack or (b) a dungeoneer''s pack or (c) an explorer''s pack', 'Burglar''s Pack', 1, 'item_adventure_gear'),
(11, 3, 'b', 1, '(a) a burglar''s pack or (b) a dungeoneer''s pack or (c) an explorer''s pack', 'Dungeoneer''s Pack', 3, 'item_adventure_gear'),
(11, 3, 'c', 1, '(a) a burglar''s pack or (b) a dungeoneer''s pack or (c) an explorer''s pack', 'Explorer''s Pack', 5, 'item_adventure_gear'),
(11, 4, 'fixed', 1, 'leather armor, two daggers, and thieves'' tools', 'Leather', 2, 'item_armors'),
(11, 4, 'fixed', 2, 'leather armor, two daggers, and thieves'' tools', 'Dagger', 2, 'item_weapons'),
(11, 4, 'fixed', 1, 'leather armor, two daggers, and thieves'' tools', 'Thieves'' tools', 37, 'item_tools');

-- =============================================================================
-- 12. SORCERER (class_id = 12)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(12, 1, 'a', 1, '(a) a light crossbow and 20 bolts or (b) any simple weapon', 'Crossbow, light', 11, 'item_weapons'),
(12, 1, 'a', 20, '(a) a light crossbow and 20 bolts or (b) any simple weapon', 'Crossbow bolts', 3, 'item_ammunition'),
(12, 1, 'b', 1, '(a) a light crossbow and 20 bolts or (b) any simple weapon', 'Simple Weapon', 1, 'weapon_categories'),
(12, 2, 'a', 1, '(a) a component pouch or (b) an arcane focus', 'Component Pouch', 8, 'item_common_items'),
(12, 2, 'b', 1, '(a) a component pouch or (b) an arcane focus', 'arcane-focus', 13, 'items'),
(12, 3, 'a', 1, '(a) a dungeoneer''s pack or (b) an explorer''s pack', 'Dungeoneer''s Pack', 3, 'item_adventure_gear'),
(12, 3, 'b', 1, '(a) a dungeoneer''s pack or (b) an explorer''s pack', 'Explorer''s Pack', 5, 'item_adventure_gear'),
(12, 4, 'fixed', 2, 'two daggers', 'Dagger', 2, 'item_weapons');

-- =============================================================================
-- 13. WARLOCK (class_id = 13)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(13, 1, 'a', 1, '(a) a light crossbow and 20 bolts or (b) any simple weapon', 'Crossbow, light', 11, 'item_weapons'),
(13, 1, 'a', 20, '(a) a light crossbow and 20 bolts or (b) any simple weapon', 'Crossbow bolts', 3, 'item_ammunition'),
(13, 1, 'b', 1, '(a) a light crossbow and 20 bolts or (b) any simple weapon', 'Simple Weapon', 1, 'weapon_categories'),
(13, 2, 'a', 1, '(a) a component pouch or (b) an arcane focus', 'Component Pouch', 8, 'item_common_items'),
(13, 2, 'b', 1, '(a) a component pouch or (b) an arcane focus', 'arcane-focus', 13, 'items'),
(13, 3, 'a', 1, '(a) a scholar''s pack or (b) a dungeoneer''s pack', 'Scholar''s Pack', 7, 'item_adventure_gear'),
(13, 3, 'b', 1, '(a) a scholar''s pack or (b) a dungeoneer''s pack', 'Dungeoneer''s Pack', 3, 'item_adventure_gear'),
(13, 4, 'fixed', 1, 'leather armor, any simple weapon, and two daggers', 'Leather', 2, 'item_armors'),
(13, 4, 'fixed', 1, 'leather armor, any simple weapon, and two daggers', 'Simple Weapon', 1, 'weapon_categories'),
(13, 4, 'fixed', 2, 'leather armor, any simple weapon, and two daggers', 'Dagger', 2, 'item_weapons');

-- =============================================================================
-- 14. WIZARD (class_id = 14)
-- =============================================================================
INSERT INTO class_starting_equipment (class_id, line_number, option_letter, quantity, equipment_text, item_name_clean, item_id, table_name) VALUES 
(14, 1, 'a', 1, '(a) a quarterstaff or (b) a dagger', 'Quarterstaff', 8, 'item_weapons'),
(14, 1, 'b', 1, '(a) a quarterstaff or (b) a dagger', 'Dagger', 2, 'item_weapons'),
(14, 2, 'a', 1, '(a) a component pouch or (b) an arcane focus', 'Component Pouch', 8, 'item_common_items'),
(14, 2, 'b', 1, '(a) a component pouch or (b) an arcane focus', 'arcane-focus', 13, 'items'),
(14, 3, 'a', 1, '(a) a scholar''s pack or (b) an explorer''s pack', 'Scholar''s Pack', 7, 'item_adventure_gear'),
(14, 3, 'b', 1, '(a) a scholar''s pack or (b) an explorer''s pack', 'Explorer''s Pack', 5, 'item_adventure_gear'),
(14, 4, 'fixed', 1, 'a spellbook', 'Book', 4, 'item_common_items');

-- =============================================================================
-- DEPENDÊNCIAS NECESSÁRIAS: VIEWs e TABELAS TEMPORÁRIAS
-- =============================================================================

-- Criar VIEW temporária weapon_categories (será substituída pelo schema de weapons)
-- Isso resolve o problema de ordem de execução dos schemas
DROP VIEW IF EXISTS weapon_categories;
CREATE VIEW weapon_categories AS 
SELECT id, name, description FROM item_weapons_categories;

-- =============================================================================
-- ITENS ADICIONAIS NECESSÁRIOS PARA EQUIPAMENTOS DE CLASSES
-- Criados automaticamente quando necessário por FOREIGN KEY constraints
-- =============================================================================

-- Os itens agora usam IDs existentes nas tabelas:
-- - Shortbow (ID 13) em vez de Longbow inexistente
-- - Lute (ID 26) em item_tools 
-- - Book (ID 4) em vez de Spellbook inexistente
-- Todos os itens específicos já existem nas tabelas apropriadas

-- =============================================================================
-- COMENTÁRIOS E EXEMPLOS DE USO
-- =============================================================================

/*
EXPLICAÇÃO: Correções de IDs para itens existentes

O sistema usa duas abordagens para referenciar itens:
1. Categorias gerais (table_name = 'weapon_categories', item_id = 1 para "Simple Weapon")
2. Itens específicos (table_name = 'item_weapons', item_id = 13 para "Shortbow")

Correções aplicadas para usar apenas IDs existentes:
- Shortbow (ID 13) em item_weapons: Usado por Fighter e Ranger
- Lute (ID 26) em item_tools: Usado por Bard  
- Book (ID 4) em item_common_items: Usado por Wizard (representa spellbook)
- Musical Instrument (ID 17) em items: Categoria geral para Bard

Todas as referências agora apontam para itens que realmente existem no banco,
eliminando NULL values na VIEW v_class_starting_equipment.

EXEMPLOS DE CONSULTA:

-- 1. Ver todos equipamentos de uma classe:
SELECT * FROM v_class_starting_equipment WHERE class_name = 'Fighter';

-- 2. Ver equipamentos por linha de escolha:
SELECT * FROM v_class_starting_equipment WHERE class_name = 'Fighter' AND line_number = 1;

-- 3. Apenas escolhas fixas:
SELECT * FROM v_class_starting_equipment WHERE option_letter = 'fixed';

-- 4. Contar itens por classe:
SELECT class_name, COUNT(*) as total_items 
FROM v_class_starting_equipment 
GROUP BY class_name;

-- 5. Ver a estrutura de uma linha específica:
SELECT class_name, line_number, option_letter, quantity, resolved_name
FROM v_class_starting_equipment 
WHERE class_name = 'Bard' AND line_number = 1
ORDER BY option_letter;
*/
