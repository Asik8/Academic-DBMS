USE LabTest;
CREATE TABLE Students (       -- Create Student Table
    sid INT PRIMARY KEY,
    sname VARCHAR(50),
    age INT,
    gl INT
);
CREATE TABLE Teachers (      -- Creating Teachers Table
    tid INT PRIMARY KEY,
    tname VARCHAR(50),
    sub VARCHAR(50)
);
CREATE TABLE Courses (		-- Creating Courses Table
    cid INT PRIMARY KEY,
    cname VARCHAR(50),
    sid INT,
    tid INT,
    FOREIGN KEY (sid) REFERENCES Students(sid),
    FOREIGN KEY (tid) REFERENCES Teachers(tid)
);

INSERT INTO Students (sid, sname, age, gl) VALUES		-- Inserting Data into Students Table
(1, 'Alice', 14, 9),
(2, 'Bob', 15, 10),
(3, 'Charlie', 16, 11),
(4, 'Daisy', 17, 12),
(5, 'Asik', 21, 13);

INSERT INTO Teachers (tid, tname, sub) VALUES			-- Inserting Data into Teachers Table
(1, 'Mr. Smith', 'Math'),
(2, 'Ms. Johnson', 'Science'),
(3, 'Dr. Brown', 'History');

INSERT INTO Courses (cid, cname, sid, tid) VALUES    	-- Inserting Data into Courses Table
(1, 'Algebra', 1, 1),
(2, 'Biology', 2, 2),
(3, 'World History', 3, 3),
(4, 'Chemistry', 4, 2),
(5, 'Geometry', 1, 1),
(6, 'Physics', 2, 2);

-- Query-1: List all students along with their courses and teacher names.
Select s.sname,c.cname,t.tname from Students s Join Courses c on s.sid = c.sid Join Teachers t on c.tid = t.tid;

-- Query-2: Show all courses and teachers, including courses without assigned students.
Select c.cname, t.tname from Courses c Left Join Teachers t On c.tid = t.tid;

-- Query-3: Find all teachers who teach at least one course.
Select distinct t.tname from Teachers t Join Courses c on t.tid=c.tid;

-- Query-4: List students who are not enrolled in any course.
Select s.sname From Students s Left join Courses c On s.sid=c.sid where c.cid is Null;

-- Query-5: Show all pairs of students and teachers, regardless of whether they share a course.
Select s.sname, t.tname from Students s cross Join Teachers t;

-- Query-6: List all students enrolled in 'Physics' and the names of their teachers.
Select s.sname,t.tname from Students s join Courses c On s.sid = c.sid Join Teachers t On c.tid = t.tid where c.cname = "Physics";

-- Query-7: Identify all courses with students who are 16 years or older.
select c.cname,s.sname from Courses c join Students s On c.sid = s.sid where s.age>=16;

-- Query-8: List all students and their teachers, showing NULL for students without teachers.
select s.sname, t.tname from Students s Left Join Courses c on s.sid=c.sid Left Join Teachers t on c.tid = t.tid;

-- Query-9: Get the count of courses each teacher teaches.
Select t.tname, count(c.cid) from Teachers t Left Join Courses c On t.tid = c.tid group by t.tname;

-- Query-10: Show the teacher-student pairs for students in grade level 10 or above.
Select distinct t.tname, s.sname from Teachers t Join Courses c On t.tid = c.tid Join Students s On s.sid = c.sid where s.gl>=10;

-- More Practice:
-- Q-11: List all students with their ages and grade levels.
select * from students;

-- Q-12: Count the total number of courses in which students are enrolled.
select Count(cid) from Courses;

-- Q-13: Find the highest grade level among students.
select sname from Students where gl = (select max(gl) from Students);

-- Q-14: List all students in descending order by age.
select * from Students group by age order by asc;

-- Q-15: Find the teacher who teaches the most courses.

-- Q-16: Find all students who share the same teacher.

-- Q-17: Count the total number of students enrolled in each course.

-- Q-18: Show students and the total number of courses they are enrolled in.

-- Q-19: List teachers and their subjects in alphabetical order.

-- Q-20: Show all students who have a teacher assigned for each of their courses.

-- Q-21: List the names of students in grade levels 10 and above.

-- Q-22: Find students who are 15 years or older and enrolled in a 'Math' course.

-- Q-23: Show the average age of students per grade level.

-- Q-24: List all teachers and the subjects they teach, with no duplicate entries.

