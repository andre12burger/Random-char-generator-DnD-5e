-- ================================================================================================
-- TOOLS XGE SKILLS ADVANTAGES - Implementação Completa
-- ================================================================================================
-- Todas as vantagens de skills do Xanathar's Guide to Everything para tools

-- Limpar dados existentes para recriação completa
DELETE FROM item_tool_skill_advantages;

-- ================================================================================================
-- ARTISAN'S TOOLS - SKILLS ADVANTAGES
-- ================================================================================================

-- Alchemist's Supplies
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Alchemist''s supplies'), 5, 'Proficiency with alchemist''s supplies allows you to unlock more information on Arcana checks involving potions and similar materials.'),
((SELECT tool_id FROM item_tools WHERE name = 'Alchemist''s supplies'), 7, 'When you inspect an area for clues, proficiency with alchemist''s supplies grants additional insight into any chemicals or other substances that might have been used in the area.');

-- Brewer's Supplies
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Brewer''s supplies'), 6, 'Proficiency with brewer''s supplies gives you additional insight on Intelligence (History) checks concerning events that involve alcohol as a significant element.'),
((SELECT tool_id FROM item_tools WHERE name = 'Brewer''s supplies'), 12, 'This tool proficiency grants additional insight when you treat anyone suffering from alcohol poisoning or when you can use alcohol to dull pain.'),
((SELECT tool_id FROM item_tools WHERE name = 'Brewer''s supplies'), 18, 'A stiff drink can help soften the hardest heart. Your proficiency with brewer''s supplies can help you ply someone with drink, giving them just enough alcohol to mellow their mood.');

-- Calligrapher's Supplies
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Calligrapher''s supplies'), 5, 'Although calligraphy is of little help in deciphering the content of magical writings, proficiency with these supplies can aid in identifying who wrote a script of a magical nature.'),
((SELECT tool_id FROM item_tools WHERE name = 'Calligrapher''s supplies'), 6, 'This tool proficiency can augment the benefit of successful checks made to analyze or investigate ancient writings, scrolls, or other texts, including runes etched in stone or messages in frescoes or other displays.');

-- Carpenter's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Carpenter''s tools'), 6, 'This tool proficiency aids you in identifying the use and the origin of wooden buildings and other large wooden objects.'),
((SELECT tool_id FROM item_tools WHERE name = 'Carpenter''s tools'), 7, 'You gain additional insight when inspecting areas within wooden structures, because you know tricks of construction that can conceal areas from discovery.'),
((SELECT tool_id FROM item_tools WHERE name = 'Carpenter''s tools'), 13, 'You can spot irregularities in wooden walls or floors, making it easier to find trap doors and secret passages.'),
((SELECT tool_id FROM item_tools WHERE name = 'Carpenter''s tools'), 4, 'You can quickly assess the weak spots in a wooden floor, making it easier to avoid the places that creak and groan when they''re stepped on.');

-- Cobbler's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Cobbler''s tools'), 5, 'Your knowledge of shoes aids you in identifying the magical properties of enchanted boots or the history of such items.'),
((SELECT tool_id FROM item_tools WHERE name = 'Cobbler''s tools'), 6, 'Your knowledge of shoes aids you in identifying the magical properties of enchanted boots or the history of such items.'),
((SELECT tool_id FROM item_tools WHERE name = 'Cobbler''s tools'), 7, 'Footwear holds a surprising number of secrets. You can learn where someone has recently visited by examining the wear and the dirt that has accumulated on their shoes.');

-- Cook's Utensils
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Cook''s utensils'), 6, 'Your knowledge of cooking techniques allows you to assess the social patterns involved in a culture''s eating habits.'),
((SELECT tool_id FROM item_tools WHERE name = 'Cook''s utensils'), 12, 'When administering treatment, you can transform medicine that is bitter or sour into a pleasing concoction.'),
((SELECT tool_id FROM item_tools WHERE name = 'Cook''s utensils'), 14, 'When foraging for food, you can make do with ingredients you scavenge that others would be unable to transform into nourishing meals.');

