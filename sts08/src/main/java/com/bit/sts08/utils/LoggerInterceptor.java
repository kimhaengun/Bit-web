package com.bit.sts08.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerAdapter;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor 
							extends HandlerInterceptorAdapter{ 
								//implements HandlerInterceptor{
	
	//controller or view에 aop가 필요할 경우 aop 보단 interceptor를 사용하는게 더 효율적임
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("controller 호출 전"+request);
		//ex)
		//특정 조건을 만족하지 않을 경우 페이지 이동
		//request.getRequestDispatcher("/WEB-INF/views/down.jsp").forward(request, response);
		//return false;
		//return false일 경우 block 당함 --> session을 확인해서 session이 없을 경우 block을 거는 방식을 사용할 수 있다. (request.getSession())
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("controller 호출 후"+modelAndView.getViewName());
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//에러가 있을 경우 
		System.out.println("viewResolver 후"+ex.toString());
		
	}

}
