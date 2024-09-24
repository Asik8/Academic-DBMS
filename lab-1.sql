USE SMS;
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


-- VIEW TABLE DATA COMMAND
-- SELECT Student_name FROM STUDENT; 
-- SELECT Student_name,Student_id,Student_CG,Student_Age FROM STUDENT; 
SELECT * FROM STUDENT; 

