-- https://leetcode.com/problems/warehouse-manager/

SELECT W.name AS warehouse_name 
     , SUM(P.Width * P.Length * P.Height * W.units) AS volume
  FROM Warehouse W
  JOIN Products P
    ON W.product_id = P.product_id
 GROUP BY W.name;