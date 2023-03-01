CREATE DATABASE IF NOT EXISTS epl4;
USE epl4;

CREATE TABLE stadium(
  id INT AUTO_INCREMENT NOT NULL ,
  stadium_name VARCHAR(55) NOT NULL,
  location VARCHAR(55),
  capacity INT,
  PRIMARY KEY(id)
  );
  
CREATE TABLE club(
  id INT AUTO_INCREMENT NOT NULL,
  club_name VARCHAR(55),
  shorthand VARCHAR(55),
  stadium_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY(stadium_id) REFERENCES stadium(id)
  );
  
CREATE TABLE referee(
 id INT AUTO_INCREMENT,
 first_name VARCHAR(55),
 last_name VARCHAR(55),
 country VARCHAR(55),
 PRIMARY KEY(id)
 );
 
CREATE TABLE epl_match(
 id INT AUTO_INCREMENT,
 match_date DATE,
 stadium_id INT,
 refree_id INT,
 home_team_id INT,
 away_team_id INT,
 PRIMARY KEY(id),
 FOREIGN KEY(stadium_id) REFERENCES stadium(id),
 FOREIGN KEY(refree_id) REFERENCES referee(id),
 FOREIGN KEY(home_team_id) REFERENCES team_match(team_id),
 FOREIGN KEY(away_team_id) REFERENCES team_match(team_id)
 );
 
 CREATE TABLE team_match(
  match_id INT,
  team_id INT,
  corner INT,
  shots INT,
  shots_on_target INT,
  red_card INT,
  yellow_card INT,
  foul INT,
  goals INT,
  PRIMARY KEY(match_id,team_id),
  FOREIGN KEY(match_id) REFERENCES epl_match(id),
  FOREIGN KEY(team_id) REFERENCES club(id)
  );
  
  
  
  CREATE TABLE player(
   id INT AUTO_INCREMENT NOT NULL,
   first_name VARCHAR(55),
   last_name VARCHAR(55),
   club_id INT,
   country VARCHAR(55),
   age INT,
   no_games_played INT,
   in_starting_squad INT,
   minutes_played INT,
   goals_scored INT,
   assists INT,
   yellow_cards INT,
   red_cards INT,
   pass_attempted INT,
   pass_completed INT,
   penalty_taken INT,
   penalty_scored INT,
   PRIMARY KEY(id),
   FOREIGN KEY(club_id) REFERENCES club(id)
   );
   
CREATE TABLE player_position(
 player_id INT,
 position VARCHAR(55),
 PRIMARY KEY(player_id,position),
 FOREIGN KEY(player_id) REFERENCES player(id)
 );


 
