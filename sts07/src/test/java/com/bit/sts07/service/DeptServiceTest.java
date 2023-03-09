package com.bit.sts07.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.bit.sts07.model.entity.DeptVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class DeptServiceTest {
	
	@Autowired
	DeptService deptService;
	
	@Test
	public void testSelectAll() {
		assertNotNull(deptService.selectAll());
		assertNotSame(0,deptService.selectAll().size());
	}

	@Test
	public void testSelectOne() {
		DeptVo target = new DeptVo(50,"테스팅","테스트");
		assertNotNull(deptService.selectOne(target.getDeptno()));
		assertEquals(target, deptService.selectOne(target.getDeptno()));
	}

	@Transactional
	//junit에서 transaction을 수행하면 rollback됨 = default가 rollback
	//insert를 수행해서 60 데이터를 넣어도 selectOne메소드에서 60을 찾으면 없음 --> rollback되기 떄문
	@Test
	public void testInsertOne() {
		DeptVo target = new DeptVo(60,"테스팅","테스트");
		System.out.println(target.toString());
		deptService.insertOne(target);
		
	}
}
