select count(*) from employee
  
create function emp_count()
returns int
language sql
as
$$
  select count(*) from employee
$$
  
select emp_count()

create function delete_emp_id(emp_id int)
returns void
language sql
as
$$
  delete from employee where id = emp_id
$$
  
select delete_emp_id(5)