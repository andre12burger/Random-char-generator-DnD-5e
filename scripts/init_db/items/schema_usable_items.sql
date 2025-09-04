-- ================================================================================================
-- SISTEMA DE USABLE ITEMS - D&D 5e
-- ================================================================================================

-- Drop da tabela existente para recriação
DROP TABLE IF EXISTS item_usable_items;

-- Tabela de itens utilizáveis
CREATE TABLE item_usable_items (
    usable_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    item_id INTEGER NOT NULL,
    cost DECIMAL(10,2),
    cost_currency_id INTEGER,
    weight DECIMAL(10,2),
    weight_unit_id INTEGER,
    description TEXT,
    book_id INTEGER NOT NULL,
    
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (cost_currency_id) REFERENCES core_currency_types(id),
    FOREIGN KEY (weight_unit_id) REFERENCES core_measurement_units(id),
    FOREIGN KEY (book_id) REFERENCES core_books(id)
);

-- ================================================================================================
-- DADOS DOS USABLE ITEMS - Base HTML
-- ================================================================================================

-- Inserção dos itens utilizáveis baseado no HTML
INSERT INTO item_usable_items (name, item_id, cost, cost_currency_id, weight, weight_unit_id, description, book_id) VALUES
('Acid (vial)', 19, 25.00, 4, 1.0, 1, 'As an action, you can splash the contents of this vial onto a creature within 5 feet of you or throw the vial up to 20 feet, shattering it on impact. In either case, make a ranged attack against a creature or object, treating the acid as an improvised weapon. On a hit, the target takes 2d6 acid damage.', 2),
('Alchemist''s fire (flask)', 19, 50.00, 4, 1.0, 1, 'This sticky, adhesive fluid ignites when exposed to air. As an action, you can throw this flask up to 20 feet, shattering it on impact. Make a ranged attack against a creature or object, treating the alchemist''s fire as an improvised weapon. On a hit, the target takes 1d4 fire damage at the start of each of its turns. A creature can end this damage by using its action to make a DC 10 Dexterity check to extinguish the flames.', 2),
('Antitoxin (vial)', 19, 50.00, 4, NULL, NULL, 'A creature that drinks this vial of liquid gains advantage on saving throws against poison for 1 hour. It confers no benefits to undead or constructs.', 2),
('Ball bearings (bag of 1,000)', 19, 1.00, 4, 2.0, 1, 'As an action, you can spill these tiny balls from their pouch to cover a level area 10 feet square. A creature moving across the covered area must succeed on a DC 10 Dexterity saving throw or fall prone. A creature moving through the area at half speed doesn''t need to make the saving throw.', 2),
('Caltrops (bag of 20)', 19, 1.00, 4, 2.0, 1, 'As an action, you can spread a single bag of caltrops to cover a 5-foot-square area. Any creature that enters the area must succeed on a DC 15 Dexterity saving throw or stop moving and take 1 piercing damage. Until the creature regains at least 1 hit point, its walking speed is reduced by 10 feet. A creature moving through the area at half speed doesn''t need to make the saving throw.', 2),
('Candle', 19, 1.00, 1, NULL, NULL, 'For 1 hour, a candle sheds bright light in a 5-foot radius and dim light for another 5 feet.', 2),
('Chain (10 feet)', 19, 5.00, 4, 10.0, 1, 'A chain has 10 hit points. It can be burst with a successful DC 20 Strength check.', 2),
('Climber''s kit', 19, 25.00, 4, 12.0, 1, 'A climber''s kit includes special pitons, boot tips, gloves, and a harness. You can use the climber''s kit as an action to anchor yourself; when you do, you can''t fall more than 25 feet from the point where you anchored yourself, and you can''t climb more than 25 feet away from that point without undoing the anchor.', 2),
('Healer''s kit', 19, 5.00, 4, 3.0, 1, 'This kit is a leather pouch containing bandages, salves, and splints. The kit has ten uses. As an action, you can expend one use of the kit to stabilize a creature that has 0 hit points, without needing to make a Wisdom (Medicine) check.', 2),
('Holy water (flask)', 19, 25.00, 4, 1.0, 1, 'As an action, you can splash the contents of this flask onto a creature within 5 feet of you or throw it up to 20 feet, shattering it on impact. In either case, make a ranged attack against a target creature, treating the holy water as an improvised weapon. If the target is a fiend or undead, it takes 2d6 radiant damage. A cleric or paladin may create holy water by performing a special ritual. The ritual takes 1 hour to perform, uses 25 gp worth of powdered silver, and requires the caster to expend a 1st-level spell slot.', 2),
('Hunting trap', 19, 5.00, 4, 25.0, 1, 'When you use your action to set it, this trap forms a saw-toothed steel ring that snaps shut when a creature steps on a pressure plate in the center. The trap is affixed by a heavy chain to an immobile object, such as a tree or a spike driven into the ground. A creature that steps on the plate must succeed on a DC 13 Dexterity saving throw or take 1d4 piercing damage and stop moving. Thereafter, until the creature breaks free of the trap, its movement is limited by the length of chain (typically 3 feet long). A creature can use its action to make a DC 13 Strength check, freeing itself or another creature within its reach on a success. Each failed check deals 1 piercing damage to the trapped creature.', 2),
('Oil (flask)', 19, 1.00, 2, 1.0, 1, 'Oil usually comes in a clay flask that holds 1 pint. As an action, you can splash the oil in this flask onto a creature within 5 feet of you or throw it up to 20 feet, shattering it on impact. Make a ranged attack against a target creature or object, treating the oil as an improvised weapon. On a hit, the target is covered in oil. If the target takes any fire damage before the oil dries (after 1 minute), the target takes an additional 5 fire damage from the burning oil. You can also pour a flask of oil on the ground to cover a 5-foot-square area, provided that the surface is level. If lit, the oil burns for 2 rounds and deals 5 fire damage to any creature that enters the area or ends its turn in the area. A creature can take this damage only once per turn.', 2),
('Poison, basic (vial)', 19, 100.00, 4, NULL, NULL, 'You can use the poison in this vial to coat one slashing or piercing weapon or up to three pieces of ammunition. Applying the poison takes an action. A creature hit by the poisoned weapon or ammunition must make a DC 10 Constitution saving throw or take 1d4 poison damage. Once applied, the poison retains potency for 1 minute before drying.', 2),
('Potion of healing', 19, 50.00, 4, 0.5, 1, NULL, 2),
('Rope, hempen (50 feet)', 19, 2.00, 4, 10.0, 1, 'Rope, whether made of hemp or silk, has 2 hit points and can be burst with a DC 17 Strength check.', 2),
('Rope, silk (50 feet)', 19, 10.00, 4, 5.0, 1, 'Rope, whether made of hemp or silk, has 2 hit points and can be burst with a DC 17 Strength check.', 2),
('Thieves'' tools', 19, 25.00, 4, 1.0, 1, NULL, 2),
('Tinderbox', 19, 5.00, 2, 1.0, 1, 'This small container holds flint, fire steel, an tinder (usually dry cloth soaked in light oil) used to kindle a fire. Using it to light a torch — or anything else with abundant, exposed fuel — takes an action. Lighting any other fire takes 1 minutes.', 2),
('Narycrash', 19, NULL, NULL, NULL, NULL, 'This backpack-sized device holds a balloon-based parachute. If you fall while wearing this device, you can use your reaction to deploy the parachute. Once deployed, the parachute rapidly inflates, and you descend 60 feet per round and take no damage from falling. When you are 10 feet away from the ground, roll a d20. If you roll a 5 or less, the parachute gives out, and you begin to fall normally.', 41);
