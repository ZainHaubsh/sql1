
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Major VARCHAR(10) NOT NULL,
    Age INT NOT NULL,
    GPA DECIMAL(3, 2) NOT NULL
);

INSERT INTO Students VALUES (1, 'Ahmad', 'IT', 21, 3.50);
INSERT INTO Students VALUES (2, 'Sara', 'CS', 20, 3.90);
INSERT INTO Students VALUES (3, 'Ali', 'IT', 22, 2.80);
INSERT INTO Students VALUES (4, 'Noor', 'SE', 19, 3.70);
INSERT INTO Students VALUES (5, 'Omar', 'CS', 23, 3.20);
INSERT INTO Students VALUES (6, 'Lina', 'IT', 20, 4.00);
INSERT INTO Students VALUES (7, 'Ameer', 'SE', 21, 2.90);
INSERT INTO Students VALUES (8, 'Rana', 'CS', 22, 3.60);

--1
SELECT MAX(GPA) AS HighestGPA 
FROM Students;

--2
SELECT MIN(GPA) AS LowestGPA 
FROM Students;

--3
SELECT COUNT(*) AS TotalStudents 
FROM Students;

--4
SELECT SUM(GPA) AS TotalGPA 
FROM Students;

--5
SELECT AVG(GPA) AS AverageGPA 
FROM Students;

--6
SELECT * 
FROM Students 
WHERE Name LIKE 'A%';

--7
SELECT * 
FROM Students 
WHERE Name LIKE '%ra%';

--8
SELECT * 
FROM Students 
WHERE Name LIKE '%r';

--9
SELECT * 
FROM Students 
WHERE Major = 'CS';

--10
SELECT 
    MAX(GPA) AS HighestGPA, 
    MIN(GPA) AS LowestGPA 
FROM Students;
--Bonus

SELECT COUNT(*) AS IT_Students_Count 
FROM Students 
WHERE Major = 'IT';

SELECT AVG(GPA) AS CS_Average_GPA 
FROM Students 
WHERE Major = 'CS';

--challenge
SELECT 
    MAX(GPA) AS HighestGPA,
    MIN(GPA) AS LowestGPA,
    AVG(GPA) AS AverageGPA,
    COUNT(*) AS TotalStudents
FROM Students;