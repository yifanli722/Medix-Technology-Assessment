-- Write a query to select data in the following format:
--last_name home_address billing_address
-------------------- ------------------------------------ ---------------------------------------
--Smith 89 Lyon Circle, Clifton, VA 12345 25 Science Park, New Haven, CT 06511
--Jones 212 Maple Ave, Manassas, VA 22033 275 Winchester Ave, New Haven, CT 06511
-- NOT FUNCTIONAL
SELECT p.last_name,
       MAX(CASE WHEN a.address_type = 'HOME' THEN CONCAT(a.street_line_1, ', ', a.city, ', ', a.state, ' ', a.zip_code) END) AS home_address,
       MAX(CASE WHEN a.address_type = 'BILL' THEN CONCAT(a.street_line_1, ', ', a.city, ', ', a.state, ' ', a.zip_code) END) AS billing_address
FROM person p
LEFT JOIN address a ON p.person_id = a.person_id
GROUP BY p.last_name;
