package com.test065;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		//메인 메뉴
		//1.자동번호 2.수동번호 3.당첨자검색
		Scanner sc = new Scanner(System.in);
		LottoService service = new LottoService();

		while (true) {

			System.out.println();
			System.out.println("--------------");
			System.out.println("로또 판매 서비스 v1.0");
			System.out.println("1.자동번호 2.수동번호 3.당첨자검색");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0) break;

			switch (m) {
			// 메뉴메소드 호출시 Scanner 객체를 매개변수를 통해서 전달
			case 1: service.menu1(sc); break;
			case 2: service.menu2(sc); break;
			case 3: service.menu3(sc); break;
			// 히든메뉴 - 메뉴 번호에 노출되지 않은 메뉴
			case 99: service.hidden(); break;
			}
			
		}

		sc.close();
		System.out.println("프로그램 종료");;

	}

}
