--Transactions are basically three types
--1. Auto Commit Transaction
--2. Implicit Transaction
--3. Explict Transaction

--Auto Commit Transaction
--In SQL For each and every statement sql will create a transaction and commit/rollbacktransaction
--For Demo will create a new table

CREATE TABLE Customer
(
    CustomerID INT PRIMARY KEY,
    CustomerCode VARCHAR(10),
    CustomerName VARCHAR(50)
)

INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(1, 'A1', 'ACT')

select * from Customer

--Implict transaction
-- with the implicit transaction we can avoid the auto commit transaction
-- For this purpose we need to turn ON/OFF the implicit Transaction

SET IMPLICIT_TRANSACTIONS ON
INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(2, 'A1', 'ACT')

ROLLBACK TRANSACTION

SET IMPLICIT_TRANSACTIONS OFF

--Last one is explicit transactions
-- with this we will have the control on the transaction
BEGIN TRANSACTION T1
INSERT INTO Customer (CustomerID, CustomerCode, CustomerName) Values(2, 'A1', 'ACT')
COMMIT TRANSACTION T1

--@@ERROR is used to identify that statment contains any exception


