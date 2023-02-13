package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.CommunityDao;
import com.bit.dto.CommunityDto;

public class DetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(req.getParameter("communityNo"));
		System.out.println("디페일 페이징 요청옴 : "+no);
		CommunityDao dao = new CommunityDao();
		CommunityDto dto = dao.selectOne(no);
		
	}
}
