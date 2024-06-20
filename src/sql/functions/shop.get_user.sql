CREATE OR REPLACE FUNCTION shop.get_user(
    _id INTEGER
)
RETURNS SETOF shop.users AS $$
BEGIN
    RETURN QUERY SELECT * FROM shop.users
    WHERE id = _id;
END;
$$ LANGUAGE plpgsql;