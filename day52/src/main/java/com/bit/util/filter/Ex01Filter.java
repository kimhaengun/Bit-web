package com.bit.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.log4j.Logger;

public class Ex01Filter implements Filter{
	Logger log = Logger.getLogger("com.bit.util.filter.Ex01Filter");
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		log.debug("시작 시");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 4. 02Filter가 실행되고 chain으로 인해 01Filter가 실행됨.
		log.debug("서비스 시!!!!!");
		// 5. 01filter가 실행되고 난 후 필터는 서블릿 이전에 실행되기 떄문에
		//    서블릿을 chain을 걸어 실행 시켜줘야함.
		log.debug("before ex01filter");
		chain.doFilter(request, response);
		log.debug("after ex01filter");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		log.debug("종료 시");
	}

}
