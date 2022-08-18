-- https://leetcode.com/problems/trips-and-users/
-- Runtime: 412 ms, faster than 97.94% of MySQL online submissions for Trips and Users.
-- ** COUNT함수에 조건 설정하는 방법
-- ** COUNT(CASE WHEN (조건식) THEN 1 END) AS '별칭' 

SELECT request_at AS 'Day'
     , ROUND(
         COUNT(CASE WHEN T.status <> 'completed' THEN 1 END)
                      / COUNT(T.request_at), 2
       ) AS 'Cancellation Rate'
       
  FROM Trips T
  
  JOIN Users U1 ON T.client_id = U1.users_id
  JOIN Users U2 ON T.driver_id = U2.users_id
  
 WHERE T.request_at BETWEEN '2013-10-01' AND '2013-10-03' AND
       U1.banned = 'No' AND 
       U2.banned = 'No'
       
 GROUP BY T.request_at;