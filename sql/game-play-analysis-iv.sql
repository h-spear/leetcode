-- https://leetcode.com/problems/game-play-analysis-iv/

SELECT ROUND(
        COUNT(DISTINCT A1.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity)
            , 2) AS fraction

  FROM Activity A1

  JOIN (SELECT player_id, MIN(event_date) AS event_date
          FROM Activity
         GROUP BY player_id) A2

    ON A1.player_id = A2.player_id AND
       A1.event_date = DATE_ADD(A2.event_date, INTERVAL 1 DAY)