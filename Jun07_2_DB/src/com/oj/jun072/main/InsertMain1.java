package com.oj.jun072.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertMain1 {
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

			// 주의할 점 2가지!
			String sql = "insert into jun07_product " // 1. 띄어쓰기 주의
					+ "values(jun07_product_seq.nextval," + "'테스트', 10, 10, 3)"; // 2. 뒤에 ';' 쓰지 말것
			// 서버에 전송/실행/결과 받아오는 작업을 하는 총괄 매니저

			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate(); // 서버에 전송/실행/결과받기

			pstmt.close();

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
