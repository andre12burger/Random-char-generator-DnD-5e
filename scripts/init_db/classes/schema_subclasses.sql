DROP TABLE IF EXISTS subclasses;

CREATE TABLE subclasses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    name TEXT,
    source TEXT,
    url TEXT,
    FOREIGN KEY (class_id) REFERENCES classes(id)
);
