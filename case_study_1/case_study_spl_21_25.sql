use furama_resort;
-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và 
-- đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values
(13,'2019-12-12','2020-01-12',0,1,10,1);
create view v_nhan_vien as
select nv.ma_nhan_vien,nv.ho_ten,nv.dia_chi,hd.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ma_khach_hang from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where dia_chi regexp  '^yen bai|đà nẵng$' and year(ngay_lam_hop_dong) = '2019';

drop view v_nhan_vien;
-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
select * from v_nhan_vien;
select * from nhan_vien;
select * from hop_dong;
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
-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
