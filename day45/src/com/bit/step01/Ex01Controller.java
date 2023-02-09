package com.bit.step01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Ex01Controller implements Servlet{
	ServletConfig config;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		// 서버 종료 시
		System.out.println("destroy");
		
	}

	@Override
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		System.out.println("config");
		return config;
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		System.out.println("info");
		return "테스트삼아 한번 작성하지만 출력 X";
	}

	@Override
	public void init(ServletConfig arg0) throws ServletException {
		// 요청 시 딱한번 실행
		// 객체 생성
		// TODO Auto-generated method stub
		System.out.println("init");
		config=arg0;
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		try {
			//요청 마다 실행
			System.out.println("service");
			out.println("<!doctype html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<meta charset=\"utf-8\">");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>servlet test page 아아아아앙ㄱ</h1>");
			out.println("</body>");
			out.println("</html>");
		}finally {
			out.close();
		}
	}
	
	
}
