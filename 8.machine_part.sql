USE machine_part;

DROP TABLES machine, part;

CREATE TABLE machine(MNO VARCHAR(10) PRIMARY KEY, NAME VARCHAR(50), MTYPE VARCHAR(25), MCOST INT);

CREATE TABLE part(PNO VARCHAR(10) PRIMARY KEY, MNO VARCHAR(10), FOREIGN KEY (MNO) REFERENCES machine(MNO),PNAME VARCHAR(30), PDESC VARCHAR(600));


INSERT INTO machine VALUES('1', 'Washing Machine', 'Domestic', 50000);
INSERT INTO machine VALUES('2', 'AC', 'Domestic', 40000);
INSERT INTO machine VALUES('3', 'Printer', 'Official', 5500);
INSERT INTO machine VALUES('4', 'Drill Machine', 'Construction', 1200);
INSERT INTO machine VALUES('5', 'Calculator', 'Education', 600);

INSERT INTO part VALUES('101', '1', 'Water Pump', 'For pumping water in machine'); 
INSERT INTO part VALUES('102', '2', 'Compressor', 'Compressing air into AC'); 
INSERT INTO part VALUES('103', '3', 'Sheet Feeder', 'Feeding sheets into printer'); 
INSERT INTO part VALUES('104', '4', 'Drill', 'Main part of drill machine'); 
INSERT INTO part VALUES('105', '5', 'Display', 'Displays output of calculator'); 

SELECT * FROM machine;
SELECT * FROM part;

UPDATE machine
SET MCOST = MCOST + (MCOST/10);
SELECT * FROM machine;

SELECT M.NAME, P.PNAME
FROM machine M
JOIN part P ON P.MNO = M.MNO;

SELECT P.PNAME
FROM part P 
JOIN machine M ON M.MNO = P.MNO
WHERE M.MCOST < 20000;

SELECT M.NAME, count(P.PNAME) AS CNT
FROM machine M
JOIN part P ON P.MNO = M.MNO
GROUP BY M.NAME;



