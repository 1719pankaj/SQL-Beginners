SELECT * FROM products;

SELECT name FROM products;

SELECT * FROM products WHERE price = 3.00 AND coffee_origin = 'Brazil';

SELECT * FROM products WHERE price >= 3.00 OR coffee_origin = 'Brazil';

SELECT * FROM customers;

SELECT * FROM customers WHERE phone_number IS NULL;

SELECT * FROM customers WHERE phone_number IS NOT NULL;

-- Excersise 

SELECT first_name, phone_number FROM customers WHERE last_name = 'Bluth';

SELECT * FROM products WHERE price > 3.00 OR coffee_origin = 'India';

SELECT * FROM customers WHERE gender = 'M' AND phone_number IS NULL;


-- Multi qualifier select

SELECT * FROM customers WHERE last_name IN ('Taylor', 'Bluth', 'Armstrong');

SELECT * FROM customers WHERE first_name NOT IN ('Katie' ,'John' ,'George');

-- BEWTWEEN

SELECT product_id, customer_id, order_time FROM orders 
WHERE order_time BETWEEN '2017-01-01' AND '2017-01-07';

SELECT product_id, customer_id, order_time FROM orders 
WHERE customer_id BETWEEN 5 AND 10;

SELECT * FROM customers WHERE last_name BETWEEN 'A' AND 'L';

-- LIKE

SELECT * FROM customers WHERE last_name LIKE 'W%';
SELECT * FROM customers WHERE first_name LIKE '%o%';
SELECT * FROM customers WHERE first_name LIKE '_o_';

SELECT*FROM products WHERE price LIKE '3%';

-- ORDER BY

SELECT*FROM orders WHERE customer_id = 1 ORDER BY order_time;

-- Excersise 2

SELECT name, price FROM products 
WHERE coffee_origin IN ('Brazil','Indonesia')
ORDER BY name;

SELECT * FROM orders 
WHERE order_time BETWEEN '2017-02-01' AND '2017-02-28'
AND customer_id IN (2,4,6,8);

SELECT first_name, phone_number, last_name FROM customers 
WHERE last_name LIKE '%ar%';

-- DISTINCT 

SELECT DISTINCT coffee_origin FROM products;

SELECT DISTINCT customer_id FROM orders
WHERE order_time BETWEEN '2017-02-01' AND '2017-02-28';

SELECT DISTINCT customer_id, product_id FROM orders
WHERE order_time BETWEEN '2017-02-01' AND '2017-02-28'; -- This will return dictinct combinations of Customer id and product IDs and will repeat them individually.

-- LIMIT

SELECT * FROM customers LIMIT 5; -- Will get you 1-5

SELECT * FROM customers LIMIT 5 OFFSET 10; -- Will get you 11-15

-- Alias

SELECT*FROM products;

SELECT name AS coffee, price, coffee_origin AS country FROM products;

-- Ex3

-- 1. From the customers table, select distinct last names and order alphabetically from A-Z. 

SELECT DISTINCT last_name FROM customers
ORDER BY last_name;

-- 2. From the orders table, select the first 3 orders placed by customer with id 1, in February 2017.

SELECT * FROM orders
WHERE order_time BETWEEN '2017-02-01' AND '2017-02-28'
AND customer_id = 1
ORDER BY order_time ASC
LIMIT 3;

-- 3. From the products table, select the name, price and coffee origin but rename the price to 
-- retail_price in the results set.

SELECT name, price AS retail_price, coffee_origin FROM products;

-- JOINs
-- Inner JOIN

SELECT products.name, orders.order_time FROM orders
INNER JOIN products ON orders.product_id = products.id;
-- /\ BOTH \/ are equivalent
SELECT p.name, o.order_time FROM orders o 
JOIN products p ON o.product_id = p.id; -- This is the short hand way of writing things.

-- LEFT JOIN
UPDATE orders SET customer_id = NULL WHERE customer_id = 1;

Select o.id, c.phone_number, c.last_name, o.order_time 
FROM orders o LEFT JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_time LIMIT 10;

Select o.id, c.phone_number, c.last_name, o.order_time 
FROM customers c LEFT JOIN orders o ON c.id = o.customer_id
ORDER BY o.order_time LIMIT 10;

-- RIGHT JOIN

Select o.id, c.phone_number, c.last_name, o.order_time 
FROM orders o RIGHT JOIN customers c ON o.customer_id = c.id
ORDER BY o.order_time LIMIT 10;

Select o.id, c.phone_number, c.last_name, o.order_time 
FROM customers c RIGHT JOIN orders o ON c.id = o.customer_id
ORDER BY o.order_time LIMIT 10;

UPDATE orders SET customer_id = 1 WHERE customer_id = 1;

-- JOIN more than 2 tables
SELECT*FROM products;
SELECT*FROM customers;
SELECT*FROM orders;

SELECT p.name, p.price, c.first_name, c.last_name, o.order_time
FROM products p JOIN orders o ON p.id = o.product_id
JOIN customers c ON c.id = o.customer_id;


-- Ex 4 (Sec7)
-- Select the order id and customer's phone number for all orders of product id 4

SELECT o.id, c.phone_number
FROM orders o JOIN customers c ON o.customer_id = c.id
WHERE o.product_id = 4;

-- Select product name and order time for filter coffee sofd b/w Jan 15 2017 and Feb 14th 2017

SELECT o.order_time, p.name 
FROM products p JOIN orders o ON o.product_id = p.id
WHERE o.order_time BETWEEN '2017-01-15' AND '2017-02-14'
AND p.name = 'FILTER';

-- Select the product name and price and order time for all orders from females in Jan 2017

SELECT*FROM products;
SELECT*FROM customers;
SELECT*FROM orders;

SELECT p.name, p.price, o.order_time 
FROM products p JOIN orders o ON o.product_id = p.id
JOIN customers c ON c.id = o.customer_id
WHERE gender = 'F'
AND o.order_time BETWEEN '2017-01-01' AND '2017-01-31';







