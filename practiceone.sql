-- create database advance_sql

--creating the employees table
CREATE TABLE employees(
  employee_id SERIAL PRIMARY KEY,
  employee_name VARCHAR(50),
  department_id INT REFERENCES 
  departments (department_id),
  salary DECIMAL(10,2),
  hire_date DATE
);

-- creating the departments table
CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50)
);

INSERT INTO departments (department_name)
VALUES ('HR'),
('Marketing'),
('Finance'),
('IT'),
('Sales'),
('Engineering'),
('Customer Support'),
('Administration'),
('Research'),
('Quality Assurance');

INSERT INTO
employees (employee_name, department_id,salary, hire_date)
VALUES
('Rahim Ahmed', 1, 45000.00, '2020-01-15'),
('Karim Uddin', 2, 52000.00, '2019-03-20'),
('Sara Khan', 3, 60000.00, '2021-06-10'),
('John Smith', 4, 75000.00, '2018-09-05'),
('Emma Brown', 5, 48000.00, '2022-02-12'),

('Ayaan Ali', 1, 55000.00, '2020-11-25'),
('Lina Rahman', 2, 47000.00, '2021-01-30'),
('Mark Taylor', 3, 68000.00, '2019-07-18'),
('Sophia Lee', 4, 82000.00, '2017-04-22'),
('Daniel Martinez', 5, 50000.00, '2022-08-14'),

('Michael Brown', 1, 62000.00, '2018-10-01'),
('Laura Scott', 2, 46000.00, '2020-12-19'),
('David Kim', 3, 71000.00, '2019-05-07'),
('Emily Stone', 4, 78000.00, '2021-03-11'),
('James Allen', 5, 53000.00, '2020-06-29'),

('Andrew Ng', 1, 90000.00, '2016-01-10'),
('Sarah Miller', 2, 58000.00, '2019-09-23'),
('Chris Evans', 3, 65000.00, '2021-07-02'),
('Olivia Wilson', 4, 80000.00, '2018-12-15'),
('Noah Anderson', 5, 49000.00, '2022-04-05'),

('Mia Thomas', 1, 56000.00, '2020-02-17'),
('Ethan White', 2, 51000.00, '2021-05-09'),
('Isabella Harris', 3, 69000.00, '2019-11-27'),
('Lucas Martin', 4, 83000.00, '2017-08-08'),
('Amelia Clark', 5, 47000.00, '2022-09-01'),

('Benjamin Lewis', 1, 60000.00, '2018-06-14'),
('Charlotte Walker', 2, 54000.00, '2020-04-21'),
('Henry Hall', 3, 72000.00, '2019-02-03'),
('Ava Young', 4, 79000.00, '2021-10-16'),
('William King', 5, 52000.00, '2020-07-28');

-- 1. INNER JOIN to Retrieve Employee and Department Information:
select * from employees
inner join departments using(department_id)

-- 2. Show Department Name with Average Salary:
select department_name, round (avg(salary)) from employees
inner join departments using(department_id)
group by department_name

-- 3. Count Employees in Each department
select department_name, count(*) from employees
inner join departments using(department_id)
group by department_name

-- 4. Find the Department name with the Highest Average Salary:
select department_name, round (avg(salary)) as avg_salary from employees
inner join departments using(department_id)
group by department_name order by avg_salary desc limit 1

-- 5. Count Employees Hired Each Year:
-- select extract(year from '2025-12-25'::date)
select extract(year from hire_date) as hired_year, count(*) from employees
group by hired_year 


