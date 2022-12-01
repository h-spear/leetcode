-- https://leetcode.com/problems/queries-quality-and-percentage/

SELECT query_name

     , ROUND(
            SUM(rating / position) 
             / COUNT(position), 2) AS quality

     , ROUND(
            COUNT(CASE WHEN rating < 3 THEN 1 END)
             / COUNT(position) * 100, 2) AS poor_query_percentage

  FROM Queries
 GROUP BY query_name;