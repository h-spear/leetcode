-- https://leetcode.com/problems/students-with-invalid-departments/
-- Beats 98.27%

SELECT S.id
     , S.name
  FROM Students S
  LEFT JOIN Departments D
    ON S.department_id = D.id
 WHERE D.name IS NULL;