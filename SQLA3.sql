create database SQL3

use SQL3

create table DEPT
(
Deptno Numeric(2) primary key,
Name varchar(15) not null,
Loc varchar(20) not null
)

create table EMP
(
Empno Numeric(4) primary key,
Ename varchar(20) not null,
Job varchar(15) not null,
Mgrid Numeric(4) references Emp(Empno),
Hiredate Date not null,
Sal Numeric not null,
Comm Numeric,
Deptno Numeric(2) references Dept(Deptno)
)

insert into DEPT values(10,'Accounting','New York'),(20,'Research','Dallas'),(30,'Sales','Chicago'),(40,'Operation','Boston')

select * from DEPT

insert into EMP(Empno,Ename,Job,Hiredate,Sal,Deptno) values (7839,'King','President','17-Nov-81',5000,10)

insert into EMP(Empno,Ename,Job,Mgrid,Hiredate,Sal,Deptno) values (7698,'Blake','Manager',7839,'01-May-81',2850,30)

insert into EMP values (7499,'Allen','Salesman',7698,'20-Feb-81',1600,300,30),(7521,'Ward','Salesman',7698,'22-Feb-81',1250,500,30),
(7654,'Martin','Salesman',7698,'28-Sep-81',1250,1400,30)

insert into EMP(Empno,Ename,Job,Mgrid,Hiredate,Sal,Deptno) values (7566,'Jones','Manager',7839,'02-Apr-81',2975,20),
(7782,'Clark','Manager',7839,'09-Jun-81',2450,10)

insert into EMP(Empno,Ename,Job,Mgrid,Hiredate,Sal,Deptno) values (7902,'Ford','Analyst',7566,'03-Dec-81',3000,20),
(7788,'Scott','Analyst',7566,'19-Apr-87',3000,20)

insert into EMP(Empno,Ename,Job,Mgrid,Hiredate,Sal,Deptno) values (7369,'Smith','Clerk',7902,'17-Dec-80',800,20),
(7876,'Adams','Clerk',7788,'23-May-87',1100,20),(7900,'James','Clerk',7698,'03-Dec-81',950,30),(7934,'Miller','Clerk',7782,'23-Jan-82',1300,10)

insert into EMP values (7844,'Turner','Salesman',7698,'08-Sep-81',1500,0,30)

select * from EMP

--1
select * from EMP where Job = 'Manager'

--2
select Ename,Sal from EMP where Sal > 1000

--3
select Ename,Sal from EMP where Ename != 'James'

--4
select * from EMP where Ename like 'S%'

--5
select Ename from EMP where Ename like '%a%'

--6
select Ename from EMP where Ename like '__l%'

--7
select Sal/30 from EMP where Ename = 'Jones'

--8
select sum(Sal) from EMP

--9
select avg(Sal) from EMP

--10
select Ename,Job,Sal,Deptno from EMP where Job!='Salesman' and Deptno!=30

--11
select Name from DEPT where Deptno = any (select distinct(Deptno) from EMP)

--12
select Ename as 'Name',Sal as 'Salary' from EMP where Sal > 1500 and (Deptno=10 or Deptno=30)

--13
select Ename,Job,Sal from EMP where (Job = 'Manager' or Job = 'Analyst') and (Sal!=1000 or Sal!=3000 or Sal!=5000)

--14
select Ename,Sal,Comm from EMP where Comm > Sal + Sal*0.1

--15
select Ename from EMP where Ename like '%ll%' and (Deptno=30 or Mgrid=7782)

--16

--17
select EMP.Ename,DEPT.Name from EMP join DEPT on EMP.Deptno= DEPT.Deptno order by EMP.Ename , DEPT.Name desc

--18
select Ename,FLOOR(DATEDIFF(year,Hiredate,SYSDATETIME())) as 'Years of Experience' from EMP where Ename='Miller'