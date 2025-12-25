PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;

-- 1. Atributos (Base para quase tudo)
DROP TABLE IF EXISTS core_attributes;
CREATE TABLE core_attributes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    abbreviation TEXT NOT NULL UNIQUE
);

-- 2. Modificadores de Valor de Atributo (Tabela de consulta rápida)
DROP TABLE IF EXISTS core_attribute_modifiers;
CREATE TABLE core_attribute_modifiers (
    attribute_score INTEGER PRIMARY KEY,
    modifier_sign VARCHAR(1),
    modifier_number INTEGER NOT NULL,
    modifier_value TEXT NOT NULL
);

-- 3. Dados (Sistemas de rolagem)
DROP TABLE IF EXISTS core_dice;
CREATE TABLE core_dice (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    sides INTEGER NOT NULL UNIQUE,
    description TEXT
);

-- 4. Tamanhos (Mecânicas de combate e raça)
DROP TABLE IF EXISTS core_sizes;
CREATE TABLE core_sizes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    code TEXT NOT NULL UNIQUE
);

-- 5. Alinhamentos
DROP TABLE IF EXISTS core_alignments;
CREATE TABLE core_alignments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    abbreviation TEXT NOT NULL UNIQUE,
    alignment_order TEXT NOT NULL,
    alignment_morality TEXT NOT NULL,
    description TEXT
);

-- 6. Tipos de Dano
DROP TABLE IF EXISTS core_damage_types;
CREATE TABLE core_damage_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL UNIQUE
);

-- 7. Idiomas
DROP TABLE IF EXISTS core_languages;
CREATE TABLE core_languages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT NOT NULL CHECK(type IN ('standard','exotic','rare','secret')),
    description TEXT,
    book_id INTEGER,
    page INTEGER,
    script TEXT,
    typical_speakers_json TEXT,
    entries_json TEXT,
    has_fluff_images INTEGER DEFAULT 0,
    UNIQUE(name, book_id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- 8. Progressão de Nível
DROP TABLE IF EXISTS core_level_xp;
CREATE TABLE core_level_xp (
    level INTEGER PRIMARY KEY,
    xp_required INTEGER NOT NULL
);

-- 9. Moedas e Medidas
DROP TABLE IF EXISTS core_currency_types;
CREATE TABLE core_currency_types (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    conversion_rate INTEGER NOT NULL
);

DROP TABLE IF EXISTS core_measurement_units;
CREATE TABLE core_measurement_units (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL
);

-- 10. Condições e Efeitos (Relacionadas)

DROP TABLE IF EXISTS core_conditions;
CREATE TABLE core_conditions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    book_id INTEGER,
    page INTEGER,
    entries_json TEXT,
    has_fluff_images INTEGER DEFAULT 0,
    is_disease INTEGER DEFAULT 0,
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

DROP TABLE IF EXISTS core_condition_effects;
CREATE TABLE core_condition_effects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    condition_id INTEGER NOT NULL,
    effect_description TEXT NOT NULL,
    FOREIGN KEY (condition_id) REFERENCES core_conditions(id)
);

-- 11. Perícias (Depende de Atributos)
DROP TABLE IF EXISTS core_skills;
CREATE TABLE core_skills (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    attribute_id INTEGER NOT NULL,
    source TEXT,
    raw_source TEXT,
    book_id INTEGER,
    book_source_id INTEGER,
    page INTEGER,
    ability_abbr TEXT,
    description TEXT,
    entries_json TEXT,
    srd INTEGER DEFAULT 0,
    basic_rules INTEGER DEFAULT 0,
    FOREIGN KEY (attribute_id) REFERENCES core_attributes(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id),
    FOREIGN KEY (book_source_id) REFERENCES core_book_sources(id)
);

CREATE INDEX IF NOT EXISTS idx_core_languages_book_id ON core_languages(book_id);
CREATE INDEX IF NOT EXISTS idx_core_conditions_book_id ON core_conditions(book_id);
CREATE INDEX IF NOT EXISTS idx_core_skills_book_id ON core_skills(book_id);