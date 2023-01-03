-- https://leetcode.com/problems/convert-date-format/
-- %W : 요일
-- %d : 일(09)  /  %e : 일(9)

SELECT DATE_FORMAT(day, "%W, %M %e, %Y") AS day
  FROM Days;