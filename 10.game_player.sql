USE game_player;

DROP TABLES game, players, game_player;

CREATE TABLE game(GNAME VARCHAR(50) PRIMARY KEY, NO_OF_PLAYERS INT, CAPTAIN_NAME VARCHAR(50));

CREATE TABLE players(PNAME VARCHAR(50) PRIMARY KEY, ADDRESS VARCHAR(50), CLUBNAME VARCHAR(50));

CREATE TABLE game_player(GNAME VARCHAR(50), FOREIGN KEY (GNAME) REFERENCES game(GNAME), PNAME VARCHAR(50), FOREIGN KEY (PNAME) REFERENCES players(PNAME), COACH_NAME VARCHAR(50));

INSERT INTO game VALUES('Football', 11, 'Lionel Messi');
INSERT INTO game VALUES('Cricket', 11, 'MS Dhoni');
INSERT INTO game VALUES('Chess', 1, 'V Anand');
INSERT INTO game VALUES('Tennis', 2, 'Rafael Nadal');
INSERT INTO game VALUES('Badminton', 2, 'PV Sindhu');

INSERT INTO players VALUES('Abhimanyu', 'Pune', 'Vision');
INSERT INTO players VALUES('Virat', 'Mumbai', 'Solaris');
INSERT INTO players VALUES('Rohit', 'Nashik', 'Solaris');
INSERT INTO players VALUES('Krunal', 'Nagpur', 'Vision');
INSERT INTO players VALUES('Hardik', 'Pune', 'Solaris');

INSERT INTO game_player VALUES('Football','Abhimanyu', 'Ronaldo');
INSERT INTO game_player VALUES('Cricket','Virat', 'Dravid');
INSERT INTO game_player VALUES('Badminton','Rohit', 'Gopi');
INSERT INTO game_player VALUES('Chess','Krunal', 'Carlsen');
INSERT INTO game_player VALUES('Tennis','Hardik', 'Williams');
INSERT INTO game_player VALUES('Chess','Abhimanyu', 'Carlse');
INSERT INTO game_player VALUES('Tennis','Abhimanyu', 'Federer');
INSERT INTO game_player VALUES('Tennis','Virat', 'Paes');

SELECT * FROM game;
SELECT * FROM players;
SELECT * FROM game_player;

SELECT GP.PNAME, COUNT(GP.GNAME) CNT
FROM game_player GP
GROUP BY GP.PNAME
HAVING CNT > 2;

SELECT GP.GNAME, G.CAPTAIN_NAME, COUNT(GP.COACH_NAME) CNT
FROM game_player GP
JOIN game G ON G.GNAME = GP.GNAME
GROUP BY GP.GNAME
HAVING CNT > 2;

SELECT G.GNAME
FROM game G
WHERE G.NO_OF_PLAYERS > 5;

SELECT GP.PNAME, GP.COACH_NAME
FROM game_player GP;


