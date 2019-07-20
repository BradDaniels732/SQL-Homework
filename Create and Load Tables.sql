-- Create the six tables, and load the data by
-- right clicking on the table name in the schema
-- and selecting "Import/Export..."

CREATE TABLE Depts (
  Dept_No VARCHAR (4),
  Dept_Name VARCHAR (20),
  PRIMARY KEY (Dept_No)
);

-- After loading each file, run the SELECT statement to 
-- make sure it worked as expected
SELECT * from Depts;

CREATE TABLE Employees (
  Emp_No INTEGER,
  Birth_Date DATE,
  First_Name VARCHAR (20),
  Last_Name VARCHAR (20), 
  Gender VARCHAR (1),
  Hire_Date DATE,
  PRIMARY KEY (Emp_No)
);

-- Limit some of the queries that have many rows in the related table
SELECT * from Employees LIMIT 10;

CREATE TABLE Dept_Emp (
  Emp_No INTEGER,
  Dept_No VARCHAR (4),
  From_Date DATE,
  To_Date DATE,
  PRIMARY KEY (Emp_No, Dept_No),
  FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No),
  FOREIGN KEY (Dept_No) REFERENCES Depts(Dept_No)
);

SELECT * from Dept_Emp LIMIT 10;

CREATE TABLE Dept_Mgr (
  Dept_No VARCHAR (4),
  Emp_No INTEGER,
  From_Date DATE,
  To_Date DATE,
  PRIMARY KEY (Dept_No, Emp_No),
  FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No),
  FOREIGN KEY (Dept_No) REFERENCES Depts(Dept_No)
);

SELECT * from Dept_Mgr;

CREATE TABLE Salaries (
  Emp_No INTEGER,
  Salary REAL,
  From_Date DATE,
  To_Date DATE,
  PRIMARY KEY (Emp_No, From_Date),
  FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No)
);

SELECT * FROM Salaries LIMIT 10;

CREATE TABLE Titles (
  Emp_No INTEGER,
  Title VARCHAR (20),
  From_Date DATE,
  To_Date DATE,
  PRIMARY KEY (Emp_No, From_Date),
  FOREIGN KEY (Emp_No) REFERENCES Employees(Emp_No)
);

SELECT * FROM Titles LIMIT 10;