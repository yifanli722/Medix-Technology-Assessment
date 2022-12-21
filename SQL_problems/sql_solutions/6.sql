-- Write a query to select all rows from person and only those rows from address
-- that have a matching billing address (address_type = 'BILL').
-- If a matching billing address does not exist, display 'NONE' in the address_type column.

SELECT p.first_name,
	p.last_name,
    (CASE WHEN a.address_type IS NULL THEN 'NONE' ELSE a.address_type END) AS address_type,
   	a.street_line_1,
	a.city,
	a.state,
	a.zip_code
FROM person p
LEFT JOIN address a ON p.person_id = a.person_id AND a.address_type = 'BILL'
WHERE EXISTS (SELECT person_id, address_type, street_line_1, city, state, zip_code
			  FROM address
			  WHERE person_id = p.person_id
				  AND address_type = 'HOME'
				  AND street_line_1 = a.street_line_1
				  AND city = a.city
				  AND state = a.state
				  AND zip_code = a.zip_code
			 )
OR a.address_type IS NULL;