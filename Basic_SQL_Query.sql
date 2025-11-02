--Select all columns from the employee table.--
SELECT * FROM public.employee;


--Show employee first name, last name, and salary from the EMPLOYEE table.--
SELECT
	first_name,
	last_name,
	salary,
	comm
FROM EMPLOYEE;
/*ORDER BY last_name ;
ORDER BY first_name ASC;
ORDER BY first_name DESC;*/


--List out employee_id,last name,department id for all employees and rename employee id as “ID  of the employee”, last name as “Name of the employee”, department id as  “Department  ID”--
SELECT
    employeeid AS "ID of the employee",
    last_name AS "Name of the employee",
    departmentid AS "Department ID"
FROM EMPLOYEE;


--List out the employees annual salary with their names only (please note EMPLOYEE table captured with monthly salary)--
SELECT
	first_name,
	last_name,
	(salary * 12) AS annual_salary
FROM EMPLOYEE;










