
CREATE DATABASE Library_ssll;

USE [Library_ssll];



CREATE TABLE publisher (
    publisher_id  int IDENTITY (1,1) NOT NULL PRIMARY KEY,
    publisher_name nvarchar(255) NOT NULL,
	publisher_phone int NOT NULL,
    nationality nvarchar(255),
);

CREATE TABLE books (
    book_id int IDENTITY (1,1) NOT NULL PRIMARY KEY,
    book_name nvarchar(255) NOT NULL,
    book_author nvarchar(255) NOT NULL,
	price int NOT NULL,
	category  nvarchar(255) NOT NULL,
    available int NOT NULL,
	publisher_id int NOT NULL,
	CONSTRAINT FK_PubkisherBook FOREIGN KEY (publisher_id)
    REFERENCES publisher(publisher_id)
);
 
 CREATE TABLE member (
	member_id int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	first_name nvarchar(255)  NOT NULL,
	address nvarchar(255) NOT NULL,
	expiry_date date NOT NULL,
	member_type nvarchar(255) NOT NULL,
	nationality nvarchar(255) NOT NULL,
);

CREATE TABLE borrow  (
    borrow_id int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	book_id int NOT NULL,
	member_id int NOT NULL,
	start_date date  NOT NULL,
    return_date date  NOT NULL,
	CONSTRAINT FK_book FOREIGN KEY (book_id)
    REFERENCES books (book_id),
	CONSTRAINT FK_member FOREIGN KEY (member_id)
    REFERENCES member (member_id)
);






INSERT INTO publisher (publisher_name,publisher_phone,nationality)
VALUES ('mohamed','01208270353','egyption');


INSERT INTO publisher (publisher_name,publisher_phone,nationality)
VALUES ('willam','01205277353','english');


INSERT INTO publisher (publisher_name,publisher_phone,nationality)
VALUES ('mohamoud','01228279353','egyption');


INSERT INTO publisher (publisher_name,publisher_phone,nationality)
VALUES ( 'luis','01128270353','french');


INSERT INTO publisher (publisher_name,publisher_phone,nationality)
VALUES ( 'ahmed','01208260355','egyption');

/* SHOW THE TABLE */

SELECT * FROM publisher


INSERT INTO books(book_name , book_author,price,category,available,publisher_id)
VALUES ( 'PAST PERFECT','Danille Steel',30,'history',5,1);

INSERT INTO books(book_name , book_author,price,category,available,publisher_id)
VALUES ( 'romeo and julit','williiam shakespear',35,'novel',6,2);

INSERT INTO books(book_name , book_author,price,category,available,publisher_id)
VALUES ( 'shadow king','luaren johnsen',40,'history',5,1);

INSERT INTO books(book_name , book_author,price,category,available,publisher_id)
VALUES ( 'short history of london','simon jenkins',30,'history',5,3);

INSERT INTO books(book_name , book_author,price,category,available,publisher_id)
VALUES ( 'travlling around world','Danille henry',30,'history',5,1);



SELECT * FROM books 



INSERT INTO member (first_name , address,expiry_date,member_type,nationality)
VALUES ( 'mohamed','falaki street','1-6-2020','teacher','egyption');

INSERT INTO member (first_name , address,expiry_date,member_type,nationality)
VALUES ( 'ali','cairo street','1-6-2009','teacher','egyption');

INSERT INTO member (first_name , address,expiry_date,member_type,nationality)
VALUES ( 'yousef','factoria street','1-7-2010','engineer','egyption');

SELECT * FROM member 

INSERT INTO borrow(book_id ,member_id, start_date,return_date)
VALUES ( 1,1,'1-6-2020','1-8-2020');


INSERT INTO borrow(book_id ,member_id, start_date,return_date)
VALUES ( 2,1,'1-10-2019','1-1-2020');

INSERT INTO borrow(book_id ,member_id, start_date,return_date)
VALUES ( 1,3,'1-6-2020','1-8-2018');

INSERT INTO borrow(book_id ,member_id, start_date,return_date)
VALUES ( 2,1,'8-10-2019','1-8-2020');

INSERT INTO borrow(book_id ,member_id, start_date,return_date)
VALUES ( 1,1,'1-6-2020','1-8-2020');

INSERT INTO borrow(book_id ,member_id, start_date,return_date)
VALUES ( 2,3,'8-6-2006','1-8-2007');

INSERT INTO borrow(book_id ,member_id, start_date,return_date)
VALUES ( 3,1,'1-6-2003','1-8-2004');


SELECT * FROM borrow 


/* 1 how to Return the absolute value of price?  */
SELECT ABS(-28) 


/* 2 how to select average price of books? */ 

SELECT AVG(price) AS Price FROM books; 


/* 3 how to select the largest price?*/
SELECT MAX(price) AS LargestPrice FROM books;


/* 4 how to know the number of available books? */
SELECT SUM(available) FROM books


/* 5 how to select the min price? */

SELECT MIN(price) AS LargestPrice FROM books;


/* 6. How to set the price of book to be float? */

SELECT CONVERT(float, price)FROM books


/* 7 how to make book name in lower cases ? */
SELECT LOWER(books.book_name) FROM books


