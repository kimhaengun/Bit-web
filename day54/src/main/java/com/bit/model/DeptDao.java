package com.bit.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.h2.jdbcx.JdbcDataSource;

import com.bit.framework.jdbc.JdbcTemplate;
import com.bit.framework.jdbc.RowMapper;

public class DeptDao {
	DataSource dataSource;
	RowMapper mapper=new RowMapper() {
		
		@Override
		public Object rows(ResultSet rs) throws SQLException {
			// TODO Auto-generated method stub
			return new DeptDto(rs.getInt("deptno"),rs.getString("dname"),rs.getString("ename"));
		}
	};
	public DeptDao() {
		// TODO Auto-generated constructor stub
		JdbcDataSource jds = new JdbcDataSource();
		jds.setUrl("jdbc:h2:tcp://localhost/~/test");
		jds.setUser("sa");
		dataSource=jds;
	}
	public List<DeptDto> selectAll(){
		String sql = "select * from dept;";
		JdbcTemplate template = new JdbcTemplate(dataSource);
		return (List<DeptDto>) template.queryForList(sql,mapper);
	}
	
	public int insertOne(int deptno, String dname, String loc) {
		String sql = "insert into dept (deptno,dname, nalja,ename) values(?,?,now(),?)";
		JdbcTemplate template = new JdbcTemplate(dataSource);
		return template.update(sql, new Object[]{deptno, dname, loc});
	}
	public Object selectOne(int deptno) {
		String sql = "select * from dept where deptno=?";
		JdbcTemplate template = new JdbcTemplate(dataSource);
		return template.queryForObject(sql, mapper, new Object[] {deptno});
	}
	public int updateOne(int deptno, String dname, String loc) {
		String sql = "update dept set dname=?, ename=? where deptno=?";
		JdbcTemplate template = new JdbcTemplate(dataSource);
		return template.update(sql, new Object[] {dname, loc, deptno});
		
	}
}
