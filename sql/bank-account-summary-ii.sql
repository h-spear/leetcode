-- https://leetcode.com/problems/bank-account-summary-ii/

SELECT U.name AS name
     , SUM(T.amount) AS balance
  FROM Users U JOIN Transactions T
    ON U.account = T.account
 GROUP BY U.account
 HAVING SUM(T.amount) >= 10000;