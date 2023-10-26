--for retriving the data sql use two approaches 
--1. Table scan
--2. Index Scan
--Table scan means it will fetch the each and every record
--index scan will use the b-tree sturucture to fetch
--one table we can have 1000 indexs(1 clusture, 999 non-clusture index)
--If the table contains primary key then it having clusture index by default
--Clusture index will will be stored with in the table


--creating table 
create table IndexSample(Id int, name Nvarchar(200))

create CLUSTERED INDEX IX_IndexSample_Id on Indexsample(Id asc)