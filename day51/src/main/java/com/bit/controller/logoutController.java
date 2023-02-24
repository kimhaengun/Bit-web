package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout.do")
public class logoutController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		//세션 삭제 방법
		//1.
//		session.setAttribute("id", null);
		//2.
//		session.removeAttribute("id");
		//3.삭제 보다는 세션을 갱신해서 새로운 세션을 만듬
		session.invalidate();
		req.getRequestDispatcher("ex02.jsp").forward(req, resp);
	}
}
