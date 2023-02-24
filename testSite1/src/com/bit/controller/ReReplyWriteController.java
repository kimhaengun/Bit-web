package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.ReplyDao;


public class ReReplyWriteController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		System.out.println("대댓글 POST 요청옴");
		int communityNo=Integer.parseInt(req.getParameter("communityNo"));
		String id = req.getParameter("id");
		String content = req.getParameter("content");
		int positions = Integer.parseInt(req.getParameter("positions"));
		int depth=2;
		ReplyDao dao = new ReplyDao();
		try {
			
			dao.write(communityNo,id,content,positions,depth);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
