--Row number which is used to provide the sequential number to the partion
-- The row number starts with 1 and it will increament
-- let say we  have 4 records that will be single partion the row numbers will be like this 1,2,3,4
--For the RowNumber partion is option but order by is mandatory

--for the demo will create a table
CREATE TABLE Employees
(
     ID INT,
     Name VARCHAR(50),
     Department VARCHAR(50),
     Salary int
)
Go

INSERT INTO Employees Values (1, 'James', 'IT', 15000)
INSERT INTO Employees Values (2, 'Smith', 'IT', 35000)
INSERT INTO Employees Values (3, 'Rasol', 'HR', 15000)
INSERT INTO Employees Values (4, 'Rakesh', 'Payroll', 35000)
INSERT INTO Employees Values (5, 'Pam', 'IT', 42000)
INSERT INTO Employees Values (6, 'Stokes', 'HR', 15000)
INSERT INTO Employees Values (7, 'Taylor', 'HR', 67000)
INSERT INTO Employees Values (8, 'Preety', 'Payroll', 67000)
INSERT INTO Employees Values (9, 'Priyanka', 'Payroll', 55000)
INSERT INTO Employees Values (10, 'Anurag', 'Payroll', 15000)
INSERT INTO Employees Values (11, 'Marshal', 'HR', 55000)
INSERT INTO Employees Values (12, 'David', 'IT', 96000)

--Row number without Partion by, then will be considered as a result set as single partion
select *, ROW_NUMBER() OVER (ORDER BY Salary) as ROW from Employees
--Row Number with out Order by will throw an error, the error is The function 'ROW_NUMBER' must have an OVER clause with ORDER BY.
select *, ROW_NUMBER() OVER () as ROW from Employees
--Row Number with order by and Partion BY
select *, ROW_NUMBER() OVER (Partition By Department ORDER BY Salary) as ROW from Employees

--Realtime sesanio, Generally will be used used to remove the duplicate records from the result set
--For this purpose i will truncate the existing table and re insert with the duplicate data

truncate table Employees

INSERT INTO Employees Values (1, 'James', 'IT', 15000)
INSERT INTO Employees Values (1, 'James', 'IT', 15000)
INSERT INTO Employees Values (2, 'Rasol', 'HR', 15000)
INSERT INTO Employees Values (2, 'Rasol', 'HR', 15000)
INSERT INTO Employees Values (2, 'Rasol', 'HR', 15000)
INSERT INTO Employees Values (3, 'Stokes', 'HR', 15000)
INSERT INTO Employees Values (3, 'Stokes', 'HR', 15000)
INSERT INTO Employees Values (3, 'Stokes', 'HR', 15000)
INSERT INTO Employees Values (3, 'Stokes', 'HR', 15000)

;WITH Temp AS(
	select Id, Name, Salary, ROW_NUMBER() OVER (Partition By Name ORDER BY Salary) as ROW from Employees
)
UPDATE TEMP set Name = 'Data' where ROW > 1

select * from Employees
--NOTE: If we update the CTE with out joins it will impact the actual table
--Inorder to understand this, let's consider one of the differences between temp tables and CTE.
--When we use Temporary tables, this temp table will be saved in a Tempdb database. So, it is just a copy of your table tblEmployee. No matter what changes you make to temp table, it won't affect tblEmployee.
--But, when you use cte, it is actually pointing to the same table itself. That is why, if you delete from cte, it will affect tblEmployee also. CTE is nothing but a disposable view.
