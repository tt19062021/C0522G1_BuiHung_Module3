create table `student-management`.class (
`id` int not null,
`name` varchar(45) null,
primary key(`id`)
);

create table `student-management`.teacher (
`id` int not null,
`name` varchar(40) null,
`age` int null,
`country` varchar(45) null,
primary key(`id`) 
);
INSERT INTO `student-management`.`class` (`id`, `name`) VALUES ('1', 'C522G1');
INSERT INTO `student-management`.`class` (`id`, `name`) VALUES ('2', 'C0622G1');
INSERT INTO `student-management`.`teacher`(`id`, `name`,`age`,`country`) VALUES ('1', 'Bùi Hùng','19','Đà Nẵng');
INSERT INTO `student-management`.`teacher`(`id`, `name`,`age`,`country`) VALUES ('2', 'Nguyễn Tất Thành','18','Đà Nẵng');