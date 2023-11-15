--in this we can return table as result


--first we can fill the data
-- Create Student Table
CREATE TABLE Student
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(50),
  DOB DATETIME,
  Branch VARCHAR(50)
)
-- Populate the Student Table with test data
INSERT INTO Student VALUES(1, 'Pranaya', 'Male','1996-02-29 10:53:27.060', 'CSE')
INSERT INTO Student VALUES(2, 'Priyanka', 'Female','1995-05-25 10:53:27.060', 'CSE')
INSERT INTO Student VALUES(3, 'Anurag', 'Male','1995-04-19 10:53:27.060', 'ETC')
INSERT INTO Student VALUES(4, 'Preety', 'Female','1996-03-17 10:53:27.060', 'ETC')
INSERT INTO Student VALUES(5, 'Sambit', 'Male','1997-01-15 10:53:27.060', 'CSE')


CREATE OR ALTER FUNCTION GetStudent(@id int)
RETURNS Table
AS
	RETURN (select * from Student where id = @id)

select * from  dbo.GetStudent(5)

