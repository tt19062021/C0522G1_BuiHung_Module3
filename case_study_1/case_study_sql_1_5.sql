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

SELECT kh.ma_khach_hang, kh.ho_ten, COUNT(kh.ma_khach_hang) so_lan_dat_phong
FROM khach_hang kh
INNER JOIN hop_dong hd 
ON kh.ma_khach_hang = hd.ma_khach_hang
INNER JOIN loai_khach lk 
ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang
ORDER BY so_lan_dat_phong;

-- 5.5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT kh.ma_khach_hang, kh.ho_ten , lk.ten_loai_khach , hd.ma_hop_dong,
 dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,(dv.chi_phi_thue + IFNULL((dvdk.gia * hdct.so_luong),0)) tong_tien 
 FROM khach_hang kh
 LEFT JOIN loai_khach lk 
 ON kh.ma_loai_khach = lk.ma_loai_khach
 lEFT JOIN hop_dong hd 
 ON hd.ma_khach_hang = kh.ma_khach_hang
 LEFT JOIN dich_vu dv 
 ON dv.ma_dich_vu = hd.ma_dich_vu
 LEFT JOIN hop_dong_chi_tiet hdct 
 ON hdct.ma_hop_dong = hd.ma_hop_dong
 LEFT JOIN dich_vu_di_kem dvdk 
 ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 GROUP BY kh.ma_khach_hang;

