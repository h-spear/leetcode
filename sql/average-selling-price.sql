-- https://leetcode.com/problems/average-selling-price/

SELECT P.product_id
     , ROUND(SUM(P.price * US.units) / SUM(US.units), 2) AS average_price
  FROM Prices P
  JOIN UnitsSold US
    ON P.product_id = US.product_id
 WHERE US.purchase_date BETWEEN P.start_date AND P.end_date
 GROUP BY product_id;