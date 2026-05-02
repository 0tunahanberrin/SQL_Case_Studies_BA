--Display the second highest salary drawing employee details.--
SELECT *
FROM EMPLOYEE
ORDER BY salary DESC
LIMIT 1 OFFSET 1;
________________________________________________________________
WITH RankedSalaries AS (
    SELECT
        *,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM
        EMPLOYEE
)
SELECT
    *
FROM
    RankedSalaries
WHERE
    salary_rank = 2; 


--Write a query to determine the 3rd highest salary using Ranking functions.--
WITH RankedSalaries AS (
    SELECT
        *,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM
        EMPLOYEE 
)
SELECT
    *
FROM
    RankedSalaries
WHERE
    salary_rank = 3; 
____________________________________________________________
SELECT *
FROM
	(SELECT
			first_name,
			departmentID,
			salary,
			RANK() OVER (ORDER BY salary DESC) AS salary_rank
		FROM EMPLOYEE1
	)
WHERE
	salary_rank = 3;

/*!!! Write a query by putting Rank and Dense_Rank in a single query.
Partition by Department_ID column and order by Employee_ID. What is your observation from the output?*/

SELECT
	EMPLOYEE1.employee_id,
	departmentID,
	
	RANK() OVER (PARTITION BY departmentID ORDER BY EMPLOYEE1.employee_id) AS rank,
	DENSE_RANK() OVER (PARTITION BY departmentID ORDER BY EMPLOYEE1.employee_id) AS dense_rank
FROM
	EMPLOYEE1
ORDER BY
	departmentID,
	EMPLOYEE1.employee_id;

