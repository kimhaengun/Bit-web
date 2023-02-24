package com.bit.controller;

import javax.servlet.http.HttpServletRequest;

import com.bit.frame.web.Controller;
import com.bit.model.DeptDao;

public class ListController implements Controller {

	@Override
	public String execute(HttpServletRequest req) {
		// TODO Auto-generated method stub
		DeptDao deptDao = new DeptDao();
		req.setAttribute("list", deptDao.selectAll());
		return "dept/list";
	}

}
