create database SQL2

use SQL2

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

--Q1
select * from EMP where Ename like 'A%'

--Q2
select * from EMP where Mgrid IS NULL

--Q3
select Empno,Ename,Sal from EMP where Sal between 1200 and 1400

--Q4
select * from EMP where Deptno = (select Deptno from Dept where Name = 'Research')
update EMP set Sal = Sal + (Sal * 0.1) where Deptno =  (select Deptno from Dept where Name = 'Research')
select * from EMP where Deptno = (select Deptno from Dept where Name = 'Research')

--Q5
select count(Ename) as 'No. of Clerks' from EMP where Job = 'Clerk'

--Q6
select count(Ename) as 'No. of Employees' ,avg(Sal) as 'Average Salary' ,Job from EMP group by Job

--Q7
select * from EMP where Sal = (select min(Sal) from EMP)
select * from Emp where Sal = (select max(Sal) from Emp)

--Q8
select * from DEPT where Deptno not in (Select Deptno from EMP group by (Deptno))

--Q9
select Ename,Sal from EMP where Sal > 1200 and Deptno = 20 order by Ename

--Q10
select DEPT.Deptno,DEPT.Name,sum(EMP.Sal) from DEPT,EMP where DEPT.Deptno = EMP.Deptno group by DEPT.Deptno,DEPT.Name

--Q11
select Ename,Sal from EMP where Ename = 'Miller' or Ename = 'Smith'

--Q12
select Ename from EMP where Ename like '[AM]%'

--Q13
select Sal * 12 from EMP where Ename = 'Smith'

--Q14
select Ename,Sal from EMP where Sal not between 1500 and 2850

--Q15
select Ename from EMP where Empno in (select Mgrid from EMP group by (Mgrid) having count(Mgrid)>2)  








