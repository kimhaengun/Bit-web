package com.bit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Map;

import com.mysql.cj.jdbc.Driver;

public class LocalMysql {
	private static Connection conn;
	private LocalMysql() {}
	public static Connection getConnection() {
		Map<String, String>env = System.getenv();
		try {
			if(conn==null || conn.isClosed()) {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lecture"
						,env.get("local.mysql.user")
						,env.get("local.mysql.password")
						);
				System.out.println(conn);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}
}
