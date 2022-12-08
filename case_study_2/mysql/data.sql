use furama;
INSERT INTO position (id, name) VALUES ('1', 'Lễ tân');
INSERT INTO position (id, name) VALUES ('2', 'Phục vụ');
INSERT INTO position (id, name) VALUES ('3', 'Chuyên viên');
INSERT INTO position (id, name) VALUES ('4', 'Giám sát');
INSERT INTO position (id, name) VALUES ('5', 'Quản Lý');
INSERT INTO position (id, name) VALUES ('6', 'Giám đốc');


INSERT INTO education_degree(id, name) VALUES ('1', 'Trung cấp');
INSERT INTO education_degree(id, name) VALUES ('2', 'Cao đẳng');
INSERT INTO education_degree(id, name) VALUES ('3', 'Đại học');
INSERT INTO education_degree(id, name) VALUES ('4', 'Sau đại học');


INSERT INTO division (id, name) VALUES ('1', 'Sale-Marketing');
INSERT INTO division (id, name) VALUES ('2', 'Hành chính');
INSERT INTO division (id, name) VALUES ('3', 'Phục vụ');
INSERT INTO division (id, name) VALUES ('4', 'Quản lý');


INSERT INTO user (user_name, password) VALUES ('haitt', 'codegym123');
INSERT INTO user (user_name, password) VALUES ('congnt', 'codegym123');
INSERT INTO user (user_name, password) VALUES ('quangnn', 'codegym123');
INSERT INTO user (user_name, password) VALUES ('trungdc', 'codegym123');
INSERT INTO user (user_name, password) VALUES ('bin', 'codegym123');


INSERT INTO role (role_id, role_name) VALUES ('1', 'Role name 1');
INSERT INTO role (role_id, role_name) VALUES ('2', 'Role name 2');
INSERT INTO role (role_id, role_name) VALUES ('3', 'Role name 3');
INSERT INTO role (role_id, role_name) VALUES ('4', 'Role name 4');
INSERT INTO role (role_id, role_name) VALUES ('5', 'Role name 5');

INSERT INTO user_role (role_id, user_name) VALUES ('1', 'haitt');
INSERT INTO user_role (role_id, user_name) VALUES ('2', 'bin');
INSERT INTO user_role (role_id, user_name) VALUES ('3', 'trungdc');
INSERT INTO user_role (role_id, user_name) VALUES ('4', 'quangnn');
INSERT INTO user_role (role_id, user_name) VALUES ('5', 'congnt');


INSERT INTO employee (id, name, date_of_birth, id_card, salary, phone_number, email, address, position_id, education_degree_id, division_id, user_name) 
VALUES 
('1', 'Trương Tấn Hải', '2000-01-01', '123342432', '10000000', '0123456789', 'haitt@codegym.com', 'Đà Nẵng', '1', '3', '2', 'haitt'),
('2', 'Nguyễn Thành Công', '2000-02-01', '324326777', '10000000', '01235656789', 'congnt@codegym.com', 'Quảng Nam', '3', '3', '2', 'congnt'),
('3', 'Nguyễn Ngọc Quang', '2000-04-01', '122555689', '10000000', '0123336789', 'quangnn@codegym.com', 'Đà Nẵng', '4', '3', '2', 'quangnn'),
('4', 'Đặng Chí Trung', '2000-01-02', '467789088', '10000000', '0954456789', 'trungdc@codegym.com', 'Huê', '2', '1', '2', 'trungdc'),
('5', 'Nguyễn Bi', '2000-05-01', '333322456', '10000000', '0123459339', 'bin@codegym.com', 'Đà Nẵng', '1', '3', '4', 'bin');


INSERT INTO customer_type (id, name) VALUES ('1', 'Diamond');
INSERT INTO customer_type (id, name) VALUES ('2', 'Platinium');
INSERT INTO customer_type (id, name) VALUES ('3', 'Gold');
INSERT INTO customer_type (id, name) VALUES ('4', 'Silver');
INSERT INTO customer_type (id, name) VALUES ('5 ', 'Member');

