
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    Age INT,
    City VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, Name, Department, Salary, Age, City) VALUES
(1, 'ÃÍãÏ ãÍãÏ', 'ÊÞäíÉ ÇáãÚáæãÇÊ', 12000, 28, 'ÚãÇä'),
(2, 'ÝÇØãÉ Úáí', 'ÇáãæÇÑÏ ÇáÈÔÑíÉ', 9500, 32, 'ÅÑÈÏ'),
(3, 'ÚãÑ ÎÇáÏ', 'ÇáãÇáíÉ', 15000, 35, 'ÇáÒÑÞÇÁ'),
(4, 'ÓÇÑÉ ÍÓä', 'ÇáÊÓæíÞ', 11000, 26, 'ÚãÇä'),
(5, 'ãÍãæÏ ÅÈÑÇåíã', 'ÇáãÈíÚÇÊ', 8500, 40, 'ÇáÚÞÈÉ'),
(6, 'íæÓÝ ÃÍãÏ', 'ÊÞäíÉ ÇáãÚáæãÇÊ', 13000, 29, 'ÚãÇä'),
(7, 'Ñíã ÎÇáÏ', 'ÇáãæÇÑÏ ÇáÈÔÑíÉ', 10000, 27, 'ÅÑÈÏ'),
(8, 'ÍÓíä ãÍãÏ', 'ÇáãÇáíÉ', 16500, 38, 'ÇáÒÑÞÇÁ'),
(9, 'áÌíä ÚÈÏ Çááå', 'ÇáÊÓæíÞ', 11500, 25, 'ÚãÇä'),
(10, 'ØÇÑÞ ÓãíÑ', 'ÇáãÈíÚÇÊ', 9000, 31, 'ÇáÚÞÈÉ'),
(11, 'áÌíä ÚÈÏ ÇáßÑíã', 'ÇáÊÓæíÞ', 11500, 25, 'ÚãÇä');
--Group By
--1
SELECT Department, COUNT(*) AS EmployeeCount 
FROM Employees 
GROUP BY Department;

--2
select Avg(Salary) as avgSalary from Employees ;

--3
select Department, Max(Salary) as maxSalary from Employees Group By Department;

--4
select City, Sum(Salary) as sumSalary from Employees Group By City;

--Having
--1
SELECT Department, COUNT(*) AS employeeCount 
FROM Employees 
GROUP BY Department 
HAVING COUNT(*) > 3;

--2
select City, Avg(Salary) as AvgSalary from Employees group by city having Avg(Salary) >5000;

--3
select City, Sum(Salary) as SumSalary from Employees group by city having Sum(Salary) >15000;
--4
select Department, Min(Salary) as MinSalary from Employees group by department having Min(Salary)>3000;

--OrderBY
--1
Select * from Employees Order BY Salary Desc;

--2
Select * from Employees Order BY Name ;

--3
Select * from Employees Order BY Age;

--4
Select * from Employees Order BY Department ,Salary Desc;

--All
--1
select Department, Count(*) As EmployeeCount from Employees Group by Department Having Count(*)>2 Order by EmployeeCount;
--2
select Department, Avg(Salary) As AvgSalary from Employees Group by Department having avg(Salary) >4000 Order by AvgSalary DESC;

--3
select City, Sum(Salary) as sumSalary from Employees Group by City having sum(Salary) >10000 Order by City DESC;

--Challenge
select Department, Count(*) As EmployeeCount, Avg(Salary)as AvgSalary,Max(Salary) As MaxSalary from Employees Group BY Department having  Avg(Salary)>5000 ORDER BY MaxSalary DESC;