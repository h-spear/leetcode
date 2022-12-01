-- https://leetcode.com/problems/project-employees-ii/

SELECT project_id
  FROM Project P
 GROUP BY P.project_id
HAVING COUNT(P.project_id) =
                (SELECT COUNT(*)
                   FROM Project
                  GROUP BY project_id
                  ORDER BY COUNT(*) DESC
                  LIMIT 1);