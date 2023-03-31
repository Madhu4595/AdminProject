package com.app.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getConn() {
		Connection con = null;
		String url = "jdbc:postgresql://10.242.162.237:5432/nicadmin";
		String username="postgres";
		String password="mknic123";
		
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(url, username, password);
			return con;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
