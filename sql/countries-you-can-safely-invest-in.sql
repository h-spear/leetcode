-- https://leetcode.com/problems/countries-you-can-safely-invest-in/

with AllCall as(
    (SELECT C.caller_id AS id
          , C.duration
       FROM Calls C) 

      UNION
        
    (SELECT C.callee_id AS id
          , C.duration
       FROM Calls C) 
)

SELECT C.name AS country
  FROM AllCall AC

  JOIN Person P
    ON AC.id = P.id

  JOIN Country C
    ON LEFT(P.phone_number, 3) = C.country_code

 GROUP BY C.name
HAVING AVG(AC.duration * 1.0) > (SELECT AVG(duration) FROM calls);