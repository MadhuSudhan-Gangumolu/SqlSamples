-- in sql server we can create a computed column
create table ComputedTableTemp (Id int, StartDate DateTime, EndDate DateTime, IsActive as CONVERT(
																									BIT, 
																										case 
																											When (StartDate <= GetUtcDate() AND (EndDate is null or EndDate >= getutcdate())) then 1
																											when StartDate > GetUtcDate() or EndDate <= getutcdate() then 0
																											ELSE 0 
																										END))


insert into ComputedTableTemp (Id, StartDate, EndDate) Values
(1, DATEADD(day, -20, GETUTCDATE()), null),
(2, DATEADD(day, -20, GETUTCDATE()),  DATEADD(day, -10, GETUTCDATE())),
(3, DATEADD(day, 20, GETUTCDATE()), null),
(4, DATEADD(day, 20, GETUTCDATE()), DATEADD(day, 20, GETUTCDATE()))

select * from ComputedTableTemp

update ComputedTableTemp set StartDate = GETUTCDATE() where Id=3

