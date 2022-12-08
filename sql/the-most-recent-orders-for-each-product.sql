-- https://leetcode.com/problems/the-most-recent-orders-for-each-product/

WITH RecentOrderDate AS (
    SELECT product_id
         , MAX(order_date) AS recent_order_date
      FROM Orders 
     GROUP BY product_id
)

SELECT P.product_name 
     , P.product_id
     , O.order_id
     , O.order_date
  FROM Products P

  JOIN Orders O
    ON P.product_id = O.product_id

 WHERE O.order_date IN (SELECT recent_order_date
                          FROM RecentOrderDate
                         WHERE product_id = P.product_id)
                         
 ORDER BY P.product_name, P.product_id, O.order_id;