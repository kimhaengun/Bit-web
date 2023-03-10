package com.bit.emp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.emp.model.EmpDao;

public class AddController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String params1=req.getParameter("empno");
		String params2=req.getParameter("ename");
		String params3=req.getParameter("sal");
		System.out.println("??"+req.getParameter("empno")+","+req.getParameter("ename")+", "+req.getParameter("sal"));
		int empno=Integer.parseInt(params1.trim());
		String ename=params2.trim();
		int sal=Integer.parseInt(params3.trim());
		EmpDao dao = new EmpDao();
		if(dao.insertOne(empno, ename, sal)>0) {
			resp.setStatus(201);
		}else {
			resp.setStatus(404);
		}
	}
}
