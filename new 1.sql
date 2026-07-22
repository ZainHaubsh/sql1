/*Task1*/ 
CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE Products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL DEFAULT 0
);
CREATE TABLE Employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    fullName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    hireDate DATE NOT NULL DEFAULT GETDATE(),
    position VARCHAR(50) NOT NULL
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    orderStatus VARCHAR(50) NOT NULL DEFAULT 'Pending',
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT FK_Orders_Products FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO customers (fullName, email, phone) VALUES ('Ahmad Ali', 'ahmad.ali@email.com', '0791111111');

INSERT INTO Products (productName, description, price, stockQuantity) VALUES ('Laptop', 'High-performance laptop', 850.00, 15);

INSERT INTO Employees (fullName, lastName, email, phone, hireDate, position) VALUES ('Tariq Ziad', 'tariq.z@company.com', '0781111111', '2023-01-15', 'Manager');

INSERT INTO orders (product_id, customer_id, totalAmount, orderStatus) VALUES (1, 1, 850.00, 'Delivered');

/*task2*/
CREATE TABLE Departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    departmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    department_id INT NOT NULL,
    fullName VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    phone VARCHAR(20) NOT NULL,
    nationalID VARCHAR(50) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    maritalStatus VARCHAR(20) NOT NULL,
    personalPhoto VARCHAR(255),
    entryDate DATE NOT NULL DEFAULT GETDATE(),
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'Employee',
    CONSTRAINT FK_Employees_Departments FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Tasks (
    task_id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT NOT NULL,
    taskTitle VARCHAR(100) NOT NULL,
    taskDescription VARCHAR(MAX),
    startDate DATE NOT NULL,
    dueDate DATE NOT NULL,
    importanceLevel VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Tasks_Employees FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE ContactFeedback (
    feedback_id INT IDENTITY(1,1) PRIMARY KEY,
    senderName VARCHAR(100) NOT NULL,
    senderEmail VARCHAR(100) NOT NULL,
    message VARCHAR(MAX) NOT NULL,
    receivedDate DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);

/*task 3*/
--1 create
CREATE TABLE Cities (
    city_id INT IDENTITY(1,1) PRIMARY KEY,
    cityName VARCHAR(100) NOT NULL
);

CREATE TABLE Instructors (
    instructor_id INT IDENTITY(1,1) PRIMARY KEY,
    instructorName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE Courses (
    course_id INT IDENTITY(1,1) PRIMARY KEY,
    instructor_id INT NOT NULL,
    courseName VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    CONSTRAINT FK_Courses_Instructors FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

CREATE TABLE Students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    city_id INT NOT NULL,
    studentName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Students_Cities FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);

CREATE TABLE StudentCourses (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollmentDate DATE NOT NULL DEFAULT GETDATE(),
    finalGrade DECIMAL(5, 2) NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'In Progress', 
    CONSTRAINT FK_StudentCourses_Students FOREIGN KEY (student_id) REFERENCES Students(student_id),
    CONSTRAINT FK_StudentCourses_Courses FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

--2 insert

INSERT INTO Cities (cityName) VALUES 
('Amman'),
('Irbid'),
('Zarqa'),
('Aqaba'),
('Madaba'),
('Jerash'),
('Salt'),
('Karak');

INSERT INTO Instructors (instructorName, email, phone) VALUES 
('Ahmad Ali', 'ahmad.ali@training.com', '0791111111'),
('Sara Omar', 'sara.omar@training.com', '0792222222'),
('Mohammed Khaled', 'mohammed.k@training.com', '0793333333'),
('Fatima Noor', 'fatima.noor@training.com', '0794444444'),
('Ibrahim Zaid', 'ibrahim.zaid@training.com', '0795555555'),
('Layla Tariq', 'layla.tariq@training.com', '0796666666'),
('Yousef Rami', 'yousef.rami@training.com', '0797777777'),
('Nourhan Salem', 'nourhan.s@training.com', '0798888888');

INSERT INTO Courses (instructor_id, courseName, description) VALUES 
(1, 'Database Fundamentals', 'Introduction to SQL and relational databases'),
(1, 'Advanced SQL Queries', 'Complex joins, subqueries, and performance tuning'),
(2, 'Python for Beginners', 'Learn the basics of Python programming'),
(3, 'Web Development Basics', 'HTML, CSS, and basic JavaScript'),
(4, 'UI/UX Design Principles', 'User interface and experience fundamentals'),
(5, 'Data Science Intro', 'Introduction to data analysis and visualization'),
(6, 'Cybersecurity Basics', 'Fundamental concepts of digital security'),
(7, 'Project Management', 'Agile and Scrum methodologies');

INSERT INTO Students (city_id, studentName, email, phone) VALUES 
(1, 'Tariq Ziad', 'tariq.ziad@email.com', '0781111111'),
(1, 'Raniah Jaber', 'raniah.j@email.com', '0782222222'),
(2, 'Sami Baker', 'sami.baker@email.com', '0783333333'),
(3, 'Hiba Nasser', 'hiba.nasser@email.com', '0784444444'),
(4, 'Omar Farooq', 'omar.f@email.com', '0785555555'),
(5, 'Dina Murad', 'dina.murad@email.com', '0786666666'),
(6, 'Zaid Hani', 'zaid.hani@email.com', '0787777777'),
(7, 'Lama Kamal', 'lama.kamal@email.com', '0788888888');

INSERT INTO StudentCourses (student_id, course_id, enrollmentDate, finalGrade, status) VALUES 
(1, 1, '2026-01-10', 92.50, 'Completed'),
(1, 3, '2026-02-01', NULL, 'In Progress'),
(2, 2, '2026-01-15', 85.00, 'Completed'),
(3, 4, '2026-01-20', 45.00, 'Dropped'),
(4, 5, '2026-02-05', 88.00, 'Completed'),
(5, 6, '2026-02-10', NULL, 'In Progress'),
(6, 7, '2026-02-12', 79.50, 'Completed'),
(7, 8, '2026-02-15', NULL, 'In Progress'),
(8, 1, '2026-02-18', NULL, 'In Progress');

--3select
SELECT * FROM Students;

SELECT * FROM Instructors;

SELECT * FROM Courses;

SELECT c.courseName
FROM StudentCourses sc
JOIN Courses c ON sc.course_id = c.course_id
WHERE sc.completionStatus = 'Completed';

SELECT s.studentName
FROM StudentCourses sc
JOIN Students s ON sc.student_id = s.student_id
WHERE sc.finalGrade > 80;

SELECT s.studentName
FROM Students s
JOIN Cities c ON s.city_id = c.city_id
WHERE c.cityName = 'Amman';

SELECT c.courseName
FROM Courses c
JOIN Instructors i ON c.instructor_id = i.instructor_id
WHERE i.instructor_id = 1;

SELECT s.studentName
FROM Students s
JOIN StudentCourses sc ON s.student_id = sc.student_id
WHERE sc.enrollmentDate > '2026-02-01';

SELECT * FROM Students 
WHERE studentName LIKE 'A%';

SELECT s.studentName
FROM Students s
JOIN StudentCourses sc ON s.student_id = sc.student_id
WHERE sc.finalGrade BETWEEN 70 AND 90;

--4 UPDATE
update StudentCourses set finalGrade=50 where student_id=1;
update Students set studentName='Zain Nizar' where student_id=1;
update Courses set courseName='Course' where course_id=1;
update Instructors set instructorName='Instructor', email='instructor@gmail.com'  where instructor_id=1;
update StudentCourses set status='completed' where student_id=2;

--5 DELETE
delete from Students where student_id=8;
delete from Courses where course_id=8;
delete from StudentCourses where enrollment_id=8;
delete from StudentCourses where status='Dropped';
delete from StudentCourses where finalgrade<50;

--6join
SELECT Students.studentName, Courses.courseName 
FROM Students 
Right JOIN StudentCourses ON Students.student_id = StudentCourses.student_id 
Right JOIN Courses ON StudentCourses.course_id = Courses.course_id;

SELECT Students.studentName, Instructors.instructorName 
FROM Students 
LEFT JOIN StudentCourses ON Students.student_id = StudentCourses.student_id 
LEFT JOIN Courses ON StudentCourses.course_id = Courses.course_id 
LEFT JOIN Instructors ON Courses.instructor_id = Instructors.instructor_id;

SELECT Students.studentName, Cities.cityName 
FROM Students 
INNER JOIN Cities ON Students.city_id = Cities.city_id;

SELECT Students.studentName, Courses.courseName, StudentCourses.finalGrade, StudentCourses.completionStatus 
FROM Students 
FULL OUTER JOIN StudentCourses ON Students.student_id = StudentCourses.student_id 
FULL OUTER JOIN Courses ON StudentCourses.course_id = Courses.course_id;

--7Alter
EXEC sp_rename 'Students', 'Learners';

EXEC sp_rename 'Students.email', 'contact_email', 'COLUMN';

ALTER TABLE Students ADD dateOfBirth DATE NULL;

ALTER TABLE Students DROP COLUMN dateOfBirth;

ALTER TABLE Students ALTER COLUMN phone VARCHAR(30) NOT NULL;

--8
SELECT Courses.courseName, COUNT(StudentCourses.student_id) AS studentCount
FROM Courses
LEFT JOIN StudentCourses ON Courses.course_id = StudentCourses.course_id
GROUP BY Courses.course_id, Courses.courseName;

SELECT Courses.courseName, AVG(StudentCourses.finalGrade) AS averageGrade
FROM Courses
LEFT JOIN StudentCourses ON Courses.course_id = StudentCourses.course_id
GROUP BY Courses.course_id, Courses.courseName;

SELECT MAX(finalGrade) FROM StudentCourses;

SELECT MIN(finalGrade) FROM StudentCourses;

SELECT Students.studentName, StudentCourses.finalGrade 
FROM Students 
JOIN StudentCourses ON Students.student_id = StudentCourses.student_id 
ORDER BY StudentCourses.finalGrade DESC;

SELECT courseName FROM Courses ORDER BY courseName ASC;

SELECT Cities.cityName, COUNT(Students.student_id) AS studentCount 
FROM Cities 
LEFT JOIN Students ON Cities.city_id = Students.city_id 
GROUP BY Cities.city_id, Cities.cityName;