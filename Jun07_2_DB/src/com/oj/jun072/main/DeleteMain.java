package com.oj.jun072.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class DeleteMain {
	public static void main(String[] args) {
		// 상품명 입력 => 입력한 내용을 포함하는 상품명의 정보 삭제

		Scanner k = new Scanner(System.in);
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			String arr = "jdbc:oracle:thin:@192.168.0.22:1521:xe";
			con = DriverManager.getConnection(arr, "oj2", "1");

			System.out.print("상품명 입력 :");
			String product = k.next();

			String sql = "delete from jun07_product " 
			+ "where p_name like '%'||?||'%'";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product);
			
			if (pstmt.executeUpdate()>=1) {
				System.out.println("Success!");
			}else
				System.out.println("다시 입력");

		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
