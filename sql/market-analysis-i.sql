-- https://leetcode.com/problems/market-analysis-i/

SELECT U.user_id AS buyer_id
     , U.join_date AS join_date
     , (SELECT COUNT(*)
          FROM Orders O
         WHERE O.buyer_id = U.user_id AND
               YEAR(O.order_date) = 2019) AS orders_in_2019
  FROM Users U;