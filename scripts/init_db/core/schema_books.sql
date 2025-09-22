-- schema_books.sql

-- Remove tabelas antigas (sem prefixo)
DROP TABLE IF EXISTS books;

-- Tabela de livros oficiais
DROP TABLE IF EXISTS core_books;

CREATE TABLE core_books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    code TEXT NOT NULL UNIQUE,        -- Código curto do livro (ex: 'PHB', 'DMG', 'XGE')
    name TEXT NOT NULL UNIQUE,        -- Nome completo do livro    
    release_date DATE,                -- Data de lançamento
    publisher TEXT DEFAULT 'Wizards of the Coast'
);

-- Inserção dos livros principais
INSERT OR REPLACE INTO core_books (code, name, release_date) VALUES

('LMP', 'Lost Mine of Phandelver', '2014-07-15'),
('PHB', 'Player''s Handbook', '2014-08-19'),
('MM', 'Monster Manual', '2014-09-30'),
('RoT', 'The Rise of Tiamat', '2014-11-04'),
('DMG', 'Dungeon Master''s Guide', '2014-12-09'),
('PoA', 'Princes of the Apocalypse', '2015-04-07'),
('OoA', 'Out of the Abyss', '2015-09-15'),
('SCAG', 'Sword Coast Adventurer''s Guide', '2015-11-03'),
('CoS', 'Curse of Strahd', '2016-03-15'),
('SKT', 'Storm King''s Thunder', '2016-09-06'),
('VGM', 'Volo''s Guide to Monsters', '2016-11-15'),
('TYP', 'Tales from the Yawning Portal', '2017-04-04'),
('ToA', 'Tomb of Annihilation', '2017-09-19'),
('XGE', 'Xanathar''s Guide to Everything', '2017-11-21'),
('MTF', 'Mordenkainen''s Tome of Foes', '2018-05-29'),
('WGTE', 'Wayfarer''s Guide to Eberron', '2018-07-26'),
('WDH', 'Waterdeep: Dragon Heist', '2018-09-18'),
('LLK', 'Lost Laboratory of Kwalish', '2018-11-10'),
('WDMM', 'Waterdeep: Dungeon of the Mad Mage', '2018-11-20'),
('GoS', 'Ghosts of Saltmarsh', '2019-05-21'),
('AI', 'Acquisitions Incorporated', '2019-06-18'),
('SDW', 'Sleeping Dragon''s Wake', '2019-09-03'),
('DC', 'Divine Contention', '2019-09-03'),
('BG:DA', 'Baldur''s Gate: Descent into Avernus', '2019-09-17'),
('ToD', 'Tyranny of Dragons', '2019-10-22'),
('IMR', 'Infernal Machine Rebuild', '2019-11-12'),
('E:RLW', 'Eberron: Rising from the Last War', '2019-11-19'),
('EGW', 'Explorer''s Guide to Wildemount', '2020-03-17'),
('MOT', 'Mythic Odysseys of Theros', '2020-06-02'),
('ID:RF', 'Icewind Dale: Rime of the Frostmaiden', '2020-09-15'),
('TCE', 'Tasha''s Cauldron of Everything', '2020-11-17'),
('CM', 'Candlekeep Mysteries', '2021-03-16'),
('VRGR', 'Van Richten''s Guide to Ravenloft', '2021-05-18'),
('WBW', 'The Wild Beyond the Witchlight', '2021-09-21'),
('FTD', 'Fizban''s Treasury of Dragons', '2021-10-26'),
('SCC', 'Strixhaven: A Curriculum of Chaos', '2021-12-07'),
('CR:CN', 'Critical Role: Call of the Netherdeep', '2022-03-15'),
('JRC', 'Journeys through the Radiant Citadel', '2022-07-19'),
('SAS', 'Spelljammer: Adventures in Space', '2022-08-16'),
('MCV2', 'Monstrous Compendium Volume 2 - Dragonlance Creatures', '2022-12-05'),
('D:SDQ', 'Dragonlance: Shadow of the Dragon Queen', '2022-12-06'),
('KGV', 'Keys from the Golden Vault', '2023-02-21'),
('HAT', 'Dungeons and Dragons: Honor Among Thieves', '2023-03-31'),
('BP:GOG', 'Bigby Presents: Glory of the Giants', '2023-08-15'),
('PBTSO', 'Phandelver and Below: The Shattered Obelisk', '2023-09-19'),
('PS:AiM', 'Planescape: Adventures in the Multiverse', '2023-10-17'),
('BOMT', 'The Book of Many Things', '2023-11-14'),
('VEOR', 'Vecna: Eve of Ruin', '2024-05-21'),
('QIS', 'Quests from the Infinite Staircase', '2024-07-16'),
('DDB', 'Dungeons & Dragons Beyound', '2020-04-09'),
('BPTG', 'Bigby Presents - Glory of the Giants', '2023-08-15'),
('GGR', 'Guildmaster''s Guide to Ravnica', '2018-11-20'),
('UA', 'Unearthed Arcana', NULL);

