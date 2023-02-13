create schema myweb;
grant all privileges on myweb.* to 'scott'@'localhost';
FLUSH privileges;

USE myweb;

DROP TABLE user;
drop table community;

create TABLE user(
   id VARCHAR(45) NOT NULL PRIMARY KEY,
   password mediumtext NOT NULL,
   nickName VARCHAR(50) NOT NULL
);

create Table community(
   communityNo int not null primary key auto_increment,
    userId int not null,
    title varchar(50) not null,
    content text not null,
    hiredate datetime not null default now(),
    counts int not null default 0,
    foreign key (userId) references user(id)
);

SELECT * FROM user;
select * from community;
desc community;
insert into user (id, password, nickName) values ('test1','1234','테스트1');
# 테스트
insert into community (userNo, title, content) values (2,'제목1','내용1');