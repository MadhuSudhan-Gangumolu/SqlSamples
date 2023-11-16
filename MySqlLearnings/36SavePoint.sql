--By using savepoint we can add a savepoint to split the task
BEGIN TRANSACTION T1
	SAVE TRANSACTION ST1
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(3, 'T1', 'ACT')
	SAVE TRANSACTION ST2
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(4, 'T1', 'ACT')
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(5, 'T2', 'ACT')
	SAVE TRANSACTION ST3
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(6, 'T2', 'ACT')
	
	ROLLBACK TRANSACTION ST3

	select * from Customer

-- with the above statement records 3, 4, 5 will be saved into the table beacause it insert the data after the savepoint and before commit


--save Transaction with same name
truncate table Customer
BEGIN TRANSACTION T1
	SAVE TRANSACTION ST1
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(3, 'T1', 'ACT')
	SAVE TRANSACTION ST1
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(4, 'T1', 'ACT')
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(5, 'T2', 'ACT')
	SAVE TRANSACTION ST3
	INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(6, 'T2', 'ACT')
	
	ROLLBACK TRANSACTION ST1

	select * from Customer

--if it contains the same name then sql will consider the last transaction


