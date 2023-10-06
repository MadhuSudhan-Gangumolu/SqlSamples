use MYSQL

---Set NULL integrity
--- this will set the reference child table value to null

alter table student add constraint FK_Student_Course foreign key(courseId)
references Course(Id)
on delete set NULL
on update set NULL


---set Default
--- this will set the reference child table value to default value
alter table student add constraint FK_Student_Course foreign key(courseId)
references Course(Id)
on delete set default
on update set default

---Cascade
---this will delete the child table row when the parent table row is deleted
alter table student add constraint FK_Student_Course foreign key(courseId)
references Course(Id)
on delete cascade
on update cascade


---No Action
---this will throw error when we try to delete the parent table record without removing the child records
alter table student add constraint FK_Student_Course foreign key(courseId)
references Course(Id)
on delete no action
on update no action