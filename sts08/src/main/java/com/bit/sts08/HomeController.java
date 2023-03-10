package com.bit.sts08;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

@Controller
public class HomeController {
	
	
	
	String path = "E:\\webspace\\sts08\\up\\";
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		System.out.println("controller~~~~");
		return "home";
	}
	
	@ResponseBody
	@PostMapping("/upload")
	public void upload(
			HttpServletRequest req,
			MultipartFile file1)throws IOException{
//		Enumeration enu = req.getParameterNames();
//		while(enu.hasMoreElements()) {
//			System.out.println("ㅠㅏ일 업로드"+enu.nextElement());			
//		}
		//파일명 똑같을 경우 마지막 파일로 덮어 씌우기 때문에 문자열 붙이기
		//1.중복 업는 문자열 붙이기 --> 시간으로
		String msg=System.currentTimeMillis()+"_";
		System.out.println(path);
		File f = new File(path+msg+file1.getOriginalFilename());
		//파일 IO처리
		file1.transferTo(f);
	}
	
	@GetMapping("/down")
	public void down(Model model, String fname) {
		model.addAttribute("fname",fname);
	}
	
	@GetMapping("/load")
	public void download(String fname, HttpServletResponse res) throws FileNotFoundException, IOException {
		
		File f = new File(path+fname);
		
		//다운로드
		res.setContentType("application/octest-stream"); //브라우저가 알아듣지 못하게?? 처리하지 못하는 타입으로 변경
		res.setHeader("Content-Disposition", "attachment; filename="+fname.substring(fname.indexOf('_')+1));//기존 파일명으로 되돌리기
		try(
				//웹에 이미지(파일) 뿌리기
				InputStream is = new FileInputStream(f);
				OutputStream os = res.getOutputStream();
				){
			int su = -1;
			while((su=is.read())!=-1)os.write(su);
		}
	}
	
//	@GetMapping("/load/{fname}")
	@GetMapping("/load/{fname:.+}")
	public void  download2(@PathVariable("fname") String fname, HttpServletResponse res) throws FileNotFoundException, IOException {
		//@PathVariable을 사용해서 fname을 받으면 .뒤 확장자명을 제외시켜버려서 filenotfoundException이 나옴
		//해결 방법(확장자 인식) : 기존 "/load/{fname}" -->"/load/{fname:.+}"
		
		File f = new File(path+fname);
		
		//다운로드
		res.setContentType("application/octest-stream"); //브라우저가 알아듣지 못하게?? 처리하지 못하는 타입으로 변경
		res.setHeader("Content-Disposition", "attachment; filename="+fname.substring(fname.indexOf('_')+1));//기존 파일명으로 되돌리기
		try(
				//웹에 이미지(파일) 뿌리기
				InputStream is = new FileInputStream(f);
				OutputStream os = res.getOutputStream();
				){
			int su = -1;
			while((su=is.read())!=-1)os.write(su);
		}	
	}
}
