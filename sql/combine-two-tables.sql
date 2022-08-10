-- https://leetcode.com/problems/combine-two-tables/

SELECT firstName
     , lastName
     , city
     , state
  FROM Person P LEFT JOIN Address A
    ON P.personId = A.personId;