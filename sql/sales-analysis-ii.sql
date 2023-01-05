-- https://leetcode.com/problems/sales-analysis-ii/

WITH S8Buyer AS(
    SELECT DISTINCT buyer_id
    FROM Sales S
    JOIN Product P
      ON S.product_id = P.product_id
   WHERE P.product_name = 'S8'
), IPhoneBuyer AS(
    SELECT DISTINCT buyer_id
    FROM Sales S
    JOIN Product P
      ON S.product_id = P.product_id
   WHERE P.product_name = 'iPhone'
)

SELECT buyer_id
  FROM S8Buyer
 WHERE buyer_id NOT IN (SELECT buyer_id FROM IPhoneBuyer)
 