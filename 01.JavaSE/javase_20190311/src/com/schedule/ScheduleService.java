package com.schedule;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

//주메뉴당 메뉴별 액션 클래스
public class ScheduleService {
	
	private ScheduleDAO dao;
	public ScheduleService() {
		this.dao = new ScheduleDAO();
	}
	
	public void menu1(Scanner sc) {
		//외부 입력 항목 결정
		//날짜, 내용만 입력 받는다
		//번호(S001, S002, ...)는 자동 증가 액션 처리 
		//-> generateSid() 메소드 호출
		
		String sid = this.dao.generateSid();

		if (sid != null) {

			System.out.print("날짜(YYYY-MM-DD)>");
			String wdate = sc.nextLine();

			System.out.print("내용(200자 이내)>");
			String content = sc.nextLine();

			System.out.print("입력할까요(0/1)>");
			int input = sc.nextInt();
			sc.nextLine();

			if (input == 1) {
				Schedule s1 = new Schedule(sid, wdate, content);
				this.dao.add(s1);
				System.out.println("일정이 등록되었습니다.");
			} else {
				System.out.println("일정이 등록 취소되었습니다.");
			}
		} else {
			System.out.println("일정 등록 불가!");
		}
		
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
	
	private void menu2_1(Scanner sc) {

		//시스템의 오늘 날짜를 얻는다
		//->java.time 패키지
		//->LocalDate 클래스
		//->YYYY-MM-DD 형식

		//제목 출력
		System.out.println("2.일정 출력 및 검색/1.오늘일정");

		//오늘 날짜를 기준으로 검색 진행
		String value = LocalDate.now().format(DateTimeFormatter.ISO_LOCAL_DATE);
		Schedule[] list = this.dao.list("yyyy-mm-dd", value);

		//출력 전용 메소드 호출
		this.print(list);
		
	}
	
	private void menu2_2(Scanner sc) {
		//제목 출력
		System.out.println("2.일정 출력 및 검색/2.특정일일정");

		//특정 날짜를 기준으로 검색 진행
		System.out.print("특정일(yyyy-MM-dd)>");
		String value = sc.nextLine();
		Schedule[] list = this.dao.list("yyyy-mm-dd", value);

		//출력 전용 메소드 호출
		this.print(list);	
	}
	
	private void menu2_3(Scanner sc) {
		//제목 출력
		System.out.println("2.일정 출력 및 검색/3.특정월일정");

		//특정월를 기준으로 검색 진행
		System.out.print("특정월(yyyy-MM)>");
		String value = sc.nextLine();
		Schedule[] list = this.dao.list("yyyy-mm", value);

		//출력 전용 메소드 호출
		this.print(list);	
	}

	private void menu2_4(Scanner sc) {
		//제목 출력
		System.out.println("2.일정 출력 및 검색/4.특정단어포함일정");

		//특정단어를 기준으로 검색 진행
		System.out.print("특정단어>");
		String value = sc.nextLine();
		Schedule[] list = this.dao.list("word", value);

		//출력 전용 메소드 호출
		this.print(list);	
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
