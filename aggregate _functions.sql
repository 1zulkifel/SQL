select count(*)from books ;
select count(auth_fname) from books;
select count(distinct auth_fname) from books;
select count(*) from books where title like '%How%';


select concat('in' , released_year,' ', count(*) ,'book released') as years from books
	group by released_year;

-- min and max
select min(released_year) from books;
select min(pages) from books;
select max(released_year) from books;
select max(pages) from books;

select * from books 
where pages = (select min(pages) from books);
-- it works slow on big data
select title,pages from books where 
pages=(select max(pages) from books);
-- 
select * from books 
order by pages asc limit 1;
--
select title,pages from books 
order by pages desc limit 1;

-- min/max with group by
select auth_fname, auth_lname,min(released_year) from books
group by auth_fname,auth_lname;
--
select auth_fname, auth_lname,max(pages) from books
group by auth_fname,auth_lname;
--

select concat( auth_lname, auth_lname) as Authors, max(pages) as 'longest book' from books
group by auth_fname,auth_lname;
-- sum
select sum(stock_qty) from books;
--
select auth_fname ,auth_lname, sum(pages) from books group by
auth_fname,auth_lname;
--
select auth_fname ,auth_lname, sum(released_year) from books group by
auth_fname,auth_lname;
--avg
select avg(pages) from books;
--
select avg(released_year) from books;
select title,avg(released_year) from books
group by title;
--

select avg(stock_qty) from books
group by released_year;
--
select released_year,avg(stock_qty) from books
group by released_year;
--
select auth_fname,auth_lname, avg(pages) from books
group by auth_fname,auth_lname;
--
-- Exercise 
select count(stock_qty) from books;
--
select released_year,count(*) from books
group by released_year;
--
select sum(stock_qty) from books;
--
select auth_fname,auth_lname, avg(released_year) from books
group by auth_fname,auth_lname ;
--
select concat(auth_fname,' ', auth_lname) pages from books
order by pages desc limit 1;

select concat(auth_fname,' ', auth_lname),pages  from books
order by pages asc limit 1;
--
select released_year as 'year',count(*) as '#books',
	avg(pages) as 'avg pages' from books
	group by released_year; 