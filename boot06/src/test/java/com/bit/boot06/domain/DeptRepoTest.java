package com.bit.boot06.domain;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.bit.boot06.Boot06Application;
import com.bit.boot06.domain.entity.Dept03;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DeptRepoTest {

	@Autowired
	DeptRepo  deptRepo;
	
	@Test
	public void test() {
		Dept03 entity = Dept03.builder().deptno(1111)
															 .dname("test1111")
															 .loc("loc1111")
															 .build();
		deptRepo.save(entity);
	}
	
	@Test
	public void test2() {
		
	}

}
