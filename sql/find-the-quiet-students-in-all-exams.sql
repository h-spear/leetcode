-- https://leetcode.com/problems/find-the-quiet-students-in-all-exams/

WITH ExamMaxScore AS(
    SELECT exam_id, MAX(score) AS max_score
    FROM Exam
    GROUP BY exam_id
),
ExamMinScore AS(
    SELECT exam_id, MIN(score) AS min_score
    FROM Exam
    GROUP BY exam_id
),
Candidate AS(
    SELECT DISTINCT E.student_id AS student_id
      FROM Exam E
      JOIN ExamMinScore EMINS
        ON E.exam_id = EMINS.exam_id
      JOIN ExamMaxScore EMAXS
        ON E.exam_id = EMAXS.exam_id
     WHERE E.score = EMINS.min_score OR 
           E.score = EMAXS.max_score
)

SELECT S.student_id AS student_id
     , S.student_name AS student_name
  FROM Student S
 WHERE (SELECT COUNT(*) FROM Exam WHERE student_id = S.student_id) >= 1 AND 
       (S.student_id NOT IN (SELECT * FROM Candidate));