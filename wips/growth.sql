SELECT users.*, COUNT(followers.followee_id) AS follower_count
FROM users
INNER JOIN followers ON users.id = followers.follower_id
WHERE users.created_at > (current_timestamp - interval '2 weeks')
AND users.created_at < (current_timestamp - interval '1 week')
AND users.last_sign_in_at > (current_timestamp - interval '1 week')
AND users.last_sign_in_at < (current_timestamp)
GROUP BY users.id


SELECT COUNT(*) FROM
(SELECT users.id, COUNT(followers.followee_id) AS follower_count
FROM users
INNER JOIN followers ON users.id = followers.follower_id
INNER JOIN profiles ON users.id = profiles.user_id
WHERE users.created_at > (current_timestamp - interval '2 weeks')
AND users.created_at < (current_timestamp - interval '1 week')
AND users.updated_at > (current_timestamp - interval '1 week')
AND users.updated_at < (current_timestamp)
AND profiles.gender = 1
GROUP BY users.id) t
WHERE t.follower_count >= 5



SELECT users.created_at::date AS creation_date, (COUNT(reactions.id)/COUNT (DISTINCT users.id)) AS d0_mean_reactions_count
FROM users
INNER JOIN reactions ON users.id = reactions.user_id
WHERE users.created_at > current_date - interval '4 months'
AND reactions.user_id = users.id
AND reactions.created_at > users.created_at
AND reactions.created_at <= users.created_at + interval '1 day'
AND users.platform = 1
GROUP BY users.created_at::date
