USE car_driver;
DROP TABLES car, driver, accident, car_driver;

CREATE TABLE car(CNO VARCHAR(10) PRIMARY KEY, CARMODEL VARCHAR(50), OWNERNAME VARCHAR(50));

CREATE TABLE driver(DRVNO VARCHAR(10) PRIMARY KEY, DRVNAME VARCHAR(50), DRVADDR VARCHAR(50), DRVCITY VARCHAR(50));

CREATE TABLE accident(AC_ID VARCHAR(10) PRIMARY KEY, CNO VARCHAR(10), FOREIGN KEY (CNO) REFERENCES car(CNO), PLACE VARCHAR(50), YEAR INT);

CREATE TABLE car_driver(CNO VARCHAR(10), FOREIGN KEY (CNO) REFERENCES car(CNO), DRVNO VARCHAR(10), FOREIGN KEY (DRVNO) REFERENCES driver(DRVNO));

INSERT INTO car VALUES('1', 'WagonR', 'Jai');
INSERT INTO car VALUES('2', 'Ignis', 'Veeru');
INSERT INTO car VALUES('3', 'Tavera', 'Jignesh');
INSERT INTO car VALUES('4', 'Astor', 'Gabbar');
INSERT INTO car VALUES('5', 'i10', 'Bruce');

INSERT INTO driver VALUES('101', 'Clark', 'Sinhagad Rd', 'Pune');
INSERT INTO driver VALUES('102', 'Ram', 'Canada Rd', 'Nashik');
INSERT INTO driver VALUES('103', 'Laxman', 'MG Road', 'Mumbai');
INSERT INTO driver VALUES('104', 'Hanuman', 'Swargate', 'Pune');
INSERT INTO driver VALUES('105', 'Vali', 'Sion', 'Mumbai');

INSERT INTO accident VALUES('11', '1', 'Pune', 2000);
INSERT INTO accident VALUES('12', '2', 'Mumbai-Bangalore Highway', 2020);
INSERT INTO accident VALUES('13', '3', 'Pune', 2000);
INSERT INTO accident VALUES('14', '4', 'Pune Nagar Road', 2011);
INSERT INTO accident VALUES('15', '5', 'Pune', 2018);

INSERT INTO car_driver VALUES('1', '101');
INSERT INTO car_driver VALUES('2', '102');
INSERT INTO car_driver VALUES('3', '103');
INSERT INTO car_driver VALUES('4', '104');
INSERT INTO car_driver VALUES('5', '105');

SELECT * FROM car;
SELECT * FROM driver;
SELECT * FROM accident;
SELECT * FROM car_driver;

SELECT A.AC_ID, A.PLACE, C.CARMODEL
FROM accident A 
JOIN car C ON A.CNO = C.CNO
WHERE A.YEAR = 2000;

SELECT D.DRVNAME
FROM driver D
JOIN car_driver CD ON CD.DRVNO = D.DRVNO
JOIN car C ON C.CNO = CD.CNO
JOIN accident A ON A.CNO = C.CNO
WHERE A.PLACE = 'Pune';

SELECT A.PLACE, A.YEAR
FROM accident A 
JOIN car C ON C.CNO = A.CNO
WHERE C.CARMODEL = 'WagonR';

SELECT D.DRVNAME, C.OWNERNAME
FROM driver D 
JOIN car_driver CD ON CD.DRVNO = D.DRVNO
JOIN car C ON C.CNO = CD.CNO
JOIN accident A ON A.CNO = C.CNO
WHERE A.PLACE = 'Pune Nagar Road';


