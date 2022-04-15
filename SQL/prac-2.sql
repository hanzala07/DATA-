create table department
(
d_id int identity(1,1) primary key,
d_name varchar(10) not null
)

select * from sys.tables
select * from INFORMATION_SCHEMA.TABLES

select * from sys.all_columns
select * from INFORMATION_SCHEMA.COLUMNS

create table employee
(
e_id int primary key identity(1,1),
e_name varchar(20) not null,
e_mail varchar(100) unique,
e_salary numeric(5) check(e_salary >= 10000),
e_dob date,
e_mob numeric(10) unique,
e_state varchar(10) default ('Gujarat'),
department_id int foreign key references department(d_id)
)



select * from employee

insert into department values('it'),('sales'),('finance'),('hr')

select * from department


insert into employee
values('abc','abc@gmail.com',15000,'12/31/2000',9876543210,'gujarat',1)

--yyyy-mm-dd
--mm-dd-yyyy

select * from employee

insert into employee
values('xyz','xyz@gmail.com',15000,'12/31/2000',9876543211,'gujarat',2)

insert into employee
values('pqr','pqr@gmail.com',15000,'12/31/2000',9876543213,'gujarat',2)


set identity_insert employee on
insert into employee(e_id,e_name,e_mail,e_salary,e_dob,e_mob,e_state,department_id)
values(4,'mno','mno@gmail.com',15000,'12/31/2000',9876543214,'gujarat',2)

 


insert into employee(e_id,e_name,e_mail,e_salary,e_dob,e_mob,e_state,department_id)
values(5,'tyu','tyu@gmail.com',15000,'12/31/2000',9876543216,'gujarat',2)
,(6,'lkj','lkj@gmail.com',15000,'12/31/2000',9876543219,'gujarat',2)

select * from employee

set identity_insert employee off

insert into employee
values('ert','ert@gmail.com',15000,'12/31/2000',9876543222,'gujarat',2)

 


set identity_insert employee on
insert into employee(e_id,e_name,e_mail,e_salary,e_dob,e_mob)
values(101,'mnb','mnb@gmail.com',17500,'05/06/1999',9875543214)
set identity_insert employee off



 delete from department where d_id = 2

delete from employee where department_id = 2

select * from department
select * from employee


select * into employee_bkp from employee

select * from employee_bkp

select * from employee_bkp where e_salary > 500

select * from employee_bkp where e_salary between 15000 and 17000

 
select * from employee_bkp where department_id = NULL
select * from employee_bkp where department_id = ''
select * from employee_bkp where department_id = 'NULL'
select * from employee_bkp where department_id is null
select * from employee_bkp where department_id is not null

select * from employee_bkp where department_id != null


select * from employee_bkp where e_name = 'abc'
select * from employee_bkp where e_name != 'abc'

select * from employee_bkp where e_salary = 15000 and department_id = 2
select * from employee_bkp where e_salary = 20000 or department_id = 2
select * from employee_bkp where e_salary = 20000 and department_id = 2

select * from employee_bkp where e_name in ('abc','mno')
select * from employee_bkp where e_name = 'abc' or e_name = 'mno'

select * from employee_bkp where e_name not in ('abc','mno')


select * from department
select * from emp


select * from emp where name like 'a%'
select * from emp where name like '_b%'


select * from department
select * from employee


select e.e_name,d.d_name
from employee e
join department d
on d.d_id = e.e_id


select e.e_name,d.d_name
from employee e
left join department d
on d.d_id = e.e_id



select e.e_name,d.*
from employee e
left join department d
on d.d_id = e.e_id
where d.d_id is not null



select e.*,d.*
from department d
right join employee e
on d.d_id = e.e_id    


select e.*,d.*
from department d
full join employee e
on d.d_id = e.e_id


select e.*,d.*
from employee e
cross join department d


select * from employee order by e_name asc

select * from employee order by e_mail

select * from employee order by e_name desc

select e_name,e_mail,e_salary from employee order by e_name desc

select * from employee order by 1 desc

select * from employee
select distinct e_salary from employee
select distinct e_salary,e_id from employee

select top 3 * from employee order by e_id desc

select * from employee

--ranking function: (partition by --optional)
--rank,dense_rank,row_number,ntile

select *,'hello' a from employee

select e_salary from employee

select *,
rank() over(order by e_salary desc) [rank],
dense_rank() over(order by e_salary desc) [dense rank],
row_number() over(order by e_salary desc) [row_number],
ntile(2) over(order by e_salary desc) [ntile]
from employee


select *,
dense_rank() over(partition by e_name order by e_name desc) [rank]
from employee


select *,
first_value(e_salary) over(order by e_id desc)
from employee