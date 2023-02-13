package com.bit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bit.dto.CommunityDto;

public class CommunityDao {
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	//DB 연결
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
	//게시글 리스트
	public List<CommunityDto> listAll() {
		// TODO Auto-generated method stub
		String sql = "select communityNo, id, title, DATE_FORMAT(hiredate, \"%Y-%m-%d\") as hiredate, counts from community ORDER BY communityNo desc";
		List<CommunityDto> list = null;
		list = new ArrayList<CommunityDto>();
		getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				CommunityDto dto = new CommunityDto();
				dto.setCommunityNo(rs.getInt("communityNo"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setHiredate(rs.getDate("hiredate"));
				dto.setCounts(rs.getInt("counts"));
				System.out.println(dto.toString());
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return list;
	}
	//게시글 작성
	public int write(String id, String title, String content) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into community (id,title,content) values(?,?,?)";
		try {
			getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setNString(3, content);
			return pstmt.executeUpdate();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
	}
	public CommunityDto selectOne(int no) {
		// TODO Auto-generated method stub
		CommunityDto dto = new CommunityDto();
		String sql = "SELECT communityNo, id, title, content, hiredate, counts FROM community WHERE communityNo=?";
		getConnection();
		try {
			//조회수 증가
			pstmt = conn.prepareStatement("update community set counts=counts+1 where communityNo=?");
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setCommunityNo(rs.getInt("communityNo"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setHiredate(rs.getDate("hiredate"));
				dto.setCounts(rs.getInt("counts"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();							
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		System.out.println("디테일 Dto : "+dto.toString());
		return dto;
	}

	
	
}
