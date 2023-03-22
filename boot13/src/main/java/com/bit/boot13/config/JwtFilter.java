package com.bit.boot13.config;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import com.bit.boot13.utils.JwtUtil;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class JwtFilter extends OncePerRequestFilter {

	final JwtUtil jwtUtil;
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		//토큰 받기
		String authorization =  request.getHeader("authorization");
		if(authorization==null || !authorization.startsWith("Bearer ")) {
			filterChain.doFilter(request, response);
			return;
		}
		
		authorization = authorization.replace("Bearer ", "");
		System.out.println("authorization : "+ authorization);
		//내가만든 토큰인지 확인하기
		Jws<Claims> jws = jwtUtil.getJwt(authorization);
		if(jws==null  ) { //시간 체크 || jwtUtil.
			System.out.println("없너");
			filterChain.doFilter(request, response);
			return;
		}
		// 정상 통큰일 경우
		String ename = jwtUtil.getJwtName(authorization);
		System.out.println("정상 토큰임 : "+ename);
		//인증 처리
		SecurityContext context =  SecurityContextHolder.getContext();
		context.setAuthentication(new UsernamePasswordAuthenticationToken(ename, null, List.of(new SimpleGrantedAuthority("USER"))));
		filterChain.doFilter(request, response);
	}


}
