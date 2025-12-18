DROP TABLE IF EXISTS core_sizes;
CREATE TABLE core_sizes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

INSERT INTO core_sizes (name) VALUES
('Tiny'), 
('Small'), 
('Medium'), 
('Large'), 
('Huge'), 
('Gargantuan');