package com.bit.sts06.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.sts06.model.DeptDao;
import com.bit.sts06.model.DeptVo;

import lombok.Setter;

@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
//	@Setter
	DeptDao deptDao;
	
	@Override
	public List<DeptVo> selectAll(){
		return deptDao.findAll();
	}

	@Transactional
	@Override
	public void insertOne(DeptVo bean) {
		// TODO Auto-generated method stub
		deptDao.insertOne(bean);
	}

	@Override
	public DeptVo selectOne(int deptno) {
		// TODO Auto-generated method stub
		return deptDao.findObject(deptno);
	}

	@Transactional
	@Override
	public int updateOne(DeptVo bean) {
		// TODO Auto-generated method stub
		return deptDao.updateOne(bean);
	}

	@Transactional
	@Override
	public int deleteOne(int deptno) {
		// TODO Auto-generated method stub
		return deptDao.deleteOne(deptno);
	}
	
	
	
}
