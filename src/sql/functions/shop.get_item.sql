CREATE OR REPLACE FUNCTION shop.get_item(
    _id INTEGER
)
RETURNS SETOF shop.users AS $$
BEGIN
    RETURN QUERY SELECT * FROM shop.item
    WHERE id = _id;
END;
$$ LANGUAGE plpgsql;