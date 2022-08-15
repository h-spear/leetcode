-- https://leetcode.com/problems/duplicate-emails/

SELECT DISTINCT email
  FROM Person
 GROUP BY email
HAVING COUNT(id) > 1;