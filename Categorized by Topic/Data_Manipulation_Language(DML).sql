--Employees who are working as Clerk received 10% hike, please update salaries accordingly in employee table.--
UPDATE EMPLOYEE
SET salary = salary * 1.10
WHERE jobID = (SELECT jobID FROM job WHERE job_name = 'CLERK');

--Research department has been removed within the organization, update employee table accordingly.--
UPDATE EMPLOYEE
SET departmentID = NULL
WHERE departmentID = (SELECT departmentID FROM DEPARTMENT WHERE dept_name = 'RESEARCH');

--Research department has been removed within the organization, update employee table accordingly.--
UPDATE EMPLOYEE
SET departmentID = NULL
WHERE departmentID = (SELECT departmentID FROM DEPARTMENT WHERE dept_name = 'RESEARCH');
(NULL List:
  SELECT *
FROM EMPLOYEE
WHERE departmentID IS NULL;)
