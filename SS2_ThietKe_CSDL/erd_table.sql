drop database if exists quan_ly_vat_tu;
create database quan_ly_vat_tu;
use quan_ly_vat_tu;

CREATE TABLE phieu_xuat (
    so_phieu_xuat INT PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATE
);

CREATE TABLE vat_tu (
    ma_vat_tu INT AUTO_INCREMENT PRIMARY KEY,
    ten_vat_tu VARCHAR(45)
);

CREATE TABLE phieu_xuat_vat_tu (
    so_phieu_xuat INT,
    ma_vat_tu INT,
    don_gia_xuat DOUBLE,
    so_luong_xuat INT,
    PRIMARY KEY (so_phieu_xuat , ma_vat_tu),
    FOREIGN KEY (so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_nhap (
    so_phieu_nhap INT AUTO_INCREMENT PRIMARY KEY,
    ngay_nhap DATE
);

CREATE TABLE phieu_nhap_vat_tu (
    ma_vat_tu INT,
    so_phieu_nhap INT,
    don_gia_nhap DOUBLE,
    so_luong_nhap INT,
    PRIMARY KEY (ma_vat_tu , so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap)
);

CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap INT PRIMARY KEY AUTO_INCREMENT,
    ten_nha_cung_cap VARCHAR(45),
    dia_chi VARCHAR(45),
    so_dien_thoai INT
);

CREATE TABLE don_dat_hang (
    so_don_hang INT AUTO_INCREMENT PRIMARY KEY,
    ngay_dat_hang DATE,
    ma_nha_cung_cap INT,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);

CREATE TABLE don_dat_hang_vat_tu (
    so_don_hang INT,
    ma_vat_tu INT,
    PRIMARY KEY (so_don_hang , ma_vat_tu),
    FOREIGN KEY (so_don_hang)
        REFERENCES don_dat_hang (so_don_hang),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE so_dien_thoai (
    ma_nha_cung_cap INT,
    so_dien_thoai VARCHAR(45),
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);