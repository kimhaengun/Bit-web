package com.bit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

public class LocalSql {
	private static Connection conn;
	private LocalSql() {}
	private static Map<String, String> env = System.getenv();
	public static Connection getConnection() {
		try {
			if(conn==null || conn.isClosed()) {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lecture"
						, env.get("MYSQL_USER")
						, env.get("MYSQL_PW"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	// DB 연결 test
//	public static void main(String[] args) {
//		System.out.println(getConnection());
//	}
}
