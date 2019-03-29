package com.score;

import java.util.Scanner;

public class Main {
	
	public static void main(String[] args) {
		
		//주메뉴 액션
		//외부 입력 처리 준비 -> Scanner
		
		ScoreService s = new ScoreService();
		Scanner sc = new Scanner(System.in);
		
		while (true) {
			
			System.out.println();
			System.out.println("**성적관리 v1.0 **");
			System.out.println("1.성적정보입력  2.성적정보출력  3.성적정보검색");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0) break;
			
			switch (m) {
			//메뉴메소드 호출시 Scanner 객체를 매개변수를 통해서 전달
			//입력 관련 액션
			case 1:	s.menu1(sc); break;
			//출력 관련 액션
			case 2:	s.menu2(sc); break;
			//검색 관련 액션
			case 3:	s.menu3(sc); break;
			}
			
		}		
			
		sc.close();
		System.out.println("프로그램 종료");

	}

}
