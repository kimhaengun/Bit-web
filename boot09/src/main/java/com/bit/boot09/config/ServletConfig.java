package com.bit.boot09.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.bit.boot09.controller.DeptControllerIntercepter;
import com.bit.boot09.service.JWTService;

import lombok.AllArgsConstructor;

@Configuration
@EnableWebMvc
@AllArgsConstructor
public class ServletConfig extends WebMvcConfigurerAdapter{
	final JWTService jwtService;
	@Bean
	PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		registry.addInterceptor(new DeptControllerIntercepter(jwtService));
	}
	
}
