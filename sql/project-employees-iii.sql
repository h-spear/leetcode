-- https://leetcode.com/problems/project-employees-iii/

WITH Experience AS ( 
    SELECT P.project_id, P.employee_id
        , E.experience_years
    FROM Project P 
    JOIN Employee E
        ON P.employee_id = E.employee_id
)

SELECT E.project_id, E.employee_id
  FROM Experience E

  JOIN (SELECT project_id
             , MAX(experience_years) AS most_experience_years
          FROM Experience
         GROUP BY project_id) SUB
    ON E.project_id = SUB.project_id AND
       E.experience_years = SUB.most_experience_years;
