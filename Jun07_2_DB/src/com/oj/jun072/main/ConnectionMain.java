package com.oj.jun072.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// Socket 통신
// HTTP 통신

public class ConnectionMain {
	public static void main(String[] args) {
		Connection con = null;
		
		try {
			// 연결할 DB서버 주소 (메이커 별로 형식이 다름)
			// Data Source Explorer - 서버 이름쪽에 우클릭
			// Properties - Driver Properties
			// Connection URL 값 복사
			String arr = "jdbc:oracle:thin:@192.168.0.22:1521:xe";
			con = DriverManager.getConnection(arr, "oj2", "1");
			System.out.println("Success !");
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
