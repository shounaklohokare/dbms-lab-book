USE workshop_participant;

DROP TABLES workshop, participant, workshop_participant;

CREATE TABLE workshop(WORKSHOPID VARCHAR(10) PRIMARY KEY, TITLE VARCHAR(250), NUMBEROFSPEAKERS INT, DESIGNATION VARCHAR(50), FEES INT);

CREATE TABLE participant(PARTICIPANTID VARCHAR(10) PRIMARY KEY, PARTICIPANTNAME VARCHAR(50), WORKSHOPID VARCHAR(10), FOREIGN KEY (WORKSHOPID) REFERENCES workshop(WORKSHOPID));

CREATE TABLE workshop_participant(WORKSHOPID VARCHAR(10), FOREIGN KEY (WORKSHOPID) REFERENCES workshop(WORKSHOPID), PARTICIPANTID VARCHAR(10), FOREIGN KEY (PARTICIPANTID) REFERENCES participant(PARTICIPANTID));

INSERT INTO workshop VALUES('1', 'AI for Business Growth', 5, 'Senior Managers', 7500);
INSERT INTO workshop VALUES('2', 'Cybersecurity', 3, 'Junior Managers', 6275);
INSERT INTO workshop VALUES('3', 'Empathy in Management', 3, 'Senior Managers', 6000);
INSERT INTO workshop VALUES('4', 'Sales Hacks', 2, 'Sales Exec', 5500);
INSERT INTO workshop VALUES('5', 'Mindfulness for Managers', 1, 'Senior Managers', 2500);

INSERT INTO participant VALUES('101', 'Eddard', '1');
INSERT INTO participant VALUES('102', 'Brandon', '2');
INSERT INTO participant VALUES('103', 'Jon', '3');
INSERT INTO participant VALUES('104', 'Robb', '4');
INSERT INTO participant VALUES('105', 'Rickon', '5');

INSERT INTO workshop_participant VALUES('1', '101');
INSERT INTO workshop_participant VALUES('2', '102');
INSERT INTO workshop_participant VALUES('3', '103');
INSERT INTO workshop_participant VALUES('4', '104');
INSERT INTO workshop_participant VALUES('5', '105');

SELECT * FROM workshop;
SELECT * FROM participant;
SELECT * FROM workshop_participant;

SELECT P.PARTICIPANTNAME, W.TITLE
FROM participant P
JOIN workshop_participant WP ON WP.PARTICIPANTID = P.PARTICIPANTID
JOIN workshop W ON W.WORKSHOPID = WP.WORKSHOPID
WHERE W.NUMBEROFSPEAKERS > 2;

SELECT P.PARTICIPANTID, P.PARTICIPANTNAME, W.WORKSHOPID
FROM participant P
JOIN workshop_participant WP ON WP.PARTICIPANTID = P.PARTICIPANTID
JOIN workshop W ON W.WORKSHOPID = WP.WORKSHOPID
WHERE W.DESIGNATION = 'Senior Managers' OR W.DESIGNATION = 'Junior Managers';

SELECT W.WORKSHOPID, W.TITLE, P.PARTICIPANTID 
FROM workshop W
JOIN workshop_participant WP ON WP.WORKSHOPID = W.WORKSHOPID
JOIN participant P ON P.PARTICIPANTID = WP.PARTICIPANTID
WHERE W.FEES BETWEEN 5000 AND 8000;


