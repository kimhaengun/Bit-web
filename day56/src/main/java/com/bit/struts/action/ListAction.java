package com.bit.struts.action;

import java.util.Arrays;
import java.util.List;

import com.bit.struts.model.DeptDao;
import com.bit.struts.model.DeptVo;
import com.opensymphony.xwork2.Action;

public class ListAction implements Action {
	private List<DeptVo> list;
	public List<DeptVo> getList() {
		return list;
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
//		list = Arrays.asList(
//					new DeptVo(1111,"test1","test1"),
//					new DeptVo(2222,"test2","test2"),
//					new DeptVo(3333,"test3","test3"),
//					new DeptVo(4444,"test4","test4"));
		list = new DeptDao().findAll();
		return Action.SUCCESS;
	}

}
