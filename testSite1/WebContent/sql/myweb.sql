create schema myweb;
grant all privileges on myweb.* to 'scott'@'localhost';
FLUSH privileges;

USE myweb;

DROP TABLE user;

create TABLE user(
	userNo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id VARCHAR(45) NOT NULL,
	password mediumtext NOT NULL,
	nickName VARCHAR(50) NOT NULL
);

SELECT * FROM user;