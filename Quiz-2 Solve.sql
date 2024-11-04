-- CREATE DATABASE QUIZ2;
USE QUIZ2;

-- Creating the Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

-- Creating the Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

-- Creating the Projects table
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT
);

-- Inserting sample data into Employees
INSERT INTO Employees (emp_id, name, department_id, salary) VALUES
(1, 'Alice', 101, 70000),
(2, 'Bob', 102, 50000),
(3, 'Charlie', 101, 75000),
(4, 'David', 103, 65000),
(5, 'Eve', 104, 72000);

-- Inserting sample data into Departments
INSERT INTO Departments (department_id, department_name, location) VALUES
(101, 'IT', 'New York'),
(102, 'HR', 'Chicago'),
(103, 'Finance', 'Boston'),
(104, 'Marketing', 'San Francisco');

-- Inserting sample data into Projects
INSERT INTO Projects (project_id, project_name, emp_id) VALUES
(201, 'Project Alpha', 1),
(202, 'Project Beta', 2),
(203, 'Project Gamma', 3),
(204, 'Project Delta', 4),
(205, 'Project Epsilon', 1);

-- Q-1: List all employees and their associated department names.
select e.name, d.department_name from Employees e join Departments d on e.department_id = d.department_id;

-- Q-2: Find the names of employees who work in the 'IT' department.
select e.name from Employees e join Departments d on e.department_id = d.department_id where department_name='IT';

-- Q-3: List all projects along with the names of employees who are working on them.
select p.project_name, e.name from Projects p join Employees e on p.emp_id=e.emp_id;

-- Q-4: Find the location of departments where employees are working on 'Project Alpha'.
select d.location from Departments d join Employees e on d.department_id=e.department_id join Projects p on e.emp_id=p.emp_id where project_name = 'Project Alpha';

-- Q-5: List the names of all employees who do not have any projects assigned to them.
select e.name from Employees e join Projects p on e.emp_id=p.emp_id where p.emp_id is NULL;

