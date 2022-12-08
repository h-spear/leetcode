-- https://leetcode.com/problems/customers-who-bought-all-products/

SELECT C.customer_id AS customer_id
  FROM Customer C
  JOIN Product P
    ON C.product_key = P.product_key
 GROUP BY C.customer_id
HAVING COUNT(DISTINCT P.product_key) = (SELECT COUNT(*) FROM Product);