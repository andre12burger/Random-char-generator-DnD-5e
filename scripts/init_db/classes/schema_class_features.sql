DROP TABLE IF EXISTS class_features;

CREATE TABLE class_features (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    name TEXT,
    level INTEGER,
    description TEXT,
    FOREIGN KEY (class_id) REFERENCES classes(id)
);
