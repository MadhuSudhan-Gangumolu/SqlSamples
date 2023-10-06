use MYSQL

---we can not add identity constraint to the existing colum
--- instead of that we can create new column with the identity constraint

--- Adding identity constraint column

CREATE TABLE STUDENT (ID INT ,
NAME NVARCHAR(50) NOT NULL)

Alter table STUDENT alter column id int identity(1,1)  --- this will throw error

alter table student add IdentityId int identity(1,1)


---- how to turn on identity insert in the database
SET Identity_Insert studnet ON

---- how to turn off identity insert in the database
SET Identity_Insert studnet OFF

-----How to Reset the Identity Column Value in SQL Server?

DBCC CHECKIDENT(student, RESEED, 30)

