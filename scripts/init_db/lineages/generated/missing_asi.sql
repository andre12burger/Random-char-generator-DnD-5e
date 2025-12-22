-- ASI FALTANTES
-- Gerado automaticamente a partir do JSON extraído


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your DEX score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'EEPC' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your WIS score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aarakocra' AND l.source_book_id = b.id AND b.code = 'EEPC' AND a.abbreviation = 'WIS';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your CHA score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'CHA';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your WIS score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'WIS';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your CON score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your STR score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aasimar' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'STR';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your INT score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aven' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'INT';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your WIS score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'aven' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'WIS';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your STR score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'STR';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your DEX score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'bugbear' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your STR score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT' AND a.abbreviation = 'STR';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your WIS score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'centaur' AND l.source_book_id = b.id AND b.code = 'MOT' AND a.abbreviation = 'WIS';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'changeling' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your INT score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'EEPC' AND a.abbreviation = 'INT';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your DEX score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'deep-gnome' AND l.source_book_id = b.id AND b.code = 'EEPC' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your CON score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your STR score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'duergar' AND l.source_book_id = b.id AND b.code = 'SCAG' AND a.abbreviation = 'STR';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'eladrin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. Increase one ability score by 2, and increase a different one by 1, or increase three different scores by 1.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'fairy' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your WIS score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'WIS';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your STR score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'firbolg' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'STR';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your CON score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'EEPC' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your DEX score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-air' AND l.source_book_id = b.id AND b.code = 'EEPC' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your CON score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'EEPC' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your STR score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-earth' AND l.source_book_id = b.id AND b.code = 'EEPC' AND a.abbreviation = 'STR';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your CON score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'EEPC' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your INT score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-fire' AND l.source_book_id = b.id AND b.code = 'EEPC' AND a.abbreviation = 'INT';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your WIS score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'genasi-water' AND l.source_book_id = b.id AND b.code = 'EEPC' AND a.abbreviation = 'WIS';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githyanki' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'githzerai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your DEX score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your CON score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goblin' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'goliath' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. Increase one ability score by 2, and increase a different one by 1, or increase three different scores by 1.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'harengon' AND l.source_book_id = b.id AND b.code = 'WBW' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your CON score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your INT score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'hobgoblin' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'INT';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. Increase one ability score by 2, and increase a different one by 1, or increase three different scores by 1.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kender-ua-revised' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kender-ua-revised' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kender-ua-revised' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. Increase one ability score by 2, and increase a different one by 1, or increase three different scores by 1.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kender-ua' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kender-ua' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kender-ua' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. Increase one ability score by 2, and increase a different one by 1, or increase three different scores by 1.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kender' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kender' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kender' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your DEX score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your WIS score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kenku' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'WIS';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your DEX score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'kobold' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your CON score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your WIS score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'lizardfolk' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'WIS';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'minotaur' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your STR score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'STR';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your CON score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your STR score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW' AND a.abbreviation = 'STR';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your CON score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'orc' AND l.source_book_id = b.id AND b.code = 'EGW' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your CHA score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT' AND a.abbreviation = 'CHA';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your DEX score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'satyr' AND l.source_book_id = b.id AND b.code = 'MOT' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'sea-elf' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shadar-kai' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your CON score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your STR score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'STR';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your STR score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'STR';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your DEX score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your DEX score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your CHA score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CHA';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your WIS score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'WIS';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your DEX score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your DEX score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'shifter' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your DEX score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your CHA score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tabaxi' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'CHA';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'tortle' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'triton' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your CON score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'CON';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your STR score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'STR';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your DEX score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'warforged' AND l.source_book_id = b.id AND b.code = 'PHB' AND a.abbreviation = 'DEX';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Ability Score Increase. When determining your character’s ability scores, increase one score by 2 and increase a different score by 1, or increase three different scores by 1. You can''t raise any of your scores above 20.'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';

INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Increase a third different ability score by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'MOOT' AND a.abbreviation = 'CHOICE';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 2, 'Your CHA score increases by 2'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'CHA';


INSERT INTO lineage_ability_score_increases (lineage_id, attribute_id, bonus_value, description)
SELECT l.id, a.id, 1, 'Your INT score increases by 1'
FROM lineages l, core_books b, core_attributes a
WHERE l.slug = 'yuan-ti' AND l.source_book_id = b.id AND b.code = 'VGTM' AND a.abbreviation = 'INT';
