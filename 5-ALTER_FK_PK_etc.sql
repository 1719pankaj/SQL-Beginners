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
DESCRIBE people;
ALTER TABLE people ADD PRIMARY KEY (id);

-- Remove PRIMARY KEY
ALTER TABLE addresses DROP PRIMARY KEY;
DESCRIBE addresses;

DESCRIBE people;
-- Add Foreign Key
ALTER TABLE people
ADD CONSTRAINT FK_PeopleAddress
FOREIGN KEY (address_id) REFERENCES addresses(id);

-- Remove Foreign Key
ALTER TABLE people
DROP FOREIGN KEY FK_PeopleAddress;

-- Add UNIQUE constraint
DESCRIBE pets;

ALTER TABLE pets
ADD CONSTRAINT u_species UNIQUE(species);

-- Remove UNIQUE constraint
ALTER TABLE pets
DROP INDEX u_species;


-- Rename COLUMN
DESCRIBE pets;
ALTER TABLE pets CHANGE `species` `animal_type` VARCHAR(20);
ALTER TABLE pets CHANGE `animal_type` `species` VARCHAR(20);

-- Change Datatype
DESCRIBE addresses;
ALTER TABLE addresses MODIFY city INT;
ALTER TABLE addresses MODIFY city VARCHAR(30);


-- Excersise 1
ALTER TABLE people ADD PRIMARY KEY (id);
ALTER TABLE pets ADD PRIMARY KEY (id);

ALTER TABLE pets ADD CONSTRAINT FK_OwnerId FOREIGN KEY (owner_id) REFERENCES people(id);

ALTER TABLE people ADD COLUMN email VARCHAR(150);

ALTER TABLE people ADD CONSTRAINT email_unique UNIQUE (email);

ALTER TABLE pets CHANGE `name` `first_name` VARCHAR(20);

ALTER TABLE addresses MODIFY postcode CHAR(7);






