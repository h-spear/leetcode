-- https://leetcode.com/problems/apples-oranges/

SELECT S1.sale_date
     , S1.sold_num - S2.sold_num AS diff
  FROM Sales S1
  JOIN Sales S2
    ON S1.sale_date = S2.sale_date AND
       S1.fruit <> S2.fruit
 WHERE S1.fruit = 'apples';