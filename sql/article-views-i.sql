-- https://leetcode.com/problems/article-views-i/

SELECT DISTINCT author_id AS id
  FROM Views
 ORDER BY author_id
 WHERE author_id = viewer_id