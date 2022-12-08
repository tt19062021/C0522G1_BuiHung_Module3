use furama;

DELIMITER //
create procedure sp_select_emp_all()
begin
select * from employee;
end //
DELIMITER ;

DELIMITER //
create procedure sp_select_cus_all()
begin
select * from customer;
end //
DELIMITER ;

DELIMITER //
create procedure sp_select_fac_all()
begin
select * from facility;
end //
DELIMITER ;


DELIMITER //
create procedure sp_select_cont_all()
begin
select * from contract;
end //
DELIMITER ;

DELIMITER //
create procedure sp_insert_emp(in p_name varchar(50),p_birth date,p_card varchar(12),p_sala double,p_phone varchar(12), p_adress varchar(50), p_pos int,
p_edu int, p_divi int, p_use varchar(45))
begin
insert into employee(
`name`,
date_of_birth,
id_card,
salary,
phone_number,
email,
address,
position_id,
education_degree_id,
division_id,
user_name)
values(
p_name,
p_birth,
p_card,
p_sala,
p_phone,
p_adress,
p_pos,
p_edu,
p_divi,
p_use);
end //
DELIMITER ;


call sp_select_emp_all();
call sp_select_cus_all();
call sp_select_fac_all();
call sp_select_cont_all();
call sp_insert_emp('Bùi Hải', '2000-01-01', '123342432', '10000000', '0123456789', 'haitt@codegym.com', 'Đà Nẵng', '1', '3', '2', 'haitt');
update employee set is_delete = 1 where id = 2 and is_delete =0;