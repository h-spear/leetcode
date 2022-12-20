-- https://leetcode.com/problems/the-number-of-seniors-and-juniors-to-join-the-company-ii/

WITH Senior AS (
SELECT employee_id
        , salary
        , @val := @val + salary AS prefix_sum
        , IF (@val <= 70000, 1, 0) AS possible
    FROM Candidates, (SELECT @val := 0) Variable
    WHERE experience = 'Senior'
    ORDER BY salary
), Junior AS(
    SELECT employee_id
        , salary
        , @val2 := @val2 + salary AS prefix_sum
        , IF (@val2 <= 70000 - (SELECT IFNULL(MAX(Senior.prefix_sum), 0) FROM Senior WHERE possible = 1), 1, 0) AS possible
    FROM Candidates, (SELECT @val2 := 0) Variable
    WHERE experience = 'Junior'
    ORDER BY salary
)

SELECT employee_id
  FROM Senior
 WHERE possible = 1
 UNION
SELECT employee_id
  FROM Junior
 WHERE possible = 1;