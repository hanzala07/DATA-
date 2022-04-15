select * from sys.schemas

create table tmp
(
id int,
name varchar(20)
)

select * from [Hanzala.Mansuri].dbo.tmp

create schema abc

create table [Hanzala.Mansuri].abc.tmp
(
id int,
name varchar(20),
gender varchar(10)
)

select * from abc.tmp

alter table abc.tmp
add mob numeric(10)

select * from tmp


alter table tmp
alter column mob varchar(100)

alter table tmp
drop column mob

select * from tmp

--ddl : create,alter,drop,truncate,rename (sp_rename)
--dml : insert,update,delete


insert into tmp values(1,'hello')
insert into tmp(id,name) values(2,'demo')


insert into tmp(name,id)
select 'xyz',6


select * from tmp
select * from abc.tmp


insert into abc.tmp(id,name)
select id,name from tmp

update abc.tmp
set mob = 6564
where id = 2


delete from tmp where id = 6


create table emp
(
id int primary key identity(1,1),
name varchar(20) not null,
gender varchar(10),
salary numeric(5) check(salary > 10000),
email varchar(100) unique
)

select * from emp

insert into emp
values('xyz','mel',50000,'xyz@gmail.com')

select * from emp

alter table emp
drop constraint [CK__emp__salary__276EDEB3]   


alter table emp
add constraint CK_emp_gender check(gender = 'mel' or gender = 'female')

select * from emp

delete from emp


insert into emp
values('xyz','MaLe',50000,'xyz@gmail.com')

select * from emp

insert into emp
values('xyz','Mel ',50000,'xdz@gmail.com')
