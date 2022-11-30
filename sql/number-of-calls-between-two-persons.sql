-- https://leetcode.com/problems/number-of-calls-between-two-persons/

SELECT person1
     , person2
     , COUNT(person1) AS call_count
     , SUM(duration) AS total_duration

  FROM
    (SELECT IF (from_id < to_id, from_id, to_id) AS person1
          , IF (from_id < to_id, to_id, from_id) AS person2
          , duration
       FROM Calls) SUB
       
 GROUP BY person1, person2;
