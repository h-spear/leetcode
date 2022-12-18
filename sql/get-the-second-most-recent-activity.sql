-- https://leetcode.com/problems/get-the-second-most-recent-activity/

SELECT username
     , activity
     , startDate
     , endDate

  FROM (SELECT username AS username
             , activity AS activity 
             , startDate AS startDate
             , endDate AS endDate
             , RANK() OVER (PARTITION BY username ORDER BY startDate DESC) AS ranks
             , COUNT(*) OVER (PARTITION BY username) AS activityCount
         FROM UserActivity) SUB

 WHERE activityCount = 1 OR
       ranks = 2;