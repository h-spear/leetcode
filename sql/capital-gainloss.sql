-- https://leetcode.com/problems/capital-gainloss/

SELECT stock_name
     , SUM(price) AS capital_gain_loss
  FROM (SELECT stock_name,
               (CASE WHEN operation = 'Buy' THEN -price
                     WHEN operation = 'Sell' THEN price END) AS price
          FROM Stocks) SUB
 GROUP BY stock_name;
