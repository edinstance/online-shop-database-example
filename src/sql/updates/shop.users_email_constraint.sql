ALTER TABLE shop.users
ADD CONSTRAINT email_unique UNIQUE (email);