package com.bit.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeptDao {
	
	public List<DeptDto> selectAll(){
		String sql = "select * from dept";
		List<DeptDto> list = new ArrayList<DeptDto>();
		String className="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/lecture";
		String user = "scott";
		String password="tiger";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(className);
			conn=DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				DeptDto bean = new DeptDto();
				bean.setDeptno(rs.getInt("deptno"));
				bean.setDname(rs.getString("dname"));
				bean.setLoc(rs.getString("loc"));
				list.add(bean);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	public DeptDto selectOne(int deptno){
		String sql = "select * from dept where deptno=?";
		String className="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/lecture";
		String user = "scott";
		String password="tiger";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(className);
			conn=DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				DeptDto bean = new DeptDto();
				bean.setDeptno(rs.getInt("deptno"));
				bean.setDname(rs.getString("dname"));
				bean.setLoc(rs.getString("loc"));
				return bean;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return null;
	}
	
	public int insertOne(int deptno, String dname, String loc) {
		String sql = "insert into dept values (?,?,?)";
		String className="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/lecture";
		String user = "scott";
		String password="tiger";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
				Class.forName(className);
				conn=DriverManager.getConnection(url, user, password);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, deptno);
				pstmt.setString(2, dname);
				pstmt.setString(3, loc);
			return pstmt.executeUpdate();
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return 0;
	}
	
	public int UpdateOne(int deptno, String dname, String loc) {
		String sql = "update dept set dname=?, loc=? where deptno=?";
		String className="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/lecture";
		String user = "scott";
		String password="tiger";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(className);
			conn=DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dname);
			pstmt.setString(2, loc);
			pstmt.setInt(3, deptno);
			return pstmt.executeUpdate();
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return 0;
	}
	public int DeleteOne(int deptno) {
		String sql = "delete from dept where deptno=?";
		String className="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/lecture";
		String user = "scott";
		String password="tiger";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(className);
			conn=DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			return pstmt.executeUpdate();
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return 0;
	}
	
	
	
}
