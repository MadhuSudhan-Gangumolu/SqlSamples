--by using sp_HelpText we can see the help text

CREATE OR ALTER PROCEDURE SAMPLE
AS
	PRINT GETUTCDATE()

EXEC sp_helptext SAMPLE

--This information will be getting from the table syscomments

select text from SysComments where id = OBJECT_ID('SAMPLE')


-- we can restrict the user to not to see the text with the encryption

CREATE OR ALTER PROCEDURE SAMPLE1
WITH ENCRYPTION
AS
	PRINT GETUTCDATE()

select text from SysComments where id = OBJECT_ID('SAMPLE1')

EXEC sp_helptext SAMPLE1

--There is one more option is avaliable ie., WITH RECOMPILE
--With the Recompile option each every time the procedure will recompile,
--It is not a good practice to use

CREATE OR ALTER PROCEDURE SAMPLE2
WITH RECOMPILE
AS
	PRINT GETUTCDATE()



