-- https://leetcode.com/problems/biggest-single-number/

SELECT IF (COUNT(num) = 1, num, null) AS num
  FROM MyNumbers
 GROUP BY num
 ORDER BY COUNT(num), num DESC 
 LIMIT 1;