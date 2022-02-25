-- NON-CORELATED SUBQUERY
SELECT id, start_time FROM screenings WHERE film_id IN (SELECT id FROM films WHERE length_min > 120);

SELECT first_name, last_name, email FROM customers WHERE id IN (SELECT customer_id FROM bookings WHERE screening_id=1);

SELECT AVG(no_seats), MAX(no_seats)FROM
(SELECT booking_id, COUNT(seat_id) AS no_seats FROM reserved_seat
GROUP BY booking_id) b;

-- CORELATED SUBQUERIES
SELECT screening_id, customer_id, 
(SELECT COUNT(seat_id) FROM reserved_seat WHERE booking_id = b.id)
FROM bookings b ORDER BY screening_id;

-- EX1 S11
-- 1. Select the film name and length for all films with a length greater than the average film length. 

SELECT name, length_min FROM films 
WHERE length_min >
(SELECT AVG(length_min) FROM films);

SELECT AVG(length_min) FROM films;

-- 2. Select the maximum number and the minimum number of screenings for a particular film.

SELECT MAX(id), MIN(id) FROM
(SELECT film_id, COUNT(id) AS id FROM screenings
GROUP BY film_id) a;

-- 3. Select each film name and the number of screenings for that film.

SELECT name, 
(SELECT COUNT(id) FROM screenings 
WHERE film_id = f.id
)
FROM films f;
