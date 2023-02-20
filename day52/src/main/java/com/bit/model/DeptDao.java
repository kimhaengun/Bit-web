package com.bit.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.bit.framework.jdbc.JdbcTemplate;
import com.mysql.cj.jdbc.MysqlDataSource;

public class DeptDao {
	String className="com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/lecture";
	String user = "scott";
	String password="tiger";
	private Connection getConnection(){
		try {
			Class.forName(className);
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		 
	}
	private DataSource getDataSource() {
		MysqlDataSource dataSource = new MysqlDataSource();
		dataSource.setURL(url);
		dataSource.setUser(user);
		dataSource.setPassword(password);
		return dataSource;
	}
	JdbcTemplate template = new JdbcTemplate() {
		public Object mapper(ResultSet rs) throws SQLException {
			DeptDto bean = new DeptDto();
			bean.setDeptno(rs.getInt("deptno"));
			bean.setDname(rs.getString("dname"));
			bean.setLoc(rs.getString("loc"));
			return bean;
		};
	};
	
	public List<DeptDto> selectAll(){
		String sql = "select * from dept";

		template.setDataSource(getDataSource());
		return template.queryForAll(sql,new Object[] {});
	}
	public DeptDto selectOne(int deptno){
		String sql = "select * from dept where deptno=?";

		template.setDataSource(getDataSource());
		return (DeptDto) template.queryForAll(sql,new Object[] {deptno}).get(0);
	}
	
	public int insertOne(int deptno, String dname, String loc) {
		String sql = "insert into dept values (?,?,?)";
		Object[] objs = {deptno, dname, loc};

		template.setDataSource(getDataSource());
		return template.update(sql, objs);
	}
	
	public int UpdateOne(int deptno, String dname, String loc) {
		String sql = "update dept set dname=?, loc=? where deptno=?";
		Object[] objs = {dname, loc, deptno};

		template.setDataSource(getDataSource());
		return template.update(sql,objs);
	}
	public int DeleteOne(int deptno) {
		String sql = "delete from dept where deptno=?";

		Object[] objs = {deptno};
		template.setDataSource(getDataSource());
		return template.update(sql, objs);
	}

	public  Object setRs(ResultSet rs) throws SQLException {
		DeptDto bean = new DeptDto();
		bean.setDeptno(rs.getInt("deptno"));
		bean.setDname(rs.getString("dname"));
		bean.setLoc(rs.getString("loc"));
		return bean;
	}
}
