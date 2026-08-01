--Display the employee details who got the maximum salary.--
SELECT *
FROM EMPLOYEE
WHERE salary = (SELECT MAX(salary) FROM EMPLOYEE);

--Display the employees who are working in Sales department.--
SELECT *
FROM EMPLOYEE
WHERE
	departmentID = (SELECT departmentID FROM DEPARTMENT WHERE dept_name = 'SALES');

--Find out no.of employees working in “Sales” department.--
SELECT 
 COUNT(*) AS employee_count 
FROM EMPLOYEE 
WHERE
	departmentID = (SELECT departmentID FROM DEPARTMENT WHERE dept_name = 'SALES'); 

--List out the employees who earn more than every employee in department 30.--
SELECT *
FROM EMPLOYEE
WHERE salary > ( SELECT MAX(salary) FROM EMPLOYEE WHERE departmentID = 30 );


--List out the employees who earn more than the lowest salary in department 30.--
SELECT *
FROM EMPLOYEE
WHERE salary > ( SELECT MIN(salary) FROM EMPLOYEE WHERE departmentID = 30 );

--Find out which department does not have any employees.-- 
SELECT departmentid, dept_name
FROM department
WHERE departmentid not in (SELECT departmentid FROM employee WHERE departmentid is not null);


