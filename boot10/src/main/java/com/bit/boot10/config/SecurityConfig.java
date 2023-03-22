package com.bit.boot10.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		// permitAll()함수가 붙은 주소 요청은 권한 따지지않고 언제든지 접속할 수 있도록 허용하는 함수
		http
			.authorizeHttpRequests((requests) -> requests
				.antMatchers("/", "/ex01").permitAll()
				.anyRequest().authenticated()
			)
			.formLogin((form) -> form
				.loginPage("/login") //내가 지정(만든)한 로그인 페이지를 출력해줌
				.permitAll()
			)
			.logout((logout) -> logout
											.logoutSuccessUrl("/")
											.permitAll())
			.csrf().disable()     //csrf 제거? 해결?
			;

		return http.build();
	}
	
//	@Bean
//	UserDetailsService userDetailsService() {
//		UserDetails user =
//			//기본적으로 제공해주는 userId, password를 재설정하는 부분
//			 User.withDefaultPasswordEncoder()
//				.username("user01")
//				.password("1234")
//				.roles("USER")
//				.build();
//
//		return new InMemoryUserDetailsManager(user,
//				// 유저 추가 생성 (더미)
//				User.withDefaultPasswordEncoder().username("user02").password("1234").roles("USER").build(),
//				User.withDefaultPasswordEncoder().username("user03").password("1234").roles("USER").build());
//	}
	
}
