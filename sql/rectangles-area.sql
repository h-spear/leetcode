-- https://leetcode.com/problems/rectangles-area/

SELECT P1.id AS P1
     , P2.id AS P2
     , (ABS(P1.x_value - P2.x_value) * ABS(P1.y_value - P2.y_value)) AS AREA
  FROM Points P1
  JOIN Points P2
    ON P1.id < P2.id
 WHERE P1.x_value <> P2.x_value AND P1.y_value <> P2.y_value
 ORDER BY AREA DESC, P1.id, P2.id;