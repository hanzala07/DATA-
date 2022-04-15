--Name:Hanzala Mansuri
--emp_id:20060

--Question-1:
create table employees_2(
e_id varchar(5) primary key,
e_name varchar(20) not null,
e_dob date not null,
e_salary numeric(6) not null,
e_city varchar(20) 
)

select * from employees_2

--Question-2:

insert into employees_2 values('E01','Tulsi','1982/01/26',12000,'Ahmedabad')

insert into employees_2 values('E02','Gopi','1983/08/15',15000,'Anand'),
('E03','Rajshree','1984/10/31',20000,'Vadodara'),
('E04','Vaishali','1985/03/23',25000,'Surat'),
('E05','Laxmi','1983/02/14',18000,'Anand')
insert into employees_2 values('E06','Shivali','1984/09/05',20000,' ')

--Question-3:

select e_dob from employees_2 where e_id='E01' or e_id='E03'

--Question-4:
select * from employees_2 where e_salary=18000 or e_salary=20000

--Question-5:

select * from employees_2 where e_city!='Ahmedabad' and e_city!='Surat'

--Question-6:

select * from employees_2 where e_city like '%d'

--Question-7:

alter table employees_2
add constraint chk_salary  check(e_salary>=10000) 

--Question-8:

select * from employees_2 where e_dob between '1982-01-01'and '1983-12-31'

--Question-9:
select e_city,avg(e_salary) as salary from employees_2 where e_city!=' ' group by e_city 

--Question-10:
select count(*) as count_of_employee from employees_2 where e_salary>16000