-- https://leetcode.com/problems/human-traffic-of-stadium/
-- 서브쿼리
-- ORDER BY 없이도 통과

SELECT id
     , visit_date
     , people
     
  FROM Stadium S
  
 WHERE 
       S.people >= 100 AND
       (
           (
               (SELECT people FROM Stadium WHERE id = S.id-2) >= 100 AND
               (SELECT people FROM Stadium WHERE id = S.id-1) >= 100
           )
       
       OR 
       
           (
               (SELECT people FROM Stadium WHERE id = S.id+2) >= 100 AND
               (SELECT people FROM Stadium WHERE id = S.id+1) >= 100
           )
       
       OR 
       
           (
               (SELECT people FROM Stadium WHERE id = S.id-1) >= 100 AND
               (SELECT people FROM Stadium WHERE id = S.id+1) >= 100
           )
       )

 ORDER BY visit_date;