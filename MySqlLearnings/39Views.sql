--Views will act as interface between user and the table
--Views will directly references the table means if we do any dml operations in views that will be impacted to the main table

-- Create Employee Table
CREATE TABLE Employee
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  DeptID INT
)
GO
-- Populate the Employee Table with test data
INSERT INTO Employee VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 1)
INSERT INTO Employee VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 2)
INSERT INTO Employee VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 2)
INSERT INTO Employee VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 3)
INSERT INTO Employee VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 1)
INSERT INTO Employee VALUES(6, 'Hina', 'Female','1995-07-12 10:53:27.060', 2)
GO

CREATE OR ALTER VIEW Vw_EmployeeView
AS
	SELECT ID, NAME, Gender, DOB from Employee

select * from Vw_EmployeeView

UPDATE Vw_EmployeeView set Name = ''
--Temparary tables will not be used for views
--Whatever the columns that exists in view only columns we can update

--views are two types
-- 1. Simple View (Simple select query with one table)
-- 2. Complex view (View contains multiple tables sigle table with multiple operations)