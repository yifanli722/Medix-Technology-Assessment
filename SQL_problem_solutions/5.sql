-- Write a query to select rows from person that also have a row in address with address_type = 'HOME'.
SELECT first_name, last_name, street_line_1, city, state, zip_code, address_type FROM person
INNER JOIN address ON person.person_id = address.person_id
WHERE address.address_type = 'HOME';
