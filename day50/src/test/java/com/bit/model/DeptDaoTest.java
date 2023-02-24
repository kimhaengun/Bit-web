package com.bit.model;

import static org.junit.Assert.*;

import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import org.junit.Test;

public class DeptDaoTest {

	@Test
	public void testSelectAll() throws SQLException, ClassNotFoundException {
		DeptDao dao = new DeptDao();
		Class.forName(Driver.class.getCanonicalName());
		String url="jdbc:mysql://localhost:3306/lecture";
		String user=System.getenv("MYSQL_USER");
		String password = System.getenv("MYSQL_PW");
		dao.conn=DriverManager.getConnection(url, user, password);
		List<DeptDto> list = dao.selectAll();
		assertNotNull(list); //null체크
		assertTrue(list.size()>0);
	}

}
