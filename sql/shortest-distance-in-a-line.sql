-- https://leetcode.com/problems/shortest-distance-in-a-line/

SELECT MIN(ABS(P1.x - P2.x)) AS shortest
  FROM Point P1, Point P2
 WHERE P1.x <> P2.x;