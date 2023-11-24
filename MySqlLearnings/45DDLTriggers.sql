--In the DDL Trigger we can trigger even when there is a change in the database'
--In DDL Triggers we only use For Statement and we will not use Instead Of
-- DDL triggers are two types
--1. Database Scoped Trigger
--2. Server Scoped Trigger


--Database Scoped Trigger

CREATE OR ALTER TRIGGER T1
ON DATABASE
FOR DROP_TABLE -- we can also use Alter_Table, DROP_Table
AS
	print 'We can not drop a Table'
	ROLLBACK TRANSACTION

drop table Department

--Server Scoped Trigger
CREATE OR ALTER Trigger T2
ON ALL SERVER
FOR DROP_TABLE
AS
	print 'We can not drop a Table'
	ROLLBACK TRANSACTION

drop table REF.planType
