-- Write a query to select all rows from person.  If the person row has a value in preferred_first_name,
-- select the preferred name instead of the value in first name.  Alias the column as REPORTING_NAME.
SELECT
	person_id,
	COALESCE(preferred_first_name, first_name) as REPORTING_NAME,
	last_name,
	date_of_birth,
	hire_date,
	occupation
FROM person;
