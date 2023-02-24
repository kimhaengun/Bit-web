package com.bit.action;

import com.opensymphony.xwork2.Action;

public class Ex01Action implements Action {

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ex01");
		return Action.SUCCESS;
	}

}
