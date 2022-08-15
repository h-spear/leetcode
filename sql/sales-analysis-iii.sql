-- https://leetcode.com/problems/sales-analysis-iii/

SELECT DISTINCT P.product_id AS product_id
     , P.product_name AS product_name
  FROM Product P JOIN Sales S
    ON P.product_id = S.product_id
 GROUP BY P.product_id, P.product_name
HAVING (MAX(S.sale_date) BETWEEN '2019-01-01' AND '2019-03-31') AND
       (MIN(S.sale_date) BETWEEN '2019-01-01' AND '2019-03-31');