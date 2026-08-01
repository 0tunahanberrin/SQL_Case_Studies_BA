--Write a query to remove the duplicate records from the table.--
DELETE FROM EMPLOYEE1 WHERE employee_id 
  IN ( SELECT employee_id FROM ( SELECT employee_id, ROW_NUMBER() OVER (PARTITION BY departmentID, employee_id ORDER BY ctid) AS row_num 
  FROM EMPLOYEE1 ) AS duplicates WHERE row_num > 1 );

--Write a query to display all the records from Customer and Employee2 Table.--
SELECT *
FROM EMPLOYEE2
UNION ALL
SELECT * 
FROM Customer

--Write a query to combine the results of Customer and Employee2 Table (display only unique records)--
SELECT *
FROM EMPLOYEE2
UNION 
SELECT * 
FROM Customer 

--Write a query to display records that exists in Customer table but does not exist in Employee2 Table.--
SELECT * FROM Customer
EXCEPT
SELECT * FROM Employee2

--Write a query to display records that exists in both Customer and Employee2 Table.--
SELECT * FROM Customer
INTERSECT
SELECT * FROM Employee2
