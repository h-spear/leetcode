-- https://leetcode.com/problems/evaluate-boolean-expression/

SELECT left_operand, operator, right_operand
     , IF(CASE
            WHEN operator = '<' THEN
            (SELECT value FROM Variables WHERE name = left_operand) > 
            (SELECT value FROM Variables WHERE name = right_operand)
            WHEN operator = '>' THEN
            (SELECT value FROM Variables WHERE name = left_operand) < 
            (SELECT value FROM Variables WHERE name = right_operand)
            WHEN operator = '=' THEN
            (SELECT value FROM Variables WHERE name = left_operand) =
            (SELECT value FROM Variables WHERE name = right_operand)
            END = 1, 'true', 'false') as value
  FROM Expressions