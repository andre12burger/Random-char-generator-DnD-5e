DROP TABLE IF EXISTS classes;

CREATE TABLE classes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    min_attribute TEXT,
    hit_dice TEXT
);