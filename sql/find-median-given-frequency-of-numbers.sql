-- https://leetcode.com/problems/find-median-given-frequency-of-numbers/

WITH RECURSIVE CTE AS(
    SELECT num, 1 AS t
      FROM Numbers
     UNION ALL
    SELECT num, t + 1
      FROM CTE
     WHERE CTE.t < (SELECT frequency FROM Numbers WHERE num = CTE.num)
), RankTable AS (
    SELECT num
         , RANK() OVER (ORDER BY num, t) AS rnk
         , COUNT(*) OVER () as cnt
      FROM CTE
)

SELECT AVG(num) AS median
  FROM RankTable
 WHERE IF (cnt % 2 = 0, rnk IN (cnt / 2, cnt / 2 + 1), rnk = FLOOR(cnt / 2) + 1);