--- assignment operators are used to assign the values to variables
Declare @Var1 int
set @Var1 = 1
select @Var1

---assignment in the select query
Declare @var2 int, @var3 int
select @var2 = 10, @var3 = 40

select @var2, @var3


---Compound operators

Declare @num int
set @num = 10
set @num += 20;
select @num