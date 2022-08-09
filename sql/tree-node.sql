# https://leetcode.com/problems/tree-node/

SELECT T1.id AS id
     , (CASE WHEN T1.p_id IS NULL THEN 'Root'
             WHEN MIN(T2.id) IS NULL THEN 'Leaf'
             ELSE 'Inner' END) AS type
  FROM Tree T1 LEFT JOIN Tree T2
    ON T1.id = T2.p_id
 GROUP BY T1.ID, T1.p_id;