-- https://leetcode.com/problems/highest-grade-for-each-student/

SELECT E.student_id AS student_id
     , MIN(E.course_id) AS course_id
     , E.grade AS grade

  FROM Enrollments E

  JOIN (SELECT student_id
             , MAX(grade) AS grade
          FROM Enrollments
         GROUP BY student_id) SUB

    ON E.student_id = SUB.student_id AND E.grade = SUB.grade
    
 GROUP BY E.student_id
 ORDER BY E.student_id;