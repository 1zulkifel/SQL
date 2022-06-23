create database CustomerOrders;
use CustomerOrders;

create table customers(
	id int auto_increment primary key,
    first_name varchar(200),
    last_name varchar (100),
    email varchar(100)
    );

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id int,
    FOREIGN KEY (customer_id) REFERENCES customers (id)
); 
    

insert into customers(first_name,last_name,email) values
		('Boy','George','george@gmail.com'),
        ('George','Micheal','gm@gmail.com'),
        ('David','Bowie','david@gmail.com'),
        ('Blue','Steele','blue@gmail.com'),
        ('Bette','Davis','bette@gmail.com');
insert into orders(order_date,amount,customer_id) values
		('2016/02/10',99.99,1),
        ('2017/11/11',35.50,1),
        ('2014/12/12',450.25,2),
        ('2015/01/03',12.50,2),
        ('1999/04/11',450.25,5);
select *from customers;
select *from orders;

-- implicit inner joins
select first_name,last_name,order_date,amount
from customers,orders 
	where customers.id = customer_id;
-- implicit inner join

select * from customers
join orders
	on customers.id=orders.customer_id;

select first_name,last_name,order_date,amount from customers
join orders
	on customers.id=orders.customer_id;

-- inner join
select first_name,
		last_name,
	    sum(amount)as total_spent from customers
	inner join orders
		on customers.id = orders.customer_id
group by customer_id
order by total_spent desc;

-- left join

select first_name,
		last_name,
	    sum(amount)as total_spent 
from customers
left join orders
		on customers.id = orders.customer_id
group by customers.id
order by total_spent desc;
--

select first_name,
		last_name,
	    ifnull(sum(amount), 0)as total_spent 
from customers
left join orders
		on customers.id = orders.customer_id
group by customers.id
order by total_spent ;

-- right join
select first_name,
		last_name,
	    ifnull(sum(amount),0)as total_spent 
from customers
right join orders
		on customers.id = orders.customer_id
group by customer_id
order by total_spent ;

-- on delete cascade (we can drop values)

create table customers(
	id int auto_increment primary key,
    first_name varchar(200),
    last_name varchar (100),
    email varchar(100)
    );

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id int,
    FOREIGN KEY (customer_id) REFERENCES customers (id)
    on delete cascade
); 
    

insert into customers(first_name,last_name,email) values
		('Boy','George','george@gmail.com'),
        ('George','Micheal','gm@gmail.com'),
        ('David','Bowie','david@gmail.com'),
        ('Blue','Steele','blue@gmail.com'),
        ('Bette','Davis','bette@gmail.com');
insert into orders(order_date,amount,customer_id) values
		('2016/02/10',99.99,1),
        ('2017/11/11',35.50,1),
        ('2014/12/12',450.25,2),
        ('2015/01/03',12.50,2),
        ('1999/04/11',450.25,5);
select * from customers;
delete from customers where email= 'blue@gmail.com';
drop table customers;
show tables;

-- Exercise
create table students(
id int primary key auto_increment,
first_name varchar (20));

create table papers(
title varchar (100),
grade int,
student_id int,
foreign key( student_id) references students(id) on delete cascade);

insert into students(first_name)
values('Qasim'),('Shahid'),
	('Shuja'),('Wasim'),
	('Ali');
    
insert into papers(student_id,title,grade) values 
		(1,'My first book report',60),
		(1,'My English book report',70),
        (2,'My Urdu book report',80),
        (2,'My Physics book report',65),
        (4,'My Math book report',98);
		
drop tables papers; 

select first_name ,title,grade from students
 inner join papers
on students.id=papers.student_id
order by grade desc;

--
select * from students
 left join papers
on students.id=papers.student_id;

---
select first_name ,ifnull((title),'missing'),
		ifnull((grade),0) from students
 left join papers
on students.id=papers.student_id;
--
select first_name,
	ifnull(avg(grade),0) as average
from students
left join papers
	on students.id=papers.student_id
group by students.id
order by average desc;

-- ??
select first_name,
		ifnull(AVG(grade),0) as average,
        case
			when avg(grade) >= 75 then 'Passing'
            else 'Failing'
		end as Passing_status 
from students
left join papers
		on students.id =papers.student_id
group by first_name
order by average desc ;

--
select first_name,
		ifnull(AVG(grade),0) as average,
        case
			when avg(grade) is null then 'Failing'
			when avg(grade) >= 75 then 'Passing'
            else 'Failing'
		end as Passing_status 
from students
left join papers
		on students.id =papers.student_id
group by students.id
order by average desc ;

-- Many to many







