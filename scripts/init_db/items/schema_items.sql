-- schema_items.sql

-- Apaga tabelas se existirem
DROP TABLE IF EXISTS core_items;

-- Categorias principais de itens
CREATE TABLE items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,         -- 'armor', 'weapon', 'tool', 'gear', etc
    description TEXT
);

-- Inserir categorias base (12 categorias originais)
INSERT INTO items (name, description) VALUES
('adventuring-gear', 'The starting equipment you get from your class includes a collection of useful adventuring gear, put together in a pack. The contents of these packs are listed here. If you are buying your starting equipment, you can purchase a pack for the price shown, which might be cheaper than buying the items individually.'),
('ammunitions', 'Items used as projectiles for ranged weapons'),
('armor', 'Protective equipment worn to prevent damage'),
('currency', 'The most basic type of treasure is money, including copper pieces (cp), silver pieces (sp), electrum pieces (ep), gold pieces (gp), and platinum pieces (pp). Fifty coins of any type weigh 1 pound.'),
('explosives', 'A campaign might include explosives from the Renaissance or the modern world (the latter are priceless), as presented in the Explosives table.'),
('firearms', 'If you want to model the swashbuckling style of The Three Musketeers and similar tales, you can introduce gunpowder weapons to your campaign that are associated with the Renaissance. Similarly, in a campaign where a spaceship has crashed or elements of modern-day Earth are present, futuristic or modern firearms might appear. The Firearms table provides examples of firearms from all three of those periods. The modern and futuristic items are priceless.'),
('poison', 'Given their insidious and deadly nature, poisons are illegal in most societies but are a favorite tool among assassins, drow, and other evil creatures.'),
('siege-equipment', 'Siege weapons are designed to break through the defenses of castles and other walled fortifications.'),
('tools', 'Items used for various activities and professions'),
('trinkets', 'When you make your character, you can roll once on the Trinkets table to gain a trinket, a simple item lightly touched by mystery.'),
('weapons', 'Items used to deal damage in combat'),
('wondrous-items', 'Wondrous items include worn items such as boots, belts, capes, gloves, and various pieces of jewelry and decoration.'),
('arcane-focus', 'An arcane focus is a special item designed to channel the power of arcane spells. A sorcerer, warlock, or wizard can use such an item as a spellcasting focus.'),
('druid-focus', 'A druid focus is a spellcasting focus for druids. It might be a sprig of mistletoe, a yew wand, a staff, or some other focus.'),
('holy-symbol', 'A holy symbol is a representation of a deity or pantheon. A cleric or paladin can use a holy symbol as a spellcasting focus. To use the symbol in this way, the caster must hold it in hand, wear it visibly, or bear it on a shield.'),
('clothes', 'Clothing and garments worn for protection, comfort, or appearance.'),
('common-items', 'Common everyday items and miscellaneous equipment used in daily life and adventures.'),
('containers', 'Bags, boxes, cases, and other items used to store and transport equipment.'),
('usable-items', 'Items that can be consumed, activated, or used to perform specific functions.');

