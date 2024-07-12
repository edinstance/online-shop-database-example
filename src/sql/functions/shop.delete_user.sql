CREATE OR REPLACE FUNCTION shop.delete_user(
    _id INTEGER
)
RETURNS VOID AS $$
BEGIN
    DELETE FROM shop.users
    WHERE id = _id;
END;
$$ LANGUAGE plpgsql;