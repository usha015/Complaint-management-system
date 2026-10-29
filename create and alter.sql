create database pfs39;
show databases;
use pfs39;
create table students(std_id int, std_name varchar(20), email varchar(30), phn_no bigint, city char(15));
use pfs39;
desc students;
create table employees(emp_id int primary key, emp_name char(20) not null, salary decimal(10,2) check(salary>=25000), email varchar(20) unique, city char(20) default 'hyd',
phn_no varchar(20));
desc employees;
drop table students;
create table courses(c_id int primary key, c_name char(20));
desc courses;
create table students(std_id int primary key, std_name varchar(20) not null, email varchar(30) unique, phn_no bigint,age tinyint check(age>=18), city char(20) default 'vij',
c_id int, foreign key(c_id) references courses(c_id));
desc students;

##### Alter
#to add column and to drop the column
#to change the datatype and size of column
#to rename column or table
#to add or drop the constarints
#to add a column
#drop --remove both data and structure or sale
#truncate --remove only the data, but the stucture will be there

desc employees;
alter table stusents rename students;
alter table students rename column std_id to student_id;
desc students;
alter table students rename std;
desc std;
rename table std to students;
desc students;
desc courses;
use pfs39;
desc courses;
desc students;

insert into courses values(101,'pfs');
select * from courses;

insert into courses values(102,'jfs'),(103,'DA');
select * from courses;

desc students;
insert into students values(1,'usha','usha@123',345678990,21,'elr',101);
select * from students;

insert into students values(2,'reyna','reyna@123',0987654321,21,'hyd',102),(3,'shraboni','shra@123',4567098765,22,'kol',103);
select * from students;
desc students;

insert into  students(student_id,std_name,email,phn_no,age,c_id) values(4,'suguna','sug@123',56789765,23,104);

insert into students values(5,'charan','cha@!23',987654345,54,105);

truncate students;
select * from students;
drop table students;
desc students;

create table students(std_id int primary key, std_name varchar(20) not null, email varchar(30) unique, phn_no bigint,age tinyint check(age>=18), city char(20) default 'vij',
c_id int, foreign key(c_id) references courses(c_id));
desc students;
drop table students;

create table students(std_id int, std_name varchar(20), email varchar(30), phn_no bigint,city char(15));
desc students;

alter table students add constraint prk_emp_id primary key(std_id);
desc students;

alter table students add constraint uni_email unique key(email);
desc students;
desc students;
alter table students add column age tinyint;
alter table students add column c_id int;
desc students;
alter table students add constraint ck_age check(age>=18);
alter table students modify column phn_no bigint not null;
alter table students add constraint fr_cid foreign key(c_id) references courses(c_id);
use pfs39;
create table students(std_id int, std_name varchar(20), email varchar(30),age tinyint, phn_no bigint,city char(15),c_id int);

create table students(std_id int, std_name varchar(20), email varchar(30),age tinyint, phn_no bigint,city char(15),c_id int);
desc students;

alter table students add constraint pk_emp_id primary key(std_id);
desc students;
alter table students alter column city set default 'hyd';
use pfs39;
create table emp(emp_id int primary key auto_increment, emp_name varchar(20), salary decimal(10,2));
desc emp;
insert emp(emp_name, salary) values('A',28000),('B',35000),('C', 33000),('D',60000);
select * from emp;
select last_insert_id();
insert into emp(emp_name, salary) values ('E',30000);

#inserting data from one tablr to another table
create table high_salary_emp(emp_id int, emp_name char(20), salary decimal(10,2));
insert into high_salary_emp(emp_id, emp_name, salary)
create table high_sal_emp(e_id int,em_name varchar(30), salary decimal);

insert into high_sal_emp (e_id,em_name,salary) select * from emps where salary>100000;

select * from high_sal_emp;

