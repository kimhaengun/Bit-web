package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.ReplyDao;

public class ReplyEditController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int replyNo = Integer.parseInt(req.getParameter("replyNo"));
		String content = req.getParameter("content");
		System.out.println("변경 요청 들어옴!!!!!"+replyNo+" : "+content);
		ReplyDao dao = new ReplyDao();
		try {
			int result = dao.editOne(replyNo, content);
			PrintWriter out = resp.getWriter();
			if(result>0) {
				//삭제 성공
				out.print("ok");
			}else {
				//삭제 실패
				out.print("fail");
			}
			out.flush();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
