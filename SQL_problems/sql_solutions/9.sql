-- Write a query to update the person.occupation column to
-- ‘X’ for all rows that have a ‘BILL’ address in the address table.
UPDATE person
SET occupation = 'X'
WHERE EXISTS(SELECT 1 FROM address WHERE person.person_id = address.person_id AND address.address_type = 'BILL')

