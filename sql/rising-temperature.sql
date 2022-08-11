-- https://leetcode.com/problems/rising-temperature/

SELECT W1.id
  FROM Weather W1 JOIN Weather W2
    ON DATE_SUB(W1.recordDate, INTERVAL 1 DAY) = W2.recordDate
 WHERE W1.temperature > W2.temperature;