package com.oj.franc.main;

import java.util.ArrayList;

import com.oj.franc.reservation.Reservation;
import com.oj.franc.restaurant.Restaurant;

public class Controller {
	// MVC 패턴 의 C - 실행과 코드의 흐름을 관리
//	if(번호==1) {
//		consolesreen.예약하기 기능 (입력)
//		dao.db관련 예약기능(insert)
//		결과 보여주기 (성공 or 실패)
//	}

	public static void main(String[] args) {
		int menu = 0;
		int seat = 0;
		String result = null;
		Reservation rsv = null;
		Restaurant rst = null;
		ArrayList<Reservation> rsvResult = null;
		ArrayList<Restaurant> rstResult = null;

		System.out.println("<< 예약 프로그램 >>");

		while (true) {
			try {
				menu = ConsoleScreen.showMainMenu();
				if (menu == 9) {
					System.out.println("프로그램을 종료합니다");
					break;
				} else if (menu == 1) {
					rsv = ConsoleScreen.showRsvMenu();
					result = DAO.book(rsv);
					ConsoleScreen.printResult(result);
				} else if (menu == 2) {
					rst = ConsoleScreen.showRstMenu();
					result = DAO.registration(rst);
					ConsoleScreen.printResult(result);
				} else if (menu == 3) {
					rsvResult = DAO.getAllReserve(rsv);
					ConsoleScreen.showRsvResultMenu(rsvResult);
				} else if (menu == 4) {
					rstResult = DAO.getAllRestaurant(rst);
					ConsoleScreen.showRstResultMenu(rstResult);
				} else if (menu == 5) {
					rst = ConsoleScreen.showSRstResultMenu();
					rstResult = DAO.getSRestaurant(rst);
					ConsoleScreen.showRstResultMenu(rstResult);
				} else if (menu == 6) {
					rsv = ConsoleScreen.showSRsvResultMenu();
					rsvResult = DAO.getSearchReserve(rsv);
					ConsoleScreen.showRsvResultMenu(rsvResult);
				} else if (menu == 7) {
					rsvResult = DAO.getAllReserve(rsv);
					ConsoleScreen.showRsvResultMenu(rsvResult);

					rsv = ConsoleScreen.showUpdateRsvMenu();
					result = DAO.updateReserve(rsv);
					ConsoleScreen.printResult(result);

				} else if (menu == 8) {
					rsv = ConsoleScreen.showDeleteRsvMenu();
					result = DAO.deleteReserve(rsv);
					ConsoleScreen.printResult(result);

				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}