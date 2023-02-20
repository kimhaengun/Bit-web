package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.framework.handler.Controller;

public class IntroController implements Controller{
	public String execute(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return "intro";
	}
}
