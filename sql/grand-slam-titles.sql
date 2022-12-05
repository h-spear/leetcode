-- https://leetcode.com/problems/grand-slam-titles/

WITH Grandslams AS (
    (SELECT Wimbledon AS grand_slams
    FROM Championships)
    UNION ALL
    (SELECT Fr_open AS grand_slams
    FROM Championships)
    UNION ALL
    (SELECT US_open AS grand_slams
    FROM Championships)
    UNION ALL
    (SELECT Au_open AS grand_slams
    FROM Championships)
)

SELECT G.grand_slams AS player_id
     , P.player_name AS player_name
     , COUNT(*) AS grand_slams_count
  FROM Grandslams G
  JOIN Players P
    ON P.player_id = G.grand_slams
 GROUP BY G.grand_slams;