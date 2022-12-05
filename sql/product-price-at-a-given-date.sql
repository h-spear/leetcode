-- https://leetcode.com/problems/product-price-at-a-given-date/

WITH LastUpdate AS(
    SELECT product_id
         , MAX(change_date) AS change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

SELECT DISTINCT P.product_id
     , IF(L.change_date, P.new_price, 10) AS price

  FROM Products P 
  LEFT JOIN LastUpdate L
    ON P.product_id = L.product_id 

 WHERE P.change_date = L.change_date OR
       L.change_date IS NULL;