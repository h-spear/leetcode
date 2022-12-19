-- https://leetcode.com/problems/median-employee-salary/

SELECT id, company, salary
  FROM (SELECT id
             , company
             , salary
             , (RANK() OVER (PARTITION BY company ORDER BY salary, id)) AS rnk
             , COUNT(*) OVER (PARTITION BY company) as cnt
          FROM Employee) SUB
 WHERE IF (cnt % 2 = 0, rnk = cnt / 2 OR rnk = cnt / 2 + 1, rnk = FLOOR(cnt / 2) + 1);