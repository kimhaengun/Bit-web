package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.EmpDao;
import com.bit.model.EmpDto;

public class ListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		EmpDao dao = new EmpDao();
		try {
			List<EmpDto> list = dao.getList();
			//view에 list전달
			req.setAttribute("empList", list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd = null;
		rd = req.getRequestDispatcher("index.jsp");
		rd.forward(req, resp);
	}
}
