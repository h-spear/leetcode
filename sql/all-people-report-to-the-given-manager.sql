-- https://leetcode.com/problems/all-people-report-to-the-given-manager/

WITH RECURSIVE cte AS (
    
    -- Non-Recursive Statement
    -- 첫 번째 루프에서만 실행
    SELECT employee_id 
      FROM Employees
     WHERE employee_id = 1

     UNION ALL

    -- Recursive Statement
    SELECT e.employee_id
      FROM cte
      JOIN Employees e
        ON e.manager_id = cte.employee_id
     WHERE e.employee_id <> 1
)

SELECT employee_id
  FROM cte
 WHERE employee_id <> 1;