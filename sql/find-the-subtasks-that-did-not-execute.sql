-- https://leetcode.com/problems/find-the-subtasks-that-did-not-execute/

WITH RECURSIVE cte AS (
    SELECT task_id, 1 AS subtask_id
      FROM Tasks
    UNION ALL
    SELECT task_id, subtask_id + 1
      FROM cte
     WHERE subtask_id < (SELECT subtasks_count FROM Tasks WHERE task_id = cte.task_id)
)

SELECT task_id, subtask_id
  FROM cte
 WHERE (task_id, subtask_id) NOT IN (SELECT * FROM Executed);