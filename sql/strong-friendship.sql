-- https://leetcode.com/problems/strong-friendship/

WITH AllFriendship AS(
    SELECT user1_id AS user_id, user2_id AS friend_id
      FROM Friendship
     UNION
    SELECT user2_id AS user_id, user1_id AS friend_id
      FROM Friendship
)

SELECT F1.user_id AS user1_id
     , F2.user_id AS user2_id
     , COUNT(F2.friend_id) AS common_friend
  FROM AllFriendship F1
  JOIN AllFriendship F2
    ON F1.user_id < F2.user_id AND
       F1.user_id <> F2.user_id AND 
       F1.friend_id = F2.friend_id
 WHERE (F1.user_id, F2.user_id) IN (SELECT * FROM Friendship)      -- 이 부분 실수
 GROUP BY F1.user_id, F2.user_id
HAVING COUNT(F1.friend_id) >= 3;