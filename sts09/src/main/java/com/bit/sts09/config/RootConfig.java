package com.bit.sts09.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

import com.mysql.cj.jdbc.Driver;


@Configuration
@MapperScan("com.bit.sts09.model") //interface 경로 지정하여 @Mapper 어노테이션을 스캔해서 매퍼로 지정한다.,
public class RootConfig {

	//DB - dataSource
	@Bean //Bean 객체 생성, 등록 어노테이션
	public DataSource getDataSource() {
		SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
		dataSource.setDriverClass(Driver.class);
		dataSource.setUrl("jdbc:mysql://192.168.99.100:3306/lecture");
		dataSource.setUsername("scott");
		dataSource.setPassword("tiger");
		return dataSource;
	}
	
	@Bean
	public SqlSessionFactory getsqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		// dataSource 주입
		sqlSessionFactory.setDataSource(getDataSource());
		// mapper 사용 시
//		Resource[] resources = {new ClassPathResource("/mapper/dept-mapper.xml")}; //mapper 파일이 여러개 일 수 있기 떄문에 배열로 받기
//		sqlSessionFactory.setConfigLocation(resource);
//		sqlSessionFactory.setMapperLocations(resources);
		// @mapperScan 어노테이션으로 대체 가능
				
		return sqlSessionFactory.getObject();
	}
	
	@Bean
	public SqlSession getSqlSession() throws Exception {
		// sqlSession 요청 --> getsqlSessionFactory() 실행
		return new SqlSessionTemplate(getsqlSessionFactory());
	}
}
