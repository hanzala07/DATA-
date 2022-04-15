--Name:Hanzala Mansuri
--Emp_id:20060

--Question-1:

create table student_1(
s_id int  identity(1,1) primary key,
s_name varchar(20) not null,
s_subject varchar(20) not null,
s_marks int not null check(s_marks>0 and s_marks<100)
)

select * from student_1

--Question-2:

insert into student_1 values('viren','maths',70)

insert into student_1 values('priyanshu','science',60),
('krishna','english',88),
('vishnu','maths',75),
('viren','english',90),
('krishna','science',65),
('vishnu','english',80),
('priyanshu','maths',45),
('viren','science',78),
('krishna','maths',55),
('vishnu','science',92),
('priyanshu','english',89)

select * from student_1

--Question 3:

select * from student_1 where (s_marks>=50 and s_marks<=90) and s_subject='science'



--Question 4:
--select * ,case when s_marks>90 then 'A'
--Question 5:
declare @subject varchar(20)='science'
declare @total int
set @total = (select e_subject 





