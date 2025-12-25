-- 01_schema_books.sql
-- Esquema para tabela de livros (books)

DROP TABLE IF EXISTS core_books;
CREATE TABLE IF NOT EXISTS core_books (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  code TEXT UNIQUE NOT NULL,    -- ex: PHB, DMG, MM
  name TEXT NOT NULL,
  category TEXT,                -- ex: core, adventure
  cover TEXT,                   -- caminho relativo para a imagem (se houver)
  published TEXT,               -- data de publicação (string)
  author TEXT,
  contents_json TEXT            -- JSON string com sumário/contents
);

CREATE INDEX IF NOT EXISTS idx_core_books_code ON core_books(code);
CREATE INDEX IF NOT EXISTS idx_core_books_name ON core_books(name COLLATE NOCASE);