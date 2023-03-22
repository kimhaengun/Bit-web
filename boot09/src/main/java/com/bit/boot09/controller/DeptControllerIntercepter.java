package com.bit.boot09.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.HandlerInterceptor;

import com.bit.boot09.service.JWTService;

import lombok.AllArgsConstructor;

//@RestControllerAdvice
@AllArgsConstructor
public class DeptControllerIntercepter implements HandlerInterceptor{
	final JWTService jwtService;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getRequestURI().toString().startsWith("/api/")) {
			//    /api/ 요청이 오면 interceptor가 실행됨
			String authorization = request.getHeader("Authorization");
			if(authorization==null) {
				//만약 authorization 이 없을 경우 = 로그인이 안된 요청
				response.sendRedirect("/login");
				return false;
			}else {
				System.out.println("authorization : "+authorization);				
				String token = authorization.split(" ")[1];
				//eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhdXRoMCIsInVzZXIiOiJ1c2VyMDIifQ.n9X-6ne_EZ2hZGCcTf-LkoGTfbmDbVvqtSDldrrmO3s
				System.out.println("token : "+token);
				String user =  jwtService.verify(token);
				System.out.println("user : "+user);
				if(user==null) {
					response.sendRedirect("/login");
					return false;
				}
					
			}
			
		}
		return true;
	}
	
}