-- Q-25: Display students who are enrolled in more than one course.

-- Q-26: Find the names of students enrolled in both 'Biology' and 'Physics'.

-- Q-27: List all students, their courses, and teacher names, sorted by student age.

-- Q-28: Show all courses that do not have any enrolled students.

-- Q-29: Find the oldest student enrolled in any course.

-- Q-30: List all students whose names start with the letter 'A'.

-- Q-31: Display the total number of students assigned to each teacher.

-- Q-32: List all courses along with their assigned teacher names, sorted by course name.

-- Q-33: Identify courses where all students are 16 years or older.

-- Q-34: Count the number of students in each grade level.

-- Q-35: Show the names of students not taking 'Chemistry'.

-- Q-36: Find teachers who do not have any students assigned.

-- Q-37: Display students and their corresponding teacher names for the subject 'History'.

-- Q-38: Show courses and teacher names where students are in grade 12.

-- Q-39: List all students and their teachers, including those without any courses.

-- Q-40: Find the most common course among students.

-- Q-41: Show the total count of distinct subjects taught by each teacher.

-- Q-42: List students along with their teachers and courses, ordered by grade level.

-- Q-43: Find teachers who teach both 'Math' and 'Science'.

-- Q-44: Display all students whose age is below the average age.

-- Q-45: Identify courses with the least number of enrolled students.

-- Q-46: Find the teacher who teaches students in grade level 9.

-- Q-47: Show students with an odd-numbered student ID.

-- Q-48: List all courses along with students enrolled in them, sorted by course name.

-- Q-49: Display students and teachers assigned to subjects that start with 'S'.

-- Q-50: Show all students and teachers where the student is older than 15 years.
-- Q-51: List all teachers who have more than 2 students assigned to them.

-- Q-52: Display the name of the course with the highest number of enrolled students.

-- Q-53: Show the teacher names and subjects of all teachers who teach students under 16 years of age.

-- Q-54: List students along with the courses they are not enrolled in.

-- Q-55: Find the average grade level of students in each course.

-- Q-56: Display all students along with their teacher's name and subject, ordered by teacher name.

-- Q-57: Show the total number of students for each subject taught by a teacher.

-- Q-58: List all students who are not enrolled in any course taught by 'Dr. Brown'.

-- Q-59: Show the teacher and course names for each course taken by students in grade level 9.

-- Q-60: Display the maximum, minimum, and average ages of students.

-- Q-61: List all students who share the same first letter in their name as their teacher’s name.

-- Q-62: Identify students who are in the same grade level but assigned to different teachers.

-- Q-63: Show the count of students who are enrolled in 'Algebra'.

-- Q-64: Find students who are in the same course but have different teachers.

-- Q-65: Display courses taken by the youngest student.

-- Q-66: List teachers who have students only in grade 10.

-- Q-67: Show all students and their teacher names in alphabetical order of student names.

-- Q-68: Find the names of all students who are younger than any student in grade 12.

-- Q-69: List the teachers and their students, only for courses with more than 1 student.

-- Q-70: Show the teacher and subject for courses taken by students whose names end with the letter 'e'.

-- Q-71: Display the distinct subjects taught to students in grade level 9.

-- Q-72: Show all students who have teachers from both 'Math' and 'Science'.

-- Q-73: List all teachers who do not teach students in grade level 10.

-- Q-74: Display courses taught by the teacher with the fewest number of students.

-- Q-75: Show all teachers and students who are associated through exactly one course.

-- Q-76: List students who are in the same course as students in grade level 12.

-- Q-77: Find the teacher names for courses that have students in every grade level.

-- Q-78: Show all students who are older than the average age of students in their grade level.

-- Q-79: List students and courses, excluding those courses that only have one enrolled student.

-- Q-80: Display the subjects taught by each teacher and count the number of courses per subject.

-- Q-81: Show all teachers who teach courses to students of exactly one age group.

-- Q-82: List students who have more courses than any other student.

-- Q-83: Display students and their teachers who teach 'Science' or 'Math'.

-- Q-84: Identify the teachers with students in both the youngest and oldest grade levels.

-- Q-85: List the students along with the total number of teachers assigned to them.

-- Q-86: Find courses that have students in grade 11 and a teacher who also teaches grade 9 students.

-- Q-87: Show students who are in the top 50% age group among all students.

-- Q-88: Display the names of students who are not enrolled in 'History'.

-- Q-89: List the subjects where teachers have students enrolled from multiple grades.

