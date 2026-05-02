--List out employees along with their department names--
SELECT first_name, last_name, DEPARTMENT.departmentID, dept_name 
FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.departmentID = DEPARTMENT.departmentID;

--Display the employees with their department name and regional groups.--
SELECT  first_name, last_name, DEPARTMENT.dept_name, LOCATION.regional_group 
FROM EMPLOYEE 
JOIN DEPARTMENT ON EMPLOYEE.departmentID = DEPARTMENT.departmentID 
JOIN LOCATION ON DEPARTMENT.loactionID = LOCATION.locationID; 

--How many employees who are working in sales department.--
SELECT  
  COUNT(*) AS employee_count  
FROM EMPLOYEE  
JOIN DEPARTMENT ON EMPLOYEE.departmentID = DEPARTMENT.departmentID 
WHERE DEPARTMENT.dept_name = 'SALES'; 

--List all departments having greater than or equal to 2 employees and display the department names in ascending order.--
SELECT 

    	dept_name, 

	COUNT(EMPLOYEE.employeeID) AS employee_count 

FROM EMPLOYEE 

JOIN 

	DEPARTMENT ON EMPLOYEE.departmentID = DEPARTMENT.departmentID 

GROUP BY 

	dept_name 

HAVING COUNT(EMPLOYEE.employeeID) >= 2 

ORDER BY DEPARTMENT.dept_name ASC;

--Display employee count for each designation within the organization.--
SELECT
	JOB.job_name AS designation,
	COUNT(EMPLOYEE.employeeID) AS employees_count
FROM
	EMPLOYEE
JOIN
	JOB ON EMPLOYEE.jobID = JOB.jobID
GROUP BY
	JOB.job_name
ORDER BY
	employees_count DESC;*/

--How many employees working in “New York”.--
SELECT
	COUNT(EMPLOYEE.employeeID) AS employee_count
FROM
	EMPLOYEE
JOIN
	DEPARTMENT ON EMPLOYEE.departmentID = DEPARTMENT.departmentID
JOIN
	LOCATION ON DEPARTMENT.loactionID = LOCATION.locationID
WHERE
	LOCATION.regional_group = 'NEW YORK';

--Display all department details along with their employee information (if any) (LEFT JOIN).--
SELECT 
	*
FROM DEPARTMENT D
LEFT JOIN 
EMPLOYEE E ON D.departmentID = E.departmentID;

--Display the employee details along with their manager names in employee1 table (SELF JOIN).--
SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS "Employee name",
    m.employee_id AS "ManagerID",
    m.first_name || ' ' || m.last_name AS "Manager name",
    e.salary,
    e.departmentid
FROM employee1 e
JOIN employee1 m
ON e.manager_id = m.employee_id
ORDER BY e.employee_id;

--Display the employee details who earn more than their managers salaries.--
SELECT
	e.first_name,
	e.last_name,
	e.salary AS employee_salary,
	m.first_name AS manager_name,
	m.last_name AS manager_last_name,
	m.salary AS manager_salary
FROM
	EMPLOYEE AS e
JOIN
	EMPLOYEE AS m ON e.managerID = m.employeeID
WHERE
	e.salary > m.salary;

--Show the no. of employees working under every manager.--
SELECT 

m.employee_id as "Manager ID", 

m.first_name || ' ' || m.last_name AS "Manager name", 

count(e.employee_id) as "Number of employees" 

FROM employee1 e 

JOIN employee1 m 

ON e.manager_id = m.employee_id 

group by m.employee_id, m.first_name, m.last_name 

ORDER BY m.employee_id; 
