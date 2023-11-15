--In this we can write more than one line of code
--we can use begin and end
--in this we need to explicitly mention the table variable
--In inline there is possibility of updating the data but in multi value it should not be updated

CREATE OR ALTER FUNCTION MULTIFUN(@id int)
RETURNS @Result Table(Id int, name nvarchar(30), branch Nvarchar(30))
AS
BEGIN
	INSERT INTO @Result (Id, Name, Branch)
	SELECT ID, NAME, Branch from Student
	REturn
END

select * from dbo.MULTIFUN(5)