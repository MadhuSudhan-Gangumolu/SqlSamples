--similar to the SPROC and functions views also have the options to encrypt and schemabinding options

-- With Check OPtion
-- by using views the user can do the DML Operations
-- letsay we have a view with the select query along with the where condition
-- Eventhough it contains where condition the view is able to insert the data into the table
select * from Employees

CREATE OR ALTER VIEW CHECKOption
AS
	SElect * from Employees
	where Id=9

select * from CHECKOption

insert into CHECKOption(ID, Name, Department, Salary) values(12, 'Jhon', 'IT', 50000)

CREATE OR ALTER VIEW CHECKOption
AS
	SElect * from Employees
	where Id=9
WITH Check OPtion

insert into CHECKOption(ID, Name, Department, Salary) values(13, 'Jhon', 'IT', 50000)

--With Encryption Option
-- all the view test can be seen with the sp to avoid this we can use with Encryption Option

CREATE OR ALTER VIEW CHECKOption
WITH Encryption
AS
	SElect * from Employees
	where Id=9
WITH Check OPtion

EXEC sp_helptext CHECKOption

-- With Schema Binding
-- By using this option we can restrict the table drop of reference tables in view

CREATE OR ALTER VIEW CHECKOption
WITH SCHEMABinding, Encryption
AS
	SElect Name from dbo.Employees
	where Id=9
WITH Check OPtion

drop table dbo.Employees