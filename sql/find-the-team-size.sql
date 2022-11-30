-- https://leetcode.com/problems/find-the-team-size/

SELECT E1.employee_id AS employee_id
     , (SELECT COUNT(team_id)
          FROM Employee E2
         WHERE E2.team_id = E1.team_id) AS team_size
         
  FROM Employee E1;