#create a table from another table
select * from emp where salary < 30000;
create table low_salary_emp as select * from emp where salary < 30000;
select * from low_salary_emp;
select * from employees;
create table Employees_1(emp_id int, emp_name char(20), dept_id int, salary decimal(10,2), email varchar(20), city char(10));
insert into Employees_1 values(1,'A',101,35000, null, 'hyd'), (2, null, null, 40000, 'B@gmail.com', 'vij'), (3, 'C', 102, 28000, 'C@gmail.com',null), (4,'D', 101, 33000, null, 'vij'), (5,'E',108,25000,null,'blr'), (6,'F',103,45000,'F@gmail.com','hyd'), (7,'G',103,50000,'G@gmail.com','blr');
select * from Employees_1;
update Employees_1 set email = 'A@gmail.com' where emp_id = 1;
set sql_safe_updates = 0;
update Employees_1 set email='D@gmail.com' where emp_id=4;
update Employees_1 set dept_id=102 where dept_id is null;
update Employees_1 set email='is not provided' where email is null;
update Employees_1 set city='Blr' where dept_id=103 and city='hyd';
shift all Employees_1, who are working in 102 dept to 'hyd';


use pfs39;
select * from superstore;
select category, country, segment from superstore;
select country from superstore;
select distinct country from superstore;
select distinct category from superstore;
select distinct country, category from superstore;
select distinct country, category, segment from superstore;
select distinct country from superstore;
select distinct country from superstore order by country asc;
select distinct country from superstore order by country desc;
select distinct sales from superstore order by sales desc limit 10;
select distinct sales from superstore order by sales desc limit 1 offset 1;
select distinct sales from superstore order by sales desc limit 2 offset 3;
select distinct country from superstore where country='germany';
select distinct country, category from superstore where country='germany'and category='technology';
select distinct country from superstore where country!='germany';
select distinct country from superstore where country='germany'or country='france';
select distinct country from superstore where country !='germany' and country<>'france' order by country asc;
select distinct country,sales from superstore where country in('germany','france','spain','italy') and sales>500 order by sales desc;

use pfs39;
select country, sales from superstore where country in('spain','italy') and sales>500;
select country, sales from superstore where (country='spain' or country='italy' ) and sales>500;

#set the sales from 500-200
select country, sales from superstore where country in('spain','italy') and sales>=500 and sales<=2000;
select sales from superstore where sales between 500 and 2000 order by sales;
select distinct country from superstore where country between 'france' and 'spain' order by country;
select distinct country,sales from superstore order by country asc, sales desc;
select distinct country,category from superstore order by country asc, category desc;

#pattern matching -- like,not like
select distinct country from superstore where country like 'i%';  #startswith means before percentage given letter starting letter 
select distinct country from superstore where country like '%a'; #endswith

select distinct country from superstore where country like '%ia%';

#get the customer name starts with 's' letter
select distinct customer_name from superstore where customer_name like 's%';
select distinct customer_name from superstore where customer_name like '%land';
select distinct customer_name from superstore where customer_name like '%king%';

#get the countries starting with 'i' letter and letter have exactly 5 letters
select distinct country from superstore where country like 'i____';
select distinct country from superstore where country like '_______';
select distinct country from superstore where country not like '_______%';
select distinct country from superstore where country like '__d%';

#arithematic operator------ +,-,*,/,%
select distinct profit, quantity from superstore ;
select distinct profit, quantity , profit/quantity as profit_per_item from superstore;

#add +
select distinct sales ,sales+200 as sales_full from superstore;
 
#assignment operator-----=,:=
set @min_sales=500;
select @min_sales;
select sales from superstore where sales>@min_sales;

#bitwise operator----&,|,^,-,<<,>>
select 5<<3; #multiplies by 2 power n--- 5*2^2
#x=5 , n=3 ------ x*2^n
select 60>>3; #divides by 2^n---x/2^n
select 2&6;
select 3|7;
select * from emps;
truncate employees;
insert into employees values(1,'kavya',098765),(2,'geetha',765678),(3,'reyna',5678998),(4,null,456789);
desc employees;
select * from employees where emp_name is not null;