INSERT INTO customer (customer_type_id, name, gender, date_of_birth, id_card, phone_number, email, address)
VALUES 
(2, 'Nguyễn Tất Thành', 1, '2000-12-24', '1233332233', '012345678', 'thanhnt@gmail.com', 'Quảng Nam'),
(1, 'Bùi Hùng', 1, '2000-11-12', '1233343233', '012333678', 'hungb@gmail.com', 'Đà Nẵng'),
(5, 'Hà Bảo Ân', 1, '2000-11-12', '1233111233', '012567678', 'anhb@gmail.com', 'Huế'),
(3, 'Nguyễn Tấn Huân', 1, '2000-9-12', '1233345233', '023445678', 'huannt@gmail.com', 'Quảng Ngãi'),
(2, 'Phan Phước Đại', 1, '2000-11-12', '1233888233', '014745678', 'daipp@gmail.com', 'Quảng Trị'),
(3, 'Nguyễn Văn Phức', 1, '2000-4-12', '1233321233', '012347678', 'phucnv@gmail.com', 'Đà Nẵng'),
(4, 'Trần Đặng Quang Anh', 1, '2000-2-12', '1233445233', '012323678', 'anhtdq@gmail.com', 'Quãng Ngãi'),
(5, 'Võ Văn Tý', 1, '2000-4-12', '123399233', '012233378', 'tyvv@gmail.com', 'Quảng Nam'),
(1, 'Đặng Ngọc Huy', 1, '2000-2-12', '1233387233', '015555678', 'huydn@gmail.com', 'Quảng Nam'),
(2, 'Đặng Thị Thủy Tiên', 1, '2000-2-12', '1232337233', '013355678', 'tiendtt@gmail.com', 'Quảng Nam');


INSERT INTO facility_type (name) VALUES ('Villa');
INSERT INTO facility_type (name) VALUES ('Room');
INSERT INTO facility_type (name) VALUES ('House');

INSERT INTO rent_type (name) VALUES ('Rent type 1');
INSERT INTO rent_type (name) VALUES ('Rent type 2');
INSERT INTO rent_type (name) VALUES ('Rent type 3');

INSERT INTO facility (name, area, cost, max_people, rent_type_id, facility_type_id, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free) 
VALUES ('Facility 1', '50', '100', '10', '1', '1', 'Phòng thường', 'Khong', '50', '100', 'Khong'),
('Facility 2', '50', '100', '10', '3', '2', 'Phòng thường', 'Khong', '50', '100', 'Khong'),
('Facility 3', '50', '100', '10', '2', '1', 'Phòng thường', 'Khong', '50', '100', 'Khong'),
('Facility 4', '50', '100', '10', '2', '2', 'Phòng thường', 'Khong', '50', '100', 'Khong'),
('Facility 5', '50', '100', '10', '1', '3', 'Phòng thường', 'Khong', '50', '100', 'Khong');

INSERT INTO attach_facility (name, cost, unit, status) 
VALUES 
('Attach facility 1', '10', 'VND', 'Khong'),
('Attach facility 2', '10', 'VND', 'Khong'),
('Attach facility 3', '10', 'VND', 'Khong'),
('Attach facility 4', '10', 'VND', 'Khong'),
('Attach facility 5', '10', 'VND', 'Khong');

INSERT INTO contract (start_date, end_date, deposit, employee_id, customer_id, facility_id) 
VALUES 
('2021-06-12 10:34:09', '2022-06-12 10:34:09', '2000000', '2', '1', '2'),
('2021-06-12 10:34:09', '2022-06-12 10:34:09', '2000000', '1', '2', '1'),
('2021-06-12 10:34:09', '2022-06-12 10:34:09', '2000000', '4', '3', '3'),
('2021-06-12 10:34:09', '2022-06-12 10:34:09', '2000000', '3', '4', '2'),
('2021-06-12 10:34:09', '2022-06-12 10:34:09', '2000000', '1', '5', '1'),
('2021-06-12 10:34:09', '2022-06-12 10:34:09', '2000000', '2', '6', '3'),
('2021-06-12 10:34:09', '2022-06-12 10:34:09', '2000000', '3', '7', '4'),
('2021-06-12 10:34:09', '2022-06-12 10:34:09', '2000000', '4', '8', '2'),
('2021-06-12 10:34:09', '2022-06-12 10:34:09', '2000000', '1', '9', '1'),
('2021-06-12 10:34:09', '2022-06-12 10:34:09', '2000000', '2', '10', '3');

INSERT INTO contrat_detail (contract_id, attach_facility_id, quantity) 
VALUES 
('1', '1', '20'),
('2', '2', '20'),
('3', '2', '20'),
('4', '3', '20'),
('5', '4', '20');
