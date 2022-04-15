select * from City
select * from Company
select * from State
select * from employees_0

select employees_0_name,employees_0_salary,state_name,city_name,company_name from employees_0 e
join City ct on e.employees_0_city=ct.city_id
join State s on ct.state=s.state_id
join Company c on c.company_id=e.employees_0_company

select * from student_bkp