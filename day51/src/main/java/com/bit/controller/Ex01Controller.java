package com.bit.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ex01.do")
public class Ex01Controller extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//첫 GET 요청이 들어오게 되면 JSESSIONID를 생성하여 브라우저에 저장한다.
		
		
		//쿠키 받기
		Cookie[] cookies = req.getCookies();
		if(cookies!=null) {			
			for(Cookie cookie : cookies) {
				String key = cookie.getName();
				String val = cookie.getValue();
				if(key.equals("id")) {
					val = URLDecoder.decode(val,"utf-8");
					req.setAttribute("cookID", val);
				}else if(key.equals("ck")) {
					req.setAttribute("cookCk", "checked");
				}
				
			}
		}
//		String id = cookies[0].getName();
//		System.out.println("req : "+id);
		req.getRequestDispatcher("ex01.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String ck = req.getParameter("ck");
		
		HttpSession session = req.getSession();
		session.setAttribute("id", id);
		
		//id값 바꾸기
		id = URLEncoder.encode(id,"utf-8");
		//응답 시 쿠키 넣기
		Cookie cookie = new  Cookie("id",id); //id로 쿠키 생성
		Cookie cookie2 = new  Cookie("ck",ck); //ck로 쿠키 생성
		cookie.setMaxAge(30);//일주일 설정(24*60*60*7) //쿠키 유효 기간 설정
		resp.addCookie(cookie);
		resp.addCookie(cookie2);
		
		
		
		req.getRequestDispatcher("result.jsp").forward(req, resp);
		
		//localStorage = 브라우저를 껏다 켜도 값이 저장되어 있음
		//SessionStorage = session이 유효할 떄까지 저장
	}
}
