-- https://leetcode.com/problems/page-recommendations/

SELECT DISTINCT page_id AS recommended_page
  FROM Likes L
  JOIN (SELECT IF(user1_id > user2_id, user1_id, user2_id) AS friend
        FROM Friendship
        WHERE IF(user1_id < user2_id, user1_id, user2_id) = 1) F
    ON L.user_id = F.friend
 WHERE page_id NOT IN (SELECT page_id 
                         FROM Likes 
                        WHERE user_id = 1);