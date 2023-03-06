package com.bit.sts04.step01;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.sts04.model.DeptVo;

@Controller
public class Ex05Controller {

	@RequestMapping( value = "/ex11", method = {RequestMethod.GET,RequestMethod.POST})
	public String ex05() {
		
		return "ex01";
	}
	@RequestMapping(value = "/ex12", method= {RequestMethod.POST})
	public String ex12(
			//@requestParam 생략가능 = 파라매터와 파람 값이 같을 경우
			String dname,
			int deptno,
			Model model) {
		System.out.println("dname:"+dname);
		System.out.println("deptno:"+deptno);
		
		model.addAttribute("dname", dname);
		model.addAttribute("deptno", deptno);
		return "ex02";
	}
	
	@RequestMapping(value = "/ex13/{deptno}")
	public String ex13(
			// @PathVariable 일 경우 이름이 같으면 value값을 생략할 수 있지만 어노테이션은 생략 불가능 --> default값이 requestParam이기 때문에
			@PathVariable int deptno
			) {
		System.out.println(deptno);
		return "ex03";
	}
	
	
	@RequestMapping("/ex14")
	public String ex14(@ModelAttribute("bean") DeptVo bean) {
		bean.setDeptno(2222);
		bean.setDname("test2");
		bean.setLoc("test2");

		return "ex04";
	}
}
