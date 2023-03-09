package com.bit.sts07.model;

import static org.junit.Assert.*;

import java.util.Iterator;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.sts07.model.entity.DeptVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class DeptDaoTest {

	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void findAllTest() {
//		assertNotNull(dataSource);
//		assertNotNull(sqlSession);
//		assertNotNull(sqlSession.getMapper(DeptDao.class).findAll());
		for(DeptVo bean : sqlSession.getMapper(DeptDao.class).findAll()) {
			System.out.println(bean);
		}
	}

}
