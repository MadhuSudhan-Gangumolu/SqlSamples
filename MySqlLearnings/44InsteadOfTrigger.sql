--Generally Instead of trigger is used to trigger the event on the Complex views
--Gernerally we can not insert or update the table with the complex view because it involvs more than one table to resolve this we can use Instead of Trigger



-- Create Department Table
CREATE TABLE Department
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50)
)
GO

-- Populate the Department Table with test data
INSERT INTO Department VALUES(1, 'IT')
INSERT INTO Department VALUES(2, 'HR')
INSERT INTO Department VALUES(3, 'Sales')

-- Create Employee Table
CREATE TABLE Employee
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  Salary DECIMAL(18,2),
  DeptID INT
)
GO

-- Populate the Employee Table with test data
INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 25000, 1)
INSERT INTO Employee VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 30000, 2)
INSERT INTO Employee VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060',40000, 2)
INSERT INTO Employee VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 35000, 3)
INSERT INTO Employee VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 27000, 1)
INSERT INTO Employee VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 33000, 2)
GO

CREATE VIEW vwEmployeeDetails
AS
SELECT emp.ID, emp.Name, Gender, Salary, dept.Name AS Department
FROM Employee emp
INNER JOIN Department dept
ON emp.DeptID = dept.ID

INSERT INTO vwEmployeeDetails VALUES(7, 'Saroj', 'Male', 50000, 'IT') -- it will throw an error

CREATE TRIGGER tr_vwEmployeeDetails_InsteadOfInsert
ON vwEmployeeDetails
INSTEAD OF INSERT
AS
BEGIN
  DECLARE @DepartmenttId int
 
  -- First Check if there is a valid DepartmentId in the Department Table
  -- for the given Department Name
  SELECT @DepartmenttId = dept.ID 
  FROM Department dept
  INNER JOIN INSERTED inst
  on inst.Department = dept.Name
 
  --If the DepartmentId is null then throw an error
  IF(@DepartmenttId is null)
  BEGIN
    RAISERROR('Invalid Department Name. Statement terminated', 16, 1)
    RETURN
  END
 
  -- Finally insert the data into the Employee table
  INSERT INTO Employee(ID, Name, Gender, Salary, DeptID)
  SELECT ID, Name, Gender, Salary, @DepartmenttId
  FROM INSERTED
End

INSERT INTO vwEmployeeDetails VALUES(7, 'Saroj', 'Male', 50000, 'IT') -- now it will not throw any error
