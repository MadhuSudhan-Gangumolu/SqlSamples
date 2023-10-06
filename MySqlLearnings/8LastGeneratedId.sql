use MYSQL

--- how to get last inserted identity value
insert into student(ID, Name) values (1, 'Madhu')

select @@Identity

---we have three options avaliable to get the identity value
---@@Identity
---SCOPE_IDENTITY()
---IDENT_CURRENT(‘TableName’)

---Definition
---The SCOPE_IDENTITY() returns the last identity value that is created in the same session (Connection) and in the same scope (in the same Stored procedure, function, trigger). Let’s say, I have 2 tables Person1 and Person2 and I have a trigger on the Person1 table, which will insert a record into the Person2 table.
---Now, when we insert a record into the Person1 table, SCOPE_IDENTITY() returns the identity value that is generated in the Person1 table, whereas @@IDENTITY returns, the value that is generated in the Person2 table.
---So @@IDENTITY returns the last identity value that is created in the same session without any consideration to the scope. The IDENT_CURRENT(‘Person’) returns the last identity value created for a specific table across any session and any scope.


