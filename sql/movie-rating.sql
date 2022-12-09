-- https://leetcode.com/problems/movie-rating/

(SELECT U.name AS results
   FROM Users U
   JOIN MovieRating MR
     ON U.user_id = MR.user_id
  GROUP BY U.user_id
  ORDER BY COUNT(U.user_id) DESC, U.name
  LIMIT 1)

  UNION 

(SELECT M.title AS results
   FROM Movies M
   JOIN MovieRating MR
     ON M.movie_id = MR.movie_id
  WHERE YEAR(MR.created_at) = 2020 AND 
        MONTH(MR.created_at) = 2
  GROUP BY M.movie_id
  ORDER BY AVG(MR.rating) DESC, M.title
  LIMIT 1)