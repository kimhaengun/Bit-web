package com.bit.sts04.step01;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.*;

@Controller
@RequestMapping("/lec02")
public class Ex02Controller{

	@RequestMapping("/ex02.do")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return new ModelAndView("ex02");
	}

	@RequestMapping("/ex03.do")
	public ModelAndView ex03(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return new ModelAndView("ex03");
	}

	@RequestMapping("/ex04.do")
	public String ex04(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		return new View() {
//
//			@Override
//			public String getContentType() {
//				// TODO Auto-generated method stub
//				return "application/json; charset=utf-8";
//			}
//
//			@Override
//			public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response)
//					throws Exception {
//				// TODO Auto-generated method stub
//				PrintWriter out = response.getWriter();
////				out.print("<html>");
////				out.print("<body>");
////				out.print("<h2>my view page</h2>");
////				out.print("</body>");
////				out.print("</html>");
//				out.print("{}");
//			}
//		};
		return "ex04";
	}
	
	@RequestMapping("/ex05.do")
	public String Ex05(HttpServletRequest request) {
		//request, response는 필요시 매개변수로 받아서 알아서 사용하면 됨
		System.out.println(request.getMethod());
		return "ex05";
	}
	
}
