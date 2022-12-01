-- https://leetcode.com/problems/monthly-transactions-i/

SELECT DATE_FORMAT(trans_date, "%Y-%m") AS month
     , country
     , count(*) AS trans_count
     , count(CASE WHEN state = 'approved' THEN 1 END) AS approved_count
     , SUM(amount) AS trans_total_amount
     , SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
  FROM Transactions
 GROUP BY DATE_FORMAT(trans_date, "%Y-%m"), country;