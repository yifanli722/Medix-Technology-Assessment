-- Write a query to select all rows from person and only those rows from address
-- that have a matching billing address (address_type = 'BILL').
-- If a matching billing address does not exist, display 'NONE' in the address_type column.

-- NOT CORRECT
SELECT p.first_name, p.last_name, a.street_line_1, a.city
FROM person p
JOIN address a ON p.person_id = a.person_id
JOIN address a2 ON p.person_id = a2.person_id AND a.address_id <> a2.address_id
GROUP BY p.person_id, a.street_line_1
HAVING COUNT(*) >= 2;