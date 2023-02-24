package com.bit.struts.action;

import com.bit.struts.model.DeptDao;
import com.opensymphony.xwork2.Action;

public class AddAction implements Action {
	int deptno;
	String dname;
	String loc;
	
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if(deptno==0||dname.isEmpty()||loc.isEmpty()) {
			return Action.INPUT;
		}
		DeptDao dao = new DeptDao();
		dao.addOne(deptno,dname,loc);
		return Action.SUCCESS;			
		
	}

}
