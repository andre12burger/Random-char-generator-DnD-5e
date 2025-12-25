#!/usr/bin/env python3
"""
Importador de livros (books) para SQLite.

Uso:
  python scripts/import_books.py --source "../5etools-2014-src/data/books.json" --db "db/5e.db"

O script cria a tabela `books` (se não existir) e importa os registros do arquivo JSON.
"""

import argparse
import json
import os
import sqlite3
import sys
from typing import Any

DEFAULT_SOURCE = os.path.join('..', '5etools-2014-src', 'data', 'books.json')
DEFAULT_DB = os.path.join('db', '5e.db')

CREATE_TABLE_SQL = r"""
CREATE TABLE IF NOT EXISTS books (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  code TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  "group" TEXT,
  cover TEXT,
  published TEXT,
  author TEXT,
  contents_json TEXT,
  notes TEXT,
  created_at DATETIME DEFAULT (datetime('now'))
);
"""

INSERT_SQL = r"""
INSERT OR REPLACE INTO books (code, name, "group", cover, published, author, contents_json, notes)
VALUES (?, ?, ?, ?, ?, ?, ?, ?);
"""


def load_books(source_path: str) -> list[dict[str, Any]]:
    with open(source_path, 'r', encoding='utf-8') as fh:
        j = json.load(fh)
    # O arquivo tem a chave "book" → lista
    return j.get('book', [])


def ensure_db(db_path: str) -> sqlite3.Connection:
    os.makedirs(os.path.dirname(db_path), exist_ok=True)
    conn = sqlite3.connect(db_path)
    conn.execute(CREATE_TABLE_SQL)
    conn.commit()
    return conn


def normalize_book(b: dict[str, Any]) -> tuple:
    code = b.get('id') or b.get('source') or b.get('name')
    name = b.get('name')
    group = b.get('group')
    cover = None
    if isinstance(b.get('cover'), dict):
        cover = b['cover'].get('path')
    published = b.get('published')
    author = b.get('author')
    contents_json = None
    if 'contents' in b:
        try:
            contents_json = json.dumps(b['contents'], ensure_ascii=False)
        except Exception:
            contents_json = None
    notes = None
    return (code, name, group, cover, published, author, contents_json, notes)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--source', default=DEFAULT_SOURCE, help='Caminho para books.json (5etools)')
    parser.add_argument('--db', default=DEFAULT_DB, help='Caminho para o arquivo SQLite de destino')
    args = parser.parse_args()

    source = args.source
    db = args.db

    if not os.path.isfile(source):
        print(f"Arquivo de origem não encontrado: {source}")
        sys.exit(2)

    books = load_books(source)
    print(f"{len(books)} livros carregados do arquivo fonte")

    conn = ensure_db(db)
    cur = conn.cursor()

    count = 0
    for b in books:
        row = normalize_book(b)
        cur.execute(INSERT_SQL, row)
        count += 1

    conn.commit()
    cur.close()
    conn.close()

    print(f"{count} registros inseridos/atualizados em {db}")


if __name__ == '__main__':
    main()
