select distinct concat(auth_fname, ' ',auth_lname) from books; 
select distinct auth_lname,auth_lname from books;

-- order by
select auth_lname from books order by auth_lname;
select auth_lname from books order by  auth_lname desc ;
select title,pages,stock_qty from books order by released_year desc;
select title,pages,stock_qty from books order by 3;
select auth_fname,auth_lname from books order by  auth_lname, auth_fname ;

-- limit
select title from books limit 3;
select title,pages,stock_qty from books order by released_year desc limit 3;
select title,pages,stock_qty from books order by released_year desc limit 0,5;
select title from books limit 8, 15;

-- like
select title,auth_fname from books where title like '%Da%'; 
select title from books where title like 'Fu%'; 
select title, stock_qty from books where stock_qty like'___' ;
-- select title, stock_qty from books where stock_qty like'()____-_____' ; for matching patterns
-- search name having % and _ atc
select title from books where title like '%\%%';
select title from books where title like '%\_%';

-- Exercise
select * from books;
select title from books where title like '%Nature%';

select title , pages from books order by pages desc limit 1;

select concat(title,'-', released_year) as summary  from books order by released_year desc limit 3 ;

select title,auth_fname from books where title like'% %';

select title,released_year,stock_qty from books order by stock_qty  like  0,3 ;

select title,auth_fname from books order by auth_fname ;
select title,auth_fname from books order by 2,1 ;

select  concat('my favorite auth is ', upper(auth_fname),' ',upper(auth_lname),'!') as yell
 from books order by auth_lname;
