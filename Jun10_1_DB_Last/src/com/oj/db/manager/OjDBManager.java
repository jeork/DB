package com.oj.db.manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OjDBManager {
	public static Connection connect() throws SQLException {
		String arr = "jdbc:oracle:thin:@192.168.0.22:1521:xe";
		return DriverManager.getConnection(arr, "oj2", "1");
	}

	public static void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			rs.close(); // C, U, D 때는 필요없고, R 때만 필요
		} catch (Exception e) { // insert하게 되면 NullPointerExcepetion 발생
								// 모든 exception이 잡히도록 할 것 (try-catch)
//			e.printStackTrace(); // 메시지 안보려고 생략
		}
		try {
			pstmt.close();
		} catch (Exception e) {
		}
		try {
			con.close();
		} catch (Exception e) {
		}
	}
}
