--As same way we can encrypt the function test by using with encryption

CREATE OR ALTER FUNCTION SAMPLEENC(@id int)
RETURNS TABLE
WITH ENCRYPTION
AS
	RETURN (SELECT * FROM STUDENT)

--in some time if the dependent table deleted then the entire function will give you an error
-- To avoid this we can use WITH SCHEMABINDING claues
CREATE FUNCTION SAMPLESCHA()
RETURNS TABLE
WITH SCHEMABINDING
AS
	RETURN (SELECT ID, Name FROM dbo.STUDENT)

-- we can use both schema binding and encryption
CREATE FUNCTION SAMPLESCH()
RETURNS TABLE
WITH SCHEMABINDING, ENCRYPTION
AS
	RETURN (SELECT ID, Name FROM dbo.STUDENT)