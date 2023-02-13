package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.CommunityDao;

public class WriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("게시글 작성 페이지 요청");
		String id = req.getParameter("userId");
		System.out.println("로그인 유저 : "+id);
		if(id==null || "".equals(id)) {
			RequestDispatcher rd =req.getRequestDispatcher("loginForm.jsp");	
		}		
		RequestDispatcher rd =req.getRequestDispatcher("writeForm.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 게시글 작성
		req.setCharacterEncoding("UTF-8");
		String id=req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
//		System.out.println("POST !! "+id+" : "+title+" : "+content);
		CommunityDao dao = new CommunityDao();
		int result = 0;
		try {
			result = dao.write(id, title, content);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result==1) {
			//정상
			resp.sendRedirect("list");
		}else {
			//실패
			resp.sendRedirect("write");
		}
	}
}
