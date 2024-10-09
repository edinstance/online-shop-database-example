DROP FUNCTION IF EXISTS shop.create_item(_title varchar, _description varchar, _condition varchar, _weight numeric);
CREATE OR REPLACE FUNCTION shop.create_item(
    _title VARCHAR(255),
    _description VARCHAR(512),
    _condition VARCHAR(255),
    _weight NUMERIC(10,2),
    _item_price DECIMAL(20, 2),
    _item_currency shop.currency,
    _item_quantity INT
)
RETURNS SETOF shop.item AS $$
DECLARE
    new_id INTEGER;
BEGIN
    INSERT INTO shop.item (title, description, condition, weight, item_price, item_currency, item_quantity)
    VALUES (_title, _description, _condition, _weight, _item_price, _item_currency, _item_quantity)
    RETURNING id INTO new_id;

    RETURN QUERY SELECT * FROM shop.item WHERE id = new_id;
END;
$$ LANGUAGE plpgsql;