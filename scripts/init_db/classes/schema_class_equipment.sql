DROP TABLE IF EXISTS class_equipment;

CREATE TABLE class_equipment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_id INTEGER NOT NULL,
    item_option TEXT,
    FOREIGN KEY (class_id) REFERENCES classes(id)
);
