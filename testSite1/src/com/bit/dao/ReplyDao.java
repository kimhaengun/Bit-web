package com.bit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.dto.ReplyDto;

public class ReplyDao {
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
	//댓글 리스트
	public List<ReplyDto> selectAll(int no) throws SQLException {
		String sql = "select replyNo, id, content, positions, depth, hiredate FROM reply WHERE communityNo=? ORDER BY positions DESC, depth, hiredate desc";
		
		List<ReplyDto> list = null;
		list = new ArrayList<ReplyDto>();
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReplyDto dto = new ReplyDto();
				dto.setReplyNo(rs.getInt("replyNo"));
//				System.out.println("댓글리스트1"+dto.toString());
//				System.out.println(rs.getString("id"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setPosistions(rs.getInt("positions"));
				dto.setDepth(rs.getInt("depth"));
				dto.setHiredate(rs.getString("hiredate"));
				dto.setCommunityNo(no);
//				System.out.println("댓글리스트2"+dto.toString());
				list.add(dto);
			}
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

	//positions 구하기 = 모댓글no
	public int selectCount(int no) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT MAX(positions) AS positions FROM reply";
		getConnection();
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
				
			}
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();							
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return result;
	}
	//모댓글 작성
	public int write(int no,String id, String content, int positions)throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into reply (communityNo, id, content, positions) values (?,?,?,?)";
		try {
			getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, id);
			pstmt.setString(3, content);
			pstmt.setInt(4, positions);
			return pstmt.executeUpdate();
		}finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
	}
	//대댓글작성 (자식)
	public int write(int communityNo, String id, String content, int positions, int depth) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "insert into reply (communityNo, id, content, positions, depth) values (?,?,?,?,?)";
		try {
			getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, communityNo);
			pstmt.setString(2, id);
			pstmt.setString(3, content);
			pstmt.setInt(4, positions);
			pstmt.setInt(5, depth);
			return pstmt.executeUpdate();
		}finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	//댓글 수정
	public int editOne(int replyNo, String content) throws SQLException {
		String sql = "update reply set content=? where replyNo=?";
		getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, replyNo);
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
	
	//댓글 삭제
	public int deleteOne(int replyNo) throws SQLException {
		String sql = "update reply set content=\"삭제된 댓글 입니다.\" where replyNo=?";
		getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
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
}
