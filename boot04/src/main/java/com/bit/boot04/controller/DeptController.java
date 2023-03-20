package com.bit.boot04.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bit.boot04.model.DeptVo;
import com.bit.boot04.service.DeptService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api")
@CrossOrigin
public class DeptController {
	
	
	@Autowired
	DeptService deptService;
	
	@GetMapping
	public List<?> list() {
		return deptService.selectAll();
	}
	
	@GetMapping("/{deptno}")
	public ResponseEntity<?> detail(@PathVariable int deptno) {
		
		DeptVo bean = deptService.selectOne(deptno);
		if(bean!=null) {
			return ResponseEntity.ok(bean);
		}else {
			return ResponseEntity.notFound().build();
		}
	}
	
	@PostMapping
	public ResponseEntity<?> add(@RequestBody DeptVo bean){
		try {
			deptService.insertOne(bean);
		} catch (Exception e) {
			return ResponseEntity.badRequest().build();
		}
		return ResponseEntity.ok().build();
	}
	
	@PutMapping("/{deptno}")
	public ResponseEntity<?> edit(@RequestBody DeptVo bean){
//	public ResponseEntity<?> edit(@ModelAttribute DeptVo bean){
		//ModelAttribute --> 받는 데이터 형식이 x-www-form-urlencoded
		//RequestBody --> json 데이터로 보낼경우 
		
		if(deptService.updateOne(bean)>0) 
			return ResponseEntity.ok().build();
		return ResponseEntity.badRequest().build();
	}
	
	@DeleteMapping("/{deptno}")
	//Deletemaping 은 body에 데이터를 담을수 없기 때문에 PathVariable로 값을 받아야 한다.
	public ResponseEntity<?> delete(@PathVariable int deptno){
		
		if(deptService.deleteOne(deptno) > 0) {
			return ResponseEntity.ok().build();			
		}else {
			System.out.println("값ㅇ벗...");
			return ResponseEntity.badRequest().build();			
		}
	}
	
	
}
