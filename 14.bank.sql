USE bank;

DROP TABLES customer, branch, account, loan;

CREATE TABLE branch(BRANCH_NO INT PRIMARY KEY, BRANCH_NAME VARCHAR(20) NOT NULL, BRANCH_CITY VARCHAR(20));

CREATE TABLE customer(CUST_NO INT PRIMARY KEY, CUST_NAME VARCHAR(20), CUST_STREET VARCHAR(15), CUST_CITY VARCHAR(20));

CREATE TABLE account(ACC_NO INT PRIMARY KEY, CUST_NO INT, FOREIGN KEY (CUST_NO) REFERENCES customer(CUST_NO), BRANCH_NO INT, FOREIGN KEY (BRANCH_NO) REFERENCES branch(BRANCH_NO), ACC_TYPE VARCHAR(10), BALANCE FLOAT);

CREATE TABLE loan(LOAN_NO INT PRIMARY KEY, CUST_NO INT, FOREIGN KEY (CUST_NO) REFERENCES customer(CUST_NO), BRANCH_NO INT, FOREIGN KEY (BRANCH_NO) REFERENCES branch(BRANCH_NO), LOAN_AMT DOUBLE, NO_OF_YEARS INT);

INSERT INTO branch VALUES(1, 'FC Road', 'Pune');
INSERT INTO branch VALUES(2, 'MG Road', 'Mumbai');
INSERT INTO branch VALUES(3, 'Sinhagad Rd','Pune');
INSERT INTO branch VALUES(4, 'Canada Road','Nashik');
INSERT INTO branch VALUES(5, 'Ring Rd','Mumbai');

INSERT INTO customer VALUES(101, 'Kunti', 'DP Rd', 'Pune');
INSERT INTO customer VALUES(102, 'Ashwathama', 'First St.', 'Pune');
INSERT INTO customer VALUES(103, 'Arjun', 'Sun City Rd', 'Pune');
INSERT INTO customer VALUES(104, 'Yudhishtir', 'Canada Road', 'Nashik');
INSERT INTO customer VALUES(105, 'Karna', 'Thane', 'Mumbai');

INSERT INTO account VALUES(1001, 101, 1, 'Savings', 2000.00);
INSERT INTO account VALUES(1002, 102, 2, 'Current', 2500.00);
INSERT INTO account VALUES(1003, 103, 3, 'Savings', 4000.00);
INSERT INTO account VALUES(1004, 104, 4, 'Current', 10000.00);
INSERT INTO account VALUES(1005, 105, 5, 'Savings', 12000.00);

INSERT INTO loan VALUES(11, 101, 1, 10000, 5);
INSERT INTO loan VALUES(12, 102, 2, 12000, 4);
INSERT INTO loan VALUES(13, 103, 3, 15000, 3);
INSERT INTO loan VALUES(14, 104, 4, 18000, 2);
INSERT INTO loan VALUES(15, 105, 5, 2000, 1);

/* Create a view which contains all the customer details along with the details of all accounts of that 
customer. */
CREATE OR REPLACE VIEW cust_acc
AS SELECT C.CUST_NAME, C.CUST_STREET, C.CUST_CITY, A.ACC_TYPE, A.BALANCE
FROM customer C
JOIN account A ON C.CUST_NO = A.CUST_NO;

SELECT * 
FROM cust_acc;

/* Create a view which contains details of all loans from the F.C. Road branch. */
CREATE OR REPLACE VIEW fc_road
AS SELECT L.CUST_NO, L.LOAN_AMT, L.NO_OF_YEARS
FROM loan L 
JOIN branch B ON B.BRANCH_NO = L.BRANCH_NO
WHERE B.BRANCH_NAME = 'FC Road';

SELECT *
FROM fc_road;

