-- https://leetcode.com/problems/exchange-seats/

SELECT IF(id % 2 = 0
          , id - 1
          , IF (id = (SELECT COUNT(id) FROM Seat), id, id + 1)
         ) AS id
     , student
  FROM Seat
 ORDER BY id