---Union

CREATE TABLE EmployeeIndia
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(50)
)
GO
INSERT INTO EmployeeIndia VALUES(1, 'Pranaya', 'Male','IT')
INSERT INTO EmployeeIndia VALUES(2, 'Priyanka', 'Female','IT')
INSERT INTO EmployeeIndia VALUES(3, 'Preety', 'Female','HR')
INSERT INTO EmployeeIndia VALUES(4, 'Subrat', 'Male','HR')
INSERT INTO EmployeeIndia VALUES(5, 'Anurag', 'Male','IT')
INSERT INTO EmployeeIndia VALUES(6, 'Anurag', 'Male','IT')
GO
CREATE TABLE EmployeeUK
(
  ID INT PRIMARY KEY,
  Name VARCHAR(50),
  Gender VARCHAR(10),
  Department VARCHAR(50)
)
GO
INSERT INTO EmployeeUK VALUES(1, 'James', 'Male','IT')
INSERT INTO EmployeeUK VALUES(2, 'Priyanka', 'Female','IT')
INSERT INTO EmployeeUK VALUES(3, 'Sara', 'Female','HR')
INSERT INTO EmployeeUK VALUES(4, 'Subrat', 'Male','HR')
INSERT INTO EmployeeUK VALUES(5, 'Pam', 'Female','HR')


--union with out duplicates
select Id from EmployeeIndia
UNION 
select ID from EmployeeUK

--union all with  duplicates
select Id from EmployeeIndia
UNION ALL
select ID from EmployeeUK

---INTERSECT SAmple
select Id from EmployeeIndia
INTERSECT
select ID from EmployeeUK

---EXCEPT SAmple
select Id from EmployeeIndia
EXCEPT
select ID from EmployeeUK