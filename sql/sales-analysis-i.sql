-- https://leetcode.com/problems/sales-analysis-i/

WITH MaximumTotalPrice AS (
    SELECT SUM(price) AS maximum_price
      FROM Sales
     GROUP BY seller_id
     ORDER BY maximum_price DESC
     LIMIT 1
)

SELECT seller_id
  FROM Sales
 GROUP BY seller_id
HAVING SUM(price) = (SELECT maximum_price
                       FROM MaximumTotalPrice);