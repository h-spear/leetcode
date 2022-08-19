-- https://leetcode.com/problems/human-traffic-of-stadium/
-- JOIN
-- 순서가 뒤엉키므로 ORDER BY 해야 통과

SELECT DISTINCT S1.id
     , S1.visit_date
     , S1.people
     
  FROM Stadium S1 JOIN Stadium S2 JOIN Stadium S3
  
    ON (S1.id = S2.id - 2 AND S1.id = S3.id - 1) OR
       (S1.id = S2.id - 1 AND S1.id = S3.id + 1) OR
       (S1.id = S2.id + 1 AND S1.id = S3.id + 2)
       
 WHERE S1.people >= 100 AND
       S2.people >= 100 AND
       S3.people >= 100
       
 ORDER BY S1.visit_date ASC;