create table students1(std_id int, std_name varchar(20), email char(30), phn_no bigint, city varchar(20), age tinyint);
insert into students1 values(1,'thanuja',null,456786544,'vij',22),(2,'charan','charan@123',null,'vizag',null),(3,'reyna','rayna@123',56787654,'hyd',34),(4,'remo',null,null,'hyd',23);
desc students1;
select * from students1;

#isnull()--checks the values and return 1 or 2 if it is null else 0 or false
select email,isnull(email)from students1;
select age,isnull(age)from students1;

#ifnull()--- checks the value provides an alternative value if it is null
select phn_no, ifnull(phn_no, 'Not Provided')from students1;
select age, ifnull(age,0) from students1;

#alesce()---- check multiple values and returns the first non null values
select email,phn_no, coalesce(email,phn_no, 'Not Provided')as first_contact from students1;

#aggregation functions---- sum,avg,count,min,max
select sum(sales)as total_sales from superstore;
select avg(sales)as avg_sales from superstore;
select count(sales) as total_no_of_sales from superstore;
select max(sales) as highest_sales from superstore;
select min(sales)as lowest_sales from superstore;

#get country wise total sales
select country, sum(sales)as total_sales from superstore group by country order by total_sales desc;

#set category wise avg sales
select category, avg(sales)as average_sale from superstore group by category;

#set country and category wise total sales
select category,country, sum(sales) as total_sale from superstore group by category,country;

#find the highest sale  for the countries (germany,france,italy,spain,austria)
select country, max(sales)as highest_sale from superstore where country in ('germany','france','italy','spain','austria') group by country order by highest_sale desc;

#from--- choose the table from database
#where---filters the data
#group by--group the rows, aggrigate the column
#having--filters the groups
#select--to select the column from the table
#distinct---removes duplicates
#order by--- sorts the result 

#find total and avg sales for the countries which has the letters 'a' and 's' in it and the total_sale should be above 5l and sort in desc

select country , sum(sales) as total_sale,avg(sales)as avg_sale from superstore where country like '%a%'and country like'%s%' group by country having total_sale>20000 order by total_sale desc;

select avg(sales) from superstore;

#non scalar functions-- round(), ceil()/celling(), floor(), truncate()
#round -- rounds to the nearest  integer, based on the decimal values
#IF THE value is >=5, round UP to the integer else
#rounds DOWN to the nearest integer
#ceil()/celling()-- Rounds UP to the nearest integer
#floor-- round DOWN to nearest integer
#truncate-- Just trims the values

select round(1153.567,2);
#-1 -- rounds to nearest to the nearest 10s
#-2 -- rounds to nearest to the nearest 100s
#-3 -- rounds to nearest to the nearest 1000s
#0 -- rounds to nearest int based on the decimal values
#1 -- rounds to the nearest int based on the decimal values
# -- rounds to 1 decimal value based on the next decimal values

select floor(13.6676);
select truncate(113.567,1);

select round(avg(sales),3) from superstore;
select sqrt(36);
select power(2,3);
select abs(100-200);
select mod(23,2);
select pi();
select sign(-5);
select rand();
select exp(2);
select log(7.38905609893065);
select greatest(12,300,20);
select least(12,30,100);

##string functions
#string search functions --- locate(),position(),instr()
select distinct order_id from superstore;
select distinct order_id, locate('-',order_id)from superstore;
select distinct order_id, position('-'in order_id)from superstore;
select distinct order_id,instr(order_id,'-')from superstore;

#locate(substring, string)
#position(substring in string)
#instr(string, substring)
select distinct order_id, locate('-',order_id) as 1st,locate('-',order_id,locate('-',order_id)+1)as 2nd from superstore;


#date functions
use pfs39;
select now();
select current_date();
select curdate();
select current_time();
select curtime();
select date("2026-05-05");
select date(curdate());
select makedate(2026,276);
select year('2025--08-23');
select month(curdate());
select monthname(curdate());
select day(curdate());
select dayname(curdate());
select week(curdate());
select week('2026-05-05');
select quarter(curdate());
select weekday(curdate()); #mon-0, tue-1, wed-2, thur-3, fri-4, sat-5, sun-6
select dayofweek(curdate()); # sun-1, mon-2, tue-3, wed-4, thur-5, fri-6, sat-7
select dayofmonth(curdate());
select date_format(curdate(),'%y/%b/%D');

