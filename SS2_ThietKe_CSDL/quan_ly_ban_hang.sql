drop database if exists quan_ly_ban_hang;
create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
c_id int primary key,
c_name varchar(25),
c_age tinyint
);
create table or_der(
o_id int primary key,
c_id int,
o_date datetime,
o_total_price double,
foreign key(c_id) references customer(c_id)
);

create table product(
p_id int primary key,
p_name varchar(25),
p_price int
);

create table order_detail(
o_id int,
p_id int,
od_qty int,
primary key(o_id,p_id),
foreign key(o_id) references or_der(o_id),
foreign key(p_id) references product(p_id)
);

insert into customer(c_id,c_name,c_age) values 
(1,'MINH QUANG',10),
(2,'NGOC OANH',20),
(3,'HONG HA',50);

insert into or_der(o_id,c_id,o_date,o_total_price) values
(1,1,'2006-03-16',null),
(2,2,'2006-03-18',null),
(3,1,'2006-01-21',null);

insert into product(p_id,p_name,p_price) values
(1,'MAY GIAC',3),
(2,'Tu Lanh',5),
(3,'DIEU HOA',7),
(4,'QUAT',1),
(5,'BEP DIEN',2);

insert into order_detail(o_id,p_id,od_qty) values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select * from customer;
select * from or_der;
select * from product;
select * from order_detail;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.o_id,o.o_date,o.o_total_price from or_der o;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.c_name ,  p.p_name from order_detail od
inner join or_der o on o.o_id= od.o_id
inner join product p on p.p_id = od.p_id
inner join customer c on c.c_id = o.c_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.c_name from or_der o
right join customer c on o.c_id = c.c_id
where o.o_date is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)