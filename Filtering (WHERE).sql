-- List out the names and department IDs of all employees who work in departments that have 4 or more employees.--
SELECT
    first_name,
    last_name,
    departmentid
FROM
    EMPLOYEE
WHERE
    departmentid IN (
        SELECT
            departmentid
        FROM
            EMPLOYEE
        GROUP BY
            departmentid
        HAVING
            COUNT(*) >= 4
    )
ORDER BY
    departmentid;

--How many employees joined in January month.--
SELECT
	COUNT(*) AS January_employees
FROM EMPLOYEE
WHERE
	DATE_PART('month', to_date(hiredate, 'DD-MON-YY')) = 1;

--How many employees joined in January or September month.--
SELECT 

COUNT(CASE WHEN EXTRACT(MONTH FROM to_date(hiredate, 'DD-MON-YY')) = 1 THEN 1 END) AS January_employees, 
COUNT(CASE WHEN EXTRACT(MONTH FROM to_date(hiredate, 'DD-MON-YY')) = 9 THEN 1 END) AS September_employees 
 
FROM EMPLOYEE; 

--How many employees joined in 1985.--
SELECT
	COUNT(*) AS joined_in_1985_employees	
FROM EMPLOYEE
WHERE
	EXTRACT(YEAR FROM to_date(hiredate, 'DD-MON-YY')) = 1985;

--How many employees joined each month in 1985.--
SELECT
	EXTRACT(MONTH FROM to_date(hiredate, 'DD-MON-YY')) AS month, 
	COUNT(*) AS employee_count
FROM EMPLOYEE
WHERE
	EXTRACT(YEAR FROM to_date(hiredate, 'DD-MON-YY')) = 1985
GROUP BY
	month
ORDER BY
	month ASC;
	