-- Glassblower's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Glassblower''s tools'), 5, 'Your knowledge of glassmaking techniques aids you when you examine glass objects, such as potion bottles or glass items found in a treasure hoard.'),
((SELECT tool_id FROM item_tools WHERE name = 'Glassblower''s tools'), 6, 'Your knowledge of glassmaking techniques aids you when you examine glass objects, such as potion bottles or glass items found in a treasure hoard.'),
((SELECT tool_id FROM item_tools WHERE name = 'Glassblower''s tools'), 7, 'When you study an area, your knowledge can aid you if the clues include broken glass or glass objects.');

-- Jeweler's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Jeweler''s tools'), 5, 'Proficiency with jeweler''s tools grants you knowledge about the reputed mystical uses of gems. This insight proves handy when you make Arcana checks related to gems or gem-encrusted items.'),
((SELECT tool_id FROM item_tools WHERE name = 'Jeweler''s tools'), 7, 'When you inspect jeweled objects, your proficiency with jeweler''s tools aids you in picking out clues they might hold.');

-- Leatherworker's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Leatherworker''s tools'), 5, 'Your expertise in working with leather grants you added insight when you inspect magic items crafted from leather, such as boots and some cloaks.'),
((SELECT tool_id FROM item_tools WHERE name = 'Leatherworker''s tools'), 7, 'You gain added insight when studying leather items or clues related to them, as you draw on your knowledge of leather to pick out details that others would overlook.');

-- Mason's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Mason''s tools'), 6, 'Your expertise aids you in identifying a stone building''s date of construction and purpose, along with insight into who might have built it.'),
((SELECT tool_id FROM item_tools WHERE name = 'Mason''s tools'), 7, 'You gain additional insight when inspecting areas within stone structures.'),
((SELECT tool_id FROM item_tools WHERE name = 'Mason''s tools'), 13, 'You can spot irregularities in stone walls or floors, making it easier to find trap doors and secret passages.');

-- Painter's Supplies
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Painter''s supplies'), 5, 'Your expertise aids you in uncovering lore of any sort that is attached to a work of art, such as the magical properties of a painting or the origins of a strange mural found in a dungeon.'),
((SELECT tool_id FROM item_tools WHERE name = 'Painter''s supplies'), 6, 'Your expertise aids you in uncovering lore of any sort that is attached to a work of art, such as the magical properties of a painting or the origins of a strange mural found in a dungeon.'),
((SELECT tool_id FROM item_tools WHERE name = 'Painter''s supplies'), 9, 'Your expertise aids you in uncovering lore of any sort that is attached to a work of art, such as the magical properties of a painting or the origins of a strange mural found in a dungeon.'),
((SELECT tool_id FROM item_tools WHERE name = 'Painter''s supplies'), 7, 'When you inspect a painting or a similar work of visual art, your knowledge of the practices behind creating it can grant you additional insight.'),
((SELECT tool_id FROM item_tools WHERE name = 'Painter''s supplies'), 13, 'When you inspect a painting or a similar work of visual art, your knowledge of the practices behind creating it can grant you additional insight.');

-- Potter's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Potter''s tools'), 6, 'Your expertise aids you in identifying ceramic objects, including when they were created and their likely place or culture of origin.'),
((SELECT tool_id FROM item_tools WHERE name = 'Potter''s tools'), 7, 'You gain additional insight when inspecting ceramics, uncovering clues others would overlook by spotting minor irregularities.'),
((SELECT tool_id FROM item_tools WHERE name = 'Potter''s tools'), 13, 'You gain additional insight when inspecting ceramics, uncovering clues others would overlook by spotting minor irregularities.');

-- Smith's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Smith''s tools'), 5, 'Your expertise lends you additional insight when examining metal objects, such as weapons.'),
((SELECT tool_id FROM item_tools WHERE name = 'Smith''s tools'), 6, 'Your expertise lends you additional insight when examining metal objects, such as weapons.'),
((SELECT tool_id FROM item_tools WHERE name = 'Smith''s tools'), 7, 'You can spot clues and make deductions that others might overlook when an investigation involves armor, weapons, or other metalwork.');

