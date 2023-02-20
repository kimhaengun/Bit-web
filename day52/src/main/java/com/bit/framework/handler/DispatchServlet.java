package com.bit.framework.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.controller.AddController;
import com.bit.controller.IndexController;
import com.bit.controller.InsertController;
import com.bit.controller.IntroController;
import com.bit.controller.ListController;

public class DispatchServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doDo(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doDo(req, resp);
	}
	
	protected void doDo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String uri = req.getRequestURI();
		uri=uri.substring(req.getContextPath().length());
		System.out.println(uri);
		Controller controller = null;
		// 2.
//		String classInfo = "";
//		if(uri.equals("/index.do")) {
		
//			//인덱스 요청 시
				// 1.
////			 controller = new IndexController();
		 	// 2.
//			classInfo = "com.bit.controller.IndexController";
//		}else if(uri.equals("/intro.do")) {
////			 controller = new IntroController();
//			classInfo = "com.bit.controller.IntroController";
//		}else if(uri.equals("/emp/list.do")) {
////			 controller = new ListController();
//			classInfo = "com.bit.controller.ListController";
//		}else if(uri.equals("/emp/add.do")) {
////			 controller = new AddController();
//			classInfo = "com.bit.controller.AddController";
//		}else if(uri.equals("/emp/insert.do")) {
////			 controller = new InsertController();
//			classInfo = "com.bit.controller.InsertController";
//		}
		
		// 3. web.xml에서 init-param 값으로 처리
		String classInfo = this.getInitParameter(uri);
		
		// 2.
		try {
			Class clz = Class.forName(classInfo);
			controller=(Controller)clz.newInstance();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 1.
		String viewName= controller.execute(req);
		
		if(viewName.startsWith("redirect:")) {
			resp.sendRedirect(viewName.replace("redirect:", ""));
		}else {
			req.getRequestDispatcher("/WEB-INF/views/"+viewName+".jsp").forward(req, resp);			
		}
	}
}

