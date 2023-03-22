package com.bit.boot13;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bit.boot13.model.DeptVo;
import com.bit.boot13.utils.JwtUtil;

@RestController
@RequestMapping("/")
public class ApiController {
	
	@Autowired
	JwtUtil jwtUtil;
	
	@GetMapping("/token")
	public String getToken() {
		return jwtUtil.createJwt(); 
	}
	
	@GetMapping("/api/dept")
	public ResponseEntity<?> getList(){
		return ResponseEntity.ok().body(
										List.of(
												DeptVo.builder().deptno(1111).dname("tester").loc("test").build()
												,DeptVo.builder().deptno(2222).dname("tester2").loc("test2").build()
												,DeptVo.builder().deptno(3333).dname("tester3").loc("test3").build()
												,DeptVo.builder().deptno(4444).dname("tester4").loc("test4").build()
												));
	}
}
