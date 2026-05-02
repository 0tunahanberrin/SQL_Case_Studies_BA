--display no of duplicated rows from employees table--
/*SELECT
    employeeID,
    first_name,
	last_name,
	departmentID,
    COUNT(*) AS duplicate_count
FROM
    EMPLOYEE
GROUP BY
    employeeID,
    first_name,
	last_name,
	departmentID
HAVING
    COUNT(*) > 1;*/


--Write a query to remove the duplicate records from the table (PostgreSQL specific).--
DELETE FROM EMPLOYEE1
WHERE employee_id IN (
    SELECT employee_id
    FROM (
        SELECT
            employee_id,
            ROW_NUMBER() OVER (PARTITION BY departmentID, employee_id ORDER BY ctid) AS row_num
        FROM EMPLOYEE1
    ) AS duplicates
    WHERE row_num > 1
);
