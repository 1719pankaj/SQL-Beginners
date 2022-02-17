CREATE DATABASE test;

USE test; 

CREATE TABLE addresses (

	id INT,
    house_number INT,
	city VARCHAR(20),
    postcode VARCHAR(7)
);

CREATE TABLE people (

	id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    address_id INT
); 

CREATE TABLE pets (

	id INT,
    name VARCHAR(20),
    species VARCHAR(20), 
    owner_id INT
); 

SHOW TABLES;

-- Add PRIMARY KEY
DESCRIBE addresses;
ALTER TABLE addresses ADD PRIMARY KEY (id);


ALTER TABLE people ADD PRIMARY KEY (id);

-- Remove PRIMARY KEY
ALTER TABLE addresses DROP PRIMARY KEY;
DESCRIBE addresses;









