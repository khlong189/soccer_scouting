-- create database scout;
-- USE scout;

-- This script contains creations of 10 tables.

CREATE TABLE academies (
   academy_id INT PRIMARY KEY,
   academy_name VARCHAR(50) NOT NULL,
   contact_info VARCHAR(50) NOT NULL,
   est_year INT,
   stad_name VARCHAR(50) NOT NULL,
   stad_size INT NOT NULL,
   city VARCHAR(50) NOT NULL,
   country VARCHAR(50) NOT NULL,
   league VARCHAR(20) NOT NULL,
   revenue INT NOT NULL,
   num_player_grad INT
);


CREATE TABLE agents (
   agent_id INT PRIMARY KEY,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   agency_name VARCHAR(50) NOT NULL,
   contact_info VARCHAR(50) NOT NULL,
   num_client INT
);


CREATE TABLE players (
   player_id INT PRIMARY KEY,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   birthdate DATE NOT NULL,
   city VARCHAR(20) NOT NULL,
   country VARCHAR(20) NOT NULL,
   nationality VARCHAR(50) NOT NULL,
   lang VARCHAR(50) NOT NULL,
   height INT NOT NULL,
   weight INT NOT NULL,
   foot VARCHAR(10) NOT NULL,
   academy_id INT,
   agent_id INT,
   FOREIGN KEY (academy_id) REFERENCES academies(academy_id),
   FOREIGN KEY (agent_id) REFERENCES agents(agent_id)
);




CREATE TABLE attack (
  attk_id INT PRIMARY KEY,
   season VARCHAR(20) NOT NULL,
   games INT NOT NULL,
  goals INT,
   hd_goals INT,
   rf_goals INT,
   lf_goals INT,
   fk_goals INT,
   pen_goals INT,
   shots INT,
   shots_target INT,
   shoot_acc VARCHAR(10),
   bc_misses INT
);


CREATE TABLE defend (
  def_id INT PRIMARY KEY,
   season VARCHAR(20) NOT NULL,
   games INT NOT NULL,
  tackles INT,
   tackles_succ VARCHAR(10),
   blocked_shots INT,
   intercept INT,
   clear INT,
   hd_clear INT,
   recoveries INT,
   duels_won INT,
   duels_lost INT
);


CREATE TABLE teamplay (
  tp_id INT PRIMARY KEY,
   season VARCHAR(20) NOT NULL,
   games INT NOT NULL,
  assists INT,
   passes INT,
   big_chances INT,
   crss INT,
   crss_acc VARCHAR(10),
   through_ball INT,
   acc_long_balls INT
);


CREATE TABLE discipline (
  dis_id INT PRIMARY KEY,
   season VARCHAR(20) NOT NULL,
   games INT NOT NULL,
  yellow INT,
   red INT,
   fouls INT,
   offsides INT
);


CREATE TABLE goalkeep (
  gk_id INT PRIMARY KEY,
   season VARCHAR(20) NOT NULL,
   games INT NOT NULL,
   saves INT,
   pen_saves INT,
   punches INT,
   high_claims INT,
   catches INT,
   sweep_clear INT,
   throw_outs INT
);


CREATE TABLE player_stat (
   stat_id INT PRIMARY KEY,
   player_id INT NOT NULL,
   pos VARCHAR(20) NOT NULL,
   team VARCHAR(20) NOT NULL,
   attk_id INT NOT NULL,
   def_id INT NOT NULL,
   dis_id INT NOT NULL,
   tp_id INT NOT NULL,
   gk_id INT NOT NULL,
   FOREIGN KEY (player_id) REFERENCES players(player_id),
   FOREIGN KEY (attk_id) REFERENCES attack(attk_id),
   FOREIGN KEY (def_id) REFERENCES defend(def_id),
   FOREIGN KEY (tp_id) REFERENCES teamplay(tp_id),
   FOREIGN KEY (gk_id) REFERENCES goalkeep(gk_id),
   FOREIGN KEY (dis_id) REFERENCES discipline(dis_id)
);


CREATE TABLE awards (
   award_id INT PRIMARY KEY,
   player_id INT,
   award_name VARCHAR(50) NOT NULL,
   award_year INT NOT NULL,
   FOREIGN KEY (player_id) REFERENCES players(player_id)
);
