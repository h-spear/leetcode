-- https://leetcode.com/problems/find-the-start-and-end-number-of-continuous-ranges/
-- 다른사람 풀이 : https://leetcode.com/problems/find-the-start-and-end-number-of-continuous-ranges/discussion/comments/1565460/

-- ********
-- best solution
SELECT MIN(log_id) AS start_id
     , MAX(log_id) AS end_id
  FROM (SELECT log_id, (@val := @val + 1) AS id
          FROM Logs, (SELECT @val := 0) Variable) SUB
 GROUP BY Log_id - id;