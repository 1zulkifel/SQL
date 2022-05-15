# Some of The Most Important SQL Commands
## DDL(Data Definition Language) Creating table structure
    - SELECT- extracts data from a database
    - CREATE DATABASE- creates a new database
    - ALTER DATABASE- modifies a database
    - CREATE TABLE- creates a new table
    -ALTER TABLE- modifies a table
    - DROP TABLE- deletes a table
    - CREATE INDEX- creates an index (search key)
    - DROP INDEX- deletes an index
    - Truncate- Remove all records from table
    - Rename- rename an object
## DML( Data Manupulation Language)
    - INSERT INTO- inserts new data into a database
      **insert into employees(emp_id,f_name,L_name,salary) values(1,’qasim’,’khan’1000);
    - UPDATE- updates data in a database(update employees set last_name =’ali’ where emp_id in (6);
    - DELETE- deletes data from a database(delete from employees where emp_id in (6);)
## DCL( Data Control Language)
    - Grant- Gives access privileges to DB
      ** grant< privileges list> ON < Table Name> to <user>
    - Revoke- Withdraw access privileges given with the grant command
      **Revoke<relation name or privileges list> On <relation name or table name> to <user>
## TCL (Transaction Control Language)
    - commit- saves the work done
    - Rollback – Restores database to origin state since the last commit
    - savepoint- identify a point in a transaction to which you can roll back later
## SQL Operators -Filter
### Where;
    - used to specify a condition while fetching the data from a single table or by joining with multiple table
      ** select * from employees where emp_id =2;
## SQL Logical Operators (AND,OR,NOT).
    - AND (5<2) and (5>4) False
      ** select * from employees where First_Name='shahid' and salary=4000;
    - OR (5<2) and (5>4) True
      ** select * from employees where First_Name='qasim' or salary =1000;
    - NOT (5>4) True
      ** select * from employees where First_Name='qasim' and salary !=3000;
## SQL Comparison Operators.(<,>,>=,=<,!=)
** select * from employees where First_Name='shuja' or salary <=1000;
** select * from employees where First_Name='shuja' or salary >=2000;
** select * from employees where First_Name='shuja' and salary !=2000;
** select * from employees where First_Name='shuja' and salary >=2000;
** select * from employees where salary <2000;
