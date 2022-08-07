-- https://leetcode.com/problems/calculate-special-bonus/

SELECT employee_id
     , IF(name LIKE 'm%' OR employee_id % 2 = 0, 0, salary) AS bonus
  FROM Employees
 ORDER BY employee_id;