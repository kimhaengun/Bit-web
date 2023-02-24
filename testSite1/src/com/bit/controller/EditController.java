package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.CommunityDao;
import com.bit.dto.CommunityDto;

public class EditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int communityNo = Integer.parseInt(req.getParameter("communityNo"));
//		System.out.println("수정 GET 요청"+communityNo);
		CommunityDao dao = new CommunityDao();
		CommunityDto dto = dao.selectOne(communityNo);
		req.setAttribute("dto", dto);
		
		RequestDispatcher rd = req.getRequestDispatcher("editForm.jsp");
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		int communityNo = Integer.parseInt(req.getParameter("communityNo"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		System.out.println("수정 POST 요청 "+communityNo+" : "+title+" : "+content);
		CommunityDao dao= new CommunityDao();
		try {
			 dao.editOne(communityNo, title, content);
			 resp.sendRedirect("detail?communityNo="+communityNo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
