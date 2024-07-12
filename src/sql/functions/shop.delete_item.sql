CREATE OR REPLACE FUNCTION shop.delete_item(
    _id INTEGER
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM shop.item
    WHERE id = _id;
END;
$$ LANGUAGE plpgsql;