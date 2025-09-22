-- =========================================================================
-- SISTEMA MANY-TO-MANY PARA CLASSES D&D 5e
-- Permite que uma classe apareça em múltiplos livros
-- Rastreia fonte original vs reimpressões/expansões
-- =========================================================================

-- ==================== TABELA DE RELACIONAMENTO CLASSE-LIVRO ====================

-- Tabela para relacionar classes com múltiplos livros
CREATE TABLE IF NOT EXISTS class_books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES core_books(id),
    UNIQUE(class_id, book_id) -- Evita duplicatas
);

-- ==================== ÍNDICES PARA PERFORMANCE ====================

CREATE INDEX IF NOT EXISTS idx_class_books_class ON class_books(class_id);
CREATE INDEX IF NOT EXISTS idx_class_books_book ON class_books(book_id);

-- ==================== DADOS INICIAIS DAS CLASSES ====================

-- Inserir relacionamentos das classes principais

-- ARTIFICER - Aparece em múltiplos livros
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Artificer'), 
 (SELECT id FROM core_books WHERE code = 'TCE')),

((SELECT id FROM classes WHERE name = 'Artificer'), 
 (SELECT id FROM core_books WHERE code = 'E:RLW'));

-- BARBARIAN - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Barbarian'), 
 (SELECT id FROM core_books WHERE code = 'PHB'));

-- BARD - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Bard'), 
 (SELECT id FROM core_books WHERE code = 'PHB'));

-- CLERIC - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Cleric'), 
 (SELECT id FROM core_books WHERE code = 'PHB'));

-- DRUID - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Druid'), 
 (SELECT id FROM core_books WHERE code = 'PHB'));

-- FIGHTER - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Fighter'), 
 (SELECT id FROM core_books WHERE code = 'PHB'));

-- MONK - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Monk'), 
 (SELECT id FROM core_books WHERE code = 'PHB'));

-- PALADIN - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Paladin'), 
 (SELECT id FROM core_books WHERE code = 'PHB'));

-- RANGER - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Ranger'), 
 (SELECT id FROM core_books WHERE code = 'PHB')),

((SELECT id FROM classes WHERE name = 'Ranger'), 
 (SELECT id FROM core_books WHERE code = 'UA'));

-- ROGUE - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Rogue'), 
 (SELECT id FROM core_books WHERE code = 'PHB'));

-- SORCERER - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Sorcerer'), 
 (SELECT id FROM core_books WHERE code = 'PHB'));

-- WARLOCK - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Warlock'), 
 (SELECT id FROM core_books WHERE code = 'PHB'));

-- WIZARD - PHB
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Wizard'), 
 (SELECT id FROM core_books WHERE code = 'PHB'));

-- BLOOD HUNTER - Matt Mercer's homebrew (Critical Role)
INSERT OR IGNORE INTO class_books (class_id, book_id) VALUES
((SELECT id FROM classes WHERE name = 'Blood Hunter'), 
 (SELECT id FROM core_books WHERE code = 'DDB'));