-- =============================================================================
-- SCHEMA: D&D 5e Classes (Tabela Principal Simplificada)
-- =============================================================================
-- 
-- Tabela principal minimalista das classes do D&D 5e
-- 
-- DEPENDÊNCIAS: core_dice
-- RELACIONAMENTOS: class_initial_gold, class_proficiencies_*, class_spell_slots, class_books
--
-- ESTRUTURA SIMPLIFICADA:
-- - Apenas dados essenciais na tabela principal
-- - Equipamento inicial em tabela separada (class_starting_equipment)  
-- - Primary abilities em tabela de proficiências
-- - Hit points calculados via fórmula padrão (hit_dice + CON modifier)
-- - ASI levels padrão (4,8,12,16,19) com exceções nas habilidades de classe
-- - Gold inicial gerenciado pela tabela class_initial_gold sem FK direta
-- - Referências a livros gerenciadas pela tabela class_books (many-to-many)
--
-- =============================================================================

-- =============================================================================
-- TABELA PRINCIPAL: CLASSES
-- =============================================================================

DROP TABLE IF EXISTS classes;
CREATE TABLE classes (
    -- Identificação
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    hit_dice_id INTEGER NOT NULL,
    is_spellcaster INTEGER CHECK(is_spellcaster IN (0, 1)) DEFAULT 0,
    main_book_id INTEGER,
    level_subclass INTEGER DEFAULT 3,  -- Nível em que a subclasse é escolhida (padrão 3)
    FOREIGN KEY (hit_dice_id) REFERENCES core_dice(id),
    FOREIGN KEY (main_book_id) REFERENCES core_books(id)
);

-- =============================================================================
-- DADOS: INSERÇÃO DAS CLASSES
-- =============================================================================

-- Classes principais do D&D 5e (em ordem alfabética)
INSERT INTO classes (name, hit_dice_id, is_spellcaster, main_book_id, level_subclass) VALUES 
('Artificer', 3 /* d8 */, 1, (SELECT id FROM core_books WHERE code = 'TCE'), 3),
('Barbarian', 5 /* d12 */, 0, (SELECT id FROM core_books WHERE code = 'PHB'), 3),
('Bard', 3 /* d8 */, 1, (SELECT id FROM core_books WHERE code = 'PHB'), 3),
('Blood Hunter', 4 /* d10 */, 0, (SELECT id FROM core_books WHERE code = 'DDB'), 3),
('Cleric', 3 /* d8 */, 1, (SELECT id FROM core_books WHERE code = 'PHB'), 1),
('Druid', 3 /* d8 */, 1, (SELECT id FROM core_books WHERE code = 'PHB'), 2),
('Fighter', 4 /* d10 */, 0, (SELECT id FROM core_books WHERE code = 'PHB'), 3),
('Monk', 3 /* d8 */, 0, (SELECT id FROM core_books WHERE code = 'PHB'), 3),
('Paladin', 4 /* d10 */, 1, (SELECT id FROM core_books WHERE code = 'PHB'), 3),
('Ranger', 4 /* d10 */, 1, (SELECT id FROM core_books WHERE code = 'PHB'), 3),
('Rogue', 3 /* d8 */, 0, (SELECT id FROM core_books WHERE code = 'PHB'), 3),
('Sorcerer', 2 /* d6 */, 1, (SELECT id FROM core_books WHERE code = 'PHB'), 1),
('Warlock', 3 /* d8 */, 1, (SELECT id FROM core_books WHERE code = 'PHB'), 2),
('Wizard', 2 /* d6 */, 1, (SELECT id FROM core_books WHERE code = 'PHB'), 2);
