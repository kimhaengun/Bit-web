package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.ReplyDao;


public class ReplyWriteController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
//		System.out.println("댓글 POST 요청옴");
//		System.out.println(req.getParameter("communityNo"));
		int communityNo=Integer.parseInt(req.getParameter("communityNo"));
		String id = req.getParameter("id");
		String content = req.getParameter("content"); 
		ReplyDao dao = new ReplyDao();
			try {
				//부모 댓글 작성
				//positions 가져오기
				int positions = dao.selectCount(communityNo);
				positions += 1;
				System.out.println("positions : "+positions);
				dao.write(communityNo,id,content,positions);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
}
