-- Write a query to select data in the following format:
--last_name home_address billing_address
-------------------- ------------------------------------ ---------------------------------------
--Smith 89 Lyon Circle, Clifton, VA 12345 25 Science Park, New Haven, CT 06511
--Jones 212 Maple Ave, Manassas, VA 22033 275 Winchester Ave, New Haven, CT 06511
-- NOT FUNCTIONAL

SELECT last_name, CONCAT(street_line_1, ', ', city, ', ', state, ' ', zip_code) AS home_address
FROM person p
JOIN address a ON p.person_id = a.person_id
GROUP BY last_name, home_address;