package com.bit.boot05.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.boot05.domain.DeptRepo;
import com.bit.boot05.domain.entity.DeptVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DeptService {

	@Autowired
	DeptRepo deptRepo;
	
	public List<?> selectAll(){
		return deptRepo.findAll();
	}
	
}
