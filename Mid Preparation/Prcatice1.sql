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



