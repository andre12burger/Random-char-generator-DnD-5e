-- ================================================================================================
-- SISTEMA DE ADVENTURE GEAR (EQUIPMENT PACKS) - D&D 5e - VERSÃO CORRIGIDA
-- ================================================================================================

-- Drop das tabelas existentes para recriação
DROP TABLE IF EXISTS item_adventure_gear_contents;
DROP TABLE IF EXISTS item_adventure_gear;

-- ================================================================================================
-- TABELA PRINCIPAL: ADVENTURE GEAR (EQUIPMENT PACKS)
-- ================================================================================================

-- Tabela principal de Equipment Packs
CREATE TABLE item_adventure_gear (
    adventure_gear_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    item_id INTEGER NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    cost_currency_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    description TEXT,
    contents_summary TEXT NOT NULL,
    
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- ================================================================================================
-- TABELA DE RELACIONAMENTO: CONTEÚDO DOS PACKS
-- ================================================================================================

-- Tabela de relacionamento: Que itens específicos cada pack contém
CREATE TABLE item_adventure_gear_contents (
    content_id INTEGER PRIMARY KEY AUTOINCREMENT,
    adventure_gear_id INTEGER NOT NULL,
    item_name TEXT NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    unit TEXT,                    -- "feet", "days", "sheets", etc. (apenas para itens não catalogados)
    item_table TEXT,             -- qual tabela contém o item: "common_items", "usable_items", "containers", "clothes"
    item_reference_id INTEGER,   -- ID do item na tabela específica (nullable para itens não encontrados)
    notes TEXT,                  -- observações especiais
    
    FOREIGN KEY (adventure_gear_id) REFERENCES item_adventure_gear(adventure_gear_id)
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_adventure_gear_item ON item_adventure_gear(item_id);
CREATE INDEX IF NOT EXISTS idx_gear_contents_gear ON item_adventure_gear_contents(adventure_gear_id);
CREATE INDEX IF NOT EXISTS idx_gear_contents_table ON item_adventure_gear_contents(item_table);

-- ================================================================================================
-- DADOS: EQUIPMENT PACKS (Player's Handbook)
-- ================================================================================================

-- item_id = 1 (adventure-gear), cost_currency_id = 4 (gp), book_id = 2 (PHB)
INSERT INTO item_adventure_gear (adventure_gear_id, name, item_id, cost, cost_currency_id, book_id, description, contents_summary) VALUES
(1, 'Burglar''s Pack', 1, 16.00, 4, 2, 'Backpack, a bag of 1,000 ball bearings, 10 feet of string, a bell, 5 candles, a crowbar, a hammer, 10 pitons, a hooded lantern, 2 flasks of oil, 5 days rations, a tinderbox and a waterskin. The pack also has 50 feet of hempen rope strapped to the side of it.', 'backpack + burglary tools + survival gear'),
(2, 'Diplomat''s Pack', 1, 39.00, 4, 2, 'Chest, 2 cases for maps and scrolls, a set of fine clothes, a bottle of ink, an ink pen, a lamp, 2 flasks of oil, 5 sheets of paper, a vial of perfume, sealing wax, and soap.', 'chest + diplomatic tools + fine supplies'),
(3, 'Dungeoneer''s Pack', 1, 12.00, 4, 2, 'Backpack, a crowbar, a hammer, 10 pitons, 10 torches, a tinderbox, 10 days of rations, and a waterskin. The pack also has 50 feet of hempen rope strapped to the side of it.', 'backpack + dungeon exploration gear'),
(4, 'Entertainer''s Pack', 1, 40.00, 4, 2, 'Backpack, a bedroll, 2 costumes, 5 candles, 5 days of rations, a waterskin, and a disguise kit.', 'backpack + performance gear + disguise tools'),
(5, 'Explorer''s Pack', 1, 10.00, 4, 2, 'Backpack, a bedroll, a mess kit, a tinderbox, 10 torches, 10 days of rations, and a waterskin. The pack also has 50 feet of hempen rope strapped to the side of it.', 'backpack + wilderness survival gear'),
(6, 'Priest''s Pack', 1, 19.00, 4, 2, 'Backpack, a blanket, 10 candles, a tinderbox, an alms box, 2 blocks of incense, a censer, vestments, 2 days of rations, and a waterskin.', 'backpack + religious supplies + ceremony tools'),
(7, 'Scholar''s Pack', 1, 40.00, 4, 2, 'Backpack, a book of lore, a bottle of ink, an ink pen, 10 sheets of parchment, a little bag of sand, and a small knife.', 'backpack + research tools + writing supplies');

-- ================================================================================================
-- CONTEÚDO DETALHADO: BURGLAR'S PACK (ID 1)
-- ================================================================================================

INSERT INTO item_adventure_gear_contents (adventure_gear_id, item_name, quantity, unit, item_table, item_reference_id, notes) VALUES
-- Container principal
(1, 'Backpack', 1, NULL, 'containers', NULL, 'Container base do pack'),
-- Itens utilizáveis (referências corretas)
(1, 'Ball bearings (bag of 1,000)', 1, NULL, 'usable_items', NULL, 'Bag de 1000 esferas - vendido como 1 unidade'),
-- Itens comuns (quantidades baseadas na unidade de venda)
(1, 'Bell', 1, NULL, 'common_items', NULL, 'Sino - vendido individualmente'),
(1, 'Candle', 5, NULL, 'common_items', NULL, 'Velas - 5 unidades individuais'),
(1, 'Crowbar', 1, NULL, 'common_items', NULL, 'Pé de cabra - vendido individualmente'),
(1, 'Hammer', 1, NULL, 'common_items', NULL, 'Martelo - vendido individualmente'),
(1, 'Piton', 10, NULL, 'common_items', NULL, 'Pitões - 10 unidades individuais'),
(1, 'Oil (flask)', 2, NULL, 'common_items', NULL, 'Óleo - 2 frascos'),
(1, 'Rations (1 day)', 5, NULL, 'common_items', NULL, 'Rações - 5 dias (5 unidades)'),
(1, 'Tinderbox', 1, NULL, 'common_items', NULL, 'Isqueiro - vendido individualmente'),
(1, 'Rope, Hemp (50 ft)', 1, NULL, 'common_items', NULL, 'Corda cânhamo - 1 unidade = 50 pés'),
-- Containers adicionais
(1, 'Waterskin', 1, NULL, 'containers', NULL, 'Cantil - vendido individualmente'),
-- Itens não catalogados (mantém unit para clareza)
(1, 'String', 10, 'feet', NULL, NULL, 'Barbante - não catalogado ainda'),
(1, 'Hooded lantern', 1, NULL, NULL, NULL, 'Lanterna com capuz - não catalogado ainda');

-- ================================================================================================
-- CONTEÚDO DETALHADO: DIPLOMAT'S PACK (ID 2)
-- ================================================================================================

INSERT INTO item_adventure_gear_contents (adventure_gear_id, item_name, quantity, unit, item_table, item_reference_id, notes) VALUES
-- Container principal
(2, 'Chest', 1, NULL, 'containers', NULL, 'Baú elegante'),
(2, 'Case, Map/Scroll', 2, NULL, 'containers', NULL, 'Cases para mapas - 2 unidades'),
-- Roupas elegantes
(2, 'Fine Clothes', 1, NULL, 'clothes', NULL, 'Roupas finas - 1 conjunto'),
-- Itens de escrita (quantidades corretas)
(2, 'Ink (1 oz)', 1, NULL, 'common_items', NULL, 'Tinta - 1 frasco (bottle)'),
(2, 'Ink Pen', 1, NULL, 'common_items', NULL, 'Pena de escrever - 1 unidade'),
(2, 'Paper (1 sheet)', 5, NULL, 'common_items', NULL, 'Papel - 5 folhas'),
-- Itens pessoais
(2, 'Perfume (vial)', 1, NULL, 'common_items', NULL, 'Perfume - 1 frasco'),
(2, 'Sealing Wax', 1, NULL, 'common_items', NULL, 'Cera de selar - 1 unidade'),
(2, 'Soap', 1, NULL, 'common_items', NULL, 'Sabão - 1 unidade'),
-- Iluminação
(2, 'Oil (flask)', 2, NULL, 'common_items', NULL, 'Óleo - 2 frascos'),
-- Itens não catalogados
(2, 'Lamp', 1, NULL, NULL, NULL, 'Lâmpada - não catalogado ainda');

-- ================================================================================================
-- CONTEÚDO DETALHADO: DUNGEONEER'S PACK (ID 3)
-- ================================================================================================

INSERT INTO item_adventure_gear_contents (adventure_gear_id, item_name, quantity, unit, item_table, item_reference_id, notes) VALUES
-- Container principal
(3, 'Backpack', 1, NULL, 'containers', NULL, 'Mochila base'),
-- Ferramentas de exploração
(3, 'Crowbar', 1, NULL, 'common_items', NULL, 'Pé de cabra'),
(3, 'Hammer', 1, NULL, 'common_items', NULL, 'Martelo'),
(3, 'Piton', 10, NULL, 'common_items', NULL, 'Pitões - 10 unidades'),
-- Iluminação
(3, 'Torch', 10, NULL, 'common_items', NULL, 'Tochas - 10 unidades'),
(3, 'Tinderbox', 1, NULL, 'common_items', NULL, 'Isqueiro'),
-- Suprimentos
(3, 'Rations (1 day)', 10, NULL, 'common_items', NULL, 'Rações - 10 dias'),
(3, 'Waterskin', 1, NULL, 'containers', NULL, 'Cantil'),
(3, 'Rope, Hemp (50 ft)', 1, NULL, 'common_items', NULL, 'Corda cânhamo - 50 pés');

-- ================================================================================================
-- CONTEÚDO DETALHADO: ENTERTAINER'S PACK (ID 4)
-- ================================================================================================

INSERT INTO item_adventure_gear_contents (adventure_gear_id, item_name, quantity, unit, item_table, item_reference_id, notes) VALUES
-- Container principal
(4, 'Backpack', 1, NULL, 'containers', NULL, 'Mochila base'),
-- Roupas e disfarces
(4, 'Costume', 2, NULL, 'clothes', NULL, 'Fantasias - 2 conjuntos'),
-- Iluminação
(4, 'Candle', 5, NULL, 'common_items', NULL, 'Velas - 5 unidades'),
-- Suprimentos básicos
(4, 'Rations (1 day)', 5, NULL, 'common_items', NULL, 'Rações - 5 dias'),
(4, 'Waterskin', 1, NULL, 'containers', NULL, 'Cantil'),
-- Itens não catalogados
(4, 'Bedroll', 1, NULL, NULL, NULL, 'Saco de dormir - não catalogado'),
(4, 'Disguise kit', 1, NULL, NULL, NULL, 'Kit de disfarce - não catalogado');

-- ================================================================================================
-- CONTEÚDO DETALHADO: EXPLORER'S PACK (ID 5)
-- ================================================================================================

INSERT INTO item_adventure_gear_contents (adventure_gear_id, item_name, quantity, unit, item_table, item_reference_id, notes) VALUES
-- Container principal
(5, 'Backpack', 1, NULL, 'containers', NULL, 'Mochila base'),
-- Equipamentos de acampamento
(5, 'Mess Kit', 1, NULL, 'common_items', NULL, 'Kit de mesa'),
(5, 'Tinderbox', 1, NULL, 'common_items', NULL, 'Isqueiro'),
-- Iluminação
(5, 'Torch', 10, NULL, 'common_items', NULL, 'Tochas - 10 unidades'),
-- Suprimentos
(5, 'Rations (1 day)', 10, NULL, 'common_items', NULL, 'Rações - 10 dias'),
(5, 'Waterskin', 1, NULL, 'containers', NULL, 'Cantil'),
(5, 'Rope, Hemp (50 ft)', 1, NULL, 'common_items', NULL, 'Corda cânhamo - 50 pés'),
-- Itens não catalogados
(5, 'Bedroll', 1, NULL, NULL, NULL, 'Saco de dormir - não catalogado');

-- ================================================================================================
-- CONTEÚDO DETALHADO: PRIEST'S PACK (ID 6)
-- ================================================================================================

INSERT INTO item_adventure_gear_contents (adventure_gear_id, item_name, quantity, unit, item_table, item_reference_id, notes) VALUES
-- Container principal
(6, 'Backpack', 1, NULL, 'containers', NULL, 'Mochila base'),
-- Conforto básico
(6, 'Blanket', 1, NULL, 'common_items', NULL, 'Cobertor'),
-- Iluminação e fogo
(6, 'Candle', 10, NULL, 'common_items', NULL, 'Velas - 10 unidades'),
(6, 'Tinderbox', 1, NULL, 'common_items', NULL, 'Isqueiro'),
-- Suprimentos
(6, 'Rations (1 day)', 2, NULL, 'common_items', NULL, 'Rações - 2 dias'),
(6, 'Waterskin', 1, NULL, 'containers', NULL, 'Cantil'),
-- Itens religiosos não catalogados
(6, 'Alms box', 1, NULL, NULL, NULL, 'Caixa de esmolas - não catalogado'),
(6, 'Incense blocks', 2, 'blocks', NULL, NULL, 'Blocos de incenso - não catalogado'),
(6, 'Censer', 1, NULL, NULL, NULL, 'Incensário - não catalogado'),
(6, 'Vestments', 1, NULL, NULL, NULL, 'Vestimentas religiosas - não catalogado');

-- ================================================================================================
-- CONTEÚDO DETALHADO: SCHOLAR'S PACK (ID 7)
-- ================================================================================================

INSERT INTO item_adventure_gear_contents (adventure_gear_id, item_name, quantity, unit, item_table, item_reference_id, notes) VALUES
-- Container principal
(7, 'Backpack', 1, NULL, 'containers', NULL, 'Mochila base'),
-- Materiais de estudo
(7, 'Book', 1, NULL, 'common_items', NULL, 'Livro de conhecimento'),
(7, 'Ink (1 oz)', 1, NULL, 'common_items', NULL, 'Tinta - 1 frasco'),
(7, 'Ink Pen', 1, NULL, 'common_items', NULL, 'Pena de escrever'),
(7, 'Parchment (1 sheet)', 10, NULL, 'common_items', NULL, 'Pergaminho - 10 folhas'),
-- Itens não catalogados
(7, 'Bag of sand', 1, 'small bag', NULL, NULL, 'Saco de areia - não catalogado'),
(7, 'Small knife', 1, NULL, NULL, NULL, 'Faca pequena - não catalogado');

-- ================================================================================================
-- VIEWS PARA CONSULTA FACILITADA
-- ================================================================================================

-- View para visualizar packs completos com informações dos itens
DROP VIEW IF EXISTS v_adventure_gear_complete;
CREATE VIEW v_adventure_gear_complete AS
SELECT 
    ag.name as pack_name,
    ag.cost as pack_cost,
    curr.name as currency,
    agc.item_name,
    agc.quantity,
    agc.unit,
    agc.item_table,
    agc.notes,
    CASE 
        WHEN agc.item_table = 'common_items' THEN ci.cost
        WHEN agc.item_table = 'usable_items' THEN ui.cost
        WHEN agc.item_table = 'containers' THEN cont.cost
        WHEN agc.item_table = 'clothes' THEN cl.cost
        ELSE NULL
    END as item_unit_cost,
    CASE 
        WHEN agc.item_table = 'common_items' THEN agc.quantity * ci.cost
        WHEN agc.item_table = 'usable_items' THEN agc.quantity * ui.cost
        WHEN agc.item_table = 'containers' THEN agc.quantity * cont.cost
        WHEN agc.item_table = 'clothes' THEN agc.quantity * cl.cost
        ELSE NULL
    END as total_item_cost
FROM item_adventure_gear ag
JOIN item_adventure_gear_contents agc ON ag.adventure_gear_id = agc.adventure_gear_id
JOIN core_currency_types curr ON ag.cost_currency_id = curr.id
LEFT JOIN item_common_items ci ON agc.item_table = 'common_items' AND agc.item_name = ci.name
LEFT JOIN item_usable_items ui ON agc.item_table = 'usable_items' AND agc.item_name = ui.name
LEFT JOIN item_containers cont ON agc.item_table = 'containers' AND agc.item_name = cont.name
LEFT JOIN item_clothes cl ON agc.item_table = 'clothes' AND agc.item_name = cl.name
ORDER BY ag.adventure_gear_id, agc.content_id;
