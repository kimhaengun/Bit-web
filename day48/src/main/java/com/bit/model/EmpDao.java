package com.bit.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class EmpDao {
	Logger log = Logger.getGlobal();
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getConnection(){
		String url="jdbc:mysql://localhost:3306/lecture";
		String user = System.getenv("MYSQL_USER");
		String password = System.getenv("MYSQL_PW");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			if(conn==null || conn.isClosed()) {
				conn=DriverManager.getConnection(url, user, password);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public int deleteOne(int empno) throws SQLException {
		String sql = "delete from emp where empno=?";
		getConnection();
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, empno);
		int result = pstmt.executeUpdate();
		log.info("delete result:"+result);
		return result;
	}
	
	public int editOne(String ename, int sal, int comm,int mgr, int empno) throws SQLException {
		String sql = "update emp set ename=?, sal=?, comm=?, mgr=? where empno=?";
		try {
			getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ename);
			pstmt.setInt(2, sal);
			pstmt.setInt(3, comm);
			pstmt.setInt(4, mgr);			
			pstmt.setInt(5, empno);
			int result = pstmt.executeUpdate();
			log.info("update cnt="+result);
			return result;
		}finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();	
		}
		
	}
	public EmpDto getOne(int empno) throws SQLException {
		String sql = "select * from emp where empno=?";
		EmpDto bean = new EmpDto();
		try {
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setComm(rs.getInt("comm"));
				bean.setEmpno(rs.getInt("empno"));
				bean.setEname(rs.getString("ename"));
				bean.setHiredate(rs.getDate("hiredate"));
				bean.setJob(rs.getString("job"));
				bean.setMgr(rs.getInt("mgr"));
				bean.setSal(rs.getInt("sal"));
				log.info(bean.toString());
			}
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();			
		}
		
		return bean;
	}
	public int pushList(int empno, String ename, int sal) throws SQLException {
		String sql = "insert into emp (empno,ename,hiredate,sal) values (?,?,now(),?)";
		try {	
			getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
			pstmt.setString(2, ename);
			pstmt.setInt(3, sal);
			return pstmt.executeUpdate();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				log.severe(e2.toString());
			}
		}
		
				
	}
	public List<EmpDto> getList() throws SQLException{
		String sql = "select * from emp";
		List<EmpDto> list = null;
		list = new ArrayList<EmpDto>();
		
		try {
			getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				EmpDto bean = new EmpDto();
				bean.setEmpno(rs.getInt("empno"));
				bean.setEname(rs.getString("ename"));
				bean.setHiredate(rs.getDate("hiredate"));
				bean.setSal(rs.getInt("sal"));
//				System.out.println(bean);
				log.info(bean.toString());
//				System.err.append("에러");
				list.add(bean);
			}
		}finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				log.severe(e2.toString());
			}
		}
		//info<warning<severe
//		log.setLevel(Level.SEVERE);
//		log.config("config list size : "+list.size());
//		log.fine("fine list size : "+list.size());
//		log.finer("finer list size : "+list.size());
//		log.finest("finest list size : "+list.size());
//		log.severe("severe list size : "+list.size());
//		log.warning("warning list size : "+list.size());
//		log.info("info list size : "+list.size());
		return list;
	}
}
