create table pkTbl
(
	id int
)


alter table pkTbl
alter column id int not null

alter table pkTbl
add constraint pk_tbl primary key (id)

execute sp_emp5 @columnName = 'e_gender', @data='male'


create function fun_name()
returns int
as  
begin  
    return 5+5
end
select dbo.fun_name(


alter function fun_name()
returns int
as  
begin  
    return 5.3+5.5
end
select dbo.fun_name()


create function dbo.fun_name2()    
returns table
as    
return(select * from emp5)

select* from  dbo.fun_name2()

create trigger [trMyFirstTrigger]
on database
for create_table, alter_table, drop_table, rename
as
begin
	print 'you are create, alter, rename or drop table'
end