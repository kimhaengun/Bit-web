package com.bit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.CommunityDao;
import com.bit.dto.CommunityDto;

public class ListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("리스트 페이지 요청 드렁옴");
		int page = Integer.parseInt(req.getParameter("page"));
		int limit = 10;
		int offset = (limit*(page-1));
		CommunityDao dao = new CommunityDao();
		List<CommunityDto> list = dao.listAll(limit, offset);
		System.out.println("!!!!!!!"+list);
		req.setAttribute("communityList", list);
		RequestDispatcher rd =req.getRequestDispatcher("listForm.jsp");
		rd.forward(req, resp);
	}

}
