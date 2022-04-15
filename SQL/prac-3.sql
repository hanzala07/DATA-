--Advanced function : null, Coalesce, exists, Cast, Convert

select * from emp
select e_name,e_gender,isnull(e_city,'abc') city,e_age from emp

update emp
set e_city = 'abc'
where e_city is null

select coalesce('a','b','c','d','e')
select coalesce('','b','c','d','e')
select coalesce(null,'b','c','d','e')

select *,coalesce(e_city,'abc') from emp

select top 5 * from sys.databases order by create_date desc

select * from sys.tables


create table demo
(
date varchar(20)
)


insert into demo values('2022/05/03'),('2021/06/06'),('31/12/2022')

select * from demo


update demo
set date = '2022/12/31'
where date = '31/12/2022'


alter table demo
alter column date datetime

--cast : (<column_name> as <datatype>)
select *,cast(date as date) from demo
select *,cast(date as varchar(20)) from demo

--convert : (<datatype>,<column_name>)
select *,convert(date,date) from demo
select *,convert(varchar(20),date),convert(varchar(5),date) from demo


select *,len(convert(varchar(5),date)) from demo

select *,datalength(convert(varchar(5),date)) from demo

select len(' abc'),len(' abc ')
select datalength(' abc'),datalength(' abc ')

select * from emp

select distinct salary from emp

select name, sum(salary) from emp
group by name 

select distinct name,gender,salary from emp

select name,gender,salary from emp
group by name,gender,salary


select name,gender,salary,count(salary) from emp
group by name,gender,salary
having salary > 30000

select name,gender,salary,count(*) salary from emp
group by name,gender,salary
having count(*) > 3


select * into emp2 from emp

select *  from emp2 

select name from emp
union
select name from emp2

select name from emp
union all
select name from emp2

select name from emp
intersect
select name from emp2

select name from emp
except
select name from emp2



print 'xyz'
select 'abc'

print 3+4

declare @name varchar(10) = 'hello'
print @name

declare @name1 varchar(10)
set @name1 = 'hello'
print @name1

declare @name2 varchar(10)
select @name2 = 'hello'
print @name2

declare @name3 varchar(10) = 'hi'
set @name3 = 'hello'
print @name3


declare @name4 varchar(10) = 'hi'
print @name4
set @name4 = 'hello'
print @name4

declare @name5 varchar(10) = 'hi'
print @name5
set @name5 = @name5 + 'hello'
print @name5

-- case when then else end
select *, case when gender = 'mel' then 'M' else 'F' end newGender from emp


-- iif
select *,iif(gender='Male','M','F') newGender from emp


select *,
case when salary >= 30000 then 'high' when salary < 300 and salary >= 150 then 'mid' else 'low' end newGender 
from emp


declare @val int = 1
if @val < 0
	print 'neg'
else
	print 'pos'

declare @val1 int
if @val1 < 0
begin
	print 'neg'
end
else if @val1 > 0
begin
	print 'pos'
end
else if @val1 is null
begin
	print 'non'
end
else
begin
	print 'zero'
end

--while <condition>
--begin

--<incr/decr>
--end


declare @c1 int = 1, @c2 int = 10
while @c1 <= @c2
begin
	print @c1
	--select @c1
set @c1 += 1
end

declare @a1 int = 1, @a2 int = 10
while @a1 <= @a2
begin
	print @a2
	break

set @a2 += 1
end


declare @b1 int = 1, @b2 int = 10
while @b1 <= @b2
begin
	print @b1
	continue

	print @b2

set @b1 += 1
end


select *,salary+100 sal from emp
where salary = 445

select *,e_salary+100 sal from emp
where e_salary+100 = 445



--with <cte_name>
--as
--()
--use of cte

with abc
as
(select *,salary+100 sal from emp)
select * from abc
where sal = 50100


select name,max(salary) from emp
group by name


declare @sal int
--select @sal = max(e_salary) from emp
set @sal = (select max(salary) from emp)
select * from emp where salary = @sal


select * from emp where salary = (select max(salary) from emp where gender = 'mel')


select * from emp where salary in
(
	select max(salary) from emp 
	group by gender
)
