create database SQL1

use SQL1

create table tclients
(
	Client_ID numeric(4) primary key,
	Cname varchar(40) not null,
	Address varchar(30),
	Email varchar(30) unique,
	Phone numeric(10),
	Business varchar(20) not null,
)

create table tDepartments
(
Deptno Numeric(2) primary key,
Dname varchar(15) not null,
Loc varchar(20)
)

create table tEmployees
(
Empno Numeric(4) primary key,
Ename varchar(20) not null,
Job varchar(15),
Salary Numeric(7) check(Salary>0),
Deptno Numeric(2) references tbDepartments(Deptno)
)

create table tProjects
(
Project_ID Numeric(3) primary key,
Descr varchar(30) not null,
StartDate Date,
Planned_End_Date Date,
Actual_End_Date Date,
Budget Numeric(10) check(Budget>0),
Client_ID Numeric(4) references tClients(Client_ID),
constraint datecheck check(Actual_End_Date>=Planned_End_Date),
)

create table tEmpProjectTasks
(
Project_ID Numeric(3) references tProjects(Project_ID),
Empno Numeric(4) references tEmployees(Empno),
StartDate Date,
End_Date Date,
Task varchar(25),
Status varchar(15)
)

insert into tClients(Client_ID,Cname,Address,Email,Phone,Business) values(1001,'ACME Utilities','Noida','contact@acmeutil.com',9567880032,'Manufacturing');

insert into tClients(Client_ID,Cname,Address,Email,Phone,Business) values(1002,'Trackon Consultants','Mumbai','consult@trackon.com',8734210090,'Consultant'),(1003,'MoneySaver Distributors','Kolkata','save@moneysaver.com',7799886655,'Reseller'),
(1004,'Lawful Corp','Chennai','justice@lawful.com',9210342219,'Professional');

select * from tClients;

insert into tDepartments(Deptno,Dname,Loc) values(10,'Design','Pune'),(20,'Development','Pune'),(30,'Testing','Mumbai'),(40,'Document','Mumbai');

select * from tDepartments;

insert into tEmployees (Empno,Ename,Job,Salary,Deptno) values (7001,'Sandeep','Analyst',25000,10),(7002,'Rajesh','Designer',30000,10),(7003,'Madhav','Developer',40000,20),
(7004,'Manoj','Developer',40000,20),(7005,'Abhay','Designer',35000,10),(7006,'Uma','Tester',30000,30),(7007,'Gita','Tech.Writer',30000,40),
(7008,'Priya','Tester',35000,30),(7009,'Nutan','Developer',45000,20),(7010,'Smita','Analyst',20000,10),(7011,'Anand','Project Mgr',65000,10);

select * from tEmployees;


insert into tProjects (Project_ID,Descr,StartDate,Planned_End_Date,Actual_End_Date,Budget,Client_ID) values (401,'Inventory','01-Apr-11','01-Oct-11','31-Oct-11',150000,1001);
insert into tProjects (Project_ID,Descr,StartDate,Planned_End_Date,Budget,Client_ID) values (402,'Accounting','01-Aug-11','01-Jan-12',500000,1002),(403,'Payroll','01-Oct-11','31-Dec-11',75000,1003),
(404,'Contact Mgmt','01-Nov-11','31-Dec-11',50000,1004);

select * from tProjects;

insert into tEmpProjectTasks values(401,7001,'01-Apr-11','20-Apr-11','System Analysis','Completed'),(401,7002,'21-Apr-11','30-May-11','System Design','Completed'),
(401,7003,'01-Jun-11','15-Jul-11','Coding','Completed'),(401,7004,'18-Jul-11','01-Sep-11','Coding','Completed'),(401,7006,'03-Sep-11','15-Sep-11','Testing','Completed'),
(401,7009,'18-Sep-11','05-Oct-11','Code Change','Completed'),(401,7008,'06-Oct-11','16-Oct-11','Testing','Completed'),
(401,7007,'06-Oct-11','22-Oct-11','Documentation','Completed'),(401,7011,'22-Oct-11','31-Oct-11','Sign off','Completed'),
(402,7010,'01-Aug-11','20-Aug-11','System Analysis','Completed'),(402,7002,'22-Aug-11','30-Sep-11','System Design','Completed');

insert into tEmpProjectTasks (Project_ID,Empno,StartDate,Task,Status) values (402,7004,'01-Oct-11','Coding','In Progress')

select * from tEmpProjectTasks;