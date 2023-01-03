-- https://leetcode.com/problems/all-the-matches-of-the-league/

SELECT T1.team_name AS home_team
     , T2.team_name AS away_team
  FROM Teams T1
  JOIN Teams T2
    ON T1.team_name <> T2.team_name;