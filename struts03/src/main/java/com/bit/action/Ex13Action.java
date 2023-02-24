package com.bit.action;

import com.opensymphony.xwork2.Action;

public class Ex13Action implements Action{
	String id ;
	String pw;
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("id??"+id);
		System.out.println("pw??"+pw);
		return Action.SUCCESS;
	}

}
