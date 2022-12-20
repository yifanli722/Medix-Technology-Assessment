-- Write a query to select data in the following format:
-- BELOW DOESN't WORK, SKIP

SELECT last_name, street_line_1, city, state, zip_code, address_type FROM person
INNER JOIN address ON person.person_id = address.person_id as temp

SELECT last_name, CONCAT(street_line_1, ', ', city, ', ', state, ' ', zip_code) AS home_address FROM temp;