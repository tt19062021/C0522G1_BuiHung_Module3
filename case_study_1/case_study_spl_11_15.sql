use furama_resort;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những 
-- khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT dvdk.ma_dich_vu_di_kem , dvdk.ten_dich_vu_di_kem, kh.ho_ten,lk.ten_loai_khach
FROM dich_vu_di_kem dvdk
INNER JOIN hop_dong_chi_tiet hdct 
	ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
INNER JOIN hop_dong hd 
	ON hdct.ma_hop_dong = hd.ma_hop_dong
INNER JOIN khach_hang kh 
	ON hd.ma_khach_hang = kh.ma_khach_hang
INNER JOIN loai_khach lk 
	ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond' AND (kh.dia_chi LIKE '%Vinh' OR '%Quảng Ngãi')
GROUP BY dvdk.ma_dich_vu_di_kem;

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), 
-- ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách 
-- hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong, nv.ho_ten as ten_nhan_vien, kh.ho_ten as ten_khach_hang, kh.so_dien_thoai,dv.ma_dich_vu, dv.ten_dich_vu,
ifnull((hdct.so_luong),0)  AS so_luong_dich_vu_di_kem, hd.tien_dat_coc
from hop_dong hd
left join nhan_vien nv
on hd.ma_nhan_vien = nv.ma_nhan_vien
left join khach_hang kh
on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv
on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct
on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where (year(hd.ngay_lam_hop_dong)= '2020') 
and 
(month(hd.ngay_lam_hop_dong) between 10 and 12)
and 
(month(hd.ngay_lam_hop_dong) <> (month(hd.ngay_lam_hop_dong) between 1 and 6))
group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 -- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
 
 -- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
 -- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
 -- (được tính dựa trên việc count các ma_dich_vu_di_kem).
 -- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, 
 -- ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
 select nv.ma_nhan_vien, nv.ho_ten as ten_nhan_vien, nv.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
 from nhan_vien nv
 join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
 join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
 