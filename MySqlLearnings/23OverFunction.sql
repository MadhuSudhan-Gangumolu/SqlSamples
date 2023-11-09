--Over is another built in function, this will be used along with the Partion BY function
--Over will be used to work with the Aggregates
--First will populate the data for our example

CREATE TABLE Employees
(
     ID INT,
     Name VARCHAR(50),
     Department VARCHAR(50),
     Salary int
)
Go

INSERT INTO Employees Values (1, 'James', 'IT', 15000)
INSERT INTO Employees Values (2, 'Smith', 'IT', 35000)
INSERT INTO Employees Values (3, 'Rasol', 'HR', 15000)
INSERT INTO Employees Values (4, 'Rakesh', 'Payroll', 35000)
INSERT INTO Employees Values (5, 'Pam', 'IT', 42000)
INSERT INTO Employees Values (6, 'Stokes', 'HR', 15000)
INSERT INTO Employees Values (7, 'Taylor', 'HR', 67000)
INSERT INTO Employees Values (8, 'Preety', 'Payroll', 67000)
INSERT INTO Employees Values (9, 'Priyanka', 'Payroll', 55000)
INSERT INTO Employees Values (10, 'Anurag', 'Payroll', 15000)
INSERT INTO Employees Values (11, 'Marshal', 'HR', 55000)
INSERT INTO Employees Values (12, 'David', 'IT', 96000)

-- Now We need to generate a report to display the total number of employees department-wise. 
--Along with this we also need to display the Total Salary, Average Salary, Minimum Salary, and Maximum Salary department wise


--This can be done by using Group By
select Department, count(*) as Count, Sum(Salary) as TotalSalary,
AVG(Salary) as AverageSalary, MIN(Salary) as MinimumSalary, MAX(Salary) as MaximumSalary from Employees
GROUP BY Department

---Now we need to get the employer names as well, go get that we will add name in the group by
select Department, Name, count(*) as Count, Sum(Salary) as TotalSalary,
AVG(Salary) as AverageSalary, MIN(Salary) as MinimumSalary, MAX(Salary) as MaximumSalary from Employees
GROUP BY Department, Name

--This will return the result but it is wrong, instead of grouping the records by department it will group by name as well, will result count as 1
-- To resolve this we can use Over partition by
--syntax
-- Function [Over (Partion BY, order by )]
select Department, 
Name, 
count(*)  OVER(PARTITION BY Department) as Count, 
Sum(Salary) OVER(PARTITION BY Department) as TotalSalary,
AVG(Salary) OVER(PARTITION BY Department) as AverageSalary, 
MIN(Salary) OVER(PARTITION BY Department) as MinimumSalary, 
MAX(Salary) OVER(PARTITION BY Department) as MaximumSalary 
from Employees

--with the over we can select both aggregate and non aggregate values in a single query
--Partion BY we can remember it as Group BY in Column not in the entire query



