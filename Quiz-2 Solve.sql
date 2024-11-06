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
select e.name from Employees e join Departments d on e.department_id = d.department_id where d.department_name='IT';

-- Q-3: List all projects along with the names of employees who are working on them.
select e.name,p.project_name from Employees e join Projects p on e.emp_id=p.emp_id;

-- Q-4: Find the location of departments where employees are working on 'Project Alpha'.
select d.location from Departments d join Employees e on d.department_id=e.department_id join Projects p on e.emp_id=p.emp_id where project_name = 'Project Alpha';

-- Q-5: List the names of all employees who do not have any projects assigned to them.
select e.name from Employees e join Projects p on e.emp_id=p.emp_id where p.emp_id is NULL;

-- Q-6: Lists each employee's name along with their department and project names (if they are assigned to any projects).
select e.name, d.department_name, p.project_name from Employees e join Departments d on e.department_id= d.department_id join Projects p on e.emp_id = p.emp_id;

-- Q-7: Shows the total salary expenditure for each department.
-- Q-8: Displays names of employees who work in departments located in New York.
-- Q-9: Calculates the average salary of employees within each department.
-- Q-10: Lists employees who are assigned to more than one project.
-- Q-11: Shows the name and department of the employee with the highest salary.
-- Q-12: Counts the number of employees in each department.
-- Q-13: Shows each project's name and the count of employees assigned to it.
-- Q-14: Lists names of employees earning more than the average salary.
-- Q-15: Shows the number of projects in each department's location.
-- Q-16: List each department along with the count of employees in it.
-- Q-17: Find employees who do not have any projects assigned.
-- Q-18: Find the names of employees who work in the Finance department.
-- Q-19: List employees who earn a salary between 60,000 and 80,000.
-- Q-20: Find the maximum salary in each department.
-- Q-21: Show each employee along with the number of projects they are assigned to.
-- Q-22: Calculate the total salary for each department location.
-- Q-23: List each project along with its corresponding department.
-- Q-24: Find the employee with the lowest salary and their department name.
-- Q-25: Find the names of employees assigned to 'Project Delta'.
-- Q-26: Count the distinct number of departments that have employees.
-- Q-27: List the top 3 highest-paid employees.
-- Q-28: Count the number of unique employees assigned to each project.
-- Q-29: Find employees in the Chicago location who earn more than 50,000.
-- Q-30: List all employees who are not in the HR department, along with their department names.
-- Q-31: Find employees who are not assigned to any projects.
-- Q-32: Find departments where the average employee salary is greater than 70,000.
-- Q-33: List employees in alphabetical order within each department.
-- Q-34: Find the employee with the lowest salary.
-- Q-35: Count the total number of projects.
-- Q-36: Count the unique employees in each department.
-- Q-37: List employees who earn more than all employees in the Finance department.
-- Q-38: Find employees who earn below the average salary.
-- Q-39: Find the minimum salary for each department.
-- Q-40: List each employee's name along with their project and department name.