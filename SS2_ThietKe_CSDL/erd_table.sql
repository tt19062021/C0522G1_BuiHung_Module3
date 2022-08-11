drop database if exists quan_ly_vat_tu;
create database quan_ly_vat_tu;
use quan_ly_vat_tu;

create table phieu_xuat(
ma_phieu_xuat int primary key ,
ngay_xuat date
);

create table phieu_nhap(
ma_phieu_nhap int primary key ,
ngay_nhap date 
);

create table vat_tu(
ma_vat_tu int primary key ,
ten_vat_tu varchar(50)
);

create table don_dat_hang(
ma_dat_hang int primary key,
ngay_dat_hang date
);

create table nha_cung_cap(
ma_nha_cung_cap int primary key,
ho_ten varchar(50),
dia_chi varchar(50),
ma_so_dien_thoai int(10),
ma_dat_hang int,
foreign key(ma_dat_hang) references don_dat_hang(ma_dat_hang)
);

create table so_dien_thoai(
so_dien_thoai int(10),
ma_nha_cung_cap int,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table chi_tiet_phieu_xuat(
ma_phieu_xuat int,
ma_vat_tu int,
don_gia_xuat double,
so_luong_xuat int,
primary key(ma_phieu_xuat, ma_vat_tu),
foreign key(ma_phieu_xuat) references phieu_xuat(ma_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_phieu_nhap(
ma_vat_tu int,
ma_phieu_nhap int,
don_gia_nhap double,
so_luong_nhap int,
primary key(ma_phieu_nhap, ma_vat_tu),
foreign key(ma_phieu_nhap) references phieu_nhap(ma_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_don_dat_hang(
ma_vat_tu int,
ma_dat_hang int,
primary key(ma_vat_tu, ma_dat_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(ma_dat_hang) references don_dat_hang(ma_dat_hang)
);