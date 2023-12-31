USE MYSQLSAMPLE
--DDL MEANS DATA DEFINITION LANGUAGE it will change structure of the table
-- Five comands to be used in the DDL those are CREATE, ALTER, SP_RENAME, TRUNCATE, DROP

---ALTER-ALTER COLUMN
	------Change the width of a column
ALTER TABLE STUDENT ALTER COLUMN NAME NVARCHAR(100)
	-----Changing the data type of an existing column
ALTER TABLE STUDENT ADD GENDER VARCHAR(10)
ALTER TABLE STUDENT ALTER COLUMN GENDER CHAR(10)

	----- CHANGING NULL TO NOT NULL
ALTER TABLE STUDENT ALTER COLUMN GENDER CHAR(10) NOT NULL

	------ DROPING COLUMN
ALTER TABLE STUDENT DROP COLUMN GENDER

	----RENAME THE TABLE
EXEC sp_rename STUDENT, STUDENT1


	--- TRUNCATE TABLE
TRUNCATE TABLE [DTO].STUDENT

	---DROP TABLE
DROP TABLE [DTO].STUDENT
