package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.framework.handler.Controller;

public class IndexController implements Controller{

	public String execute(HttpServletRequest req) {
		// TODO Auto-generated method stub

			return "index";

	}

}
