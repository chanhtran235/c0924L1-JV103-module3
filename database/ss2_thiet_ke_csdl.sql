create database if not exists m3_c0924l1_jv103;
use m3_c0924l1_jv103;
create table jame (
 `username` varchar(50) primary key,
 `password` varchar(50)
);
create table class (
 id int primary key auto_increment,
 `name` varchar(50)
);
create table room (
 id int primary key auto_increment,
 `name` varchar(50),
 class_id int,
 foreign key(class_id) references class(id)
);
create table student(
 id int primary key auto_increment,
 `name` varchar(50),
 gender boolean,
 birthday date,
 email varchar(100),
 point float,
 `username` varchar(50) unique,
 class_id int,
 foreign key (`username`) references jame(`username`),
 foreign key (class_id) references class(id)
 );
 
create table instructor (
 id int primary key auto_increment,
 `name` varchar(50),
 birthday date,
 salary float
 );
 create table instructor_class (
  instructor_id int,
  class_id int,
  start_time date,
  end_time date,
  primary key (instructor_id,class_id),
  foreign key (instructor_id) references instructor(id),
  foreign key (class_id) references class(id)
 );
 
 -- input data
insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');
insert into room(name,class_id) values ('Ken',1), ('Jame',1),('Ada',2),('Andy',2);

insert into jame(`username`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`username`,`password`)
 values('chau','12345');
 
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);


 
 insert into student(`name`,birthday, gender,`point`, class_id,`username`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

  insert into student(`name`,birthday, gender,`point`, class_id) 
 values ('nguyen van a','1981-12-12',1,8,null),('tran van b','1981-12-12',1,5,null);
 
--   insert into student(`name`,birthday, gender,`point`, class_id,`username`) 
--  values ('nguyen minh hai chau','1981-12-12',1,8,null,'chau');
 
 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);

select * from room;
select* from class;
select* from student;
select* from jame;
select* from instructor;
select * from instructor_class;

-- bài 3 thao tác với csdl

-- Câu 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào? --
select s.*, c.name as class_name from student  s
join class  c on s.class_id = c.id ;

-- Câu 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào 
-- và cả các bạn đã đăng ký nhưng chưa có lớp học? --
select s.*, c.name as class_name from student  s
right join class  c on s.class_id = c.id;

--  Câu 3. Lấy thông tin của các học viên tên 'nguyen minh hai'?
select * from student where name = 'nguyen minh hai';
  
-- Câu 4. Lấy ra học viên có họ là “nguyen”
select * from student where name like 'nguyen %';

--  Câu 5. Lấy thông tin của các học viên tên 'hai' hoặc 'huynh’.
select * from student where name like '% hai' or name like '% huynh';

--      Câu 6. Lấy ra các học viên có điểm lớn hơn 5
select * from student where point >5;

-- Câu 7. lấy ra thông tin các học viên có điểm 4,6,8
select * from student where point in (4,6,8);

--  lấy ra các loại điểm trong bảng student; 
select distinct point from student;
-- Câu 8. Thông kế số lượng học sinh theo từng loại điểm.
     
select point, count(point) as so_luong from student group by point;
      
-- Câu 9 . Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn =5

   select point, count(point) as so_luong from student where point>=5 group by point;
   
-- Câu 10. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2

   select point, count(point) as so_luong from student where point>=5 group by point having so_luong>=2;
   
-- tìm hiểu khác nhau giữa where và having ( having có thể thay thể cho where được không? và ngược lại)

-- Câu 11. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp  học viên giảm dần theo point,
-- nếu bằng tuổi thì sắp xếp tăng dần theo tên

 select * from student s
 join class c on s.class_id = c.id
 where c.name ='c1121g1' order by s.point desc, s.name asc;
 
 
 -- bài 4: sử dụng các hàm thông dụng
 select* from class;
select* from student;
-- tính số lượng học viên của trung tâm: => count
select count(id) as so_luong from student;
-- 1.1	Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp
select c.name as class_name, count(s.id) as so_luong from class c
join student s on s.class_id = c.id 
group by c.id;
-- 1.2.	 Tính điểm lớn nhất của mỗi các lớp
select c.name as class_name, max(s.point) as max_point from class c
join student s on s.class_id = c.id 
group by c.id;

-- 1.3	 Tình điểm trung bình  của từng lớp
select c.name as class_name, round(avg(s.point),2) as avg_point from class c
join student s on s.class_id = c.id 
group by c.id;

-- 2 Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym.

select name, point from student
union all
select name, birthday from instructor;

-- thực hiện full join cho student và class
select *  from class c
left join student s on s.class_id = c.id 
union
select *  from class c
right join student s on s.class_id = c.id ;

-- 4 Lấy ra top 3 học viên có điểm cao nhất của trung tâm.
select * from student order by point desc limit 0, 3;

-- 3 record tiếp the
select * from student order by point desc limit 3, 3;

select * from student;

-- 5. Lấy ra các học viên có điểm số là cao nhất của trung tâm.

select * from student where point = (select max(point) from student);


-- 6. lấy ra tất cả các giảng viên chưa từng tham gia giảng dạy

-- join bảng : khuyến khích dùng
select * from instructor i 
left join instructor_class ic on i.id=ic.instructor_id
where ic.instructor_id is null;

-- câu truy vấn con: không khuyến khích

select * from instructor i
 where id not in (
    select distinct instructor_id from instructor_class
 );


-- BÀI 5
-- 1. INDEX
select count(*) from customers;
select * from customers;


explain select * from customers where city ='lyon';
explain select * from customers where country ='france';

create index i_country on customers(country);

alter table customers add index i_country(country);

drop index i_country on customers;

alter table customers drop index i_country;

-- 2. VIEW
create view w_student as
select s.*, c.name as class_name from student  s
 join class  c on s.class_id = c.id;

select * from w_student;
select * from w_student;
-- khi bảng chính thay đổi thì view có thay đổi hay không và ngược lại
update w_student set name ='abc' where id =1;

create view w_student1 as
select s.*, c.name as class_name , j.username  from student  s
 join class  c on s.class_id = c.id
 join jame j on s.username = j.username;

-- 3. SP
-- lấy tất cả thông tin của học viên -- không tham số
   delimiter //
   create procedure get_all_student()
   begin
    
    select * from student;
    select * from student;
    select * from student;
   end //
   delimiter ;

call get_all_student();

-- xoa sinh viên theo id 
delimiter $$
create procedure delete_student_by_id(IN p_id int)
begin
delete from student where id = p_id;
end $$
delimiter ;

call delete_student_by_id(1);
-- 4. FUNCTION
select * from student;
-- viết function xếp loại

delimiter //
create function xep_loai (p_point int)
returns varchar(20)
deterministic
begin 
declare loai varchar(20);
if p_point >=8 then
set loai = 'gioi';
elseif p_point>=7 then
set loai = 'khá';
elseif p_point>=5 then
set loai = ' trung bình';
else
set loai ='yeu';
end if;
return loai;
end //
delimiter ;

select *, xep_loai(point) as `rank` from student;




 
 