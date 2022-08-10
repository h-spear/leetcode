-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/

SELECT customer_id
     , COUNT(customer_id) AS count_no_trans
  FROM Visits V LEFT JOIN Transactions T
    ON V.visit_id = T.visit_id
 WHERE transaction_id IS NULL
 GROUP BY customer_id;