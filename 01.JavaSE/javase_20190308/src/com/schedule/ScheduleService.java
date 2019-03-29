package com.schedule;

import java.util.Scanner;

//주메뉴당 메뉴별 액션 클래스
public class ScheduleService {
	
	private ScheduleDAO dao;
	public ScheduleService() {
		this.dao = new ScheduleDAO();
	}
	
	public void menu1(Scanner sc) {
		
	}
	
	public void menu2(Scanner sc) {
		while (true) {

			System.out.println();
			System.out.println("2.일정 출력 및 검색");
			System.out.println("1.오늘일정 2.특정일일정 3.특정월일정 4.특정단어포함일정 5.전체일정");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0)
				break;

			switch (m) {
			case 1:	this.menu2_1(sc); break;
			case 2: this.menu2_2(sc); break;
			case 3: this.menu2_3(sc); break;
			case 4: this.menu2_4(sc); break;
			case 5: this.menu2_5(sc); break;
			}

		}		
	}
	
	private void menu2_4(Scanner sc) {
		// TODO Auto-generated method stub
		
	}

	private void menu2_3(Scanner sc) {
		// TODO Auto-generated method stub
		
	}

	private void menu2_2(Scanner sc) {
		// TODO Auto-generated method stub
		
	}

	private void menu2_1(Scanner sc) {
		// TODO Auto-generated method stub
		
	}

	//2.일정 출력 및 검색/5.전체일정
	private void menu2_5(Scanner sc) {
		//제목 출력
		System.out.println("2.일정 출력 및 검색/5.전체일정");
		//ScheduleDAO 객체의 list() 메소드 호출
		Schedule[] list = this.dao.list("all", "");
		//출력 전용 메소드 호출
		this.print(list);
	}
	
	//출력 전용 메소드
	private void print(Schedule[] list) {
		System.out.println("---------------------");
		System.out.println("번호 / 날짜 / 내용");
		int count = 0;
		//사본 배열의 전체 자료 출력
		for (Schedule s : list) {
			//배열 요소가 null인 경우는 continue
			if (s == null) continue;
			//toString() 메소드 호출
			System.out.println(s.toString());
			++count;
		}
		//출력 건수가 없는 경우 전용 메시지
		if (count == 0) System.out.println("검색 결과가 없습니다");
		//출력 건수 출력
		System.out.printf("총%d건%n", count);		
	}

}
