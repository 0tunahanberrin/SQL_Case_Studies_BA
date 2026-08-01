--Using CTE, display Employee1 details whose salary is greater than 10000.--
WITH EMPLOYEE_SALARY AS (
    SELECT *
    FROM EMPLOYEE1
    WHERE Salary > 10000
)
SELECT *
FROM EMPLOYEE_SALARY;


--Using CTE, write a query to display the 4th highest salary.--
WITH RankedSalaries AS (
    SELECT
        first_name,
		last_name,
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS ranked_salary
    FROM
        EMPLOYEE1
)
SELECT
    first_name,
	last_name,
    salary
FROM
    RankedSalaries
WHERE
    ranked_salary = 4;


--Using CTE, write a query to remove the duplicates from the table.--
WITH RowNumberCTE AS (
    SELECT 
        ctid,*, 
        ROW_NUMBER() OVER (
            PARTITION BY employee_id, first_name, last_name, jobid, salary, manager_id, departmentid
            ORDER BY employee_id
        ) AS rn
    FROM Employee1
)
DELETE FROM Employee1
WHERE ctid IN (
    SELECT ctid
    FROM RowNumberCTE
    WHERE rn > 1
);
