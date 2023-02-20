package com.bit.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.log4j.Logger;

public class Ex02Filter implements Filter{
	Logger log = Logger.getLogger("com.bit.util.filter.Ex02Filter");
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 1. 현재 web.xml에 작성된 필터 매핑 순서는 02Filter->01Filter 순으로 매핑되어 있기 때문에
		// 2. ex02Filter가 먼저 실행된다.
		log.debug("doFilter ex02");
		// 3. ex02Filter가 실행되고 다른 필터를 chain을 걸어 실행 시켜줘야함
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
