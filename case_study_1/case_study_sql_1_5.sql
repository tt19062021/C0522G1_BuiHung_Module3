use furama_resort;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select ma_nhan_vien, ho_ten 
from nhan_vien 
where (ho_ten like 'H%' 
or ho_ten like  'T%' 
or ho_ten like  'K%')
and character_length(ho_ten) <=15 ;

-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select ma_khach_hang, ho_ten  
from khach_hang
where 
(((YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))) between 18 and 50 )
and 
(dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%') ;

-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select ma_khach_hang
from khach_hang 
inner join loai_khach
on khach_hang.ten_khach_hang = loai_khach.ten_loai_khach;