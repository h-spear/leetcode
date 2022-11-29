-- https://leetcode.com/problems/product-sales-analysis-i/

SELECT P.product_name AS product_name
     , S.year AS year
     , S.price AS price
  FROM Product P
  JOIN Sales S
    ON P.product_id = S.product_id;