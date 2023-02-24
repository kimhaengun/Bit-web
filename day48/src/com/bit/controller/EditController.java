package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.DeptDao;

public class EditController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext sc = req.getServletContext();
		String url = sc.getInitParameter("url");
		String user = sc.getInitParameter("user");
		String password = sc.getInitParameter("password");
		DeptDao dao = new DeptDao(url, user, password);
		
		int deptno = Integer.parseInt(req.getParameter("deptno")); 
		String dname = req.getParameter("dname");
		String loc = req.getParameter("loc");
		resp.setHeader("Access-Control-Allow-Origin", "*");
		try {
			 dao.editOne(deptno, dname, loc);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			resp.sendError(resp.SC_BAD_REQUEST);
		}
		
	}
}
