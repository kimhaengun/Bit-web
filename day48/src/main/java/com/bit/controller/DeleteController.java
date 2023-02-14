package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.model.EmpDao;

public class DeleteController extends HttpServlet{

	Logger log = Logger.getLogger("com.bit.controller.DeleteController");
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		log.info(req.getParameter("idx"));
		String param = req.getParameter("idx").trim();
		int empno = Integer.parseInt(param);
		
		EmpDao dao = new EmpDao();
		try {
			if(dao.deleteOne(empno)==0) {
				//실패
				resp.setStatus(resp.SC_BAD_REQUEST);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
