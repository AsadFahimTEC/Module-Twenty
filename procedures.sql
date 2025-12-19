-- procedure
create procedure delete_emp_byid(emp_id int)
language plpgsql
as
$$
 begin
  delete from employee where id = emp_id;
  end;
$$

call delete_emp_byid(4)

create procedure increase_low_salary(department_name VARCHAR(50))
language plpgsql
as
$$
  declare
  avg_salary int;
  begin
  select avg(salary) from employee
  where department = department_name
  end;
$$