USE property_owner;

DROP TABLES owner, district, property;

CREATE TABLE owner(ONAME VARCHAR(75) PRIMARY KEY, ADDRESS VARCHAR(100), PHONE VARCHAR(12));

CREATE TABLE district(DCODE VARCHAR(10) PRIMARY KEY, DNAME VARCHAR(60), TAX_RATE INT);

CREATE TABLE property(PNUMBER VARCHAR(10) PRIMARY KEY, ONAME VARCHAR(75), FOREIGN KEY (ONAME) REFERENCES owner(ONAME), DCODE VARCHAR(10), FOREIGN KEY (DCODE) REFERENCES district(DCODE), DESCRIPTION VARCHAR(450), AREA INT);

INSERT INTO owner VALUES('Jeff', 'Suncity', '180023457');
INSERT INTO owner VALUES('Elon', 'Santosh Hall', '18008765');
INSERT INTO owner VALUES('Mark', 'Floria', '19235432');
INSERT INTO owner VALUES('Bill', 'Ganga Bhagyoday', '1235432');
INSERT INTO owner VALUES('Mr Dev', 'Sun Orbit', '19235432');

INSERT INTO district VALUES('101', 'Ratnagiri', 1850);
INSERT INTO district VALUES('102', 'Pune', 1600);
INSERT INTO district VALUES('103', 'Nashik', 2380);
INSERT INTO district VALUES('104', 'Kolhapur', 6650);
INSERT INTO district VALUES('105', 'Sangli', 6100);

INSERT INTO property VALUES(1, 'Jeff', '101', 'Platueu', 2000);
INSERT INTO property VALUES(2, 'Elon', '102', 'Hills', 2500);
INSERT INTO property VALUES(3, 'Mark', '103', 'Grasslands', 3000);
INSERT INTO property VALUES(4, 'Bill', '104', 'Sea Side', 2000);
INSERT INTO property VALUES(5, 'Mr Dev', '105', 'Valley', 1800);

SELECT * FROM owner;
SELECT * FROM district;
SELECT * FROM property;

SELECT P.ONAME, P.DESCRIPTION, D.DNAME
FROM property P
JOIN district D ON D.DCODE = P.DCODE;

SELECT P.*
FROM property P 
JOIN district D ON D.DCODE = P.DCODE
WHERE D.DNAME = 'Nashik';

SELECT P.AREA
FROM property P 
JOIN district D ON D.DCODE = P.DCODE
WHERE P.ONAME = 'Mr Dev' AND D.DNAME = 'Sangli';

SELECT D.DNAME, P.ONAME,  P.DESCRIPTION,  P.AREA, D.TAX_RATE
FROM district D 
JOIN property P ON P.DCODE = D.DCODE;
 
