package com.bit.boot09.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpCookie;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bit.boot09.model.ResponseDeptVo;
import com.bit.boot09.service.JWTService;

import lombok.RequiredArgsConstructor;
import lombok.val;


@RequiredArgsConstructor
@RestController
public class HomeController {

	final JWTService jwtService;
	
	@GetMapping
	public String index() {
		return "<h1>ind</h1>";
	}
	
	@GetMapping("/join")
	public String join() {
		System.out.println("컨트롤러 키 : "+jwtService.createHS256());
		return jwtService.createHS256();
	}
	@GetMapping("/join2")
	public String join2(HttpServletResponse resp) {
		String value = " Bearer "+jwtService.createHS256();
		value = Base64.encodeBase64String(value.getBytes());
		System.out.println("value : "+value);
		Cookie cook = new Cookie("Authorization", value);
//		cook.setHttpOnly(true);
//		cook.setDomain("http://localhost:8080/");
//		cook.setMaxAge(10000);
		resp.addCookie(cook);
		return "<h1>쿠키 등록</h1>";
	}
	
	@GetMapping("/cookie")
	public String cookie(HttpServletRequest req) {
		Cookie cook = req.getCookies()[0];
		String value = cook.getValue();
		value = new String(Base64.decodeBase64(value)); //decode  시 String으로 변환해주는 함수가 없기 떄문에 String으로 받기
		return value;
		
	}
	
	@GetMapping("/api/dept/")
	public List<ResponseDeptVo> list() {
		return List.of(
				ResponseDeptVo.builder().deptno(1111).dname("name1").loc("loc1").build(),
				ResponseDeptVo.builder().deptno(2222).dname("name2").loc("loc2").build(),
				ResponseDeptVo.builder().deptno(3333).dname("name3").loc("loc3").build(),
				ResponseDeptVo.builder().deptno(4444).dname("name4").loc("loc4").build()
				);
	}
	
}
