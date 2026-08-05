--Identifies user records with duplicate email addresses by grouping data and filtering counts greater than one using the HAVING clause.

SELECT email, COUNT(*) AS duplicate_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;
