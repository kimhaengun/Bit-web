package com.bit.boot05.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.boot05.domain.entity.Dept2;
import com.bit.boot05.service.DeptService;

@Controller
@RequestMapping("/api/")
public class DeptController {

	@Autowired
	DeptService deptService;

	@GetMapping
	public List findAll(){
		System.out.println("컨트롤러 검색 : "+deptService.selectAll());
		return deptService.selectAll();
	}
}
