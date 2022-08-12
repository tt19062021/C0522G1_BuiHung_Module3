drop database if exists products;
create database products;
use products;
create table product(
id int primary key auto_increment,
product_code varchar(10),
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(50),
product_status bit
);
insert into product(id,product_code,product_name,product_price,product_amount,product_description,product_status) values
(1,'km21','kem dưỡng da',20.000,20,'siêu trắng',1),
(2,'km11','kem chống nắng',50.000,0,'chống nắng',0),
(3,'kmr12','kem đánh răng',15.000,5,'siêu sạch,thơm',1),
(4,'km01','kem bôi da',40.000,11,'trị lang ben',1),
(5,'km02','kem trộn',150.000,100,'siêu trắng',1);

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_product_code on product(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_product_name_price on product(product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
select * from product where product_code = 'km02';

-- So sánh câu truy vấn trước và sau khi tạo index
explain select * from product where product_code = 'km02'; 
select * from product where product_code = 'km02';

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view v_get_product as 
select product_code, product_name, product_price, product_status from product;
-- Tiến hành sửa đổi view

-- Tiến hành xoá view
drop view v_get_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
create procedure sp_product()
begin
select * from product;
end //
DELIMITER ;
call sp_product();
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
create procedure sp_add_product (in p_id int ,p_code varchar(10),p_name varchar(45),p_price double, p_amount int, p_description varchar(50),p_status bit)
begin
insert into product(id,product_code,product_name,product_price,product_amount,product_description,product_status) values
(p_id , p_code ,p_name ,p_price, p_amount , p_description,p_status );
end //
DELIMITER ;
call sp_add_product(6,'km03','kem tan mở',200.000,6,'bôi vào bụng',1);

drop procedure sp_add_product;
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create procedure sp_update_product(in  p_id int ,p_code varchar(10),p_name varchar(45),p_price double, p_amount int, p_description varchar(50),p_status bit )
begin
update product set
product_code = p_code,
product_name = p_name,
product_price =p_price,
product_amount = p_amount,
product_description = p_description,
product_status =p_status 
where id = p_id;
end //
DELIMITER ;

call sp_update_product(1,'km00','kem vip',30.000,20,'kem để ăn',1);
-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
create procedure sp_delete_product_by_id(in p_id int)
begin
delete from product
where id = p_id;
end //
DELIMITER ;
call sp_delete_product_by_id(2);
call sp_product();
