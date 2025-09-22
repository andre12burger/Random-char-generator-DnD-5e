-- =========================================================================
-- SISTEMA MANY-TO-MANY PARA SUBCLASSES D&D 5e
-- Permite que uma subclasse apareça em múltiplos livros
-- Rastreia versões UA vs oficiais
-- =========================================================================

-- ==================== TABELA DE RELACIONAMENTO SUBCLASSE-LIVRO ====================

DROP TABLE IF EXISTS subclass_books;

-- Tabela para relacionar subclasses com múltiplos livros
CREATE TABLE IF NOT EXISTS subclass_books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subclass_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    is_ua_version INTEGER CHECK(is_ua_version IN (0, 1)) DEFAULT 0,
    FOREIGN KEY (subclass_id) REFERENCES subclasses(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES core_books(id),
    UNIQUE(subclass_id, book_id) -- Evita duplicatas
);

-- ==================== ÍNDICES PARA PERFORMANCE ====================

CREATE INDEX IF NOT EXISTS idx_subclass_books_subclass ON subclass_books(subclass_id);
CREATE INDEX IF NOT EXISTS idx_subclass_books_book ON subclass_books(book_id);

-- ==================== DADOS INICIAIS DAS SUBCLASSES ====================

INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (1, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (2, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (3, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (3, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (4, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (5, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (6, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (7, 4, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (8, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (9, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (10, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (11, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (12, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (13, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (14, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (15, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (16, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (17, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (17, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (18, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (19, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (20, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (21, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (22, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (22, 11, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (23, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (24, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (25, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (26, 4, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (27, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (28, 3, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (29, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (30, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (31, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (32, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (33, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (34, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (35, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (36, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (37, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (38, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (39, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (40, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (41, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (41, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (42, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (43, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (44, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (45, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (46, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (47, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (48, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (49, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (50, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (50, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (51, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (52, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (52, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (53, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (54, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (54, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (55, 4, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (56, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (57, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (58, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (58, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (59, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (60, 8, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (61, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (62, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (63, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (64, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (65, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (66, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (67, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (67, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (68, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (68, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (69, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (69, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (70, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (71, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (71, 13, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (72, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (72, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (73, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (74, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (75, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (76, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (77, 4, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (78, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (78, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (79, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (80, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (81, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (82, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (83, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (84, 4, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (85, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (86, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (87, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (88, 3, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (89, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (89, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (90, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (91, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (92, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (92, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (93, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (94, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (95, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (95, 13, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (96, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (96, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (97, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (98, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (99, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (100, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (101, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (102, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (103, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (103, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (104, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (105, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (106, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (107, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (108, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (108, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (109, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (110, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (111, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (111, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (112, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (113, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (114, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (114, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (115, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (115, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (116, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (117, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (118, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (119, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (120, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (121, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (122, 18, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (123, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (124, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (125, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (126, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (127, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (128, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (129, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (130, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (131, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (132, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (132, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (133, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (134, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (135, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (135, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (135, 10, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (136, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (137, 1, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (138, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (138, 6, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (139, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (140, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (141, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (142, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (143, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (143, 11, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (144, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (145, 4, 0);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (146, 42, 1);
INSERT OR IGNORE INTO subclass_books (subclass_id, book_id, is_ua_version) VALUES (147, 42, 1);
