--Transactions are basically used to maintain the data efficiency
--In sql server by default all the statements are auto committed this will lead the concurancey of data
--With the transaction all the statments will be considered as a single unit and it will not be auto committed
--In the transaction  we have these commands
--BEGIN TRANSACTION [Transaction Name]
--COMMIT TRANSACTION [TransactionName]
--ROLLBACK TRANSACTION [Transaction Name]
--SAVE TRANSACTION [Transaction Name]

--For the example we will create sample table
CREATE TABLE #TRANSACTIONTABLE(ID int IDENTITY(1,1), Name varchar(30), Age int)

--Commit the transaction
BEGIN TRANSACTION T1
	INSERT INTO #TRANSACTIONTABLE(Name, Age) Values('T1', 10)
COMMIT TRANSACTION T1

-- ROLLBACK THe Transaction
BEGIN TRANSACTION T1
	Update #TRANSACTIONTABLE set Name= 'TEST' 
ROLLBACK TRANSACTION T1

select * from #TRANSACTIONTABLE

