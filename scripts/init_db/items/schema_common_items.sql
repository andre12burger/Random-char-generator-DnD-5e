-- ================================================================================================
-- SISTEMA DE COMMON ITEMS - D&D 5e (SIMPLIFICADO)
-- ================================================================================================

-- Drop da tabela existente para recriação
DROP TABLE IF EXISTS item_common_items;

-- Tabela principal de common items (estrutura simples baseada no HTML)
CREATE TABLE item_common_items (
    common_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    item_id INTEGER NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    cost_currency_id INTEGER NOT NULL,
    weight DECIMAL(10,2),
    weight_unit_id INTEGER,
    description TEXT,
    book_id INTEGER NOT NULL,
    
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- Índices para performance
CREATE INDEX IF NOT EXISTS idx_common_items_item ON item_common_items(item_id);

-- ================================================================================================
-- DADOS: COMMON ITEMS (baseado no HTML original)
-- ================================================================================================

-- item_id = 17 (common-items), cost_currency_id = 1 (cp), 2 (sp), 4 (gp), weight_unit_id = 1 (lb), book_id = 2 (PHB), 41 (Dragonlance)
INSERT INTO item_common_items (name, item_id, cost, cost_currency_id, weight, weight_unit_id, description, book_id) VALUES
('Bell', 17, 1.00, 4, 0.0, 1, NULL, 2),
('Blanket', 17, 5.00, 2, 3.0, 1, NULL, 2),
('Block and Tackle', 17, 1.00, 4, 5.0, 1, 'A set of pulleys with a cable threaded through them and a hook to attach to objects, a block and tackle allows you to hoist up to four times the weight you can normally lift.', 2),
('Book', 17, 25.00, 4, 5.0, 1, NULL, 2),
('Candle', 17, 1.00, 1, 0.0, 1, 'For 1 hour, a candle sheds bright light in a 5-foot radius and dim light for another 5 feet.', 2),
('Chain (10 ft)', 17, 5.00, 4, 10.0, 1, 'A chain has 10 hit points. It can be burst with a successful DC 20 Strength check.', 2),
('Chalk (1 pc)', 17, 1.00, 1, 0.0, 1, NULL, 2),
('Component Pouch', 17, 25.00, 4, 2.0, 1, NULL, 2),
('Crowbar', 17, 2.00, 4, 5.0, 1, 'Using a crowbar grants advantage to Strength checks where the crowbar''s leverage can be applied.', 2),
('Fishing Tackle', 17, 1.00, 4, 4.0, 1, NULL, 2),
('Grappling Hook', 17, 2.00, 4, 4.0, 1, NULL, 2),
('Hammer', 17, 1.00, 4, 3.0, 1, NULL, 2),
('Hourglass', 17, 25.00, 4, 1.0, 1, NULL, 2),
('Ink (1 oz)', 17, 10.00, 4, 0.0, 1, NULL, 2),
('Ink Pen', 17, 2.00, 1, 0.0, 1, NULL, 2),
('Ladder (10 ft)', 17, 1.00, 2, 25.0, 1, NULL, 2),
('Lock', 17, 10.00, 4, 1.0, 1, 'A key is provided with the lock. Without the key, a creature proficient with thieves'' tools can pick this lock with a successful DC 15 Dexterity check. Your DM may decide that better locks are available for higher prices.', 2),
('Magnifying Glass', 17, 100.00, 4, 0.0, 1, 'This lens allows a closer look at small objects. It is also useful as a substitute or flint and steel when starting fires. Lighting a fire with a magnifying glass requires light as bright as sunlight to focus, tinder to ignite, and about 5 minutes for the fire to ignite. A magnifying glass grants advantage on any ability check made to appraise or inspect an item that is small or highly detailed.', 2),
('Manacles', 17, 2.00, 4, 6.0, 1, 'These metal restraints can bind a Small or Medium creature. Escaping the manacles requires a successful DC 20 Dexterity check. Breaking them requires a successful DC 20 Strength check. Each set of manacles comes with one key. Without the key, a creature proficient with thieves'' tools can pick the manacles'' lock with a successful DC 15 Dexterity check. Manacles have 15 hit points.', 2),
('Mess Kit', 17, 2.00, 2, 1.0, 1, 'This tin box contains a cup and simple cutlery. The box clamps together, and one side can be used as a cooking pan and the other as a plate or shallow bowl.', 2),
('Oil (flask)', 17, 1.00, 2, 1.0, 1, 'Oil usually comes in a clay flask that holds 1 pint. As an action, you can splash the oil in this flask onto a creature within 5 feet of you or throw it up to 20 feet, shattering it on impact. Make a ranged attack against a target creature or object, treating the oil as an improvised weapon. On a hit, the target is covered in oil. If the target takes any fire damage before the oil dries (after 1 minute), the target takes an additional 5 fire damage from the burning oil. You can also pour a flask of oil on the ground to cover a 5-foot-square area, provided that the surface is level. If lit, the oil burns for 2 rounds and deals 5 fire damage to any creature that enters the area or ends its turn in the area. A creature can take this damage only once per turn.', 2),
('Paper (1 sheet)', 17, 2.00, 2, 0.0, 1, NULL, 2),
('Parchment (1 sheet)', 17, 1.00, 2, 0.0, 1, NULL, 2),
('Perfume (vial)', 17, 5.00, 4, 0.0, 1, NULL, 2),
('Piton', 17, 5.00, 1, 0.25, 1, NULL, 2),
('Pole (10 ft)', 17, 5.00, 1, 7.0, 1, NULL, 2),
('Ram, Portable', 17, 4.00, 4, 35.0, 1, NULL, 2),
('Rations (1 day)', 17, 5.00, 2, 2.0, 1, NULL, 2),
('Rope, Hemp (50 ft)', 17, 1.00, 4, 10.0, 1, 'Rope, whether made of hemp or silk, has 2 hit points and can be burst with a DC 17 Strength check.', 2),
('Rope, Silk (50 ft)', 17, 10.00, 4, 5.0, 1, 'Rope, whether made of hemp or silk, has 2 hit points and can be burst with a DC 17 Strength check.', 2),
('Sealing Wax', 17, 5.00, 2, 0.0, 1, NULL, 2),
('Shovel', 17, 2.00, 4, 5.0, 1, NULL, 2),
('Signal Whistle', 17, 5.00, 1, 0.0, 1, NULL, 2),
('Soap', 17, 2.00, 1, 0.0, 1, NULL, 2),
('Spyglass', 17, 1000.00, 4, 1.0, 1, NULL, 2),
('Tent, Two-person', 17, 2.00, 4, 20.0, 1, NULL, 2),
('Tinderbox', 17, 5.00, 2, 1.0, 1, 'This small container holds flint, fire steel, an tinder (usually dry cloth soaked in light oil) used to kindle a fire. Using it to light a torch — or anything else with abundant, exposed fuel — takes an action. Lighting any other fire takes 1 minutes.', 2),
('Torch', 17, 1.00, 1, 1.0, 1, 'A torch burns for 1 hour, providing bright light in a 20-foot radius and dim light for an additional 20 feet. If you make a melee attack with a burning torch and hit, it deals 1 fire damage.', 2),
('Whetstone', 17, 1.00, 1, 1.0, 1, NULL, 2),
-- Item Dragonlance (sem custo definido, usando 0)
('Fargab', 17, 0.00, 4, 0.0, 1, 'These backpack-sized devices are created in pairs, with matching numbers engraved on them, and allow communication over a long distance using radio frequencies. While wearing a fargab, you can use an action to speak into the device''s mouthpiece and send a short message of twenty-five words or less to another creature wearing the matched fargab while it is within 18 miles of you. The message emits from the speakers of the device and can be heard up to 10 feet away from the device. If no creature is wearing the fargab, the speakers make static noises instead.', 41);
