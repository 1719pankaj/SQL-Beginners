
show databases;
use cinema_booking_system;

-- CONCAT
SELECT CONCAT(first_name, ' ', last_name) as FULL_NAME FROM Customers;

-- SUBSTRING
SELECT SUBSTRING('01234567)', 1, 5) AS eggjamplee;

SELECT SUBSTRING('01234567', -3, 8) AS eggjamplee; -- negetive index matlab end se third 

-- UPPER/LOWER
SELECT UPPER(name) AS name FROM rooms;
SELECT LOWER(name) AS name FROM rooms;

-- EX1 S12
-- Concatenate the film names and length from the films table.

SELECT CONCAT(name,": ",length_min) AS film_info FROM films;

-- Extract the customers email from the 5th character onwards.

SELECT SUBSTRING(email,5) AS email_short FROM customers;

-- Select the customers first name in lower case and their last name in upper case 
-- for each customer with a last name of ‘Smith’.  

SELECT LOWER(first_name) AS first_name, UPPER(last_name) AS last_name FROM customers
WHERE last_name = 'Smith';

-- Select the last 3 letters of each film name from the films table.

SELECT SUBSTRING(name,-3) AS film_name FROM films;

-- Concatenate the first three letters in the first_name and last_name columns together 
-- from the customers table.

SELECT CONCAT(SUBSTRING(first_name,1,3)," ",SUBSTRING(last_name,1,3)) AS short_name
FROM customers;

-- DATE
SELECT DATE(start_time) FROM screenings; -- selects only DATE from datetime datatype

-- MONTH
SELECT MONTH(start_time) FROM screenings; -- selects only MONTH from datetime datatype

-- YEAR
SELECT YEAR(start_time) FROM screenings; -- selects only YEAR from datetime datatype

-- EX2 S12
-- Select the film id and start time from the screenings table for the date of 20th of October 2017.

SELECT film_id, start_time FROM screenings
WHERE DATE(start_time) = '2017-10-20';

-- Select all the data from the screenings table for the start time between the 6th and 13th of 
-- October 2017.

SELECT * FROM screenings
WHERE DATE(start_time) BETWEEN '2017-10-06' AND '2017-10-13';

-- Select all the data from the screenings table for October 2017.

SELECT * FROM screenings
WHERE MONTH(start_time) = '10'
AND YEAR(start_time) = '2017';
