package com.bit.model;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class DeptDaoTest {

	//테스트 케이스는 독립적인 개체로 동작됨. = 같은 dao가 아님
	//방법 1. static으로 변경
	static DeptDto target;
	DeptDao dao;
	
	//방법 2. Junit에서는 생성자를 사용하면 안됨 = 생성자와 같은 역할을 하는 메소드 생성
	@BeforeClass
	public static void beforeClass() {
		// beforeClass = Junit 시작 시 딱 한번 실행
		//              --> static 선언이 되어 있어야함
		System.out.println("beforeClass");
		target = new DeptDto();
		target.setDeptno(9999);
		target.setDname("test1");
		target.setLoc("LOC1");
	}
	
	@Before
	public void before() {
		//before 각 테스트케이스 메소드를 실행할 때 마다 동작
		System.out.println("before");
		dao=new DeptDao();
	}
	
	@Test
	public void test1SelectAll() {
		assertNotNull(dao.selectAll());
		assertTrue(dao.selectAll().size()>0);
	}

	@Test
	public void test3SelectOne() {
		assertEquals(target, dao.selectOne(target.getDeptno()));
	}

	@Test
	public void test2InsertOne() {

		assertSame(1, dao.insertOne(target.getDeptno(),target.getDname(),target.getLoc()));
	}

	@Test
	public void test4UpdateOne() {

		assertSame(1, dao.UpdateOne(target.getDeptno(),target.getDname(),target.getLoc()));
	}

	@Test
	public void test5DeleteOne() {

		assertSame(1, dao.DeleteOne(target.getDeptno()));
	}

}
