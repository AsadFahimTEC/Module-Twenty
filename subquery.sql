CREATE TABLE employee(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  department VARCHAR(50),
  salary INT
);

INSERT INTO employee(name, department, salary) VALUES
('Rahim', 'IT', 50000),
('Karim', 'HR', 40000),
('Selim', 'IT', 60000),
('Jamal', 'Finance', 45000),
('Kamal', 'HR', 35000);

-- Find the highest salary
select max(salary)  from employee

-- Find which employee gets the highest salary
select * from employee
where salary = (select max(salary) from employee)

-- Find employees who earn more than the average salary
select * from employee
where salary > (select avg(salary) from employee)

-- Name of the employee who gets the highest salary in HR department
select * from employee
  where salary = (
  select max(salary) from employee
  where department = 'HR'
  )

select max(salary) from employee
  where department = 'HR'