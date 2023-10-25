--The  full outer join also will also return the matching records along 
--with that it will also return the non matched records of a both  side
select * from Employer e
full outer join Projects p on p.EmployerId = e.Id

--instead of using left outer join we can use left join
select * from Employer e
full join Projects p on p.EmployerId = e.Id
