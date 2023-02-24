package com.bit.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeptDao {
	private String url;
	private String user;
	private String password;
	public DeptDao(String url, String user, String password) {
		this.url = url;
		this.user=user;
		this.password=password;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<DeptDto> getList() throws SQLException{
		String sql = "select * from dept";
		List<DeptDto> list = new ArrayList<DeptDto>();
		//auto close
		try (
				Connection conn=DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt=conn.prepareStatement(sql);
				ResultSet rs=pstmt.executeQuery();
			){
			while(rs.next()) {
				DeptDto bean = new DeptDto();
				bean.setDeptno(rs.getInt("deptno"));
				bean.setDname(rs.getString("dname"));
				bean.setLoc(rs.getString("loc"));
				list.add(bean);
			}
		}
		return list;
	}
	public void insertOne(int deptno, String dname, String loc) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into dept values (?,?,?)";
		try(
				Connection conn = DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql);
				){
					pstmt.setInt(1, deptno);
					pstmt.setString(2, dname);
					pstmt.setString(3, loc);
					pstmt.executeUpdate();
					
				}
	}
	public DeptDto selectOne(int deptno) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select * from dept where deptno=?";
		try(
				//괄호 안은 auto close 작업만 가능
				Connection conn = DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql);
				){
				pstmt.setInt(1, deptno);
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()) {
					DeptDto bean = new DeptDto();
					bean.setDeptno(rs.getInt("deptno"));
					bean.setDname(rs.getString("dname"));
					bean.setLoc(rs.getString("loc"));
					return bean;
				}
		
		}
		return null;
	}
	public int editOne(int deptno, String dname, String loc) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "update dept set dname=?, loc=? where deptno=?";
		try(
				Connection conn = DriverManager.getConnection(url, user, password);
				PreparedStatement pstmt = conn.prepareStatement(sql);
				){
				pstmt.setString(1, dname);
				pstmt.setString(2, loc);
				pstmt.setInt(3, deptno);
				return pstmt.executeUpdate();
		}
	}
}


