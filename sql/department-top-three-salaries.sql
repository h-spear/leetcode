-- https://leetcode.com/problems/department-top-three-salaries/

SELECT Department
     , Employee
     , Salary

  FROM (SELECT E.name AS Employee
             , E.salary AS Salary
             , D.name AS Department
             , (DENSE_RANK() OVER (PARTITION BY E.departmentId ORDER BY E.salary DESC)) AS Ranking
          FROM Employee E JOIN Department D
            ON E.departmentId = D.id) SUB

 WHERE Ranking <= 3;