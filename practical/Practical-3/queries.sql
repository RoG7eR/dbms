
-- create
CREATE TABLE STUDENT (
  UID integer PRIMARY KEY,
  Name varchar(50) unique,
  Dept TEXT NOT NULL,
  Back integer CHECK (Back >= 0),
  Back_Subject1 varchar(40),
  Back_Subject2 varchar(40),
  Back_Subject3 varchar(40),
  Back_Subject4 varchar(40),
  SEM_Repeat TEXT NOT NULL
);

CREATE TABLE Departments(
  D_ID varchar(50) unique,
  D_CODE varchar(50) PRIMARY KEY,
  D_name varchar(40) unique
);

CREATE TABLE FACULTY (
  P_Name varchar(50) NOT NULL,
  P_ID varchar(50) PRIMARY KEY,
  P_Dept varchar(50), FOREIGN KEY (P_Dept) references Departments(D_name),
  Subject_Code varchar(50), FOREIGN KEY (Subject_Code) references Departments(D_CODE)
);

-- insert
INSERT INTO STUDENT VALUES (245, 'Rishi', 'CSE-C', 4, 'Engineering Physics', 'DELA', 'PPS', 'TOM', 'Yes');
INSERT INTO STUDENT VALUES (238, 'Rohan', 'CSE-C', 0, NULL, NULL, NULL, NULL, 'No');
-- DELETE FROM STUDENT WHERE Back > 0;


INSERT INTO Departments VALUES('001', 'CE0231', 'PPS');
INSERT INTO FACULTY VALUES('KJ', '0213', 'PPS', 'CE0231');
-- fetch 
SELECT * FROM STUDENT;
SELECT * FROM Departments;
SELECT * FROM FACULTY;

desc FACULTY;
