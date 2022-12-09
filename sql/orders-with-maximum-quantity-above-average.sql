-- https://leetcode.com/problems/orders-with-maximum-quantity-above-average/

WITH MaxAverage AS (
    SELECT AVG(quantity) AS average
      FROM OrdersDetails
     GROUP BY order_id
     ORDER BY average DESC
     LIMIT 1
)

SELECT order_id
  FROM OrdersDetails
 GROUP BY order_id
HAVING MAX(quantity) > (SELECT average FROM MaxAverage);