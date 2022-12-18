-- https://leetcode.com/problems/maximum-transaction-each-day/

WITH MaxAmounts AS (
    SELECT DATE_FORMAT(day, "%Y-%m-%d") AS date
         , MAX(amount) AS max_amount
     FROM Transactions
    GROUP BY date
)

SELECT T.transaction_id AS transaction_id
  FROM Transactions T
  JOIN MaxAmounts MA
    ON DATE_FORMAT(day, "%Y-%m-%d") = MA.date
 WHERE T.amount = MA.max_amount
 ORDER BY transaction_id;


-- Follow up: Could you solve it without using the MAX() function?
SELECT transaction_id
  FROM Transactions T
 WHERE amount = (SELECT amount
                   FROM Transactions 
                  WHERE DATE_FORMAT(day, "%Y-%m-%d") = DATE_FORMAT(T.day, "%Y-%m-%d")
                  ORDER BY amount DESC
                  LIMIT 1) 
 ORDER BY transaction_id;