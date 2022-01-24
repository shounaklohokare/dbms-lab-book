DROP TABLES movie, actor, movie_actor;

CREATE TABLE movie(MOVNO INT PRIMARY KEY, MVNAME VARCHAR(30), RELEASEYEAR INT);

CREATE TABLE actor(ACTNO INT PRIMARY KEY, ACTNAME VARCHAR(30));

CREATE TABLE movie_actor(MOVNO INT, FOREIGN KEY (MOVNO) REFERENCES movie(MOVNO), ACTNO INT, FOREIGN KEY (ACTNO) REFERENCES actor(ACTNO));

INSERT INTO movie VALUES(1, 'Kaala Patthar', 1979);
INSERT INTO movie VALUES(2, 'Wanted', 2008);
INSERT INTO movie VALUES(3, 'Baghban', 2011);
INSERT INTO movie VALUES(4, 'Kabhie Kabhie', 1976);
INSERT INTO movie VALUES(5, 'Qayamat', 1981);

INSERT INTO actor VALUES(11, 'Amitabh');
INSERT INTO actor VALUES(12, 'Shah Rukh');
INSERT INTO actor VALUES(13, 'Salman');
INSERT INTO actor VALUES(14, 'Amir');
INSERT INTO actor VALUES(15, 'Farhan');
INSERT INTO actor VALUES(16, 'Ajay');

INSERT INTO movie_actor VALUES(1, 11);
INSERT INTO movie_actor VALUES(2, 13);
INSERT INTO movie_actor VALUES(3, 11);
INSERT INTO movie_actor VALUES(3, 12);
INSERT INTO movie_actor VALUES(3, 13);
INSERT INTO movie_actor VALUES(3, 14);
INSERT INTO movie_actor VALUES(3, 15);
INSERT INTO movie_actor VALUES(3, 16);
INSERT INTO movie_actor VALUES(4, 11);
INSERT INTO movie_actor VALUES(5, 16);

SELECT M.MVNAME
FROM movie M
JOIN movie_actor MA ON MA.MOVNO = M.MOVNO
JOIN actor A ON A.ACTNO = MA.ACTNO
WHERE (M.RELEASEYEAR BETWEEN 1965 AND 1980) AND M.MVNAME LIKE 'K%';

SELECT A.ACTNAME, M.MVNAME, M.RELEASEYEAR
FROM movie M 
JOIN movie_actor MA ON MA.MOVNO = M.MOVNO
JOIN actor A ON A.ACTNO = MA.ACTNO;

SELECT COUNT(*) AS SALMAN_MOVIES
FROM movie M 
JOIN movie_actor MA ON MA.MOVNO = M.MOVNO
JOIN actor A ON A.ACTNO = MA.ACTNO
WHERE A.ACTNAME = 'Salman';

SELECT M.MVNAME, COUNT(*) CNT
FROM movie M
JOIN movie_actor MA ON MA.MOVNO = M.MOVNO
JOIN actor A ON A.ACTNO = MA.ACTNO
GROUP BY M.MOVNO
HAVING CNT > 5;