create database SQL4

use SQL4

create table books
(
id Numeric primary key,
title varchar(30),
author varchar(30),
isbn Numeric unique,
publishedDate Datetime,
)

insert into books values(1,'My first sql book','Mary Parker',981483029127,'2012-02-22 12:08:17'),(2,'My Second SQL book','John Mayer',857300923713,'1972-07-03 09:22:45'),
(3,'My Third SQL Book','Cary Flint',523120967812,'2015-10-18')

--1
select * from books where author like '%er'

create table review
(
id Numeric primary key,
book_id Numeric references books(id),
reviewer_name varchar(30),
content varchar(30),
rating Numeric(1),
published_date Datetime,
)

insert into review values(1,1,'John Smith','My first review',4,'2017-12-10 05:50:11'),(2,2,'John Smith','My second review',5,'2017-10-13 15:05:12'),
(3,2,'Alice Walker','Another review',1,'2017-10-22 23:47:10')

--2
select books.title,books.author,review.reviewer_name from books join review on books.id = review.book_id

--3
select reviewer_name from review group by reviewer_name having count(reviewer_name)>=2

create table customers
(
id numeric primary key,
name varchar(30),
age numeric,
address varchar(30),
salary float,
)

insert into customers values(1,'Ramesh',32,'Ahmedabad',2000),(2,'Khilan',25,'Delhi',1500),(3,'Kaushik',23,'Kota',2000),(4,'Chaitali',25,'Mumbai',6500),
(5,'Hardik',27,'Bhopal',8500),(6,'Komal',22,'MP',4500),(7,'Muffy',24,'Indore',10000)

--4
select name from customers where address like '%o%'

create table orders
(
oid numeric primary key,
date datetime,
customer_id numeric references customers(id),
amount numeric
)

insert into orders values(102,'2009-10-08 00:00:00',2,3000),(100,'2009-10-08 00:00:00',3,1500),(101,'2009-11-20 00:00:00',2,1560),(103,'2009-05-20 00:00:00',4,2060)


--5
select date,count(date) as 'Total number of orders places' from orders group by date