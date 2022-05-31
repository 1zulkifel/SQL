create database shirts_db;
use shirts_db;
create table shirts(
shirt_id int not null auto_increment,article varchar(20) not null,
color varchar(20) not null,shirt_size varchar(10) not null,
last_worn int not null, primary key (shirt_id));
select *from shirts;
insert into shirts(article ,color ,shirt_size ,last_worn)
 values
 ('t-shirt','red','S',10),
 ('t-shirt','black','S',200),
 ('polo shirt','white','M',10),
 ('tank top','pink','S',17),
 ('tank top','red','S',15),
 ('t-shirt','green','M',0),
 ('polo shirt','yellow','S',20),
 ('f-shirt','brown','M',200);
 select * from shirts;
 update shirts set shirt_size ='L' where article='polo shirt';
 select * from shirts;
 update shirts set last_worn=0 where last_worn=15;
 select * from shirts where color ='white';
 update shirts set color='off white', shirt_size='XS' where shirt_id=3;
 select * from shirts;
 delete from shirts where last_worn=200;
select * from shirts;
delete from shirts where article='tank top';
select * from shirts;

