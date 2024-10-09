CREATE OR REPLACE FUNCTION shop.insert_item(
    _id INTEGER DEFAULT NULL,
    _title VARCHAR(255) DEFAULT NULL,
    _description VARCHAR(512) DEFAULT NULL,
    _condition VARCHAR(255) DEFAULT NULL,
    _weight NUMERIC(10,2) DEFAULT NULL,
    _item_price DECIMAL(20, 2) DEFAULT NULL,
    _item_currency shop.currency DEFAULT NULL,
    _item_quantity INT DEFAULT NULL
)
RETURNS SETOF shop.item AS $$
DECLARE
    new_id INTEGER;
BEGIN
    IF _id IS NOT NULL THEN
        UPDATE shop.item
        SET
            title = COALESCE(_title, title),
            description = COALESCE(_description, description),
            condition = COALESCE(_condition, condition),
            weight = COALESCE(_weight, weight),
            item_price = COALESCE(_item_price, item_price),
            item_currency = COALESCE(_item_currency, item_currency),
            item_quantity = COALESCE(_item_quantity, item_quantity)
        WHERE id = _id
        RETURNING id INTO new_id;

    ELSE
        INSERT INTO shop.item (title, description, condition, weight, item_price, item_currency, item_quantity)
        VALUES (_title, _description, _condition, _weight, _item_price, _item_currency, _item_quantity)
        RETURNING id INTO new_id;
    END IF;

    RETURN QUERY SELECT * FROM shop.item WHERE id = new_id;

END;
$$ LANGUAGE plpgsql;