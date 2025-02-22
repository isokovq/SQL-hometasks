create database MyFirstTask
use MyFirsttask
select * from students
Create table students (id int not null, s_name varchar(50), class int)
insert into students values (1, 'Kakhramon', 1)
create table teachers (id int not null, t_name varchar(50))
insert into teachers values (1, 'Mr.Shakhzod')
create table mentors (id int not null, m_name varchar(50))
insert into mentors values (1, 'Mr.Jobirbek')
create table student_numbers (s_name varchar(50), number int)
insert into student_numbers values ('Kakhramon', 975472909)
create table teacher_numbers (t_name varchar(50), number int)
insert into teacher_numbers values ('Mr.Shakhzod', 977777777)
create table mentor_numbers (m_name varchar(50), number int)
insert into mentor_numbers values ('Mr.Jobirbek', 939339393)
create table lessons ('days' varchar(50), l_time date)
insert into lessons (days) values ('odd_days')
create table directors (id int not null, d_name varchar(50))
insert into directors values (1, 'Mr.Sherzod')
create table admins (id int not null, a_name varchar(50))
insert into admins values (1, 'Mr.Alijon')
create table securities (id int not null, s_name varchar(50))
insert into securities values (1, 'Mr.Akbar')


create login Mentor with password = 'Mentor123'
create user Mentor1 for login Mentor

create role Mentor
alter role Mentor add member Mentor1

grant select on securities to Mentor
grant select on directors to Mentor
grant select on students to Mentor
grant select on teachers to Mentor
grant select on mentors to Mentor