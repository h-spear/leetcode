-- https://leetcode.com/problems/active-businesses/ 

WITH Avgs AS(
    SELECT event_type
         , AVG(occurences) AS average_occurences
      FROM Events
     GROUP BY event_type
)

SELECT business_id
  FROM Events E
  JOIN Avgs A
    ON E.event_type = A.event_type
 WHERE E.occurences > A.average_occurences
 GROUP BY E.business_id
HAVING COUNT(*) > 1;