package com.bit.struts.action;

import com.bit.struts.model.DeptDao;
import com.opensymphony.xwork2.Action;

public class UpdateAction implements Action{
	int deptno;
	String id,dname,loc;
	
	
	public int getDeptno() {
		return deptno;
	}


	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getDname() {
		return dname;
	}


	public void setDname(String dname) {
		this.dname = dname;
	}


	public String getLoc() {
		return loc;
	}


	public void setLoc(String loc) {
		this.loc = loc;
	}


	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		DeptDao dao = new DeptDao();
		if(dao.updateOne(id,deptno,dname,loc)>0) {
			return Action.SUCCESS;			
		}else {
			return Action.INPUT;
		}
	}

}
