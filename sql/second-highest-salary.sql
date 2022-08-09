# https://leetcode.com/problems/second-highest-salary/

SELECT IF (COUNT(*) = 0, NULL, SecondHighestSalary) AS SecondHighestSalary
  FROM (SELECT salary AS SecondHighestSalary
          FROM Employee
         GROUP BY salary
         ORDER BY salary DESC
         LIMIT 1 OFFSET 1) SUB;