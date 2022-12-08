-- https://leetcode.com/problems/restaurant-growth/

WITH Amount AS(
    SELECT visited_on
         , SUM(amount) AS amount
      FROM Customer
     GROUP BY visited_on
)

SELECT visited_on
     , (SELECT SUM(amount)
          FROM Amount
         WHERE visited_on >= DATE_ADD(A.visited_on, INTERVAL -6 DAY) AND
               visited_on <= A.visited_on) AS amount
     , (SELECT ROUND(AVG(amount), 2)
          FROM Amount
         WHERE visited_on >= DATE_ADD(A.visited_on, INTERVAL -6 DAY) AND
               visited_on <= A.visited_on) AS average_amount

FROM Amount A

LIMIT 123456789 OFFSET 6;