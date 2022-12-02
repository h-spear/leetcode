-- https://leetcode.com/problems/customers-who-bought-products-a-and-b-but-not-c/

SELECT O.customer_id
     , C.customer_name
  FROM Orders O
  JOIN Customers C
    ON O.customer_id = C.customer_id
 GROUP BY O.customer_id
 HAVING COUNT(CASE WHEN O.product_name = 'A' THEN 1 END) >= 1 AND
        COUNT(CASE WHEN O.product_name = 'B' THEN 1 END) >= 1 AND
        COUNT(CASE WHEN O.product_name = 'C' THEN 1 END) <= 0;