-- Q-90: Show teachers who have students both under and over 15 years old.

-- Q-91: Find students who are only assigned to teachers whose names start with 'M'.

-- Q-92: List all courses that have more students than the course 'Geometry'.

-- Q-93: Display students and teachers, ordered by the number of students per teacher.

-- Q-94: Find the names of teachers who only teach students in grades 9 and 12.

-- Q-95: List students who are not enrolled in any course that a teacher named 'Mr. Smith' teaches.

-- Q-96: Show students whose teacher is also assigned to another student in a higher grade.

-- Q-97: Display the youngest student in each course.

-- Q-98: List teachers who have students exclusively in grades 10 and 11.

-- Q-99: Show all students and the count of distinct courses they are enrolled in.

-- Q-100: Display the names of students in courses where the average student age is above 15.
-- Q-101: List all students along with their teachers and the courses they are enrolled in.

-- Q-102: Display all students along with the subjects of their teachers using a JOIN.

-- Q-103: Show each student’s name, course name, and the name of their teacher for each course.

-- Q-104: Find all students and their teachers, including students who are not enrolled in any course (use LEFT JOIN).

-- Q-105: List teachers who teach multiple students along with the names of those students.

-- Q-106: Show the count of students enrolled in each course and the name of the teacher (use JOIN and GROUP BY).

-- Q-107: Display each course's name along with the names of students and their assigned teacher for that course.

-- Q-108: List all students, their age, their grade level, and the names of the teachers they are assigned to.

-- Q-109: Display the names of teachers who teach 'Chemistry' and list the students enrolled in that course.

-- Q-110: Find all courses taken by students aged 15 or older and display the teacher names along with the course names.

-- Q-111: List students and the names of teachers who teach subjects other than 'History' that they are enrolled in.

-- Q-112: Show all teachers and their students for each course, even if the course does not have students assigned (use LEFT JOIN).

-- Q-113: List each teacher and the total number of students they have across all their courses (use JOIN and GROUP BY).

-- Q-114: Display all students enrolled in 'Physics' along with their teacher's name and subject.

-- Q-115: Show each student's name, age, course name, and the corresponding teacher's name.

-- Q-116: List all students who have the same teacher for two or more different courses.

-- Q-117: Find all teachers who have students in grade level 9 and display those students' names.

-- Q-118: Show all courses along with the names of students enrolled and their respective teacher's subject.

-- Q-119: List the names of students who have a teacher assigned to both 'Math' and 'Science'.

-- Q-120: Display each teacher's name and the list of unique students they are teaching across all courses.

-- Q-121: Find teachers who teach both 'Algebra' and 'Geometry' and list their students.

-- Q-122: Show the course names and teacher names for all courses that have students aged 17.

-- Q-123: List all teachers and their students in courses where the teacher teaches more than one subject.

-- Q-124: Display the course names, students, and teachers for courses taken by students in grade 10 or higher.

-- Q-125: Find all teachers and students where students are not in the teacher's main subject.

-- Q-126: Show each student's name and the names of teachers teaching different subjects that the student is enrolled in.

-- Q-127: List teachers along with the count of students they teach in each subject.

-- Q-128: Display all courses along with their teacher's name and the students' names enrolled in those courses.

-- Q-129: Show the names of all teachers who have students enrolled in both 'Biology' and 'Chemistry'.

-- Q-130: Find teachers who have students across different age groups in the same course.

-- Q-131: List all teachers along with the students in their courses who are in grade level 12.

-- Q-132: Display students and teachers for each course, even if there are no students assigned (use LEFT JOIN).

-- Q-133: Show each teacher's name, subject, and the names of their students who are younger than 16.

-- Q-134: List students who are enrolled in the same course as students with a different teacher.

-- Q-135: Display all courses, their teachers, and students, where the course has more than one student enrolled.

-- Q-136: Find the count of students in each course for teachers who teach at least two subjects.

-- Q-137: List students along with the teachers for all courses they are not enrolled in (use LEFT JOIN).

-- Q-138: Show each student’s name, grade level, course name, and the name of their teacher's subject.

-- Q-139: Display the names of students who share a teacher with a student in grade level 11.

-- Q-140: List all courses along with their teachers and students who are older than the average student age in their grade level.
select c.cname, t.tname, s.sname,s.age,s.gl from Courses c Join Teachers t on c.tid = t.tid Join Students s On c.sid = s.sid where s.age>(select avg(s2.age) from Students s2 where s2.gl = s.gl);
