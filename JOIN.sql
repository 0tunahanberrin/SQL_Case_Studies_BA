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


