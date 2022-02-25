SELECT * FROM customers;

-- COUNT
SELECT COUNT(*) FROM customers;
SELECT COUNT(first_name) FROM customers; -- COUNT will not count NULL values

-- SUM 
SELECT SUM(no_seats) FROM rooms;
SELECT*FROM rooms;

-- MAX MIN
SELECT MAX(length_min) FROM films;
SELECT MIN(length_min) FROM films;

-- AVERAGE
SELECT AVG(length_min) FROM films;
SELECT AVG(length_min) FROM films WHERE length_min > 120;

-- EX1 S10
-- 1. How many bookings did customer id 10 make in October 2017.
SELECT COUNT(*) FROM bookings
WHERE customer_id = 10;


-- 2. Count the number of screenings for Blade Runner 2049 in October 2017. 
SELECT COUNT(*) FROM screenings s
JOIN films f ON s.film_id = f.id 
WHERE f.name = 'Blade Runner 2049';


-- 3. Count the number of unique customers who made a booking for October 2017.
SELECT COUNT(DISTINCT(customer_id)) FROM bookings;

-- GROUP BY
SELECT customer_id, COUNT(id) FROM bookings GROUP BY customer_id;
SELECT customer_id, screening_id, COUNT(id) FROM bookings GROUP BY customer_id, screening_id;

SELECT f.name, s.start_time, c.first_name, c.last_name, COUNT(b.id) FROM films f
JOIN screenings s ON f.id = s.film_id
JOIN bookings b ON s.id = b.screening_id
JOIN customers c ON b.customer_id = c.id
GROUP BY f.name, c.last_name, s.start_time
ORDER BY s.start_time;

-- HAVING

SELECT customer_id, screening_id, COUNT(id) 
FROM bookings GROUP BY customer_id, screening_id
HAVING customer_id = 10;


-- EX2 S10
-- 1. Select the customer id and count the number of reserved seats grouped by customer for 
-- October 2017. 

SELECT b.customer_id, COUNT(rs.id) FROM bookings b 
JOIN reserved_seat rs ON b.id = rs.booking_id
GROUP BY b.customer_id;

-- 2. Select the film name and count the number of screenings for each film that is over
-- 2 hours long.

SELECT f.name, f.length_min, COUNT(s.id) FROM films f
JOIN screenings s ON f.id = s.film_id 
GROUP BY f.name, f.length_min
HAVING f.length_min > 120;








