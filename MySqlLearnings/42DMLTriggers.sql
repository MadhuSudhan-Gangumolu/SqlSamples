--Triggers are used invoke the logic when we do any operation on the table
CREATE TABLE Computer (ID int, Name varchar(10))

CREATE OR ALTER Trigger T_Computer
ON dbo.computer
FOR INSERT
AS
	print 'we cannot insert the data'
	ROLLBACK Transaction

insert into Computer(Id, Name) Values(1, '')


--The transaction will be opened on the table and we call access the same transaction in Trigger

CREATE OR ALTER Trigger T_Computer1
ON dbo.computer
FOR INSERT, Update, Delete
AS
	print 'we cannot update/insert the data'
	ROLLBACK Transaction

	delete from computer
