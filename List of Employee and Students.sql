CREATE TABLE STUDENT(
    Student_name VARCHAR(30),
    Student_id INT PRIMARY KEY,
    Student_Age INT NOT NULL,
    Student_CG FLOAT
);

INSERT INTO STUDENT (Student_id, Student_name, Student_CG, Student_Age) 
VALUES
(1, "ASIK", 3.60, 23),
(2, "FOYSAL", 3.00, 23),
(3, "RAKIB", 3.20, 22),
(4, "SADIB", 3.50, 21),
(5, "ALIF", 3.80, 23),
(6, "TANVIR", 3.40, 22),
(7, "SAIF", 3.30, 24),
(8, "NADIM", 3.75, 22),
(9, "MAHIN", 3.10, 21),
(10, "RIAD", 3.90, 23),
(11, "HASAN", 3.55, 22),
(12, "SIAM", 3.65, 23),
(13, "IMRAN", 3.45, 22),
(14, "FARHAN", 3.85, 23),
(15, "RAHUL", 3.25, 21),
(16, "SHAHIN", 3.50, 24),
(17, "RUBEL", 3.70, 22),
(18, "NAYEM", 3.95, 23);


CREATE TABLE Emp(
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