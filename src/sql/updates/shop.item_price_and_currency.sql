ALTER TABLE shop.item ADD COLUMN item_price DECIMAL(20, 2) DEFAULT 0.00 NOT NULL;
CREATE TYPE shop.currency AS ENUM ('GBP');
ALTER TABLE shop.item ADD COLUMN item_currency shop.currency DEFAULT 'GBP' NOT NULL;