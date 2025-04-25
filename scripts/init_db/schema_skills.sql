DROP TABLE IF EXISTS skills;

CREATE TABLE skills (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    attribute_id INTEGER NOT NULL,
    FOREIGN KEY (attribute_id) REFERENCES attributes(id)
);

-- Inserção das skills e associação ao atributo correspondente
-- Atributo STR
INSERT INTO skills (name, attribute_id) VALUES
('Athletics', 1);

-- Atributo DEX
INSERT INTO skills (name, attribute_id) VALUES
('Acrobatics', 2),
('Sleight of Hand', 2),
('Stealth', 2);

-- Atributo INT
INSERT INTO skills (name, attribute_id) VALUES
('Arcana', 4),
('History', 4),
('Investigation', 4),
('Nature', 4),
('Religion', 4);

-- Atributo WIS
INSERT INTO skills (name, attribute_id) VALUES
('Animal Handling', 5),
('Insight', 5),
('Medicine', 5),
('Perception', 5),
('Survival', 5);

-- Atributo CHA
INSERT INTO skills (name, attribute_id) VALUES
('Deception', 6),
('Intimidation', 6),
('Performance', 6),
('Persuasion', 6);
