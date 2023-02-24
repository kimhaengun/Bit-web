package com.bit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

@WebServlet("/upload.do")
public class FileController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("file.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String upload ="E:\\webspace\\day51\\src\\main\\webapp\\upload";
		int max = 1024*10;
		String upload=req.getRealPath("/upload");
		System.out.println("path:"+upload);
		// !!! 파일명이 중복날 경우 가장 마지막에 들어간 파일로 덮어씌워짐 !!!!
		FileRenamePolicy frp = new DefaultFileRenamePolicy();//해결 방안
		MultipartRequest mr = new MultipartRequest(req, upload,max,frp); //(request, "파일 저장 위치");
		
		//MultipartRequest가 아니면 name 값을 못가져옴
		String name = mr.getParameter("name");
		//FileRenmaePolicy로 인해 사용자가 올린 파일의 이름이 변경되었기 떄문에 변경전 이름과 변경 후 이름을 가지고 있어야한다.
		//이전 이름 (사용자에게 보여줄 이름)
		String ordname = mr.getOriginalFileName("file1");
		//변경 후 이름 (다운로드 될 변경된 파일 이름)
		String newName = mr.getFilesystemName("file1");
//		System.out.println(filename);
		req.setAttribute("old", ordname);
		req.setAttribute("nw", newName);
		req.getRequestDispatcher("ex04.jsp").forward(req, resp);
	}
}
