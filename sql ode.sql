CREATE DATABASE myDB;
USE myDB;
CREATE TABLE Patient(
PatientID INT PRIMARY KEY auto_increment,
PatientName VARCHAR(50),
PatientSurname VARCHAR(50),
PatientDOB  DATE
);

CREATE TABLE Doctor(
DoctorID INT PRIMARY KEY auto_increment,
DoctorName VARCHAR(50),
DoctorSurname varchar(50)
);

CREATE TABLE Appointments(
AppointmentID INT PRIMARY KEY ,
PatientID INT,
DoctorID INT,
AppointmentDate DATE,
AppointmentTime time,
AppointmentDuration INT,
FOREIGN KEY(PatientID) REFERENCES Patient(PatientID),
FOREIGN KEY(DoctorID) REFERENCES Doctor(DoctorID)
);

INSERT INTO Patient
Values (1,"Debbie","Theart","1980-03-17"),
	   (2,"Thomas","Duncan","1976-08-12");
INSERT INTO Doctor
VALUES (1,"Zintle","Nukani"),
       (2,"Ravi","Maharaj");
INSERT INTO Appointments
Values (1,1,2,"2025-01-15","9:00",15),
        (2,2,2,"2025-01-18","15:00",30),
        (3,1,1,"2025-01-20","10:00",15),
        (4,1,2,"2025-01-21","11:00",15);
selecT* FROM Appointments
WHERE AppointmentDate>="2025-01-16" AND AppointmentDate<="2025-01-20";

SELECT PatientName,PatientSurname,AppointmentID  from Patient  JOIN Appointments ON Patient.PatientID=Appointments.PatientID ORDER BY AppointmentID DESC;

CREATE VIEW patient_list AS
SELECT PatientName,PatientSurname FROM Patient JOIN Appointments ON Patient.PatientID = Appointments.PatientID
where DoctorID=2  ORDER BY PatientSurname ASC;