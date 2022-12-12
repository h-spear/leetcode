-- https://leetcode.com/problems/the-most-frequently-ordered-products-for-each-customer/

SELECT O.customer_id, O.product_id, P.product_name
  FROM Orders O
  JOIN Products P
    ON O.product_id = P.product_id
 GROUP BY O.customer_id, O.product_id
HAVING COUNT(*) = (SELECT COUNT(*) AS count
                     FROM Orders
                    WHERE customer_id = O.customer_id
                    GROUP BY customer_id, product_id
                    ORDER BY count DESC
                    LIMIT 1)
 ORDER BY product_id, product_name, customer_id;