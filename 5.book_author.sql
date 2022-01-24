DROP TABLES book, author, book_author;

CREATE TABLE book(BOOK_NO VARCHAR(10) PRIMARY KEY, BOOK_NAME VARCHAR(100), PUBNAME VARCHAR(30));

CREATE TABLE author(AUTHOR_NO VARCHAR(10) PRIMARY KEY, AUTHOR_NAME VARCHAR(30));

CREATE TABLE book_author(BOOK_NO VARCHAR(10), FOREIGN KEY (BOOK_NO) REFERENCES book(BOOK_NO), AUTHOR_NO VARCHAR(10), FOREIGN KEY (AUTHOR_NO) REFERENCES author(AUTHOR_NO), PUBLISHINGYEAR INT);

INSERT INTO book VALUES('101', 'A Game Of Thrones', 'Bantam Classics');
INSERT INTO book VALUES('102', 'Savarkar : Echoes Of A Forgotten Past', 'Tor Books');
INSERT INTO book VALUES('103', 'Database System Concepts', 'Virgin Books');
INSERT INTO book VALUES('104', 'Homo Sapiens', 'Penguin');
INSERT INTO book VALUES('105', 'Elon Musk : Biography', 'Tata McGraw Hill');

INSERT INTO author VALUES('1', 'George RR Martin');
INSERT INTO author VALUES('2', 'Vikram Sampath');
INSERT INTO author VALUES('3', 'Korth');
INSERT INTO author VALUES('4', 'Yuval Noah Harari');
INSERT INTO author VALUES('5', 'Ashlee Vance');

INSERT INTO book_author VALUES('101', '1', 2019);
INSERT INTO book_author VALUES('102', '2', 2021);
INSERT INTO book_author VALUES('103', '3', 1991);
INSERT INTO book_author VALUES('104', '4', 2021);
INSERT INTO book_author VALUES('105', '5', 2021);

SELECT * FROM book;
SELECT * FROM author;

SELECT B.BOOK_NAME
FROM book B
JOIN book_author BA ON BA.BOOK_NO = B.BOOK_NO
ORDER BY BA.PUBLISHINGYEAR DESC;

SELECT B.BOOK_NAME, B.PUBNAME
FROM book B
WHERE B.PUBNAME = 'Tata McGraw Hill';

SELECT B.BOOK_NAME, A.AUTHOR_NAME
FROM book B
JOIN book_author BA ON BA.BOOK_NO = B.BOOK_NO
JOIN author A ON A.AUTHOR_NO = BA.AUTHOR_NO
WHERE A.AUTHOR_NAME = 'Korth';

SELECT B.BOOK_NAME, A.AUTHOR_NAME, B.PUBNAME
FROM book B
JOIN book_author BA ON BA.BOOK_NO = B.BOOK_NO
JOIN author A ON A.AUTHOR_NO = BA.AUTHOR_NO
WHERE B.BOOK_NO = '101' AND BA.PUBLISHINGYEAR = 2019;

