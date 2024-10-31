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