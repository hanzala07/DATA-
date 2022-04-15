create table department_1(
D_id int primary key ,
D_name varchar(50)
)
 insert into department_1 values(1,'it'),
 (2,'comp'),
 (3,'civil'),
 (4,'sales'),
 (5,'')

select * from department_1

create table n_emp(
Id varchar(5) primary key,
Name varchar(50),
Dob date,
Salary numeric(6),
City varchar(50),
D_id int foreign key  references department_1(D_id) 
)

insert into n_emp values('E07','Mitesh','1973/11/21',12500,'Jaipur',2)
insert into n_emp values('E08','Rehnuma','1991/08/19',11000,'Delhi',1),
('E09','Saurabh','1999/10/11',32000,'Vadodara',1),
('E10','Parin','2000/03/09',38000,'Gandhinagar',4),
('E11','Jyoti','1979/02/01',10000,'Gandhinagar',1),
('E12','Shivali','1984/09/25',19000,'Surat',2)

select * from department_1
select * from n_emp

--Q1:Display the department name and highest salary for each of the department of the employees.

select D_name,max(Salary) as highest_salary from n_emp as e
join department_1 as d on e.D_id=d.D_id group by D_name

--Q2:count the employees with salary above IT average.

select count(Name) as Emp_number from n_emp where Salary>(
select round(avg(Salary),0) from n_emp where D_id=1)

--Q3:List all employees details whose birth is in the month of 'august'.
--(like, where dob = 'august', use suitable date-time function)
with e_
select * from n_emp where datename(month,Dob)='august'

--Q4:List all employees details with dob in form of ‘Friday,23 June,1995’ for all 

select *, cast(datename(dw,getdate()) as varchar(20)) + ',' + cast(datename(day,Dob) as varchar(20)) + ' ' + cast(datename(MONTH,Dob) as varchar(20)) + ',' + cast(datename(year,Dob) as varchar(20)) as dob  from n_emp

--Q5:-	List the employees details who are elder to 'Saurabh'.

select * from n_emp where Dob<(select Dob from n_emp where Name='Saurabh')
select Datename(month,'1999/08/01') 

--ALPHABET PRINT

declare @a varchar(10) = ascii('A')
while @a <= ascii('Z')
begin
print char(@a)
set @a = @a + 1
end
