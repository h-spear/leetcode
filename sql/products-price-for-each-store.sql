-- https://leetcode.com/problems/products-price-for-each-store/

SELECT DISTINCT P.product_id
     , (SELECT price FROM Products WHERE product_id = P.product_id AND store = 'store1') AS store1
     , (SELECT price FROM Products WHERE product_id = P.product_id AND store = 'store2') AS store2
     , (SELECT price FROM Products WHERE product_id = P.product_id AND store = 'store3') AS store3
  FROM Products P;