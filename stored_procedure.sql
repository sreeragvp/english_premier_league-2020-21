DELIMITER $$
CREATE PROCEDURE all_team_squad()
BEGIN
SELECT 
     player.id,
     CONCAT(first_name,' ',last_name) FullName,
     player_position.position AS Position,
     club_name
FROM 
     player
JOIN club ON club.id = player.club_id
JOIN player_position ON player_position.player_id = player.id
ORDER BY club_name;
END $$
DELIMITER ;






DELIMITER $$
CREATE PROCEDURE player_details()
BEGIN
SELECT 
      player.id,
      first_name,
      last_name,
      age,
      country,
      club.club_name
FROM
     player
JOIN club ON club.id = player.assists
ORDER BY club_name, age;
END $$
DELIMITER ;



DELIMITER $$
CREATE PROCEDURE top_goal_scorer ()
BEGIN
SELECT 
      player.id,
      CONCAT(first_name,' ',last_name) full_name,
      player_position.position AS position,
      club.club_name,
      SUM(player.goals_scored) AS Goals
FROM 
     player
JOIN club ON club.id = player.club_id
JOIN player_position ON player_position.player_id = player.id
WHERE player.goals_scored > 0
GROUP BY player.id
ORDER BY Goals DESC;
END $$
DELIMITER ;



DELIMITER $$
CREATE PROCEDURE top_penalty_takers ()
BEGIN
SELECT 
      player.id,
      CONCAT(first_name,' ',last_name) full_name,
      player_position.position AS position,
      club.club_name,
      SUM(penalty_taken) AS penalty_taken,
      SUM(penalty_scored) AS penalty_scored
FROM 
     player
JOIN club ON club.id = player.club_id
JOIN player_position ON player_position.player_id = player.id
WHERE player.penalty_taken > 0
GROUP BY player.id
ORDER BY player.penalty_taken DESC,player.penalty_scored DESC;
END $$
DELIMITER ;