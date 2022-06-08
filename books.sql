create database books_name;
use books_name;
create table books
(book_id int not null auto_increment,
	title varchar(100),
	auth_fname varchar(100),
	auth_lname varchar(100),
	released_year int,
	pages int,
    stock_qty int,
	primary key(book_id)
);
insert into books(
title,auth_fname,auth_lname,released_year,pages,stock_qty)
 values
 ('Fundamentals of Wavelets','Goswami', 'Jaideva',2020,228,778),
 ('Data Smart','Foreman', 'John',2019,235,342),
 ('God Created the Integers','Hawking', 'Stephen',2017,197,986),
 ('Superfreakonomics','Dubner', 'Stephen',2021,179,654),
 ('Orientalism','Said', 'Edward',2022,197,333),
 ('Nature of Statistical Learning Theory', 'Vapnik', 'Vladimir',2018,230,887),
 ('Integration of the Indian States','Menon',' V P',2020,217,564),
 ('Drunkards Walk','Mlodinow', 'Leonard',2019,197,731),
 ('Image Processing & Mathematical Morphology','Shih', 'Frank',2015,241,874),
 ('How to Think Like Sherlock Holmes','Konnikova', 'Maria',2016,240,531),
 ('Data Scientists at Work','Sebastian', 'Gutierrez',2019,230,776),
 ('Slaughterhouse Five','Vonnegut', 'Kurt',2014,198,234),
 ('Birth of a Theorem','Villani', 'Cedric',2017,234,432),
 ('Structure & Interpretation of Computer Programs','Sussman', 'Gerald',2011,240,321);

select  auth_fname,auth_lname from books;
select concat(auth_fname,' ', auth_lname) as full_name from books;
select auth_fname as fisrt,auth_lname as last ,
concat(auth_fname,' ',auth_lname) as full from books;
select concat_ws('-', title, auth_fname, auth_lname)as combined from books;
select title from books;
select substring('Structure & Interpretation of Computer Programs',1,15);
select substring(title,1,15)as short_title from books;
select concat(
	substring(title,1,10),
    '...')as 'Short tilte' from books;
select* from books;
select replace(title,'e','34') as replaced from books;
select reverse(title) as rev from books;
select concat(auth_fname ,'..', reverse(auth_fname))as reversed from books;
select(auth_fname), char_length (auth_fname) as 'char length' from books;
select concat(
auth_fname, ' is ', char_length (auth_fname),
' char long') as 'length of names' from books;
select upper(auth_fname) from books;
select lower(auth_fname) from books;
select concat('my favorite book name is ', upper(title)) from books;
select concat(title, ' was released on ', released_year) as 'rel' from books;
select title, char_length(title) as 'char len' from books;
-- Exercise
select replace(
concat(title,' '), ' ','-') from books;

select replace(title,' ', '->') as 'title' from books;

select auth_lname as forwards,reverse(auth_lname) as reversed from books;

select title ,char_length(title) as length from books;

select concat(title,' ', 'was released in',' ', released_year) as detail from books;

select concat(substring(title,1,10), '...')  as 'short title',
		concat(auth_fname,',',auth_lname) as author , 
		concat(stock_qty,' in the stock')  as quantity 
from books;


-- Refining actions 

insert into books(
	title  ,
	auth_fname,
	auth_lname,
	released_year,
    pages,
	stock_qty) values('10% Happier','Dan','Haris',2014,33,670 ),
    ('fake_book','Freida','Haris',2001,428,212 ),
    ('LincoIn the The Hardo','George','saunders',2012,337,112 );

select distinct auth_lname from books;
select * from books;
-- logical operators
select title,auth_fname,auth_lname,released_year from books where released_year!=2017 ;
select title,auth_fname,released_year from books where auth_fname='Dubner' ;

select title from books where title like '%t';
select title from books where title like 's%';
select title from books where title not like 'D%';

select title,released_year from books where released_year >2017;
select title,released_year from books where released_year >=2017 order by released_year;
select title,stock_qty from books where stock_qty >300;



select title,released_year from books where released_year <2017;
select title,released_year from books where released_year <=2017 order by released_year;
select title,stock_qty from books where stock_qty <300;

-- &&
select * from books;
select * from books where auth_fname='hawking' and released_year=2017;

select title,auth_fname,released_year from books where auth_fname='hawking' and released_year >=2000;

select * from books where title='God Created the Integers' and released_year='true';

select title,auth_fname,released_year from books where auth_fname='hawking' 
  && released_year >=2000 && title like 'God Created the Integers';
-- logical or
select title,auth_fname,released_year from books where
 auth_fname='hawking' || released_year >=2016;
 
select title,auth_fname,released_year,stock_qty from books where
 auth_fname='hawking' || released_year >=2016 || stock_qty>500;
 
select title,released_year from books where released_year between 2014  and 2017;  

select title,released_year from books where released_year not between 2014  
  and 2017 order by released_year;
  
-- 'cast' it changes one data type into other data type
 select * from books;