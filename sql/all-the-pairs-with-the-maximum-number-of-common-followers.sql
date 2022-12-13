-- https://leetcode.com/problems/all-the-pairs-with-the-maximum-number-of-common-followers/

WITH MaxCommon AS (
    SELECT R1.user_id AS user1_id
        , R2.user_id AS user2_id
        , COUNT(R1.follower_id) AS max_common
    FROM Relations R1
    JOIN Relations R2
        ON R1.follower_id = R2.follower_id AND
        R1.user_id < R2.user_id
    GROUP BY R1.user_id, R2.user_id
)

SELECT user1_id
     , user2_id
  FROM MaxCommon
 WHERE max_common = (SELECT MAX(max_common) FROM MaxCommon);