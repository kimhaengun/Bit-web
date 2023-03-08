package com.bit.sts06;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.sts06.model.DeptVo;
import com.bit.sts06.service.DeptService;
/*
 get    /dept/      list,addform
 get    /dept/1111 detail,editform
 post   /dept/     insert
 put    /dept/1111 update
 delete /dept/1111 delete
 * */
@Controller
@RequestMapping("/dept")
public class DeptController {

	@Autowired
	DeptService deptService;
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String list(Model model) {
//		DeptVo bean = new DeptVo(2222,"test2","test2-2");
		model.addAttribute("list",deptService.selectAll());
		System.out.println("c : "+deptService.selectAll());
		return "dept/list";
	}
	
	@RequestMapping(value = "/",method = RequestMethod.POST)
	public String add(@ModelAttribute("bean") DeptVo bean) {
		deptService.insertOne(bean);
		return "redirect:./";
	}
	
	@RequestMapping(value = "/{deptno}",method = RequestMethod.GET)
	public String detail(@PathVariable("deptno") int deptno, Model model) {
		model.addAttribute("bean",deptService.selectOne(deptno));
		return "dept/detail";
	}
	
	@RequestMapping(value = "/{deptno}", method = RequestMethod.PUT)
	public String update(@ModelAttribute("bean") DeptVo bean) {
//		System.out.println("put 요청 들엉옴?"+bean);
		deptService.updateOne(bean);
		return "redirect:./";
	}
	@RequestMapping(value = "/{deptno}", method = RequestMethod.DELETE)
	public String delete(@PathVariable int deptno) {
//		System.out.println("put 요청 들엉옴?"+bean);
		deptService.deleteOne(deptno);
		return "redirect:./";
	}
}
