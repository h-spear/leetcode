-- https://leetcode.com/problems/count-student-number-in-departments/

SELECT D.dept_name AS dept_name
     , IFNULL(SUB.count, 0) AS student_number
  FROM Department D
  LEFT JOIN (SELECT dept_id
                  , COUNT(dept_id) AS count
               FROM Student
              GROUP BY dept_id) SUB
    ON D.dept_id = SUB.dept_id
 ORDER BY student_number DESC, dept_name;