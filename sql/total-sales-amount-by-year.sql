-- https://leetcode.com/problems/total-sales-amount-by-year/

WITH Years AS(
    SELECT '2018' AS year
         , '2018-01-01' AS start_date
         ,' 2018-12-31' AS end_date
     UNION 
    SELECT '2019' AS year
         , '2019-01-01' AS start_date
         ,' 2019-12-31' AS end_date
     UNION
    SELECT '2020' AS year
         , '2020-01-01' AS start_date
         ,' 2020-12-31' AS end_date
)

SELECT S.product_id AS product_id
     , P.product_name AS product_name
     , Y.year AS report_year
     , (DATEDIFF
           (LEAST(period_end, Y.end_date),
            GREATEST(period_start, y.start_date)
        ) + 1) * average_daily_sales AS total_amount
        
  FROM Years Y, Sales S

  JOIN Product P
    ON S.product_id = P.product_id

 WHERE (DATEDIFF
           (LEAST(period_end, Y.end_date),
            GREATEST(period_start, y.start_date)
        ) + 1) > 0

 ORDER BY S.product_id, report_year;