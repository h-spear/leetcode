-- https://leetcode.com/problems/biggest-window-between-visits/

WITH IdxUserVisit AS(
    SELECT user_id
     , visit_date
     , (@val := @val + 1) AS idx
  FROM UserVisits, (SELECT @val := 0) Variable
    ORDER BY user_id, visit_date
)

SELECT UV1.user_id AS user_id
     , MAX(DATEDIFF(
         IFNULL(UV2.visit_date, '2021-01-01'), UV1.visit_date)) AS biggest_window 
  FROM IdxUserVisit UV1
  LEFT JOIN IdxUserVisit UV2
    ON UV1.user_id = UV2.user_id AND 
       UV1.idx + 1 = UV2.idx
 GROUP BY UV1.user_id
 ORDER BY UV1.user_id;

