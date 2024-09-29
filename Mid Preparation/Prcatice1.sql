USE MID_PREPARATION;

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(50),
    Specialty VARCHAR(50),
    DepartmentID INT,
    ExperienceYears INT
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Diagnosis VARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Orthopedics'),
(4, 'Pediatrics'),
(5, 'Dermatology');

INSERT INTO Doctors (DoctorID, Name, Specialty, DepartmentID, ExperienceYears) VALUES
(101, 'Dr. Alice', 'Cardiologist', 1, 10),
(102, 'Dr. Bob', 'Neurologist', 2, 15),
(103, 'Dr. Charlie', 'Orthopedic Surgeon', 3, 8),
(104, 'Dr. David', 'Pediatrician', 4, 5),
(105, 'Dr. Eve', 'Dermatologist', 5, 12);

INSERT INTO Patients (PatientID, Name, Age, Gender) VALUES
(201, 'John Doe', 45, 'Male'),
(202, 'Jane Smith', 30, 'Female'),
(203, 'Michael Johnson', 65, 'Male'),
(204, 'Emily Davis', 8, 'Female'),
(205, 'Chris Brown', 25, 'Male');

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, Diagnosis) VALUES
(301, 201, 101, '2024-09-20', 'Hypertension'),
(302, 202, 102, '2024-09-22', 'Migraine'),
(303, 203, 101, '2024-09-25', 'Heart Attack'),
(304, 204, 104, '2024-09-26', 'Flu'),
(305, 205, 105, '2024-09-27', 'Acne'),
(306, 201, 103, '2024-09-28', 'Knee Pain'),
(307, 202, 103, '2024-09-29', 'Back Pain');

-- Task-1: List all the patients who have an appointment on or after September 25, 2024.
select * From Patients where PatientID IN (select PatientID From Appointments where AppointmentDate >= '2024-09-25');

-- Task 2: Retrieve the names of doctors who specialize in "Cardiologist".
select Name From Doctors where Specialty = 'Cardiologist';

-- Task 3: Find the total number of appointments for each doctor.
select DoctorID, Count(*) FROM Appointments group by DoctorID; 

-- Task 4: List all the doctors from the "Pediatrics" department.
select * from Doctors where DepartmentID = (select DepartmentID From Departments where DepartmentName = 'Pediatrics');

-- Task 5: Retrieve the names of patients who have appointments in September 2024.
select Name from Patients where PatientID in (Select PatientID From Appointments where AppointmentDate between '2024-09-01' and '2024-09-30');

-- Task 6: Find the patient who was diagnosed with "Heart Attack".
select * from Patients where PatientID in (select PatientID From Appointments where Diagnosis = 'Heart Attack');

-- Task 7: Get the total number of male and female patients.
select Gender,count(*) from Patients group by Gender;

-- Task 8: List the doctors who have more than 5 years of experience.
select * from Doctors where ExperienceYears > 5;

-- Task 9: Retrieve the names of patients treated by "Dr. Alice".
select Name from Patients where PatientID in (select PatientID From Appointments where DoctorID = (select DoctorID from Doctors where Name = 'Dr. Alice'));

-- Task 10: Find the department with the most doctors.
select DepartmentID, count(*) as total from Doctors group by DepartmentID order by total desc limit 1;

-- Task 11: List the patients who have an appointment with a doctor from the "Orthopedics" department.
select * from Patients where patientID in (Select PatientId from Appointments where DoctorID in (Select DoctorID from Doctors where DepartmentId = (select DepartmentID From Departments where DepartmentName = 'Orthopedics')));

-- Task 12: Get the average age of all patients.
select avg(Age) From Patients;

-- Task 13: Find all appointments where the diagnosis contains the word "Pain".
select Diagnosis from Appointments where Diagnosis like '%pain%';

-- Task 14: Retrieve the details of the most recent appointment.
select * from Appointments where appointmentDate = (select max(AppointmentDate) from Appointments);

-- Task 15: Find the department with the highest average years of experience among doctors.
SELECT DepartmentName FROM Departments WHERE DepartmentID IN (SELECT DepartmentID FROM Doctors GROUP BY DepartmentID ORDER BY AVG(ExperienceYears) DESC LIMIT 1);

-- 16. Retrieve the names of doctors who have treated more than one unique patient.
select Name from Doctors where DoctorID in (select DoctorID from appointments group by DoctorId having count(distinct PatientID)>1);