--POSTGRES SQL
CREATE TABLE person (
  person_id NUMERIC(10) PRIMARY KEY,
  first_name VARCHAR(100),
  preferred_first_name VARCHAR(100),
  last_name VARCHAR(100) NOT NULL,
  date_of_birth DATE,
  hire_date DATE,
  occupation VARCHAR(1)
);

CREATE TABLE address (
  address_id NUMERIC(10) PRIMARY KEY,
  person_id NUMERIC(10) NOT NULL REFERENCES person(person_id),
  address_type VARCHAR(4) NOT NULL,
  street_line_1 VARCHAR(100),
  city VARCHAR(100),
  state VARCHAR(100),
  zip_code VARCHAR(30)
  CONSTRAINT fk_person
    FOREIGN KEY(person_id)
        REFERENCES person(person_id)
);

INSERT INTO person (person_id, first_name, preferred_first_name, last_name, date_of_birth, hire_date, occupation)
VALUES
(1, 'John', NULL, 'Doe', '1980-01-01', '2010-01-01', 'A'),
(2, 'Jane', 'Janey', 'Doe', '1985-06-15', '2012-04-01', 'B'),
(3, 'Bob', 'Bobby', 'Smith', '1970-09-01', '2005-03-15', NULL),
(4, 'Yifan', 'Ethan', 'Li', '1995-01-01', '2010-01-01', 'A');

INSERT INTO ADDRESS (address_id, person_id, address_type, street_line_1, city, state, zip_code)
SELECT 1, person_id, 'HOME', '123 Main St', 'Phoenix', 'AZ', '12345'
FROM person
WHERE person_id = 1;

INSERT INTO ADDRESS (address_id, person_id, address_type, street_line_1, city, state, zip_code)
SELECT 2, person_id, 'BILL', '89 Lyon Circle', 'Clifton', 'VA', '54321'
FROM person
WHERE person_id = 2;

INSERT INTO ADDRESS (address_id, person_id, address_type, street_line_1, city, state, zip_code)
SELECT 3, person_id, 'HOME', '89 Lyon Circle', 'Clifton', 'VA', '54321'
FROM person
WHERE person_id = 2;

INSERT INTO ADDRESS (address_id, person_id, address_type, street_line_1, city, state, zip_code)
SELECT 4, person_id, 'WORK', '789 Maple Ave', 'Nebraska City', 'NE', '98765'
FROM person
WHERE person_id = 3;

INSERT INTO ADDRESS (address_id, person_id, address_type, street_line_1, city, state, zip_code)
SELECT 5, person_id, 'WORK', '321 Elm St', 'Hello', 'World', '11223'
FROM person
WHERE person_id = 4;