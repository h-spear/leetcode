-- https://leetcode.com/problems/npv-queries/

SELECT Q.id AS id 
     , Q.year AS year
     , IFNULL(N.npv, 0) AS npv
  FROM Queries Q
  LEFT JOIN NPV N
    ON Q.id = N.id AND
       Q.year = N.year;