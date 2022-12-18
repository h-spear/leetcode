-- https://leetcode.com/problems/find-the-missing-ids/
-- 재귀 쿼리(WITH RECURSIVE문)
-- 참고1 : https://byul91oh.tistory.com/522
-- 참고2 : https://highjune.dev/database/mysql_recursion_hierachy_query/

WITH RECURSIVE cte AS (
    SELECT 1 AS ids
    UNION ALL
    SELECT ids + 1
      FROM cte
     WHERE ids < (SELECT MAX(customer_id) FROM Customers)
)

SELECT ids
  FROM cte 
 WHERE ids NOT IN (SELECT customer_id FROM Customers);