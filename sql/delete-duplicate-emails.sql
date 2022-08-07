-- https://leetcode.com/problems/delete-duplicate-emails/
-- DELETE 문에도 JOIN을 사용할 수 있다.

DELETE P1 
  FROM Person P1
  JOIN Person P2
 WHERE P1.email = P2.email AND P1.id > P2.id;
