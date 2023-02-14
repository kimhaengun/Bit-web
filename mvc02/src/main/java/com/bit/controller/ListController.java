package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Context;

import com.bit.model.DeptDao;

public class ListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String val = this.getInitParameter("key1");
//		System.out.println(val);
//		String url=this.getInitParameter("url");
//		String user=this.getInitParameter("user");
//		String password=this.getInitParameter("password");
		ServletContext context = req.getServletContext();
		String url = context.getInitParameter("url");
		String user = context.getInitParameter("user");
		String password = context.getInitParameter("password");
		DeptDao dao = new DeptDao(url,user,password);
		//CORS 허용
		resp.setHeader("Access-Control-Allow-Origin", "*");
		resp.setContentType("application/json");
		try(PrintWriter out = resp.getWriter();){
			out.print("{\"dept\":");
			try {
				out.print(dao.getList().toString());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				out.print("[]");
			}
			out.print("}");
		}
	}
}
