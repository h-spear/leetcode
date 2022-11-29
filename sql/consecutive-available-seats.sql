-- https://leetcode.com/problems/consecutive-available-seats/

SELECT DISTINCT C1.seat_id
  FROM Cinema C1
  JOIN Cinema C2
    ON C1.seat_id = C2.seat_id + 1 OR C1.seat_id = C2.seat_id - 1
 WHERE C1.free = 1 AND C2.free = 1
 ORDER BY C1.seat_id;