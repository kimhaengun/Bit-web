package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.CommunityDao;

public class DeleteController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("삭제 POST 요청옴");
		int communityNo = Integer.parseInt(req.getParameter("communityNo").trim());
//		System.out.println(communityNo);
		CommunityDao dao = new CommunityDao();
		try {
			if(dao.deleteOne(communityNo)==0) {
				resp.setStatus(resp.SC_BAD_REQUEST);
			}else {
				resp.setStatus(resp.SC_ACCEPTED);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