-- Tinker's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Tinker''s tools'), 6, 'You can determine the age and origin of objects, even if you have only a few pieces remaining from the original.'),
((SELECT tool_id FROM item_tools WHERE name = 'Tinker''s tools'), 7, 'When you inspect a damaged object, you gain knowledge of how it was damaged and how long ago.');

-- Weaver's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Weaver''s tools'), 5, 'Your expertise lends you additional insight when examining cloth objects, including cloaks and robes.'),
((SELECT tool_id FROM item_tools WHERE name = 'Weaver''s tools'), 6, 'Your expertise lends you additional insight when examining cloth objects, including cloaks and robes.'),
((SELECT tool_id FROM item_tools WHERE name = 'Weaver''s tools'), 7, 'Using your knowledge of the process of creating cloth objects, you can spot clues and make deductions that others would overlook when you examine tapestries, upholstery, clothing, and other woven items.');

-- Woodcarver's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Woodcarver''s tools'), 5, 'Your expertise lends you additional insight when you examine wooden objects, such as figurines or arrows.'),
((SELECT tool_id FROM item_tools WHERE name = 'Woodcarver''s tools'), 6, 'Your expertise lends you additional insight when you examine wooden objects, such as figurines or arrows.'),
((SELECT tool_id FROM item_tools WHERE name = 'Woodcarver''s tools'), 8, 'Your knowledge of wooden objects gives you some added insight when you examine trees.');

-- ================================================================================================
-- MISCELLANEOUS TOOLS - SKILLS ADVANTAGES
-- ================================================================================================

-- Disguise Kit
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Disguise kit'), 15, 'In certain cases, a disguise can improve your ability to weave convincing lies.'),
((SELECT tool_id FROM item_tools WHERE name = 'Disguise kit'), 16, 'The right disguise can make you look more fearsome, whether you want to scare someone away by posing as a plague victim or intimidate a gang of thugs by taking the appearance of a bully.'),
((SELECT tool_id FROM item_tools WHERE name = 'Disguise kit'), 17, 'A cunning disguise can enhance an audience''s enjoyment of a performance, provided the disguise is properly designed to evoke the desired reaction.'),
((SELECT tool_id FROM item_tools WHERE name = 'Disguise kit'), 18, 'Folk tend to trust a person in uniform. If you disguise yourself as an authority figure, your efforts to persuade others are often more effective.');

-- Forgery Kit
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Forgery kit'), 5, 'A forgery kit can be used in conjunction with the Arcana skill to determine if a magic item is real or fake.'),
((SELECT tool_id FROM item_tools WHERE name = 'Forgery kit'), 15, 'A well-crafted forgery, such as papers proclaiming you to be a noble or a writ that grants you safe passage, can lend credence to a lie.'),
((SELECT tool_id FROM item_tools WHERE name = 'Forgery kit'), 6, 'A forgery kit combined with your knowledge of history improves your ability to create fake historical documents or to tell if an old document is authentic.'),
((SELECT tool_id FROM item_tools WHERE name = 'Forgery kit'), 7, 'When you examine objects, proficiency with a forgery kit is useful for determining how an object was made and whether it is genuine.');

-- Herbalism Kit
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Herbalism kit'), 5, 'Your knowledge of the nature and uses of herbs can add insight to your magical studies that deal with plants and your attempts to identify potions.'),
((SELECT tool_id FROM item_tools WHERE name = 'Herbalism kit'), 7, 'When you inspect an area overgrown with plants, your proficiency can help you pick out details and clues that others might miss.'),
((SELECT tool_id FROM item_tools WHERE name = 'Herbalism kit'), 12, 'Your mastery of herbalism improves your ability to treat illnesses and wounds by augmenting your methods of care with medicinal plants.'),
((SELECT tool_id FROM item_tools WHERE name = 'Herbalism kit'), 8, 'When you travel in the wild, your skill in herbalism makes it easier to identify plants and spot sources of food that others might overlook.'),
((SELECT tool_id FROM item_tools WHERE name = 'Herbalism kit'), 14, 'When you travel in the wild, your skill in herbalism makes it easier to identify plants and spot sources of food that others might overlook.');

