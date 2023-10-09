---Parameters or Arguments used in Select Statement in SQL Server:
---ALL: It is optional. when we use ALL then the Select query will return all the matching rows from the table.
---DISTINCT: It is optional. If you want to remove the duplicate rows from the result set then you need to use the DISTINCT keyword in the Select query. We will discuss the DISTINCT keyword in detail in our upcoming articles
---TOP (top_value): It is optional. If the TOP Clause is specified in the Select query, then it will return the top number of rows in the result set based on top_value.

----Select all properties
select * from Student


----Select only perticular columns
select Name from Student

----Select distinct records from the table
select distinct * from Student

----select top record
select top 1 * from Student

--- select top records with percentage
select top 4  percent * from Student order by tempId

----select the records with ties
----with ties is nothing but based on the top selected values by ordering and if the lase records contains the tiles record then it will also display that record
--- let say we have 4 records in table
/*ID		Name	Reg
	1		a		10
	2		b		10
	3		c		20
	4		d		10

if i select top 2 record order by reg then the query like the below
select top 2 * from table order by Reg
ID		Name	Reg
1		a		10
2		b		10

what if we add with ties in the query then the records willl be 3, because there is an additional record that having reg 10 then the result and query will ve
ID		Name	Reg
1		a		10
2		b		10
4		d		10

select top 2  with ties * from table order by Reg*/

----order the records based on the column
select * from Student order by Id desc

---sort data with relative position

select Id, Name, IdentityId, TempId from Student order by 2 --- 2 means name

---how to use both desc and asc in single query
select * from Student order by TempId asc, IdentityId desc


----skip few records from the table
select * from Student order by TempId offset 2 rows


---- take few records after the skip
select * from Student order by TempId offset 2 rows fetch next 3 rows only