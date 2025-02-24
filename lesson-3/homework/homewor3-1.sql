Create database Lesson3
go
Use Lesson3
go
Create table F(Fullname varchar(50),
address varchar(50) default 'Tashkent')
insert into F values ('Nico Hawn', 'Madrid')
insert into F values (' Kevin Levrone', 'New-York')
insert into F values ('Jennifer Aniston', null)
insert into F values ('Kelly', '')
 SELECT * from F
 
 
 
 create trigger ForF on F
 after insert as 
 begin
 Update F
 set address = 'Tashkent'
 where address is null or address = ''
 end