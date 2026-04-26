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
