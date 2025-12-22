DROP TABLE IF EXISTS core_sizes;
CREATE TABLE core_sizes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    code TEXT NOT NULL UNIQUE    -- Abbreviation: T,S,M,L,H,G
);

INSERT INTO core_sizes (name, code) VALUES
('Tiny','T'), 
('Small','S'), 
('Medium','M'), 
('Large','L'), 
('Huge','H'), 
('Gargantuan','G');