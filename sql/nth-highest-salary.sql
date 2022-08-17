-- https://leetcode.com/problems/nth-highest-salary/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  DECLARE IDX INT;
  SET IDX = N - 1;
  RETURN (
      SELECT (CASE WHEN N <= COUNT(DISTINCT salary)
                        THEN (SELECT DISTINCT salary
                                FROM Employee
                               ORDER BY salary DESC
                               LIMIT 1
                              OFFSET IDX)
                   ELSE NULL END)
        FROM Employee
  );
END