#2025-10-05    26-oct-5th
#%a --- short day name --mon,tues
#%b -- short month name -- jan,feb
#%d --day number --1,2,3
#%m---month number ---1,2,3
#%D---date with suffix---1st,2nd,3rd
#%M---full month name--- march,october
#%W---full day names--monday,friday
#%Y---full year---2026
#%y----short year---26,25

select datediff('2026-09-05',curdate());
select date_add(curdate(),interval 13 day);
select date_sub('2025-08-23',interval 365 day);

select distinct order_date, ship_date from superstore;

#getv the year ,month, monthname and day from order_date column
select distinct order_date,year(order_date)as yr,month(order_date)as moth,monthname(order_date)as mname,day(order_date)as dy from superstore;

#get dayname,quarter and week from ship_date column
select distinct ship_date,dayname(ship_date)as sd,quarter(ship_date)as qtr,week(ship_date)as wk from superstore;

#calculate shipping days
select ship_date,order_date,datediff(ship_date,order_date)as shippingdays from superstore;
select datediff(ship_date,order_date)as shippingdays from superstore;

#add 10 days to the order_date as expected_date
select date_add(order_date,interval 10 day)as expected_date from superstore;
select date_sub(order_date,interval 30 day) as previous_date from superstore;
select order_id, year(order_date)as yr from superstore where year(order_date)=2022;

#get the orders placed in october
select order_id, monthname(order_date)as mname from superstore where monthname(order_date)='october';

#find the orders which shipped on their other date
select order_id from superstore where datediff(ship_date,order_date)=0;

select order_id from superstore where ship_date=order_date;

#get the no.of orders placed in each year
select year(order_date)as yr,count(order_id)as no_of_orders from superstore group by yr;
use pfs36;
#count orders by month
select month(order_date)as mn, count(order_id)as no_of_orders from superstore group by mn;

#format the order_date in this format: 26-10-mon;
select date_format(order_date,'%Y-%m-%a') formatted_date from superstore;

##system information functions
select version(); #returns mysql server versions
select user();    #returns user and hostname of the server
select connection_id();  #returns the unique id generated for this connection/session

select * from courses;
delete from courses;
select * from courses;

#return no_of rows affected by the most recent dml statement
insert into courses values(104,'ai'),(105,'dsa');
select row_count();

update courses set c_name= 'html' where c_id=105;
select row_count();

select @@version;
select @@hostname;

###set operators
#union--return the result from any 2 quaries without any duplicates
#union all--returns the result from any 2 quaries with duplicates
#intersection--returns the  common r
#except

create table store_orders(c_id int, c_name char(20));
insert into store_orders values(101,'kavya'),(102,'charan'),(103,'varun'),(104,'monoj'),(105,'usha');

create table online_orders(c_id int, c_name char(20));
insert into online_orders values(104,'pavan'),(105,'sam'),(106,'ramys'),(107,'priya'),(108,'praveen');
desc table store_orders;
desc online_orders;
desc store_orders;
 
select * from store_orders
union all
select * from online_orders;

select * from store_orders intersect select * from online_orders;

select * from store_orders except select * from online_orders;

#conditional/ CASE statements
select * from myemp;
#if(codition, value_if_true , value_if_false)
select emp_id, salary, if(salary>5000,'good','bad')status from myemp;
select emp_id,salary,case when salary>15000 then 'good' else 'bad' end as status from myemp;

#salary<10000--'bad',salary>15000---'good',salary10-15---'avg'
select salary, if(salary<10000,'bad',if(salary>15000,'good','avg'))status from myemp;
select salary, case when salary>15000 then 'good' when salary <10000 then 'bad' else 'avg' end as status from myemp;

