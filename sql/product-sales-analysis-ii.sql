-- https://leetcode.com/problems/product-sales-analysis-ii/

SELECT P.product_id AS product_id
     , SUM(S.quantity) AS total_quantity
  FROM Sales S
  JOIN Product P
    ON S.product_id = P.product_id
 GROUP BY P.product_id;