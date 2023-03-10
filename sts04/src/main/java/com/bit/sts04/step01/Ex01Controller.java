package com.bit.sts04.step01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// Controller의 역할 --> handlerMapping
// 특정 url로 접근했을 경우 해당 url에 맞게 수행
@org.springframework.stereotype.Controller
public class Ex01Controller implements Controller {

	@RequestMapping("/ex01.do")
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		return new ModelAndView("ex01");
	}

}
