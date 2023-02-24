package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.DeptDao;

public class AddController extends HttpServlet{

	Logger log = Logger.getLogger(this.getClass().getName());
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String url=this.getInitParameter("url");
//		String user=this.getInitParameter("user");
//		String password=this.getInitParameter("password");
		ServletContext context = req.getServletContext();
		String url = context.getInitParameter("url");
		String user = context.getInitParameter("user");
		String password = context.getInitParameter("password");
		int deptno = Integer.parseInt(req.getParameter("deptno"));
		String dname = req.getParameter("dname");
		String loc = req.getParameter("loc");
		log.info(deptno+" : "+dname+" : "+loc);
		DeptDao dao = new DeptDao(url,user,password);
		resp.setHeader("Access-Control-Allow-Origin", "*");
		//성공시
		resp.setStatus(resp.SC_CREATED);
		try {
			dao.insertOne(deptno, dname, loc);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//익셉션 발생시 
			resp.sendError(resp.SC_BAD_REQUEST);
		}
	}
}
