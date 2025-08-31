-- Apaga tabelas se existirem
DROP TABLE IF EXISTS class_subclasses;
DROP TABLE IF EXISTS class_equipment;
DROP TABLE IF EXISTS class_proficiency;
DROP TABLE IF EXISTS class_info;
DROP TABLE IF EXISTS class_attributes;
DROP TABLE IF EXISTS classes;

-- Cria tabela de classes
CREATE TABLE classes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    hit_dice TEXT,
    gold TEXT,
    id_info_classe INTEGER,
    id_proficiencia INTEGER,
    id_equipamento INTEGER,
    FOREIGN KEY (id_info_classe) REFERENCES class_info(id),
    FOREIGN KEY (id_proficiencia) REFERENCES class_proficiency(id),
    FOREIGN KEY (id_equipamento) REFERENCES class_equipment(id)
);

-- Cria tabela de atributos mínimos por classe
CREATE TABLE class_attributes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    attribute_id INTEGER NOT NULL,
    min_value INTEGER NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(id),
    FOREIGN KEY (attribute_id) REFERENCES attributes(id)
);

-- Cria tabela de informações adicionais da classe
CREATE TABLE class_info (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    info TEXT NOT NULL
);

-- Cria tabela de proficiências iniciais
CREATE TABLE class_proficiency (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    armors TEXT NOT NULL,
    weapons TEXT NOT NULL,
    tools TEXT NOT NULL
);

-- Cria tabela de equipamentos iniciais
CREATE TABLE class_equipment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    equipment TEXT NOT NULL
);

-- Cria tabela de subclasses
CREATE TABLE class_subclasses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    subclass TEXT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(id)
);
