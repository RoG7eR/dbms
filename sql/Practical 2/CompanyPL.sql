-- Enable output for PL/SQL blocks
SET SERVEROUTPUT ON;

-- Drop tables in reverse order of dependencies to avoid errors
DROP TABLE Assignments;
DROP TABLE Employees;
DROP TABLE Departments;
DROP TABLE Projects;

-- Create parent table: Departments
CREATE TABLE Departments (
    dept_id     VARCHAR2(10) PRIMARY KEY,
    dept_name   VARCHAR2(50) NOT NULL,
    location    VARCHAR2(50)
);

-- Create table: Employees
CREATE TABLE Employees (
    emp_id      NUMBER(5) PRIMARY KEY,
    first_name  VARCHAR2(50) NOT NULL,
    last_name   VARCHAR2(50),
    salary      NUMBER(8, 2) CHECK (salary > 0),
    hire_date   DATE,
    dept_id     VARCHAR2(10),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Create table: Projects
CREATE TABLE Projects (
    proj_id     VARCHAR2(10) PRIMARY KEY,
    proj_name   VARCHAR2(100) NOT NULL,
    budget      NUMBER(10, 2)
);

-- Create junction table: Assignments
CREATE TABLE Assignments (
    assignment_id NUMBER(5) PRIMARY KEY,
    emp_id        NUMBER(5),
    proj_id       VARCHAR2(10),
    hours_worked  NUMBER(3),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (proj_id) REFERENCES Projects(proj_id)
);

-- Insert data into Departments
INSERT ALL
    INTO Departments (dept_id, dept_name, location) VALUES ('D10', 'Engineering', 'New York')
    INTO Departments (dept_id, dept_name, location) VALUES ('D20', 'Sales', 'Chicago')
    INTO Departments (dept_id, dept_name, location) VALUES ('D30', 'Human Resources', 'New York')
    INTO Departments (dept_id, dept_name, location) VALUES ('D40', 'Marketing', 'San Francisco')
SELECT * FROM dual;

-- Insert data into Employees
INSERT ALL
    INTO Employees (emp_id, first_name, last_name, salary, hire_date, dept_id) VALUES (101, 'John', 'Smith', 65000, TO_DATE('17-JUN-2022', 'DD-MON-YYYY'), 'D10')
    INTO Employees (emp_id, first_name, last_name, salary, hire_date, dept_id) VALUES (102, 'Jane', 'Doe', 70000, TO_DATE('05-MAR-2023', 'DD-MON-YYYY'), 'D10')
    INTO Employees (emp_id, first_name, last_name, salary, hire_date, dept_id) VALUES (103, 'Laura', 'Brown', 52000, TO_DATE('10-AUG-2023', 'DD-MON-YYYY'), 'D30')
    INTO Employees (emp_id, first_name, last_name, salary, hire_date, dept_id) VALUES (104, 'Michael', 'Lee', 28000, TO_DATE('21-NOV-2023', 'DD-MON-YYYY'), 'D20')
    INTO Employees (emp_id, first_name, last_name, salary, hire_date, dept_id) VALUES (105, 'Sarah', 'Chen', 18000, TO_DATE('15-JAN-2024', 'DD-MON-YYYY'), 'D20')
    INTO Employees (emp_id, first_name, last_name, salary, hire_date, dept_id) VALUES (106, 'David', 'Kim', 150000, TO_DATE('01-FEB-2022', 'DD-MON-YYYY'), NULL) -- CEO, no dept
SELECT * FROM dual;

-- Insert data into Projects
INSERT ALL
    INTO Projects (proj_id, proj_name, budget) VALUES ('P100', 'Project Alpha', 500000)
    INTO Projects (proj_id, proj_name, budget) VALUES ('P200', 'Project Beta', 800000)
    INTO Projects (proj_id, proj_name, budget) VALUES ('P300', 'Project Gamma', 250000)
SELECT * FROM dual;

-- Insert data into Assignments
INSERT ALL
    INTO Assignments (assignment_id, emp_id, proj_id, hours_worked) VALUES (1, 101, 'P100', 40)
    INTO Assignments (assignment_id, emp_id, proj_id, hours_worked) VALUES (2, 102, 'P100', 30)
    INTO Assignments (assignment_id, emp_id, proj_id, hours_worked) VALUES (3, 102, 'P200', 10)
    INTO Assignments (assignment_id, emp_id, proj_id, hours_worked) VALUES (4, 104, 'P300', 25)
    INTO Assignments (assignment_id, emp_id, proj_id, hours_worked) VALUES (5, 105, 'P300', 20)
SELECT * FROM dual;

-- Save the changes
COMMIT;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Database setup complete. Tables are ready.');
END;
/
