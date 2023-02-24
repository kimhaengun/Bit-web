package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.UserDao;

public class IdCheckController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("cmd");
		System.out.println("유저체크 COnt, "+id);
		UserDao dao = new UserDao();
		try {
			int result = dao.selectOne(id);
			PrintWriter out = resp.getWriter();
			System.out.println(result);
			if(result==1) {
				//유저 있음 = ok
				out.print("ok");
			}else {
				//유저 없음 = fail
				out.print("fail");
			}
			out.flush();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
