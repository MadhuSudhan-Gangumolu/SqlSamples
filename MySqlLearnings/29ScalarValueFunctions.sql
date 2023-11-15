--we can create the function in sql server
--the syntax also very similar to the sproc
--in edition the function should have the return type


CREATE OR ALTER FUNCTION Cube(@value int)
RETURNS INT -- is required
AS 
BEGIN
	RETURN @value * @value * @Value
END

select dbo.Cube(10) --Schema is mandatory

--function with defaultValue

CREATE OR ALTER FUNCTION DefaultMethos(@value int = 20)
RETURNS INT -- is required
AS 
BEGIN
	RETURN @value * @value * @Value
END

select dbo.DefaultMethos(default)

--The main difference b/w the SProc and functions are we can use functions in where and select clause but sproc we cannot use.
