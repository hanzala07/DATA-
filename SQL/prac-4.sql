declare @tbl as table
(
	id int
)
insert into @tbl values(1)

select * from @tbl


select 5/0
select 5/2


--BEGIN TRY
--END TRY
--BEGIN CATCH
--END CATCH


BEGIN TRY
	SELECT 10/0 AS Result
	--SELECT 10/5 AS Result
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS [Error Message]
	      ,ERROR_LINE() AS ErrorLine
	      ,ERROR_NUMBER() AS [Error Number]  
              ,ERROR_SEVERITY() AS [Error Severity]  
              ,ERROR_STATE() AS [Error State]  
			  ,@@ERROR
END CATCH

create view vw_emp5
as
select * from emp5

select * from vw_emp5



alter view vw_emp5
as
select * from emp5 where e_age >= 25

select * from vw_emp5

--create procedure <sp_name>
--<parameters> --optionally
--as
--begin
--end

create proc sp_emp5
as
begin
	
	select * from emp5
	
end

execute sp_emp5



alter proc sp_emp5
as
begin
	select * from emp5 where e_age >= 25
end

execute sp_emp5



alter proc sp_emp5
as
begin
	select * from emp5 where e_gender = 'male'
end

execute sp_emp5

create proc sp_emp5_GenderWise
@gender varchar(20)
as
begin
	select * from emp5 where e_gender = @gender
end

execute sp_emp5_GenderWise @gender='male'

execute sp_emp5_GenderWise 'female'


alter proc sp_emp5_GenderWise
@gender varchar(20) = null
as
begin
	if @gender is null
	begin
		select * from emp5
	end
	else
	begin
		select * from emp5 where e_gender = @gender
	end
end

execute sp_emp5_GenderWise 'female'


exec sp_helptext 'sp_emp5_GenderWise'


alter proc sp_emp5_GenderWise
@gender varchar(20) = null
as
begin
	select * from emp5 where e_gender = @gender or @gender is null
end



create proc sp_emp5GetData
@gender varchar(20) = null,
@city varchar(20) = null
as
begin 	select * from emp5 where e_gender = @gender and e_city = @city
end

execute sp_emp5GetData @city='baroda',@gender='female'

select * from emp5


create proc sp_InsEmp5
@name varchar(20),
@gender varchar(20),
@salary numeric(5),
@email varchar(100)
as
begin
	insert into emp5(e_name,e_gender,e_salary,e_email)
	values(@name,@gender,@salary,@email)
end

exec sp_InsEmp5 @name = 'fgc', @gender = 'male', @salary = 1567, @email = 'fgc@gmail.com'

select * from emp5


declare @sql nvarchar(max), @gender varchar(20) = 'male'
set @sql = 'select * from emp5 where e_gender = '''+@gender+''''
--print(@sql)
--exec (@sql)
exec sp_sqlexec @sql


declare @sql nvarchar(max), @data varchar(20) = '88',@col varchar(20) = 'e_salary'
set @sql = 'select * from emp5 where ' +@col+' = '''  + @data + ''''
--print(@sql)
exec (@sql)



alter proc sp_emp5
@columnName varchar(20),
@data varchar(20)
as
begin
	select * from emp5 where '+@columnName+=' = @data
end

execute sp_emp5 @columnName = 'e_gender', @data = 'male'


with duplicate
as
(
	select *,ROW_NUMBER() over(partition by e_name order by e_name) dup from emp5
)
delete from duplicate where dup > 1

select * from duplicate