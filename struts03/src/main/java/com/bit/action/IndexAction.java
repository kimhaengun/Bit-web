package com.bit.action;

import com.opensymphony.xwork2.Action;

public class IndexAction implements Action {

	@Override
	public String execute() throws Exception {
		System.out.println("Action 실행!");
		//결과에 따른 success or error
		return Action.SUCCESS;
	}

}
