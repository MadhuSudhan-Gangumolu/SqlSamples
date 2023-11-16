--With try catch block we can handle the exceptions in the sql

BEGIN TRY
	DECLARE @Value1 int
	DECLARE @Value2 int
	DECLARE @Result int
	SET @Value1 = 10
	SET @Value2 = 0
	SET @Result = @Value1/@Value2

	PRINT @Result
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE()
	PRINT ERROR_STATE()
END CATCH

--NOTE We can not use TRY Catch in Functions