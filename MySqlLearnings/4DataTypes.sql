USE MYSQLSAMPLE
---Interger
Declare @IntegerColumn INT
set @IntegerColumn= 1

print @IntegerColumn


---decimal datatype
Declare @DecimmalDataType decimal(2,1)
declare @NumericType Numeric(10,4)
set @DecimmalDataType= 1.24567
set @NumericType= 1.24567

print @DecimmalDataType
print @NumericType

--- money datatype
Declare @MoneyType Money
set @MoneyType=10.788638336
print @MoneyType  -- 10.79

--- binary datatype
Declare @binaryDatatype bit
set @binaryDatatype=1
print @binaryDatatype  -- 1

--- datetime type
Declare @DateTimeType DateTime
set @DateTimeType=GETUTCDATE()
print @DateTimeType 

--- time type
Declare @TimeType Time
set @TimeType=GETUTCDATE()
print @TimeType 

---Date type
Declare @DateType Date
set @DateType=GETUTCDATE()
print @DateType 

---varchar type
Declare @varcharType varchar(max)
set @varcharType='hello'
print @varcharType 

---unique identifier
Declare @GuidType uniqueIdentifier
set @GuidType= NEWID()
print @GuidType 