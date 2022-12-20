-- Write a query to select all rows from person that have a date_of_birth before August 7th, 1990.
SELECT *
FROM person
WHERE date_of_birth < '1990-08-07';