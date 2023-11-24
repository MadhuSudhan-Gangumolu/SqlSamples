--We can create indexes in view
--When we create the indexes for view instead of hitting the direct table it will hit the Virtual table this will lead lot of time and improves the performance

--Table with out index
-- Create table Product
CREATE TABLE Product
(
  ProductId INT PRIMARY KEY,
  Name VARCHAR(20),
  UnitPrice INT
)
GO
-- Populate Product table with some test data
INSERT INTO Product VALUES(1, 'Books', 40)
INSERT INTO Product VALUES(2, 'Pens', 30)
INSERT INTO Product VALUES(3, 'Pencils', 10)
GO
-- Create table ProductSales
CREATE TABLE ProductSales
(
  ProductId INT,
  QuantitySold INT
)
GO

INSERT INTO ProductSales VALUES(1, 10)
INSERT INTO ProductSales VALUES(3, 23)
INSERT INTO ProductSales VALUES(3, 21)
INSERT INTO ProductSales VALUES(2, 12)
INSERT INTO ProductSales VALUES(1, 13)
INSERT INTO ProductSales VALUES(3, 12)
INSERT INTO ProductSales VALUES(2, 13)
INSERT INTO ProductSales VALUES(1, 11)
INSERT INTO ProductSales VALUES(2, 12)
INSERT INTO ProductSales VALUES(1, 14) 

CREATE VIEW vwTotalSalesPriceByProduct
WITH SCHEMABINDING
AS
SELECT Name, 
  COUNT_BIG(*) AS TotalTransactions,
  SUM(ISNULL((QuantitySold * UnitPrice), 0)) AS TotalSalesPrice  
FROM dbo.ProductSales prdSales
INNER JOIN dbo.Product prd
ON prd.ProductId = prdSales.ProductId
GROUP BY Name

select * from vwTotalSalesPriceByProduct

--Rules for creating an Index view in SQL Server:
--The view should be created with the SCHEMABINDING option
--If an Aggregate function is used in the SELECT LIST which references an expression, and if there is a possibility for that expression to become NULL, then, a replacement value should be specified. In this example, we are using ISNULL() function, to replace NULL values with ZERO with the expression SUM(ISNULL((QuantitySold * UnitPrice), 0)) AS TotalSalesPrice
--If the GROUP BY clause is specified, then the view select list must contain a COUNT_BIG(*) expression
--The base tables in the view should be referenced with 2 part name. In this example, Product and ProductSales are referenced using dbo.Product and dbo.ProductSales respectively.

CREATE UNIQUE CLUSTERED INDEX IX_vwTotalSalesPriceByProduct on vwTotalSalesPriceByProduct(Name)

-- to see the log time
SET STATISTICS IO ON;
select * from vwTotalSalesPriceByProduct

