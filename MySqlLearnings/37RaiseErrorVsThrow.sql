--with system function we can raise the exception
--RaiseError will not stop the exection whereas throw it will stop execution
--syn of RaiseError -> RaiseError(ErrorMessage/ErrorNumber, Serviority, State)

CREATE OR ALTER PROCEDURE #SAMPLE
AS
DECLARE @Result int
RAISERROR('DIVISON', 16, 1)
set @Result = 10/0

print @Result

#SAMPLE

CREATE OR ALTER PROCEDURE #SAMPLE1
AS
DECLARE @Result int


set @Result = 10/0
if (1 = 1)
BEGIN

	THROW 50001,'DIVISOR CANNOT BE ONE', 1 -- throw should be in a consition
END
print @Result

#SAMPLE1