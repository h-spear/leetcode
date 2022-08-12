-- https://leetcode.com/problems/the-latest-login-in-2020/
-- DISTINCT user_id: faster than 95.55%
-- user_id: faster than 23.47%

SELECT DISTINCT user_id
     , MAX(time_stamp) AS last_stamp
  FROM Logins
 WHERE YEAR(time_stamp) = 2020
 GROUP BY user_id;