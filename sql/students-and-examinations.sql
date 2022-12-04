-- https://leetcode.com/problems/students-and-examinations/

SELECT ST.student_id AS student_id
     , ST.student_name AS student_name
     , SU.subject_name AS subject_name
     , (SELECT COUNT(student_id) 
          FROM Examinations 
         WHERE student_id = ST.student_id AND 
               subject_name = SU.subject_name) AS attended_exams 

  FROM Students ST, Subjects SU
  
 ORDER BY student_id, subject_name;