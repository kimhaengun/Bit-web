package com.bit.sts05.service;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.bit.sts05.model.DeptVo;

public class DeptServiceTest {
	static ApplicationContext ac = null;
	private static DeptService deptSevice;
	private static int size;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception{
		ac = new GenericXmlApplicationContext("classpath:/applicationContext.xml");		
	}
	@Before
	public void setUp() throws Exception{
		deptSevice = ac.getBean(DeptService.class);
	}
	@Test
	public void testGetList() {
		List<?> list = deptSevice.getList();
		assertNotNull(list);
		size = list.size();
		assertNotSame(0, size);
	}
	
	@Test
	public void testPushList() {
		int before = deptSevice.getList().size();
		DeptVo target = new DeptVo(0,"test","success");
		deptSevice.pushList(target);
		assertSame(before+1,deptSevice.getList().size());
	}
}
