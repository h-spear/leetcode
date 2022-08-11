-- https://leetcode.com/problems/sales-person/

SELECT name
  FROM SalesPerson S
 WHERE S.sales_id NOT IN (SELECT sales_id
                            FROM Company C JOIN Orders O
                              ON C.com_id = O.com_id
                           WHERE C.name = 'RED');