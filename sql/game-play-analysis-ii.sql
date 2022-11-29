-- https://leetcode.com/problems/game-play-analysis-ii/

SELECT A1.player_id AS player_id
     , A1.device_id AS device_id
  FROM Activity A1
 WHERE (A1.player_id, A1.event_date) IN (
        SELECT
          A2.player_id, 
          MIN(A2.event_date)
        FROM
          Activity A2
        GROUP BY
          A2.player_id
 );