-- https://leetcode.com/problems/report-contiguous-dates/

WITH AddState AS (
    SELECT 'succeeded' AS period_state
         , success_date AS start_date
      FROM Succeeded
     WHERE YEAR(success_date) = 2019
     UNION 
    SELECT 'failed' AS period_state
         , fail_date AS start_date
      FROM Failed
     WHERE YEAR(fail_date) = 2019
), GroupTable AS (
    SELECT period_state, start_date
        , (ROW_NUMBER() OVER (ORDER BY start_date) -
                    ROW_NUMBER() OVER (PARTITION BY period_state ORDER BY start_date)) AS group_id
    FROM AddState
    ORDER BY start_date
)

SELECT period_state
     , start_date
     , MAX(start_date) AS end_date
 FROM GroupTable
 GROUP BY period_state, group_id;
