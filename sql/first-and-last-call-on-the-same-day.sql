-- https://leetcode.com/problems/first-and-last-call-on-the-same-day/

WITH AllCalls AS(
    SELECT caller_id AS user_id, recipient_id AS other_id, call_time
      FROM Calls
     UNION 
    SELECT recipient_id AS user_id, caller_id AS other_id, call_time
      FROM Calls
), CTE AS(
    SELECT user_id, other_id, DATE(call_time) AS call_date
         , DENSE_RANK() OVER (PARTITION BY user_id, DATE(call_time) ORDER BY call_time) AS first
         , DENSE_RANK() OVER (PARTITION BY user_id, DATE(call_time) ORDER BY call_time DESC) AS last
    FROM AllCalls
)

SELECT DISTINCT user_id FROM CTE
 WHERE first = 1 OR last = 1
 GROUP BY user_id, call_date
HAVING COUNT(DISTINCT other_id) = 1;