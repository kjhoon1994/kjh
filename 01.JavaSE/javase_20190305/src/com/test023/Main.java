package com.test023;

import java.util.Scanner;

//메인 메뉴 운영용 클래스
public class Main {

	public static void main(String[] args) {
		
		//메인 메뉴에 대한 메소드 구성
		Scanner sc = new Scanner(System.in);
		
		//서비스 클래스와 연결된 상태
		MemberService s = new MemberService();

		while (true) {
			
			System.out.println();
			System.out.println("-------회원관리-------");
			System.out.println("1.회원입력 2.회원출력");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0) break;
			
			switch (m) {
			//메뉴메소드 호출시 Scanner 객체를 매개변수를 통해서 전달
			//입력 관련 액션
			case 1:	s.menu01(sc); break;
			//출력 관련 액션
			case 2:	s.menu02(sc); break;
			}
			
		}
	
		sc.close();
		System.out.println("프로그램 종료");

	}

}
