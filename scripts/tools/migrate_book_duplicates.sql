-- Generated migration to merge duplicate core_books into canonical ones
BEGIN TRANSACTION;
-- Backup note: ensure a DB backup exists before running this script.
-- Merging PS:Z2 -> PS:Z  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PS:Z2') WHERE code='PS:Z' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PS:Z') WHERE book_id = (SELECT id FROM core_books WHERE code='PS:Z2');
DELETE FROM core_books WHERE code = 'PS:Z2';
-- Merging PS:K2 -> PS:K  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PS:K2') WHERE code='PS:K' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PS:K') WHERE book_id = (SELECT id FROM core_books WHERE code='PS:K2');
DELETE FROM core_books WHERE code = 'PS:K2';
-- Merging PS:I2 -> PS:I  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PS:I2') WHERE code='PS:I' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PS:I') WHERE book_id = (SELECT id FROM core_books WHERE code='PS:I2');
DELETE FROM core_books WHERE code = 'PS:I2';
-- Merging PS:A2 -> PS:A  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PS:A2') WHERE code='PS:A' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PS:A') WHERE book_id = (SELECT id FROM core_books WHERE code='PS:A2');
DELETE FROM core_books WHERE code = 'PS:A2';
-- Merging PS:D2 -> PS:D  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PS:D2') WHERE code='PS:D' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PS:D') WHERE book_id = (SELECT id FROM core_books WHERE code='PS:D2');
DELETE FROM core_books WHERE code = 'PS:D2';
-- Merging AWM3 -> AWM  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='AWM3') WHERE code='AWM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='AWM') WHERE book_id = (SELECT id FROM core_books WHERE code='AWM3');
DELETE FROM core_books WHERE code = 'AWM3';
-- Merging BG:DA3 -> BG:DA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='BG:DA3') WHERE code='BG:DA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='BG:DA') WHERE book_id = (SELECT id FROM core_books WHERE code='BG:DA3');
DELETE FROM core_books WHERE code = 'BG:DA3';
-- Merging UA12 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA12') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA12');
DELETE FROM core_books WHERE code = 'UA12';
-- Merging UA22 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA22') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA22');
DELETE FROM core_books WHERE code = 'UA22';
-- Merging UA19 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA19') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA19');
DELETE FROM core_books WHERE code = 'UA19';
-- Merging UA53 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA53') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA53');
DELETE FROM core_books WHERE code = 'UA53';
-- Merging DM4 -> DM  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DM4') WHERE code='DM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DM') WHERE book_id = (SELECT id FROM core_books WHERE code='DM4');
DELETE FROM core_books WHERE code = 'DM4';
-- Merging DC3 -> DC  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DC3') WHERE code='DC' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DC') WHERE book_id = (SELECT id FROM core_books WHERE code='DC3');
DELETE FROM core_books WHERE code = 'DC3';
-- Merging SDW3 -> SDW  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='SDW3') WHERE code='SDW' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='SDW') WHERE book_id = (SELECT id FROM core_books WHERE code='SDW3');
DELETE FROM core_books WHERE code = 'SDW3';
-- Merging EEPC3 -> EEPC  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='EEPC3') WHERE code='EEPC' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='EEPC') WHERE book_id = (SELECT id FROM core_books WHERE code='EEPC3');
DELETE FROM core_books WHERE code = 'EEPC3';
-- Merging GGR3 -> GGR  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='GGR3') WHERE code='GGR' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='GGR') WHERE book_id = (SELECT id FROM core_books WHERE code='GGR3');
DELETE FROM core_books WHERE code = 'GGR3';
-- Merging LR2 -> LR  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='LR2') WHERE code='LR' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='LR') WHERE book_id = (SELECT id FROM core_books WHERE code='LR2');
DELETE FROM core_books WHERE code = 'LR2';
-- Merging MM4 -> MM  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='MM4') WHERE code='MM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='MM') WHERE book_id = (SELECT id FROM core_books WHERE code='MM4');
DELETE FROM core_books WHERE code = 'MM4';
-- Merging OGA2 -> OGA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='OGA2') WHERE code='OGA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='OGA') WHERE book_id = (SELECT id FROM core_books WHERE code='OGA2');
DELETE FROM core_books WHERE code = 'OGA2';
-- Merging SAS4 -> SAS  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='SAS4') WHERE code='SAS' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='SAS') WHERE book_id = (SELECT id FROM core_books WHERE code='SAS4');
DELETE FROM core_books WHERE code = 'SAS4';
-- Merging SAS5 -> SAS  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='SAS5') WHERE code='SAS' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='SAS') WHERE book_id = (SELECT id FROM core_books WHERE code='SAS5');
DELETE FROM core_books WHERE code = 'SAS5';
-- Merging DM3 -> DM  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DM3') WHERE code='DM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DM') WHERE book_id = (SELECT id FROM core_books WHERE code='DM3');
DELETE FROM core_books WHERE code = 'DM3';
-- Merging TPJTCU3 -> TPJTCU  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='TPJTCU3') WHERE code='TPJTCU' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='TPJTCU') WHERE book_id = (SELECT id FROM core_books WHERE code='TPJTCU3');
DELETE FROM core_books WHERE code = 'TPJTCU3';
-- Merging UA58 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA58') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA58');
DELETE FROM core_books WHERE code = 'UA58';
-- Merging UA7 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA7') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA7');
DELETE FROM core_books WHERE code = 'UA7';
-- Merging UA63 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA63') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA63');
DELETE FROM core_books WHERE code = 'UA63';
-- Merging UA33 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA33') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA33');
DELETE FROM core_books WHERE code = 'UA33';
-- Merging UA10 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA10') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA10');
DELETE FROM core_books WHERE code = 'UA10';
-- Merging UA23 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA23') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA23');
DELETE FROM core_books WHERE code = 'UA23';
-- Merging UA21 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA21') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA21');
DELETE FROM core_books WHERE code = 'UA21';
-- Merging UA42 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA42') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA42');
DELETE FROM core_books WHERE code = 'UA42';
-- Merging UA8 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA8') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA8');
DELETE FROM core_books WHERE code = 'UA8';
-- Merging UA6 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA6') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA6');
DELETE FROM core_books WHERE code = 'UA6';
-- Merging UA43 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA43') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA43');
DELETE FROM core_books WHERE code = 'UA43';
-- Merging UA4 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA4') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA4');
DELETE FROM core_books WHERE code = 'UA4';
-- Merging UA2 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA2') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA2');
DELETE FROM core_books WHERE code = 'UA2';
-- Merging UA26 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA26') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA26');
DELETE FROM core_books WHERE code = 'UA26';
-- Merging UA3 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA3') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA3');
DELETE FROM core_books WHERE code = 'UA3';
-- Merging UA13 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA13') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA13');
DELETE FROM core_books WHERE code = 'UA13';
-- Merging UA34 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA34') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA34');
DELETE FROM core_books WHERE code = 'UA34';
-- Merging UA11 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA11') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA11');
DELETE FROM core_books WHERE code = 'UA11';
-- Merging UA30 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA30') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA30');
DELETE FROM core_books WHERE code = 'UA30';
-- Merging UA14 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA14') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA14');
DELETE FROM core_books WHERE code = 'UA14';
-- Merging UA37 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA37') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA37');
DELETE FROM core_books WHERE code = 'UA37';
-- Merging UA55 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA55') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA55');
DELETE FROM core_books WHERE code = 'UA55';
-- Merging UA62 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA62') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA62');
DELETE FROM core_books WHERE code = 'UA62';
-- Merging UA64 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA64') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA64');
DELETE FROM core_books WHERE code = 'UA64';
-- Merging UA54 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA54') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA54');
DELETE FROM core_books WHERE code = 'UA54';
-- Merging UA20 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA20') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA20');
DELETE FROM core_books WHERE code = 'UA20';
-- Merging UA28 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA28') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA28');
DELETE FROM core_books WHERE code = 'UA28';
-- Merging UA48 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA48') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA48');
DELETE FROM core_books WHERE code = 'UA48';
-- Merging UA59 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA59') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA59');
DELETE FROM core_books WHERE code = 'UA59';
-- Merging UA15 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA15') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA15');
DELETE FROM core_books WHERE code = 'UA15';
-- Merging UA32 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA32') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA32');
DELETE FROM core_books WHERE code = 'UA32';
-- Merging UA16 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA16') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA16');
DELETE FROM core_books WHERE code = 'UA16';
-- Merging UA60 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA60') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA60');
DELETE FROM core_books WHERE code = 'UA60';
-- Merging UA18 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA18') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA18');
DELETE FROM core_books WHERE code = 'UA18';
-- Merging UA17 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA17') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA17');
DELETE FROM core_books WHERE code = 'UA17';
-- Merging UA50 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA50') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA50');
DELETE FROM core_books WHERE code = 'UA50';
-- Merging UA29 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA29') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA29');
DELETE FROM core_books WHERE code = 'UA29';
-- Merging UA24 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA24') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA24');
DELETE FROM core_books WHERE code = 'UA24';
-- Merging UA40 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA40') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA40');
DELETE FROM core_books WHERE code = 'UA40';
-- Merging UA66 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA66') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA66');
DELETE FROM core_books WHERE code = 'UA66';
-- Merging UA5 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA5') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA5');
DELETE FROM core_books WHERE code = 'UA5';
-- Merging UA44 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA44') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA44');
DELETE FROM core_books WHERE code = 'UA44';
-- Merging UA56 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA56') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA56');
DELETE FROM core_books WHERE code = 'UA56';
-- Merging UA57 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA57') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA57');
DELETE FROM core_books WHERE code = 'UA57';
-- Merging UA27 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA27') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA27');
DELETE FROM core_books WHERE code = 'UA27';
-- Merging UA31 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA31') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA31');
DELETE FROM core_books WHERE code = 'UA31';
-- Merging UA25 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA25') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA25');
DELETE FROM core_books WHERE code = 'UA25';
-- Merging UA38 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA38') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA38');
DELETE FROM core_books WHERE code = 'UA38';
-- Merging UA47 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA47') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA47');
DELETE FROM core_books WHERE code = 'UA47';
-- Merging UA46 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA46') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA46');
DELETE FROM core_books WHERE code = 'UA46';
-- Merging UA51 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA51') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA51');
DELETE FROM core_books WHERE code = 'UA51';
-- Merging UA35 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA35') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA35');
DELETE FROM core_books WHERE code = 'UA35';
-- Merging UA36 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA36') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA36');
DELETE FROM core_books WHERE code = 'UA36';
-- Merging UA45 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA45') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA45');
DELETE FROM core_books WHERE code = 'UA45';
-- Merging UA41 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA41') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA41');
DELETE FROM core_books WHERE code = 'UA41';
-- Merging UA39 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA39') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA39');
DELETE FROM core_books WHERE code = 'UA39';
-- Merging UA61 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA61') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA61');
DELETE FROM core_books WHERE code = 'UA61';
-- Merging UA9 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA9') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA9');
DELETE FROM core_books WHERE code = 'UA9';
-- Merging UA65 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA65') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA65');
DELETE FROM core_books WHERE code = 'UA65';
-- Merging UA52 -> UA  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA52') WHERE code='UA' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA') WHERE book_id = (SELECT id FROM core_books WHERE code='UA52');
DELETE FROM core_books WHERE code = 'UA52';
-- Merging PHB5 -> PHB  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PHB5') WHERE code='PHB' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PHB') WHERE book_id = (SELECT id FROM core_books WHERE code='PHB5');
DELETE FROM core_books WHERE code = 'PHB5';
-- Merging PHB2 -> PHB  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PHB2') WHERE code='PHB' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PHB') WHERE book_id = (SELECT id FROM core_books WHERE code='PHB2');
DELETE FROM core_books WHERE code = 'PHB2';
-- Merging PHB4 -> PHB  (suffix-code)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PHB4') WHERE code='PHB' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PHB') WHERE book_id = (SELECT id FROM core_books WHERE code='PHB4');
DELETE FROM core_books WHERE code = 'PHB4';
-- Merging RoT -> RoT4  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='RoT') WHERE code='RoT4' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='RoT4') WHERE book_id = (SELECT id FROM core_books WHERE code='RoT');
DELETE FROM core_books WHERE code = 'RoT';
-- Merging RoT2 -> RoT  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='RoT2') WHERE code='RoT' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='RoT') WHERE book_id = (SELECT id FROM core_books WHERE code='RoT2');
DELETE FROM core_books WHERE code = 'RoT2';
-- Merging CoS3 -> CoS  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='CoS3') WHERE code='CoS' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='CoS') WHERE book_id = (SELECT id FROM core_books WHERE code='CoS3');
DELETE FROM core_books WHERE code = 'CoS3';
-- Merging BP:GOG -> BPTG  (norm-equals)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='BP:GOG') WHERE code='BPTG' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='BPTG') WHERE book_id = (SELECT id FROM core_books WHERE code='BP:GOG');
DELETE FROM core_books WHERE code = 'BP:GOG';
-- Merging PS:AiM5 -> PS:AiM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PS:AiM5') WHERE code='PS:AiM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PS:AiM') WHERE book_id = (SELECT id FROM core_books WHERE code='PS:AiM5');
DELETE FROM core_books WHERE code = 'PS:AiM5';
-- Merging PS:AiM3 -> PS:AiM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PS:AiM3') WHERE code='PS:AiM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PS:AiM') WHERE book_id = (SELECT id FROM core_books WHERE code='PS:AiM3');
DELETE FROM core_books WHERE code = 'PS:AiM3';
-- Merging PS:AiM2 -> PS:AiM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PS:AiM2') WHERE code='PS:AiM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PS:AiM') WHERE book_id = (SELECT id FROM core_books WHERE code='PS:AiM2');
DELETE FROM core_books WHERE code = 'PS:AiM2';
-- Merging EEPC -> EEPC3  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='EEPC') WHERE code='EEPC3' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='EEPC3') WHERE book_id = (SELECT id FROM core_books WHERE code='EEPC');
DELETE FROM core_books WHERE code = 'EEPC';
-- Merging EEPG -> EEPC3  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='EEPG') WHERE code='EEPC3' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='EEPC3') WHERE book_id = (SELECT id FROM core_books WHERE code='EEPG');
DELETE FROM core_books WHERE code = 'EEPG';
-- Merging PS:In2 -> PS:In  (norm-equals)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='PS:In2') WHERE code='PS:In' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='PS:In') WHERE book_id = (SELECT id FROM core_books WHERE code='PS:In2');
DELETE FROM core_books WHERE code = 'PS:In2';
-- Merging OGA -> OGA2  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='OGA') WHERE code='OGA2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='OGA2') WHERE book_id = (SELECT id FROM core_books WHERE code='OGA');
DELETE FROM core_books WHERE code = 'OGA';
-- Merging LR -> LR2  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='LR') WHERE code='LR2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='LR2') WHERE book_id = (SELECT id FROM core_books WHERE code='LR');
DELETE FROM core_books WHERE code = 'LR';
-- Merging ALEE -> EEPC3  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='ALEE') WHERE code='EEPC3' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='EEPC3') WHERE book_id = (SELECT id FROM core_books WHERE code='ALEE');
DELETE FROM core_books WHERE code = 'ALEE';
-- Merging LSABHV -> BH  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='LSABHV') WHERE code='BH' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='BH') WHERE book_id = (SELECT id FROM core_books WHERE code='LSABHV');
DELETE FROM core_books WHERE code = 'LSABHV';
-- Merging DBDD2 -> DM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DBDD2') WHERE code='DM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DM') WHERE book_id = (SELECT id FROM core_books WHERE code='DBDD2');
DELETE FROM core_books WHERE code = 'DBDD2';
-- Merging DE2 -> DM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DE2') WHERE code='DM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DM') WHERE book_id = (SELECT id FROM core_books WHERE code='DE2');
DELETE FROM core_books WHERE code = 'DE2';
-- Merging DFAPC -> DM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DFAPC') WHERE code='DM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DM') WHERE book_id = (SELECT id FROM core_books WHERE code='DFAPC');
DELETE FROM core_books WHERE code = 'DFAPC';
-- Merging DFE2 -> DM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DFE2') WHERE code='DM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DM') WHERE book_id = (SELECT id FROM core_books WHERE code='DFE2');
DELETE FROM core_books WHERE code = 'DFE2';
-- Merging DGP -> DM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DGP') WHERE code='DM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DM') WHERE book_id = (SELECT id FROM core_books WHERE code='DGP');
DELETE FROM core_books WHERE code = 'DGP';
-- Merging DGDP2 -> DM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DGDP2') WHERE code='DM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DM') WHERE book_id = (SELECT id FROM core_books WHERE code='DGDP2');
DELETE FROM core_books WHERE code = 'DGDP2';
-- Merging DLCD -> DM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DLCD') WHERE code='DM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DM') WHERE book_id = (SELECT id FROM core_books WHERE code='DLCD');
DELETE FROM core_books WHERE code = 'DLCD';
-- Merging DPOS -> DM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DPOS') WHERE code='DM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DM') WHERE book_id = (SELECT id FROM core_books WHERE code='DPOS');
DELETE FROM core_books WHERE code = 'DPOS';
-- Merging DF2 -> DM  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DF2') WHERE code='DM' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='DM') WHERE book_id = (SELECT id FROM core_books WHERE code='DF2');
DELETE FROM core_books WHERE code = 'DF2';
-- Merging DE2 -> EEPC3  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DE2') WHERE code='EEPC3' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='EEPC3') WHERE book_id = (SELECT id FROM core_books WHERE code='DE2');
DELETE FROM core_books WHERE code = 'DE2';
-- Merging UA22 -> UA12  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA22') WHERE code='UA12' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA12') WHERE book_id = (SELECT id FROM core_books WHERE code='UA22');
DELETE FROM core_books WHERE code = 'UA22';
-- Merging UA19 -> UA12  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA19') WHERE code='UA12' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA12') WHERE book_id = (SELECT id FROM core_books WHERE code='UA19');
DELETE FROM core_books WHERE code = 'UA19';
-- Merging UA53 -> UA12  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA53') WHERE code='UA12' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA12') WHERE book_id = (SELECT id FROM core_books WHERE code='UA53');
DELETE FROM core_books WHERE code = 'UA53';
-- Merging EET2 -> EEPC3  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='EET2') WHERE code='EEPC3' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='EEPC3') WHERE book_id = (SELECT id FROM core_books WHERE code='EET2');
DELETE FROM core_books WHERE code = 'EET2';
-- Merging DC3 -> EK2  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='DC3') WHERE code='EK2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='EK2') WHERE book_id = (SELECT id FROM core_books WHERE code='DC3');
DELETE FROM core_books WHERE code = 'DC3';
-- Merging EKDIP2 -> EK2  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='EKDIP2') WHERE code='EK2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='EK2') WHERE book_id = (SELECT id FROM core_books WHERE code='EKDIP2');
DELETE FROM core_books WHERE code = 'EKDIP2';
-- Merging SDW3 -> EK2  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='SDW3') WHERE code='EK2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='EK2') WHERE book_id = (SELECT id FROM core_books WHERE code='SDW3');
DELETE FROM core_books WHERE code = 'SDW3';
-- Merging EKSLSW2 -> EK2  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='EKSLSW2') WHERE code='EK2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='EK2') WHERE book_id = (SELECT id FROM core_books WHERE code='EKSLSW2');
DELETE FROM core_books WHERE code = 'EKSLSW2';
-- Merging SGHCG2 -> GHCG  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='SGHCG2') WHERE code='GHCG' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='GHCG') WHERE book_id = (SELECT id FROM core_books WHERE code='SGHCG2');
DELETE FROM core_books WHERE code = 'SGHCG2';
-- Merging LSSOMA3 -> LSSOMA2  (norm-equals)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='LSSOMA3') WHERE code='LSSOMA2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='LSSOMA2') WHERE book_id = (SELECT id FROM core_books WHERE code='LSSOMA3');
DELETE FROM core_books WHERE code = 'LSSOMA3';
-- Merging LSSOMA2 -> LSSOMA3  (norm-equals)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='LSSOMA2') WHERE code='LSSOMA3' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='LSSOMA3') WHERE book_id = (SELECT id FROM core_books WHERE code='LSSOMA2');
DELETE FROM core_books WHERE code = 'LSSOMA2';
-- Merging MSBUC2 -> MS3  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='MSBUC2') WHERE code='MS3' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='MS3') WHERE book_id = (SELECT id FROM core_books WHERE code='MSBUC2');
DELETE FROM core_books WHERE code = 'MSBUC2';
-- Merging UA7 -> MS2  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA7') WHERE code='MS2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='MS2') WHERE book_id = (SELECT id FROM core_books WHERE code='UA7');
DELETE FROM core_books WHERE code = 'UA7';
-- Merging MMFS2 -> MM4  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='MMFS2') WHERE code='MM4' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='MM4') WHERE book_id = (SELECT id FROM core_books WHERE code='MMFS2');
DELETE FROM core_books WHERE code = 'MMFS2';
-- Merging MMG132 -> MM4  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='MMG132') WHERE code='MM4' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='MM4') WHERE book_id = (SELECT id FROM core_books WHERE code='MMG132');
DELETE FROM core_books WHERE code = 'MMG132';
-- Merging MMGMA1 -> MM4  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='MMGMA1') WHERE code='MM4' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='MM4') WHERE book_id = (SELECT id FROM core_books WHERE code='MMGMA1');
DELETE FROM core_books WHERE code = 'MMGMA1';
-- Merging MF2WD -> MF  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='MF2WD') WHERE code='MF' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='MF') WHERE book_id = (SELECT id FROM core_books WHERE code='MF2WD');
DELETE FROM core_books WHERE code = 'MF2WD';
-- Merging MCSAV -> MC2  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='MCSAV') WHERE code='MC2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='MC2') WHERE book_id = (SELECT id FROM core_books WHERE code='MCSAV');
DELETE FROM core_books WHERE code = 'MCSAV';
-- Merging RoT2 -> RoT4  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='RoT2') WHERE code='RoT4' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='RoT4') WHERE book_id = (SELECT id FROM core_books WHERE code='RoT2');
DELETE FROM core_books WHERE code = 'RoT2';
-- Merging SF2 -> SH2  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='SF2') WHERE code='SH2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='SH2') WHERE book_id = (SELECT id FROM core_books WHERE code='SF2');
DELETE FROM core_books WHERE code = 'SF2';
-- Merging SGAAJ -> SH2  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='SGAAJ') WHERE code='SH2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='SH2') WHERE book_id = (SELECT id FROM core_books WHERE code='SGAAJ');
DELETE FROM core_books WHERE code = 'SGAAJ';
-- Merging SSSGEH -> SSGEH  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='SSSGEH') WHERE code='SSGEH' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='SSGEH') WHERE book_id = (SELECT id FROM core_books WHERE code='SSSGEH');
DELETE FROM core_books WHERE code = 'SSSGEH';
-- Merging GSSV1 -> GSS2  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='GSSV1') WHERE code='GSS2' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='GSS2') WHERE book_id = (SELECT id FROM core_books WHERE code='GSSV1');
DELETE FROM core_books WHERE code = 'GSSV1';
-- Merging UA64 -> UA62  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA64') WHERE code='UA62' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA62') WHERE book_id = (SELECT id FROM core_books WHERE code='UA64');
DELETE FROM core_books WHERE code = 'UA64';
-- Merging UA54 -> UA62  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA54') WHERE code='UA62' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA62') WHERE book_id = (SELECT id FROM core_books WHERE code='UA54');
DELETE FROM core_books WHERE code = 'UA54';
-- Merging UA28 -> UA20  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA28') WHERE code='UA20' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA20') WHERE book_id = (SELECT id FROM core_books WHERE code='UA28');
DELETE FROM core_books WHERE code = 'UA28';
-- Merging UA48 -> UA20  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA48') WHERE code='UA20' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA20') WHERE book_id = (SELECT id FROM core_books WHERE code='UA48');
DELETE FROM core_books WHERE code = 'UA48';
-- Merging UA38 -> UA25  (norm-contains)
UPDATE core_books SET release_date = (SELECT release_date FROM core_books WHERE code='UA38') WHERE code='UA25' AND (release_date IS NULL OR release_date='');
UPDATE core_book_sources SET book_id = (SELECT id FROM core_books WHERE code='UA25') WHERE book_id = (SELECT id FROM core_books WHERE code='UA38');
DELETE FROM core_books WHERE code = 'UA38';
COMMIT;