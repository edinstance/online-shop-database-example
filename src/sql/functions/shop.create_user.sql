CREATE OR REPLACE FUNCTION shop.create_user(
    _username VARCHAR(50),
    _name VARCHAR(128),
    _phone_number VARCHAR(20),
    _email VARCHAR(128),
    _password VARCHAR(255)
)
RETURNS VOID AS $$
BEGIN
    INSERT INTO shop.users (username, name, phone_number, email, password)
    VALUES (_username, _name, _phone_number, _email, _password);
END;
$$ LANGUAGE plpgsql;