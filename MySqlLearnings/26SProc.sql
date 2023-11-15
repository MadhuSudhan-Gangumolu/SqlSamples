--stored procedures is pre compiled database object
--let say if we want to execute any sql queries the sql engine will do three tasks
--Syntax checking
--Generate the execution plan and store it into the catche
--Execute the query
--but for the stored procedue the first two steps will initial phase of the creation later it will get the execution plan from catche and execute that query


---Creation of stored Procedure

CREATE PROCEDURE GetNextDate
AS
BEGIN
	select DATEADD(day, 1, GETUTCDATE())
END

--To execute 
EXEC GetNextDate

--or

EXECUTE GetNextDate

--or 

GetNextDate

--The content before AS is called SP Header
-- After AS will be body of SP

--SP With Parameters

CREATE OR ALTER PROCEDURE PrintName(
@name nvarchar(30))
AS
BEGIN
	PRINT @name
END

EXEC PrintName @name = 'Sample'

--SP With default parameters

CREATE OR ALTER PROCEDURE PrintNameWithCheck(
@name nvarchar(30),
@canDisplay bit = 0)
AS
BEGIN
	if (@canDisplay = 1)
	BEGIN
		PRINT @name
	END
	ELSE
		PRINT 'CAN NOT DISPLAY'
END

EXEC PrintNameWithCheck @name = 'Sample'

--output or out keyword is used to fill the value in the stored procedure

CREATE OR ALTER PROCEDURE SUM_Out (
@value1 int,
@value2 int,
@result int out)
AS 
BEGIN
	set @result = @value1 + @value2
END

DECLARE @res int

EXEC SUM_Out 10, 20, @res out

print @res

