-- Drop tables in reverse order of dependencies
DROP TABLE IF EXISTS Assignments;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Projects;

-- Create parent table: Departments
CREATE TABLE Departments (
    dept_id     VARCHAR(10) PRIMARY KEY,
    dept_name   VARCHAR(50) NOT NULL,
    location    VARCHAR(50)
);

-- Create table: Employees
CREATE TABLE Employees (
    emp_id      INT PRIMARY KEY,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50),
    salary      DECIMAL(8,2) CHECK (salary > 0),
    hire_date   DATE,
    dept_id     VARCHAR(10),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Create table: Projects
CREATE TABLE Projects (
    proj_id     VARCHAR(10) PRIMARY KEY,
    proj_name   VARCHAR(100) NOT NULL,
    budget      DECIMAL(10,2)
);

-- Create junction table: Assignments
CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY,
    emp_id        INT,
    proj_id       VARCHAR(10),
    hours_worked  INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (proj_id) REFERENCES Projects(proj_id)
);

-- Insert data into Departments
INSERT INTO Departments (dept_id, dept_name, location) VALUES
('D10', 'Engineering', 'New York'),
('D20', 'Sales', 'Chicago'),
('D30', 'Human Resources', 'New York'),
('D40', 'Marketing', 'San Francisco');

-- Insert data into Employees
INSERT INTO Employees (emp_id, first_name, last_name, salary, hire_date, dept_id) VALUES
(101, 'John', 'Smith', 65000, '2022-06-17', 'D10'),
(102, 'Jane', 'Doe', 70000, '2023-03-05', 'D10'),
(103, 'Laura', 'Brown', 52000, '2023-08-10', 'D30'),
(104, 'Michael', 'Lee', 28000, '2023-11-21', 'D20'),
(105, 'Sarah', 'Chen', 18000, '2024-01-15', 'D20'),
(106, 'David', 'Kim', 150000, '2022-02-01', NULL); -- CEO, no dept

-- Insert data into Projects
INSERT INTO Projects (proj_id, proj_name, budget) VALUES
('P100', 'Project Alpha', 500000),
('P200', 'Project Beta', 800000),
('P300', 'Project Gamma', 250000);

-- Insert data into Assignments
INSERT INTO Assignments (assignment_id, emp_id, proj_id, hours_worked) VALUES
(1, 101, 'P100', 40),
(2, 102, 'P100', 30),
(3, 102, 'P200', 10),
(4, 104, 'P300', 25),
(5, 105, 'P300', 20);

SELECT * FROM Departments;
SELECT * FROM Employees;