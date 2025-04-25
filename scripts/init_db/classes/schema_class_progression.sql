DROP TABLE IF EXISTS class_progression;

CREATE TABLE class_progression (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    level INTEGER NOT NULL,
    proficiency_bonus TEXT,
    features TEXT,
    rages TEXT,
    rage_damage TEXT,
    FOREIGN KEY (class_id) REFERENCES classes(id)
);
