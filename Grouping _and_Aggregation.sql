--Publish department wise (department id) employee count within the Organization.--
SELECT
	departmentid,
	COUNT(*) AS employee_count
FROM EMPLOYEE
GROUP BY
	departmentid;


--Display department wise (department id) maximum salary, minimum salary, average salary of the employees.--
SELECT
	departmentid,
	MAX(salary),
	MIN(salary),
	AVG(salary)
FROM EMPLOYEE
GROUP BY
	departmentid;


--List out the no.of employees joined in every month in ascending order.--
SELECT
	EXTRACT(MONTH FROM to_date(hiredate, 'DD-MON-YY')) AS month,
	COUNT(*) AS employee_count
FROM EMPLOYEE
GROUP BY
	month
ORDER BY
	month ASC;


--List out the no.of employees for each month and year, in the ascending order based on the year, month.--
SELECT EXTRACT(MONTH FROM to_date(hiredate, 'DD-MON-YY')) AS month, 
EXTRACT(YEAR FROM to_date(hiredate, 'DD-MON-YY')) AS year, 
COUNT(*) AS employee_count FROM EMPLOYEE 
GROUP BY month, year 
ORDER BY year ASC, month ASC;


--List out the department id having at least four employees.--
SELECT
    departmentid,
    COUNT(*) AS employee_count
FROM EMPLOYEE
GROUP BY
    departmentid
HAVING
    COUNT(*) >= 4;










