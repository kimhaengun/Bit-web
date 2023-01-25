package com.bit.stu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

public class LocalMysql {
	private static Connection conn;
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/lecture";
	private static Map<String, String> env = System.getenv();
	private static String user = env.get("local.mysql.user");
	private static String password = env.get("local.mysql.password");

	// private = 객체 생성 없이 사용가능한 클래스
	private LocalMysql() {

	}

	public static Connection getConnection() {
		try {
			if (conn == null || conn.isClosed()) {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, user, password);
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

}
