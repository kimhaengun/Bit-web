create user 'scott'@'localhost' identified by 'tiger';
create user 'scott'@'%' identified by 'tiger';
grant all privileges on *.* to 'scott'@'localhost';
grant all privileges on *.* to 'scott'@'%';
flush privileges;

create database lecture;
use lecture;
CREATE TABLE IF NOT EXISTS `dept` (
  `DEPTNO` int(11) DEFAULT NULL,
  `DNAME` varchar(14) DEFAULT NULL,
  `LOC` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `dept` (`DEPTNO`, `DNAME`, `LOC`) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');