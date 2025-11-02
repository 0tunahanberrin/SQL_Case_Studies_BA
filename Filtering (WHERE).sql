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
