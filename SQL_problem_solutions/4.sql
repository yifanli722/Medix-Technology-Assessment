-- Write a query to select all rows from person that have a hire_date in the past 100 days.
SELECT *
FROM person
WHERE hire_date > CURRENT_DATE - INTERVAL '100 days';