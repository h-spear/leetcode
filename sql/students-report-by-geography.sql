-- https://leetcode.com/problems/students-report-by-geography/

WITH AmericaTable AS
(SELECT @val1 := @val1 + 1 AS id
     , name AS America
  FROM Student, (SELECT @val1 := 0) AS Variable
  WHERE continent = 'America'
  ORDER BY name
), AsiaTable AS
(SELECT @val2 := @val2 + 1 AS id
     , name AS Asia
  FROM Student, (SELECT @val2 := 0) AS Variable
  WHERE continent = 'Asia'
  ORDER BY name
), EuropeTable AS
(SELECT @val3 := @val3 + 1 AS id
     , name AS Europe
  FROM Student, (SELECT @val3 := 0) AS Variable
  WHERE continent = 'Europe'
  ORDER BY name
)

SELECT America, Asia, Europe
  FROM AmericaTable AMT
  LEFT JOIN AsiaTable AST
    ON AMT.id = AST.id
  LEFT JOIN EuropeTable ET
    ON AMT.id = ET.id;