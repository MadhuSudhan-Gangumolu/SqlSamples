----Having is basically used to filter arrgegate records
select Gender from Employee group by Gender having gender = 'Male'

---combination where and having in the query
select Age, sum(Salary), gender from employee where Gender='Male' group by Age, gender having age >25