### nodejs & Express & mysql

### mysql docker setting
'''
### docker volume
docker volume create dummysql

docker run -it --rm -d -p 3306:3306^
 -e MYSQL_DATABASE=lecture^
 -e MYSQL_ROOT_PASSWORD=mysql^
 -e MYSQL_USER=scott^
 -e MYSQL_PASSWORD=tiger^
 --name mysql8 -v dummysql:/var/lib/mysql mysql

### mysql의 인증 방식이 8.x들어와서 caching_sha2_password방식으로 바뀌어 암호화 인증
### 오류 발생 / 따라서 mysql_native_password방식으로 암호화 없이 패스워드 수정
>docker exec -it 74 /bin/bash
>mysql -u root -pmysql
>alter user 'scott'@'%' identified with mysql_native_password by 'tiger'
>grant all privileges on *.* to 'scott'@'%'
>flush privileges
'''