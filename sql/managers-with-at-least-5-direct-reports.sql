-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/

SELECT name
  FROM Employee E
  JOIN (SELECT managerId, COUNT(*) AS reports
          FROM Employee
         GROUP BY managerId) SUB
    ON E.id = SUB.managerId
 WHERE SUB.reports >= 5;
   