--Rank and dense rank is also similar to the Row_Number()
--First we will discuss with the Rank
--Rank is also generate the sequential number based on the partition and order by
--One thing we need to keep in mind is if same cobination is repeted it will assign the previous number instead of generating the new number

truncate table Employees
Insert Into Employees Values (1, 'James', 'IT', 80000)
Insert Into Employees Values (2, 'Taylor', 'IT', 80000)
Insert Into Employees Values (3, 'Pamela', 'HR', 50000)
Insert Into Employees Values (4, 'Sara', 'HR', 40000)
Insert Into Employees Values (5, 'David', 'IT', 35000)
Insert Into Employees Values (6, 'Smith', 'HR', 65000)
Insert Into Employees Values (7, 'Ben', 'HR', 65000)
Insert Into Employees Values (8, 'Stokes', 'IT', 45000)
Insert Into Employees Values (9, 'Taylor', 'IT', 70000)
Insert Into Employees Values (10, 'John', 'IT', 68000)

--Rank without partition
select *, Rank() OVER(Order by DEpartment) from Employees 
--Rank without Order by 
select *, Rank() OVER() from Employees 

--from the above if the value is repeted the it will assign the same 1 value and for the next iteration it will assign rank as 3 means it will skip 2 because of duplicate data

--To solve this we need to use dense_Rank()
select *, Dense_Rank() OVER(partition by DEpartment order by Salary) as Rank from Employees


