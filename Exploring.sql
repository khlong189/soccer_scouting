-- Average number of goals scored by players in each academy ( at least 15 games per season)
WITH player_attk_stats AS (
   SELECT p.academy_id, a.goals, a.season
   FROM players p
   JOIN player_stat ps ON p.player_id = ps.player_id
   JOIN attack a ON ps.attk_id = a.attk_id
   WHERE ps.pos = 'attacker' AND a.games >= 15
)
SELECT a.academy_name, ps.season, AVG(goals) AS avg_gls
FROM academies a
LEFT JOIN player_attk_stats ps ON a.academy_id = ps.academy_id
GROUP BY a.academy_name, ps.season;

-- Whether a player has a shooting accuracy of at least 70%
WITH filtered_players AS (
   SELECT player_id
   FROM player_stat ps
   JOIN attack a ON ps.attk_id = a.attk_id
   WHERE shoot_acc >= 0.7 
)
SELECT p.first_name, p.last_name, a.shoot_acc
FROM players p 
JOIN player_stat ps ON p.player_id = ps.player_id
JOIN attack ON ps.attk_id = a.attk_id
WHERE ps.player_id IN (SELECT * FROM filtered_players);

-- teamplay factors for at least 10 games
WITH player_teamplay_stats AS (
   SELECT p.first_name, p.last_name, tp.assists, tp.big_chances, tp.crss_acc, tp.season
   FROM players p 
   JOIN player_stat ps ON p.player_id = ps.player_id
   JOIN teamplay tp ON ps.tp_id = tp.tp_id
   WHERE tp.games >= 10
)
SELECT first_name, last_name, season, SUM(assists) AS total_assists, SUM(big_chances) AS total_big_chances, AVG(crss_acc) AS average_cross_accuracy
FROM player_teamplay_stats
GROUP BY 1,2,3;

-- Does a player win multiple awards in different seasons
WITH player_award_counts AS (
   SELECT p.first_name, p.last_name, a.award_name, COUNT(*) AS num_awards
   FROM players p 
   JOIN awards a ON p.player_id = a.player_id
   GROUP BY 1,2,3
   HAVING COUNT(*) > 1 -- at least 1 award per season
)
SELECT first_name, last_name, award_name
FROM player_award_counts;

-- Whether a player is managed by a renowned agent?
-- If an agent manages players from more than one academy and the count of distinct 
-- players is greater than 5, they are considered a renowned agent. 
WITH agent_popularity AS (
	SELECT p.first_name, p.last_name, a.first_name AS agent_first_name, a.last_name AS agent_last_name,
		CASE
			WHEN COUNT(DISTINCT p.academy_id) > 1 AND COUNT(DISTINCT p.player_id) > 5 THEN 'Renowned Agent'
			ELSE 'Not Renowned Agent'
		END AS agent_status
	FROM players p 
	JOIN agents a ON p.agent_id = a.agent_id
)

SELECT * 
FROM agent_popularity
WHERE agent_status is 'Renowned Agent';