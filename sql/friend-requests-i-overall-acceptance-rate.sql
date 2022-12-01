-- https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/

SELECT 
    IFNULL(ROUND(
        (SELECT COUNT(DISTINCT requester_id, accepter_id)
           FROM RequestAccepted) /
        (SELECT COUNT(DISTINCT sender_id, send_to_id)
           FROM FriendRequest)
        , 2), 0)AS accept_rate;