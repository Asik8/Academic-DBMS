USE Test;
CREATE TABLE T(
	Student_name VARCHAR(30),
    Student_id INT PRIMARY KEY,
    Student_Age INT NOT NULL,
    Student_CG FLOAT
);
INSERT INTO T (Student_id, Student_name, Student_CG, Student_Age) 
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
Select Student_name FROM T;
select Student_name from T where Student_CG = (select max(Student_CG) FROM T);
select count(Student_name) from T;
select distinct Student_Age FROM T; -- to see the distinct elements
select Student_Age FROM T limit 10; -- to see the limited elements
select Student_name From T order by Student_CG; -- sort ascending order
select Student_name From T order by Student_CG desc; -- sort descending order
select Student_name FRom t order by Student_CG desc limit 1;
select max(Student_CG) from T group by Student_age; 
select max(Student_CG),Student_age from T group by Student_age;
select max(Student_CG),Student_age from T group by Student_age having id = 17;

-- Test-- for 20 Marks
select Student_name from Student where course_ID = (select course_ID From Course where Teacher_ID = (select Teacher_ID where Teacher_Name = "Asadujjaman") From Teacher);
select Student_name From Student where Courseid = (select Courseid From Course where Student_name = "Rafin");
select Teacher_name From Teacher where CourseID = (select CourseID From Course where Teacher = "Akash");