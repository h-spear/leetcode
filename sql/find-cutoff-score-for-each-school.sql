-- https://leetcode.com/problems/find-cutoff-score-for-each-school/

SELECT S.school_id AS school_id
     , IFNULL(MIN(E.score), -1) AS score
  FROM Schools S
  LEFT JOIN Exam E
    ON S.capacity >= E.student_count
 GROUP BY S.school_id;