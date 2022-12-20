-- https://leetcode.com/problems/active-users/

SELECT DISTINCT A.id AS id
     , A.name AS name

  FROM Accounts A
  JOIN (SELECT id
             , login_date
             , DATE_SUB(login_date,
                        INTERVAL DENSE_RANK() OVER (PARTITION BY id ORDER BY login_date) DAY
                        ) AS start_date
          FROM Logins) SUB
    ON A.id = SUB.id  

 GROUP BY id, name, start_date
HAVING COUNT(DISTINCT login_date) >= 5
 ORDER BY id;