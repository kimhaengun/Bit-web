package com.bit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServlet;

public class UserDao{
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet result;
	//DB
	public void getConnection(){
		String url="jdbc:mysql://localhost:3306/myweb";
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
	
	public int selectOne(String id) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM USER WHERE id=?";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeQuery();
			if(result.next()) {
				//유저가 있음
				return 1;
			}
				
		}finally {
			try {
				if(result!=null)result.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();							
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		//유저 없음
		return 0;
	}

}
