-- https://leetcode.com/problems/the-most-recent-three-orders/

WITH AddRankTable AS (
    SELECT order_id
         , order_date
         , customer_id
         , DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS ranking
      FROM Orders
     ORDER BY customer_id, ranking
)

SELECT C.name AS customer_name
     , C.customer_id AS customer_id
     , A.order_id AS order_id
     , A.order_date AS order_date
  FROM Customers C
  JOIN AddRankTable A
    ON C.customer_id = A.customer_id
 WHERE A.ranking <= 3
 ORDER BY customer_name, customer_id, order_date DESC;
