-- https://leetcode.com/problems/game-play-analysis-iii/submissions/
-- 참고 : https://gent.tistory.com/511

SELECT player_id
     , event_date
     , SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
  FROM Activity
