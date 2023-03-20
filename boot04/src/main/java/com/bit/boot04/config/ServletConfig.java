package com.bit.boot04.config;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.AllArgsConstructor;

@Configuration //config 파일이라고 설정해주는 어노테이션
@MapperScan(basePackages = "com.bit.boot04.model")
@AllArgsConstructor
public class ServletConfig implements WebMvcConfigurer{

	private final SqlSessionFactory sqlSessionFactory;
	// sqlSession 주입을 못받을 시 
//	@Bean
//	public SqlSession getsqlSession() {
//		return new SqlSessionTemplate(sqlSessionFactory);
//	}
	
//	@Bean
//	SqlSession sqlSession(SqlSessionTemplate sqlsessionTemplate) {
//		return sqlsessionTemplate;
//	}
	
	
}
