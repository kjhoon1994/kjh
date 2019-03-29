package com.emp.main;

import java.util.Scanner;

import com.emp.service.EmployeeService;
import com.emp.service.SubMenuService;

public class Main {

	public static void main(String[] args) {
		// 주메뉴 액션
		// 외부 입력 처리 준비 -> Scanner

		Scanner sc = new Scanner(System.in);

		while (true) {

			System.out.println();
			System.out.println("--------------");
			System.out.println("직원 관리 v1.0");
			System.out.println("1.직원관리  2.기초정보관리");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0) break;

			switch (m) {
			// 메뉴메소드 호출시 Scanner 객체를 매개변수를 통해서 전달
			// 직원관리 서브메뉴
			case 1: new EmployeeService().main(sc); break;
			// 기초정보관리 서브메뉴
			case 2: new SubMenuService().main(sc); break;
			}
			
		}

		sc.close();
		System.out.println("프로그램 종료");
	}

}
