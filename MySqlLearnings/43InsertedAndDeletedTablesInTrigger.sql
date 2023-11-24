--All the newly added data and deleted data that can be accessed by the two tables 1. Inserted, 2. Deleted
--For the update operation Inserted table contains updated data, deleted table contains the old data

CREATE TABLE StaffDetails (Id int Primary Key Identity(1,1), Name varchar(Max), Age int, Dob DateTime)
CREATE TABLE StaffDetailHistory (Id int Primary Key Identity(1,1), StaffDetailId int, State int, OldData nvarchar(Max), NewData nvarchar(Max), ChangeDate DateTime)

--Creating trigger for both update and insert
CREATE OR ALTER Trigger T_StaffInsert
On dbo.StaffDetails
AFTER Insert, Update, Delete -- we can also use --For Insert, Update, Delete
AS
	DECLARE @STATE int
	DECLARE @Json nvarchar(MAX)  
	if (EXISTS(select * from deleted ) and EXISTS(select * from inserted))
	BEGIN
		Print 'Update Called'
		DECLARE @NewJson nvarchar(Max) = (
				SELECT *  
				FROM inserted  
				FOR JSON AUTO, INCLUDE_NULL_VALUES , WITHOUT_ARRAY_WRAPPER
			)
		set @Json = (
			SELECT *  
			FROM deleted  
			FOR JSON AUTO, INCLUDE_NULL_VALUES , WITHOUT_ARRAY_WRAPPER
		);
		
		INSERT INTO StaffDetailHistory (StaffDetailId, State, OldData, NewData, ChangeDate)
		select Id, 2, @Json, @NewJson, GETUTCDATE() from inserted
	END
	ELSE IF NOT EXISTS (select Id from inserted)
	BEGIN
		Print 'delete Called'
		DECLARE @Id int = (SELECT ID FROM deleted)
	set @Json = (
			SELECT *  
			FROM deleted  
			FOR JSON AUTO ,INCLUDE_NULL_VALUES , WITHOUT_ARRAY_WRAPPER
		);
			INSERT INTO StaffDetailHistory (StaffDetailId, State, OldData, NewData, ChangeDate)
			Values(@Id, 3, @Json, '', GETUTCDATE())
		

	END
	ELSE
	BEGIN
		Print 'insert Called'
		set @Json = (
			SELECT *  
			FROM inserted  
			FOR JSON AUTO, INCLUDE_NULL_VALUES , WITHOUT_ARRAY_WRAPPER
		);
		INSERT INTO StaffDetailHistory (StaffDetailId, State, OldData, NewData, ChangeDate)
		select Id, 1, '', @Json, GETUTCDATE() from inserted
	END
	


INSERT INTO StaffDetails (Name, Age, DOB) values(null, 50, DATEADD(day, -3000, GetDate()))

select * from StaffDetailHistory 


update StaffDetails set Name = 'BanKCOCK' where Id=16

delete from StaffDetails where  Id=16
--Data conversion to json
SELECT * FROM StaffDetails WHERE id=2 FOR JSON PATH , INCLUDE_NULL_VALUES , WITHOUT_ARRAY_WRAPPER 


