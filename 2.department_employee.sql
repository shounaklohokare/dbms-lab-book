DROP TABLES department, employee;

CREATE TABLE department(DEPTNO INT PRIMARY KEY, DNAME VARCHAR(30), LOC VARCHAR(30));

CREATE TABLE employee(EMPNO INT PRIMARY KEY, ENAME VARCHAR(30), SALARY INT, DESIGNATION VARCHAR(30), COMM INT, DEPTNO INT, FOREIGN KEY (DEPTNO) REFERENCES department(DEPTNO), DOJ DATE);

INSERT INTO department VALUES(1, 'Sales', 'Pune');
INSERT INTO department VALUES(2, 'Marketing', 'Mumbai');
INSERT INTO department VALUES(3, 'Recovery', 'Nasik');
INSERT INTO department VALUES(4, 'R&D', 'Pune');
INSERT INTO department VALUES(5, 'Management', 'New Delhi');

INSERT INTO employee VALUES(7367, 'Lucky Ali', 20000, 'Accountant', 500, 3, '2021/05/16');
INSERT INTO employee VALUES(7368, 'Mohit', 10000, 'Company Secretary', 200, 1, '2020/01/13');
INSERT INTO employee VALUES(7369, 'Ram', 25000, 'Regional Manager', 550, 2, '2011/09/11');
INSERT INTO employee VALUES(7370, 'Shyam', 12500, 'Junior Salesman', 180, 5, '2019/04/19');
INSERT INTO employee VALUES(7371, 'Laxman', 21000, 'Field Executive', 600, 4, '2013/02/21');
INSERT INTO employee VALUES(7372, 'Lakhan', 30000, 'Regional Manager', 1000, 4, '2015/01/11');


SELECT E.DESIGNATION, MAX(E.SALARY) MAX_SAL, MIN(E.SALARY) MIN_SAL, AVG(E.SALARY) AVG_SAL
FROM employee E
GROUP BY E.DESIGNATION;

SELECT E.ENAME
FROM employee E
JOIN department D ON D.DEPTNO = E.DEPTNO
WHERE D.LOC = 'Pune';

SELECT E.*
FROM employee E
JOIN department D ON D.DEPTNO = E.DEPTNO
WHERE D.LOC = 'Nasik' AND E.DESIGNATION = 'Accountant';

SELECT D.DNAME, E.ENAME
FROM employee E
JOIN department D ON D.DEPTNO = E.DEPTNO;

SELECT E.ENAME
FROM employee E
WHERE E.DOJ <= '2018/12/12';

SELECT E.ENAME
FROM employee E
WHERE E.DESIGNATION = (SELECT E.DESIGNATION FROM employee E WHERE E.EMPNO = '7369') AND E.EMPNO <> '7369';
