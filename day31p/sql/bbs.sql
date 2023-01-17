drop table IF EXISTS bbs01;

--bbs table
create table bbs01(
	num int primary key auto_increment,
	id varchar(30) not null,
	sub varchar(50) default '제목없음',
	content text,
	nalja date
);

-- dummy data
insert into bbs01 (id,sub,content,nalja) values ('test1', 'test 제목1','test~~~~~~~~~',now());
insert into bbs01 (id,sub,content,nalja) values ('test2', 'test 제목2','test~~~~~~~~~',now());
insert into bbs01 (id,sub,content,nalja) values ('test3', 'test 제목3','test~~~~~~~~~',now());
commit;

select * from bbs01 order by num desc;