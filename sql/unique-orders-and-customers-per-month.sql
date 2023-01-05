-- https://leetcode.com/problems/unique-orders-and-customers-per-month/

SELECT DATE_FORMAT(order_date, "%Y-%m") AS month
     , COUNT(*) AS order_count
     , COUNT(DISTINCT customer_id) AS customer_count
  FROM Orders
 WHERE invoice > 20
 GROUP BY month;