-- Navigator's Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Navigator''s tools'), 14, 'Knowledge of navigator''s tools helps you avoid becoming lost and also grants you insight into the most likely location for roads and settlements.');

-- Poisoner's Kit
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Poisoner''s kit'), 6, 'Your training with poisons can help you when you try to recall facts about infamous poisonings.'),
((SELECT tool_id FROM item_tools WHERE name = 'Poisoner''s kit'), 7, 'Your knowledge of poisons has taught you to handle those substances carefully, giving you an edge when you inspect poisoned objects or try to extract clues from events that involve poison.'),
((SELECT tool_id FROM item_tools WHERE name = 'Poisoner''s kit'), 13, 'Your knowledge of poisons has taught you to handle those substances carefully, giving you an edge when you inspect poisoned objects or try to extract clues from events that involve poison.'),
((SELECT tool_id FROM item_tools WHERE name = 'Poisoner''s kit'), 12, 'When you treat the victim of a poison, your knowledge grants you added insight into how to provide the best care to your patient.'),
((SELECT tool_id FROM item_tools WHERE name = 'Poisoner''s kit'), 8, 'Working with poisons enables you to acquire lore about which plants and animals are poisonous.'),
((SELECT tool_id FROM item_tools WHERE name = 'Poisoner''s kit'), 14, 'Working with poisons enables you to acquire lore about which plants and animals are poisonous.');

-- Thieves' Tools
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) VALUES
((SELECT tool_id FROM item_tools WHERE name = 'Thieves'' tools'), 6, 'Your knowledge of traps grants you insight when answering questions about locations that are renowned for their traps.'),
((SELECT tool_id FROM item_tools WHERE name = 'Thieves'' tools'), 7, 'You gain additional insight when looking for traps, because you have learned a variety of common signs that betray their presence.'),
((SELECT tool_id FROM item_tools WHERE name = 'Thieves'' tools'), 13, 'You gain additional insight when looking for traps, because you have learned a variety of common signs that betray their presence.');

-- ================================================================================================
-- GAMING SETS - SKILLS ADVANTAGES
-- ================================================================================================

-- Gaming Sets (aplicar para todos os 4 gaming sets)
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) 
SELECT t.tool_id, 6, 'Your mastery of a game includes knowledge of its history, as well as of important events it was connected to or prominent historical figures involved with it.'
FROM item_tools t 
JOIN item_tool_categories tc ON t.category_id = tc.category_id
WHERE tc.name = 'Gaming Set';

INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) 
SELECT t.tool_id, 11, 'Playing games with someone is a good way to gain understanding of their personality, granting you a better ability to discern their lies from their truths and read their mood.'
FROM item_tools t 
JOIN item_tool_categories tc ON t.category_id = tc.category_id
WHERE tc.name = 'Gaming Set';

INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) 
SELECT t.tool_id, 3, 'Sleight of Hand is a useful skill for cheating at a game, as it allows you to swap pieces, palm cards, or alter a die roll. Alternatively, engrossing a target in a game by manipulating the components with dexterous movements is a great distraction for a pickpocketing attempt.'
FROM item_tools t 
JOIN item_tool_categories tc ON t.category_id = tc.category_id
WHERE tc.name = 'Gaming Set';

-- ================================================================================================
-- MUSICAL INSTRUMENTS - SKILLS ADVANTAGES
-- ================================================================================================

-- Musical Instruments (aplicar para todos os 10 instrumentos)
INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) 
SELECT t.tool_id, 6, 'Your expertise aids you in recalling lore related to your instrument.'
FROM item_tools t 
JOIN item_tool_categories tc ON t.category_id = tc.category_id
WHERE tc.name = 'Musical Instrument';

INSERT INTO item_tool_skill_advantages (tool_id, skill_id, advantage_description) 
SELECT t.tool_id, 17, 'Your ability to put on a good show is improved when you incorporate an instrument into your act.'
FROM item_tools t 
JOIN item_tool_categories tc ON t.category_id = tc.category_id
WHERE tc.name = 'Musical Instrument';
