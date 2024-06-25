SELECT ha.hacker_id, ha.name
FROM Hackers AS ha
JOIN (
	SELECT sa.hacker_id,
 	SUM(CASE WHEN df.score=sa.score THEN 1 ELSE 0 END) AS full_score_count 
FROM Submissions AS sa 
JOIN Challenges ch ON sa.challenge_id=ch.challenge_id
JOIN Difficulty AS df ON ch.difficulty_level= df.difficulty_level
GROUP BY sa.hacker_id
) AS sub 
ON ha.hacker_id = sub.hacker_id
WHERE sub.full_score_count >1
ORDER BY sub.full_score_count DESC,ha.hacker_id ASC;