USE Sa;
CREATE TABLE E(
    ID INT PRIMARY KEY,
    Employee_Name VARCHAR(30),
    Salary INT NOT NULL,
    Department VARCHAR(50)
);

INSERT INTO Emp(ID, Employee_Name, Salary, Department) VALUES
(1, "ASIK", 36000, "Product Management"),
(2, "FOYSAL", 37000, "Development"),
(3, "RAKIB", 36800, "Quality Assurance"),
(4, "SADIB", 37000, "UI/UX Design"),
(5, "ALIF", 36800, "Customer Support"),
(6, "TANVIR", 45000, "Finance"),
(7, "SAIF", 42000, "Human Resources"),
(8, "NADIM", 47000, "Sales"),
(9, "MAHIN", 39000, "Marketing"),
(10, "RIAD", 51000, "Data Analytics"),
(11, "HASAN", 48000, "Cloud Engineering"),
(12, "SIAM", 44000, "Operations"),
(13, "IMRAN", 50000, "Business Development"),
(14, "FARHAN", 46000, "Legal"),
(15, "RAHUL", 43000, "Procurement"),
(16, "SHAHIN", 40000, "Project Management"),
(17, "RUBEL", 47000, "DevOps"),
(18, "NAYEM", 42000, "Cybersecurity"),
(19, "NAHID", 38500, "IT Support"),
(20, "ZIHAD", 43000, "Research & Development");


-- SELECT * FROM Emp Where Department = "CSE"; 
select 
SELECT * FROM Emp Where Department = "CSE" and Salary>36000;

Update Emp SET St_name = 'asikM' where id = 2;
SELECT * FROM Emp;
-- Print average salary
select avg(Salary) from Emp; 
SELECT St_name from Emp where salary = (SELECT Max(Salary) from Emp);
SELECT * from Emp where salary > (SELECT avg(Salary) from Emp);