select salary, if(salary>5000, 'good',if(salary<2000,'bad','avg'))status from myemp;
select salary,case when salary>5000 then 'good' when salary <2000 then 'bad' else 'avg' end as status from myemp;

use pfs39;
### ---------------- joins ----------------
#inner join --returns only the matching records from both the tables
#left join - returns all the records from the left table and only the matching
        #records from the right table
#right join - returns all the records from the right table and only the
        #matching records from the left table
#full join - returns both (matching & non-matching records) from both tables
#cross join -- returns cartesian product of both tables
#self join - a table joins with itself
#equi join
#non-equi join
#natural join

select * from emps;
select * from depts;

select e.emp_name,d.dept_name from emps e inner join depts d on e.dept_id = d.dept_id;

select e.emp_name,d.dept_name from emps e left join depts d on e.dept_id = d.dept_id;

select e.emp_name,d.dept_name from depts d left join emps e on e.dept_id = d.dept_id;

select e.emp_name,d.dept_name from emps e right join depts d on e.dept_id = d.dept_id;

select e.emp_name, d.dept_name from depts d right join emps e on e.dept_id = d.dept_id;

select e.emp_name,d.dept_name from depts d left join emps e on e.dept_id=d.dept_id 
union
select e.emp_name,d.dept_name from emps e right join depts d on e.dept_id=d.dept_id;
select e.emp_name,d.dept_name from emps e cross join depts d;
#display the emps who are working in it dept
select e.emp_name,d.dept_name from emps e join depts d on e.dept_id = d.dept_id where d.dept_name ='IT';
select e.emp_name,d.dept_name,e.salary from emps e join depts d on e.dept_id = d.dept_id where d.dept_name ='IT';
select d.dept_name,e.emp_name,e.salary from emps e right join depts d on e.dept_id = d.dept_id;

select d.dept_name,e.emp_name from emps e right join depts d on e.dept_id = d.dept_id;
select d.dept_name,e.emp_name from depts d  left join  emps e on e.dept_id = d.dept_id;

select d.dept_name,e.emp_name,e.salary from depts d left join emps e on e.dept_id = d.dept_id;
select e.emp_name,d.dept_name,e.salary from emps e right join depts d on e.dept_id = d.dept_id where e.emp_name is null;

#find highest salary in each dept
select d.dept_name, max(e.salary) from emps e join depts d on e.dept_id = d.dept_id group by 1;
use pfs39;
#display the depts with hightest avg salary
select d.dept_name ,avg(e.salary)as avg_salary from emps e join depts d on e.dept_id =d.dept_id group by d.dept_name order by avg_salary desc limit 1;
#display then depts of the emps whose salary is above 30k
select d.dept_name ,e.emp_name ,e.salary from emps e join depts d on e.dept_id=d.dept_id where e.salary>30000;
#display the emps without a dept
select e.emp_name , d.dept_name from emps e left join depts d on e.dept_id=d.dept_id where e.dept_id is null;
#find no-of emps working in each dept
select d.dept_name,count(*) from emps e join depts d on e.dept_id =d.dept_id group by 1;

select * from customers;
select * from orders;
select * from products;
select * from order_details;

#get customer names and their order ids
select c.c_name,o.order_id from customers c join orders o on o.c_id = c.c_id;

select c.c_name,o.order_id,p.prod_name from customers c join orders o on c.c_id = o.c_id join order_details od on o.order_id = od.order_id join products p on p.prod_id = od.prod_id;
select c.c_name,o.order_id,p.prod_name from customers c join orders o on c.c_id = o.c_id join order_details od on o.order_id = od.order_id join products p on p.prod_id = od.prod_id where prod_name='smartphone';

#dispaly the products and count how many times each product purchased

select p.prod_name , count(od.prod_id) as cou  from products p join order_details od on p.prod_id=od.prod_id group by 1 order by 2;

select c.c_name , count(o.order_id) as cou from customers c join orders o on c.c_id=o.c_id group by 1;

