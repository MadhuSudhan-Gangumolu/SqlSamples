--The  right outer join also will also return the matching records along 
--with that it will also return the non matched records of a right  side
select * from Employer e
right outer join Projects p on p.EmployerId = e.Id

--instead of using left outer join we can use left join
select * from Employer e
right join Projects p on p.EmployerId = e.Id


--get non matched records of right side

select * from Employer e
right join Projects p on p.EmployerId = e.Id 
where p.EmployerId is null