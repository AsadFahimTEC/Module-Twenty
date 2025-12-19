-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON table_name
-- [FOR EACH ROW]
-- EXECUTE FUNCTION function_name();

create table employee_logs(
  id serial primary key,
  emp_id int,
  action varchar(25),
  action_time timestamp default now()
);

create trigger save_employee_delete_logs
after delete
on employee
for each row
execute function function_name