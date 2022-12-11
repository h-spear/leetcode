-- https://leetcode.com/problems/running-total-for-different-genders/
-- https://leetcode.com/problems/running-total-for-different-genders/solutions/2901623/using-variable-beats-99-80-mysql/

SELECT gender
     , day
     , (CASE WHEN gender ='M'
            THEN @val1 := @val1 + score_points
            ELSE @val2 := @val2 + score_points
            END) AS total
  FROM Scores, (SELECT @val1 := 0, @val2 := 0) Variable
 ORDER BY gender, day;