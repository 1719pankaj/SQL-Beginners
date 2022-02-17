use coffee_store;

SELECT * FROM products;

DESCRIBE PRODUCTS;

INSERT INTO products(name, price, coffee_origin)
VALUES('ESPRESSO', 2.50, 'BRAZIL'),
('MACCHIATO', 3.00, 'BRAZIL'),
('CAPPUCCINO', 3.50, 'Costa Rica'),
('LATTE', 3.50, 'Indonesia'),
('AMERICANO', 3.00, 'BRAZIL'),
('FLAT WHITE', 3.50, 'Indonesia'),
('FILTER', 3.00, 'India');


UPDATE products SET coffee_origin = 'Sri Lanka' WHERE id = 14;

-- With safe updates enabled only primary key can be used in where clause
SET SQL_SAFE_UPDATES = 0;
-- But now with it disabled, we dare to do this

UPDATE products SET coffee_origin = 'Sri Lanka' WHERE coffee_origin = 'Costa Rica';

UPDATE products SET price =  3.25, coffee_origin = 'ETHIOPIA' WHERE name = 'AMERICANO';

-- Deleting stuff
DELETE FROM PopleSoftHCM; -- Let's say cognizant went under
DELETE FROM PeopleSoftHCM WHERE gender = 'F'; -- Let's say congizant fires all women