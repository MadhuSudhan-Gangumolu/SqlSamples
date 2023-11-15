--In the stored procedure if it executed successfully it will return 0 otherwise it will return non zero value

CREATE OR ALTER PROCEDURE PROC1(
	@canError bit
)
AS
BEGIN
	if (@canError = 1)
	BEGIN
		THROW 60000, 'Error', 1;
	END
	else
		PRINT 'TEST'
END

DECLARE @result int
SET @result = 22
EXEC @result =  PROC1 0
print @result

--return value without using out keyword

CREATE OR ALTER PROCEDURE PROC2
AS
	RETURN (3)

DECLARE @result int
EXEC  @result =  PROC2
print @result

--The return statement will only return numeric values it will not return string values for that we can use out variables


