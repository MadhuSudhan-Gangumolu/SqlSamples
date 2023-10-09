use MYSQL
---Sequence Object in SQL Server with Examples
---A sequence is an object in SQL Server that is used to generate a number sequence. This can be useful when we need to create a unique number to act as a primary key. 

--- creating sequences
create sequence MySequence as

	bigint
	start with 1
	increment by 1
	minvalue 1
	maxvalue 20

---Properties of Sequence Object:
/*user-defined integer type. The default is bigint.
	START WITH: The Start With Value is nothing but the first value that is going to be returned by the sequence object
	INCREMENT BY: The Increment by value is nothing but the value to increment or decrement by the sequence object for each row. If you specify a negative value then the value is going to be decrement.
	MINVALUE: It specifies the value for the sequence object
	NO MINVALUE: It specifies that there is no minimum value specified for the given sequence object.
	MAXVALUE: Maximum value for the sequence object
	NO MAXVALUE: It means that there is no maximum value specified for the sequence.
	CYCLE: It specifies that reset the sequence object when the Sequence Object reached the maximum or minimum value. 
	NO CYCLE: When you specify the No Cycle option, then it will throw an error when the Sequence Object reached its maximum or minimum value.
	CACHE: Cache sequence values for performance. The default value is CACHE.
	NO CACHE: As the name says, if you specify the NO CACHE option then it will not cache the sequence numbers.

Note: If you have not specified either Cycle or No Cycle then the default is No Cycle in SQL Server.
*/

---How to Generate the Next Sequence Value in SQL Server?
select NEXT VALUE FOR MySequence

---How to Retrieving the current sequence value in SQL Server?
SELECT * FROM sys.sequences WHERE name = 'MySequence'

ALTER SEQUENCE MySequence RESTART WITH 1

--Associate Sequence object to a table
create table SequenceTable
(id int not null default (NEXT VALUE FOR MySequence)

