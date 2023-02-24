package com.bit.struts.action;

import org.apache.logging.log4j.LogManager;

import com.opensymphony.xwork2.Action;

public class SuccessAction implements Action {
	org.apache.logging.log4j.Logger log = LogManager.getLogger(SuccessAction.class);
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		log.debug("index");
		return Action.SUCCESS;
	}

}