/* 8 how to make book name in lower cases ?*/
SELECT UPPER(books.book_name) FROM books


/* 9 how to reverse books name ?*/
SELECT REVERSE(book_Name)
FROM books;


/* 10 how to return  a string with number of space characters?.*/
 SELECT SPACE(10);


 
 /* 11 how to slect day of borrow? */
SELECT DAY(borrow.start_date) FROM borrow



/* 12 How to get the month of  borrow process? */

SELECT MONTH(borrow.start_date) FROM borrow


/* 13 How to get the year of  borrow process? */

SELECT YEAR(borrow.start_date) FROM borrow


/* 14 How to get the Length of the books id? */

SELECT LEN(book_id) FROM books


/* 15. How to know if the books' id is null or not? */

SELECT ISNULL(NULL, book_id) FROM books


/* 16. How to return the password of the publisher id as string? */

SELECT STR(publisher.publisher_id)FROM publisher


/* 17. How to replace the space between the publisher name  and publisher phone with "-"? */

SELECT REPLACE(publisher.publisher_name,publisher.publisher_phone, '-')FROM publisher



/* 18. How to make the books category after its name? */

SELECT CONCAT(books.book_name,' is a ' ,books.category)FROM books


/* 19.How to Count number of publisher processes? */

SELECT COUNT(*) FROM publisher


/* 20  How to re-format the phone numbers? */

SELECT FORMAT(publisher.publisher_phone, '0##-###-###-##') FROM publisher



/*
=====================================
sub quiry
=====================================
*/


/* Select all members that done a borrow process after the date "2020-06-01" */ 

SELECT * FROM member WHERE member_id IN (SELECT member_id FROM borrow WHERE start_date > '2018-08-02') ;

/* Select all the books that the available copies is more than 5 */ 

SELECT * FROM books WHERE book_id IN (SELECT book_id FROM Books WHERE available > 5) ;

/* Select the number of books that member can borrow at a time */ 

SELECT member_id FROM member WHERE member_type IN (SELECT member_type FROM member WHERE member_type = 'teacher') ;



/*
===========================================================
	 using Count and Group Functions
===========================================================
*/

SELECT COUNT(publisher_id) FROM books WHERE publisher_Id = 3;



SELECT member_id, MAX(start_date) FROM borrow GROUP BY member_id

/*
===========================================================
   using different joins
===========================================================
*/


/* Left Join    */

SELECT member.first_name, member.member_id, publisher.publisher_name, publisher.publisher_phone 
FROM member Left JOIN publisher 
ON member.member_type = publisher.publisher_name

/* Right Join   */

SELECT books.book_name, borrow.start_date, borrow.book_id 
FROM books RIGHT JOIN borrow 
ON books.book_name = borrow.book_id

/* full Join*/

SELECT publisher.publisher_id, borrow.borrow_id
FROM publisher
FULL OUTER JOIN borrow
ON publisher.publisher_id = borrow.borrow_id
ORDER BY borrow .borrow_id;

/*inner Join*/

SELECT publisher.publisher_id, borrow.borrow_id
FROM publisher
INNER JOIN borrow 
ON publisher.publisher_id = borrow.borrow_id
ORDER BY borrow.borrow_id;



INSERT INTO Publisher ( publisher_name,publisher_phone,nationality )
VALUES ( 'wmmmm',01208270369,'english' )

INSERT INTO books (book_author,book_name,price,category,available,publisher_id )
VALUES ( 'ali','hosting',40,'tourism',5,2 )

INSERT INTO member (first_name,address,expiry_date,member_type,nationality)
VALUES('ahmed','marg','1-6-2006','teacher','egyption' )

INSERT INTO borrow (book_id,member_id,start_date,return_date)
VALUES(1,2,'8-9-2011','9-12-2019')

/*
===============================================
Update Statments
===============================================
*/


/* 1. Updating the category of the book of id = 3 */

UPDATE books SET Category = 'novel' WHERE book_id = 3;

/* 2. Updating the publisher id of the mohamed*/

UPDATE publisher SET  publisher_id = 5 WHERE publisher_name = 'mohamed';


/* 3. Updating the member type of the Teachers*/

UPDATE member SET member_id = 4  WHERE member_type = 'Teacher';


/* 4. Updating the available copies of book of id 5 to be 0 */

UPDATE books SET available = 0  WHERE book_id = 3;


/* 5. Updating the phone of puplisher of id 1*/

UPDATE publisher SET publisher_phone = 01208270353 WHERE publisher_id = 1;





/* 1. Deleting The Borrow information of danille steel's Book*/

DELETE FROM borrow WHERE book_id = '1';


/* 2. Deleting The Books of wiliwam shakspear*/

DELETE FROM books WHERE book_author = 2;


/* 3. Deleting The author of egyption Nationality */

DELETE FROM publisher WHERE nationality = 'egyption';


/* 4. Deleting The Borrow information */

DELETE FROM borrow WHERE borrow_id = 1;


/* 5. Deleting The Librarian of the librarian Ramy Mohamed*/

DELETE FROM member WHERE first_name = 'ali';
