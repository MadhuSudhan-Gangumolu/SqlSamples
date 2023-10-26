--Non clustured is also another kind of index
--In the clustured index data sorting will be done in with in the table
--In the non clustured index the index will be mainiatined in the seperated table
--In a single table we can create 999 non clustured index
--Clustured Index is faster then non clustured index

--creating non clustured index

create NONCLUSTERED Index IX_NonCLUS_Sample on Employer(Id asc) 
INCLUDE ([name], [salary])

--include keyword will be used to include the columns in the leaf node
