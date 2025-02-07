-- tạo csdl---
create database if not exists c0924L1;
use c0924L1;
-- tạo bảng student --
create table students(
  id int primary key auto_increment,
  `name` varchar(100) not null default ("abc"),
  `point` float check(point>5)
);
-- them dữ liệu vào bảng-- 
insert into students(id,name,point) values(3,"chánh",7),(4,"chánh3",45);
insert into students(name,point) values("chánh",7),("chánh3",45);
-- đọc dữ liệu
select * from students;
select * from students where id =3;
select `name`,`point` from students;
-- update dữ liêu-------
update students set name ='chánh3' where id =5;
delete from students where id =3;
delete from students where name ='chánh3';
-- xoá bảng ----
drop table students;
-- tắt chế độ bảo vệ--
SET SQL_SAFE_UPDATES = 0;

alter table students add column address varchar(250);
-- xoá csdl-------
drop database c0924L1;


