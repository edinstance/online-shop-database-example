CREATE TABLE IF NOT EXISTS shop.item(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    description VARCHAR(512),
    condition VARCHAR(255),
    weight NUMERIC(10,2)
);