#display te customers who are from hyd and the products they purchased
select c.c_name ,p.prod_name from customers c join orders o  on c.c_id =o.c_id 
join order_details od on od.order_id=o.order_id join products p on od.prod_id=p.prod_id where c.city="hyd";

#find total expenditure of each customer
select c.c_name ,sum(p.price*od.quantity) as total from customers c join orders o on c.c_id=o.c_id 
join order_details od on o.order_id =od.order_id join products p on od.prod_id=p.prod_id group by 1;

select * from emps;

#self join
select e.emp_name as employee,m.emp_name as manager from emps e join emps m on e.manager_id=m.emp_id;



#subquery

#single-row subquery---=,>,<,!=(any comparision operators ) inner query result will single record
#mulitple-row subquery----in,not in, any, all
#correlated subquery
#non-correlated subquery

#find the sales which are greater than avg sales
select sales from superstore where sales >(select avg(sales) from superstore);

#find second highest sales
select max(sales) from superstore where sales<(select max(sales) from superstore);

#find the profit which are greater than max profit in furniture categore
select profit from superstore where profit> (select max(profit) from superstore where Category='furniture');

#find the orders placed on the lastest order_date

select order_id from superstore where order_date=(select max(order_date) from superstore ) ;

#multiple row
#find all the orders of the customers who are from england

select distinct Customer_Name,order_id,state from superstore where Customer_Name in (select distinct customer_name from superstore where State='england');
use pfs39;
#find all the orders of the customers who ever placed an order in technoloy category
select customer_name from superstore where Customer_Name in (select customer_name from superstore where Category="technology");

#find the sales which are greater than any of the sales in furniture category
select sales from superstore where sales > any(select sales from superstore where category='furniture');

#find th sales which are greater then all the sales in furniture catgory
select sales from superstore where sales> all (select sales from superstore where category='furniture');

#display the customer who placed the order_id=3
select * from customers where c_id=(select c_id from orders where order_id =3);

#display the products purchased in order_id=5
select * from products where prod_id=(select prod_id from order_details where order_id=5);

#display the price of the product in order_id=1
select price from products where prod_id=(select prod_id from order_details where order_id=1);

#display the product which has price greater then the avg price of all product
select price from products where price >(select avg(price) from products); 

#display the customer who placed lastest order
use pfs39;
select * from customers where c_id=(select c_id from orders where order_date=( select max(order_date) from orders)) ;

#display the customer who never ordered
select * from customers where c_id not in (select c_id from orders);
#display the products that were never purchased
select prod_name  from products where prod_id not in (select prod_id from order_details);
#display the products which were purchased more than once
select p.prod_name ,count(od.prod_id) from order_details od join products p on p.prod_id=od.prod_id group by 1 having count(od.prod_id)>1;

select * from products where prod_id in( select prod_id from order_details group by prod_id having count(prod_id)>1);

#display the customers who purchased 
select * from customers where c_id in
(select c_id from orders where order_id in
(select order_id from order_details where prod_id=
(select prod_id from products where prod_name ="smartphone")));

#correlation
#find the employees who are earning more than their dept's avg salary
select e1.emp_name ,e1.salary from emps e1 where e1.salary>
(select avg(e2.salary) from emps e2 where e1.dept_id=e2.dept_id);

#find the emps earning highest salary
select e1.emp_name ,e1.dept_id,e1.salary from emps e1 where e1.salary =
(select max(e2.salary) from emps e2 where e1.dept_id=e2.dept_id);

#find the emps who are the only employee in their dept
select e1.emp_name ,e1.dept_id,e1.salary from emps e1 where 
(select count(e2.salary) from emps e2 where e1.dept_id=e2.dept_id)=1;

#find the emps who has colleague in their dept
select e1.emp_name ,e1.dept_id,e1.salary from emps e1 where 
(select count(e2.salary) from emps e2 where e1.dept_id=e2.dept_id)>1;

#view === virtual table which stores the query to reuse
#create view view_name as select.....
create view germany as select * from superstore where country='germany';
select * from germany;
select category,country,sales from germany where sales >1000;




















