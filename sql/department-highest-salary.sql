-- https://leetcode.com/problems/department-highest-salary/

SELECT D.name AS Department
     , E.name AS Employee
     , E.salary AS Salary
  FROM Employee E
  JOIN Department D
    ON E.departmentId = D.id
 WHERE E.salary = (SELECT MAX(salary)
                     FROM Employee EE
                    WHERE EE.departmentId = D.id);
