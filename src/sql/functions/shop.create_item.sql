CREATE OR REPLACE FUNCTION shop.create_item(
    _title VARCHAR(255),
    _description VARCHAR(512),
    _condition VARCHAR(255),
    _weight NUMERIC(10,2)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO shop.item (title, description, condition, weight)
    VALUES (_title, _description, _condition, _weight);
END;
$$ LANGUAGE plpgsql;