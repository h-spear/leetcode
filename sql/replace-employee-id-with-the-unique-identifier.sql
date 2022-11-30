-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/

SELECT unique_id
     , name
  FROM Employees E
  LEFT JOIN EmployeeUNI EUNI
    ON E.id = EUNI.id;