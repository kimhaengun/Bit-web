package com.bit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.Scanner;

import com.bit.stu.LocalMysql;
import com.bit.stu.StuDao;

public class Main {

	public static void main(String[] args) throws ClassNotFoundException {
		System.out.println("학생 성적 관리 프로그램(ver 0.8.0 mysql)");
		Scanner sc = new Scanner(System.in);

		String input = null;
		
//		String driver = "com.mysql.jdbc.Driver";
//		String url = "jdbc:mysql://localhost:3306/lecture";
//		Map<String, String> env = System.getenv();
//		String user = env.get("local.mysql.user");
//		String password = env.get("local.mysql.password");
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int su = -1;
		while (true) {
			System.out.println("1.리스트 2.보기 3.입력 4.수정 5.삭제 0.종료");
			input = sc.nextLine();
			if (input.equals("0")) {
				break;
			}
			if (input.equals("1")) {
				StuDao dao = new StuDao();
				ArrayList<int[]> stulist =  dao.selectAll();
				for (int i = 0; i < stulist.size(); i++) {
					System.out.printf("%d| %d| %d| %d \n",stulist.get(i)[0],stulist.get(i)[1],stulist.get(i)[2],stulist.get(i)[3]);
				}

			}
			if (input.equals("2")) {

			}
			if (input.equals("3")) {
				
				System.out.print("국어>");
				input = sc.nextLine();
				int kor = Integer.parseInt(input);

				System.out.print("영어>");
				input = sc.nextLine();
				int eng = Integer.parseInt(input);
				
				System.out.print("수학>");
				input = sc.nextLine();
				int math = Integer.parseInt(input);
				
				StuDao dao = new StuDao();
				dao.insertOne(kor, eng, math);
			}
			if (input.equals("4")) {

			}
			if (input.equals("5")) {

			}
		}
	}
}
