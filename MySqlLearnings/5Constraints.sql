use MYSQL

CREATE TABLE STUDENT (ID INT ,
NAME NVARCHAR(50) NOT NULL)



---Default constraint
alter table student add constraint defaultName	default 'Hello' for Name

---Unique constraint
alter table student add constraint uniqueConstraint unique(name)

---Check constraint
alter table student add constraint CheckConstraint Check(id > 0)

---Primary key constraint
alter table student alter column id int not null
alter table student add constraint PK_Primary primary key (id)

---Creating child table
create table course (id int not null, name nvarchar(50))
alter table Course add constraint PK primary key(Id)


---adding reference to the student to course
alter table student add courseId int null
alter table student add constraint FK_Student_Course foreign key(courseId)
references Course(Id)