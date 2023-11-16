--We can write the nested transactions

select * from customer

BEGIN TRANSACTION T1
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(3, 'T1', 'ACT')
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(4, 'T1', 'ACT')
	BEGIN TRANSACTION T2
		INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(5, 'T2', 'ACT')
		INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(6, 'T2', 'ACT')
		COMMIT TRANSACTION T2
	ROLLBACK TRANSACTION T1
-- from the above example we can i have commited transaction t1 and rollback the Transaction T1, T1 is base transaction, child transactions are partially committed until the base transaction commits
--We can get the number of transaction using global variable @@TranCount

BEGIN TRANSACTION T1
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(3, 'T1', 'ACT')
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(4, 'T1', 'ACT')
	BEGIN TRANSACTION T2
		INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(5, 'T2', 'ACT')
		INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(6, 'T2', 'ACT')
		PRINT @@TranCount
		COMMIT TRANSACTION T2
		PRINT @@TranCount
	ROLLBACK TRANSACTION T1
PRINT @@TranCount

