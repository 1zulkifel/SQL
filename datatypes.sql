create database datatypes;
use datatypes;
-- varchar, decimal(5,3), double and float are used to store larger numbers 
-- use decimal
-- for financial data use double
create table dtype(name varchar(5),weight decimal(10,3),price float
);
insert into dtype(name,weight, price) values('abc',555.444,88.23),('fgh',7,9989976544.23),('er',345367,1.445),
('jh',1.9999,0.23);
select* from dtype;
drop table dtype;
--
-- Dates and time format => date(yy,mm,dd), time (hh,mm,ss),datetime(yy,mm,dd hh,mm,ss)
create table peple(name varchar(10),birthdate date,birthtime time, birthDT datetime);
insert into peple(name ,birthdate,birthtime,birthDT) values(
'khan','1998-06-16', '2:12:47','1998-06-16 2:12:47');
select * from peple;
-- curdate(),curtime(),now()
select curdate()as today from peple;
insert into peple(name ,birthdate,birthtime,birthDT) values(
'wali',curdate(),curtime(),now());

select* from peple;
-- formating dates
select name,birthdate,dayname(birthdate)from peple; 
select name,birthdate,dayofweek(birthdate)from peple; 
select name,birthdate,dayofyear(birthdate)from peple;
--
select name,birthDT,dayofyear(birthDT)from peple;
select name,birthdate,month(birthdate)from peple;
select name,birthdate,monthname(birthdate)from peple;
select name,birthtime,hour(birthtime)from peple;
select name,birthtime,minute(birthtime)from peple;
--

select concat( monthname(birthdate), ' ', dayname(birthdate),' ', year(birthdate)) from peple;

select concat( monthname(birthdate), ' ', day(birthdate),' ', year(birthdate)) from peple;
select date_format(birthdate, 'your birthday on %W/%M/%Y' ) from peple;

select date_format(birthdate, 'your birthday on %m/%d/%y' ) from peple;
select date_format(birthdate, 'your birthday on %m/%d/%y at %h:%m:%s' ) from peple;

-- date difference
select name,birthdate,datediff(now(),birthdate) from peple;
-- 
select birthDT,date_add(birthDT,interval 1 month) from peple;
select birthDT,date_add(birthDT,interval 10 second) from peple;
select birthDT,birthDT + interval 1 month from peple;
select birthDT,birthDT - interval 1 month from peple;
select birthDT,birthDT + interval 1 month + interval 10 hour from peple;

-- Time stamp
create table contents( comments varchar (20),
created_at timestamp default now());
insert into contents(comments)values('its awesome');

select * from contents;
select* from contents order by created_at desc;
--
create table comments( contents varchar (20),
created_at timestamp default now() on update current_timestamp);
insert into comments(contents)values('go with flow');
select * from comments;
update comments set contents='my God' where contents='its awesome';
select * from comments order by contents;
--
select date_format(curdate(),'%m/%d%/Y');
select date_format (now(),'%w');

select date_format (now(),'%m');
select date_format(now(),'%M %D at %h:%i');

-- cast
select name ,birthdate from peple where birthdate between 
cast('1998-06-16' as datetime) and cast('2000-06-16' as datetime);
-- Modulo
