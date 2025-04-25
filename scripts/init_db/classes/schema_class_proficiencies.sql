DROP TABLE IF EXISTS class_proficiencies;

CREATE TABLE class_proficiencies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    category TEXT,
    value TEXT,
    FOREIGN KEY (class_id) REFERENCES classes(id)
);
