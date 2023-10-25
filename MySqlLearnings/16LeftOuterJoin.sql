--The leftouter join also will also return the matching records along 
--with that it will also return the matched records of a pertucular side
select * from Employer e
left outer join Projects p on p.EmployerId = e.Id

--instead of using left outer join we can use left join
select * from Employer e
left join Projects p on p.EmployerId = e.Id