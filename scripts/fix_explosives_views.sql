-- Views corrigidas para explosivos

CREATE VIEW IF NOT EXISTS v_explosives_complete AS
SELECT 
    e.id,
    e.name,
    ec.name as category,
    i.name as item_type,
    CASE 
        WHEN e.cost IS NULL THEN 'Priceless'
        ELSE printf('%.0f %s', e.cost, cc.code) 
    END as cost_display,
    printf('%.1f %s', e.weight, wu.code) as weight_display,
    CASE 
        WHEN e.damage_dice IS NOT NULL THEN e.damage_dice || ' ' || dt.name
        ELSE 'No damage'
    END as damage,
    CASE 
        WHEN e.save_dc IS NOT NULL THEN 'DC ' || e.save_dc || ' ' || e.save_ability
        ELSE 'No save'
    END as saving_throw,
    CASE 
        WHEN e.range_feet IS NOT NULL THEN e.range_feet || ' feet'
        ELSE 'Contact'
    END as range,
    CASE 
        WHEN e.area_feet IS NOT NULL THEN e.area_feet || ' feet radius'
        ELSE 'No area'
    END as area_effect,
    e.description,
    cb.name as source_book
FROM item_explosives e
JOIN item_explosive_categories ec ON e.category_id = ec.id
JOIN items i ON e.item_id = i.id
LEFT JOIN core_currency_types cc ON e.cost_currency_id = cc.id
JOIN core_measurement_units wu ON e.weight_unit_id = wu.id
LEFT JOIN core_damage_types dt ON e.damage_type_id = dt.id
JOIN core_books cb ON e.book_id = cb.id;

CREATE VIEW IF NOT EXISTS v_explosives_by_category AS
SELECT 
    ec.name as category,
    COUNT(*) as total_explosives,
    printf('%.2f', AVG(e.cost)) as avg_cost,
    printf('%.2f', AVG(e.weight)) as avg_weight
FROM item_explosives e
JOIN item_explosive_categories ec ON e.category_id = ec.id
GROUP BY ec.id, ec.name;
