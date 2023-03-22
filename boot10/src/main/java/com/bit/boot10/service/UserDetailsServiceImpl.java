package com.bit.boot10.service;


import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService{
	final PasswordEncoder passwordEncoder;
	//클라이언트에서 로그인 클릭 시 호출되는 함수
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// 1. FindById로 DB에서 해당 유저를 찾기
		//  ex) DeptVo bean = findByDname(username);  //JPA
		System.out.println("받은 userId : "+username);
		return User.builder()   //.withDefaultPasswordEncoder() << 사라져서 못쓰는 함수임
							.username("user01")  //ex) bean.username
							.password(passwordEncoder.encode("1234")) //ex) bean.password
							.roles("USER")
							.build();
	}
	
}
