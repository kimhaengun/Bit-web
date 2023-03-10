package com.bit.sts09.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		//root-context.xml 역할
		return new Class[] {RootConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		// web.xml의 <servlet> 코드 = servlet-context.xml
		// dispatchservlet 역할	
		return new Class[] {ServletConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		// web.xml의 <servlet-mapping> 코드
		return new String[] {"/"};
	}

	//utf-8 encodingFilter
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter encodingFilter=null;
		encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("utf-8");
		return new Filter[] {
			encodingFilter
		};
	}
}
