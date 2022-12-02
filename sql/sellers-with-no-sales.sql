-- https://leetcode.com/problems/sellers-with-no-sales/

SELECT S.seller_name AS SELLER_NAME
  FROM Seller S
  LEFT JOIN Orders O
    ON O.seller_id = S.seller_id
 WHERE NOT (SELECT COUNT(seller_id)
              FROM Orders
             WHERE seller_id = S.seller_id AND
                   YEAR(sale_date) = 2020)
 ORDER BY S.seller_name;