-- SQL script covering various features

-- Create a database
CREATE DATABASE CompanyDB;

-- Use the database
USE CompanyDB;

-- Create tables
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(255) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE,
    Email VARCHAR(255) UNIQUE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(255) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(15, 2)
);

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    HoursWorked INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    PRIMARY KEY (EmployeeID, ProjectID)
);

-- Insert data into tables
INSERT INTO Departments (DepartmentName) VALUES ('Human Resources');
INSERT INTO Departments (DepartmentName) VALUES ('Engineering');
INSERT INTO Departments (DepartmentName) VALUES ('Sales');

INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, HireDate, Email)
VALUES ('John', 'Doe', 2, 80000.00, '2020-01-15', 'john.doe@example.com');
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, HireDate, Email)
VALUES ('Jane', 'Smith', 1, 60000.00, '2019-03-23', 'jane.smith@example.com');
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, HireDate, Email)
VALUES ('Michael', 'Brown', 3, 75000.00, '2021-07-11', 'michael.brown@example.com');

INSERT INTO Projects (ProjectName, StartDate, EndDate, Budget)
VALUES ('Project Alpha', '2022-01-01', '2022-12-31', 500000.00);
INSERT INTO Projects (ProjectName, StartDate, EndDate, Budget)
VALUES ('Project Beta', '2023-01-01', '2023-06-30', 300000.00);

INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
VALUES (1, 1, 150);
INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
VALUES (2, 1, 200);
INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
VALUES (3, 2, 180);

-- Basic SELECT queries
SELECT * FROM Employees;
SELECT FirstName, LastName, Salary FROM Employees WHERE Salary > 70000;

-- JOIN operations
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

SELECT e.FirstName, e.LastName, p.ProjectName, ep.HoursWorked
FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID;

-- Aggregation
SELECT DepartmentID, COUNT(*) AS NumEmployees, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 60000;

-- Subqueries
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Views
CREATE VIEW EmployeeProjectHours AS
SELECT e.FirstName, e.LastName, p.ProjectName, ep.HoursWorked
FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID;

SELECT * FROM EmployeeProjectHours;

-- Indexes
CREATE INDEX idx_department ON Employees (DepartmentID);

-- Transactions
START TRANSACTION;
UPDATE Employees SET Salary = Salary * 1.1 WHERE DepartmentID = 2;
DELETE FROM Employees WHERE EmployeeID = 3;
ROLLBACK;

-- Stored Procedures
DELIMITER //
CREATE PROCEDURE GetEmployeeProjects(IN emp_id INT)
BEGIN
    SELECT p.ProjectName, ep.HoursWorked
    FROM Projects p
    JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
    WHERE ep.EmployeeID = emp_id;
END //
DELIMITER ;

CALL GetEmployeeProjects(1);

-- Triggers
DELIMITER //
CREATE TRIGGER BeforeEmployeeInsert
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
    IF NEW.Salary < 30000 THEN
        SET NEW.Salary = 30000;
    END IF;
END //
DELIMITER ;

-- Insert that triggers the trigger
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, HireDate, Email)
VALUES ('Tom', 'Hanks', 2, 25000.00, '2024-02-10', 'tom.hanks@example.com');

-- Final SELECT after the trigger operation
SELECT * FROM Employees;

-- Drop objects when done
DROP TRIGGER BeforeEmployeeInsert;
DROP PROCEDURE GetEmployeeProjects;
DROP VIEW EmployeeProjectHours;
DROP TABLE EmployeeProjects;
DROP TABLE Projects;
DROP TABLE Employees;
DROP TABLE Departments;
DROP DATABASE CompanyDB;
