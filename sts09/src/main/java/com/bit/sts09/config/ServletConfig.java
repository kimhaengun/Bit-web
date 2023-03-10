package com.bit.sts09.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@EnableWebMvc //annotation-driven
@ComponentScan("com.bit.sts09") //ComponentScanning 작업 (Mapping 작업)
public class ServletConfig implements WebMvcConfigurer{

	//viewResolver 작업
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		//prefix, subfix 작업 - impliments WebMvcConfigurer
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		//생성한 객체 등록
		registry.viewResolver(resolver);
	}

	//resources dispatch 작업
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**") // mvc:resources mapping="resources/**"
				.addResourceLocations("/resources/"); //location
	}
	
	
}
