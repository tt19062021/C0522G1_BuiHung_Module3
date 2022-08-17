use furama_resort;
-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và 
-- đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values
(13,'2019-12-12','2020-01-12',0,1,10,1);
create view v_nhan_vien as
select nv.ma_nhan_vien,nv.ho_ten,nv.dia_chi,hd.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ma_khach_hang from nhan_vien nv
left join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where dia_chi like '%Đà Nẵng'  and year(ngay_lam_hop_dong) = '2019';

drop view v_nhan_vien;
-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
select * from v_nhan_vien;
select * from nhan_vien;
select * from hop_dong;
update nhan_vien set dia_chi = 'Liên Chiểu' where ma_nhan_vien =1 ;
update nhan_vien set dia_chi = '295 Nguyễn Tất Thành, Đà Nẵng' where ma_nhan_vien =1 ;
-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
DELIMITER //
create procedure sp_xoa_khach_hang(in p_ma_khach_hang int)
begin
delete from khach_hang
where ma_khach_hang = p_ma_khach_hang;
end //
DELIMITER ;
-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp 
-- lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
DELIMITER //
create procedure sp_them_moi_hop_dong(
in p_ma_hop_dong int,
p_ngay_lam_hop_dong datetime,
p_ngay_ket_thuc datetime,
p_tien_dat_coc double,
p_ma_nhan_vien int,
p_ma_khach_hang int,
p_ma_dich_vu int )
begin
insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values
(p_ma_hop_dong,p_ngay_lam_hop_dong,p_ngay_ket_thuc,p_tien_dat_coc,p_ma_nhan_vien,p_ma_khach_hang,p_ma_dich_vu)

ON DUPLICATE KEY UPDATE
ma_hop_dong = values(p_ma_hop_dong),
ngay_lam_hop_dong = values(p_ngay_lam_hop_dong),
ngay_ket_thuc = values(p_ngay_ket_thuc),
tien_dat_coc = values(p_tien_dat_coc),
ma_nhan_vien = values(p_ma_nhan_vien),
ma_khach_hang = values(p_ma_khach_hang),
ma_dich_vu = values(p_ma_dich_vu)
;
end //
DELIMITER ;
call sp_them_moi_hop_dong('14', '2020-09-20', '2020-12-20', '1000000', '3', '1', '3');
select * from hop_dong;

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi 
-- còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
select count(ma_hop_dong) as tong_so_hop_dong from hop_dong;
DELIMITER //
create trigger tr_xoa_hop_dong
after delete on hop_dong
for each row
begin
declare dem int; 
 select count(ma_hop_dong) into dem from hop_dong ;
insert into lich_su_hop_dong(
old_ma_hop_dong,
ngay_lam_hop_dong,
ngay_ket_thuc,
tien_dat_coc,
ma_nhan_vien,
ma_khach_hang,
ma_dich_vu,
time_delete,
so_hop_dong_con_lai) 
values
(old.ma_hop_dong,
old.ngay_lam_hop_dong,
old.ngay_ket_thuc,
old.tien_dat_coc,
old.ma_nhan_vien,
old.ma_khach_hang,
old.ma_dich_vu,
 now(),
 dem);
end //
DELIMITER ;
drop trigger tr_xoa_hop_dong;
drop table lich_su_hop_dong;
select c from hop_dong;

create table lich_su_hop_dong(
id int auto_increment primary key,
old_ma_hop_dong int,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int ,
ma_khach_hang int,
ma_dich_vu int,
time_delete datetime,
so_hop_dong_con_lai int
);
delete from hop_dong where ma_hop_dong = 12;
set sql_safe_updates = 0;

select * from lich_su_hop_dong;