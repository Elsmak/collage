create table tb_user(
user_id int primary key,
user_name nvarchar(50),
user_email nvarchar(50),
user_phone int,
user_address nvarchar(50),
);

create table tb_book(
book_id int primary key,
book_name nvarchar(50) ,
author_name nvarchar(50),
date_of_publishment nvarchar(50),
);

create table tb_librarian(
librarian_id int primary key,
librarian_name nvarchar(50),
category_id int
);

create table tb_category(
category_id int primary key,
category_name nvarchar(50),
book_id int,
user_id int
);

--insert

insert into tb_book VALUES(2,'the wind in the willows','keneth gerham','3 march 1999');
insert into tb_book VALUES(3,'animal farm','josef stallen','6 aprril 2009');
insert into tb_book VALUES(4,'the old man and sea','arnest','3 june 1998');
insert into tb_book VALUES(5,'tuesday with morrie','choartez michel','7 march 2007');
insert into tb_book VALUES(6,'high fidelity','neck hornby','23 june 2015');
select*from tb_book

insert into tb_user VALUES(11,'Mohamed','mohamed@.com',032387567,'giza');
insert into tb_user VALUES(12,'Aly','aly@.com',037569457,'kafr elshiekh');
insert into tb_user VALUES(13,'saed','saed@.com',037694567,'cairo');
insert into tb_user VALUES(14,'gamal','gamal@.com',032456703,'luxor');
insert into tb_user VALUES(15,'waleed','waleed@.com',031294467,'aswan');
select*from tb_user

insert into tb_category VALUES(22,'historical',2,12);
insert into tb_category VALUES(23,'mathematical',3,13);
insert into tb_category VALUES(24,'novels',4,14);
insert into tb_category VALUES(25,'educational',5,15);
select *from tb_category

insert into tb_librarian VALUES(32,'kamal',22);
insert into tb_librarian VALUES(33,'aya',23);
insert into tb_librarian VALUES(34,'heba',24);
insert into tb_librarian VALUES(35,'menna',25);
select * from tb_librarian

--select

--1-what is the usage of ASCII function?
SELECT ASCII(user_name) AS NumCodeOfFirstChar
FROM tb_user;
--2-how to use CHAR function?
SELECT CHAR(65) AS CodeToCharacter;
--3-how to use CHARINDEX function?
SELECT CHARINDEX('e', 'saed') AS MatchPosition;
--4-how to use CONCAT function?
SELECT CONCAT('mohamed', '.com');
--5-how to use DATALENGTH function?
SELECT DATALENGTH('noha');
--6-how to know the difference between two words?
SELECT DIFFERENCE('novels', 'waleed');
--7-how to use LEFT function?
SELECT LEFT('ibrahim', 3) AS ExtractString;
--8-how to use LEN function?
SELECT LEN('historical');
--9-how to use LOWER function?
SELECT LOWER('Mohamed');
--10-how to use NCHAR function?
SELECT NCHAR(65) AS NumberCodeToUnicode;
--11-how to use PATINDEX function?
SELECT PATINDEX('aly', 'Mohamed');
--12-how to use REPLACE function?
SELECT REPLACE('novels', 'e', 'w');
--13-how to use REVERSE function?
SELECT REVERSE('educational');
--14-how to use RIGHT function?
SELECT RIGHT('the old man and sea', 3) AS ExtractString;
--15-how to use RTRIM function?
SELECT RTRIM('lord of files   ') AS RightTrimmedString;
--16-how to use STR function?
SELECT STR(65);
--17-how to use SUBSTRING function?
SELECT SUBSTRING('Mohamed', 1, 3) AS ExtractString;
--18-how to use UNICODE function?
SELECT UNICODE('ibrahim');
--19-how to use UPPER function?
SELECT UPPER('animal farm');
--20-how to use SOUNDEX function?
SELECT SOUNDEX('aly'), SOUNDEX('ahmed');

--sub query

SELECT user_name FROM tb_user WHERE user_id in (SELECT user_id FROM tb_librarian WHERE librarian_id >34)
SELECT librarian_name FROM tb_librarian WHERE librarian_id in (SELECT librarian_id FROM tb_user WHERE user_id >13)
SELECT category_name FROM tb_category WHERE category_id in (SELECT category_id FROM tb_librarian WHERE librarian_id >32)

--count and group

--what the number of user ?
SELECT COUNT(user_id)
  FROM tb_user
--what is the number of books ?
SELECT COUNT(book_id)
  FROM tb_book
--Group
SELECT COUNT(user_id), user_name 
  FROM tb_user
 GROUP BY user_name

 --join

 
 SELECT  user_name, user_email, book_name
   FROM tb_user
   INNER JOIN tb_book
   ON tb_user.user_id = tb_book.book_id;

SELECT user_name, author_name
   FROM tb_user
   LEFT JOIN tb_book
   ON tb_user.user_id = tb_book.book_id;

SELECT user_email,date_of_publishment
  FROM tb_user
  RIGHT JOIN tb_book
  ON tb_user.user_id = tb_book.book_id;

SELECT user_name,category_name
  FROM tb_user
  FULL JOIN tb_category
  ON tb_user.user_id = tb_category.category_id;

SELECT user_phone,book_name
  FROM tb_user,tb_book
  WHERE tb_user.user_id=tb_book.book_id


 --UPDATE

UPDATE tb_book
set book_name='the giver' where book_id=2
UPDATE tb_librarian
set librarian_name='noha' where librarian_id=34
UPDATE tb_user
set user_name='nabil' where user_id=14
UPDATE tb_book
set author_name='louis lory' where book_id=3
UPDATE tb_librarian
set librarian_name='eman' where librarian_id=35

select * from tb_book
select * from tb_category
select * from tb_librarian
select * from tb_user


--DELETE

DELETE from tb_book where book_id=6
DELETE from tb_librarian where librarian_name='kamal'
DELETE from tb_category where category_id =24
DELETE from tb_user where user_name='saed'
DELETE from tb_category where category_id=22

select * from tb_book
select * from tb_category
select * from tb_librarian
select * from tb_user