create table stu33(
	num int primaty key auto_increment,
	kor int not null default 0 check (kor between 0 and 100),
	eng int not null default 0 check (eng between 0 and 100),
	math int not null default 0 check (math between 0 and 100)
);

--dummy data
insert into stu33 (kor,eng,math) values(99,99,99);
insert into stu33 (kor,eng,math) values(88,88,88);
insert into stu33 (kor,eng,math) values(77,77,77);
commit;