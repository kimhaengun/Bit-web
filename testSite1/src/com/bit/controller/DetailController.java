package com.bit.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.CommunityDao;
import com.bit.dao.ReplyDao;
import com.bit.dto.CommunityDto;
import com.bit.dto.ReplyDto;

public class DetailController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no = Integer.parseInt(req.getParameter("communityNo"));
		System.out.println("디페일 페이징 요청옴 : "+no);
		CommunityDao dao = new CommunityDao();
		//디테일 정보
		CommunityDto dto = dao.selectOne(no);
		//댓글 목록
		ReplyDao replydao = new ReplyDao();
		List<ReplyDto> replylist = null;
		try {
			replylist = replydao.selectAll(no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		req.setAttribute("communityInfo", dto);
		req.setAttribute("replylist", replylist);
		RequestDispatcher rd =req.getRequestDispatcher("detailForm.jsp");
		rd.forward(req, resp);
		
	}
}
