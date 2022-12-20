-- Write a query to count the number of addresses per address type.
SELECT a.address_type, COUNT(*) as type_count
FROM address a
GROUP BY a.address_type;
