package com.bit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class indexController
 */
@WebServlet("/index.do")
public class indexController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인이 안되어 있으면 로그인 페이지로
		HttpSession session = request.getSession();
		if(session.getAttribute("id")==null) {
			response.sendRedirect("ex01.do");	
		}else {
			request.getRequestDispatcher("index.jsp").forward(request, response);			
		}
		
		
	}

}
