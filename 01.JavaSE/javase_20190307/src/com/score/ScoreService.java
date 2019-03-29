package com.score;

import java.util.Scanner;

//주메뉴당 메뉴별 액션
public class ScoreService {

	//HAS-A 관계 (강한 결합)
	private ScoreDAO dao;
	public ScoreService() {
		this.dao = new ScoreDAO();
	}
	
	//1.성적입력 메소드
	public void menu1(Scanner sc) {
		
		//저장소 상태 확인
		if (this.dao.getFull()) {
			//메시지 출력
			System.out.println("더 이상 입력이 안됩니다. ");
		} else {

			//콘솔 입력 액션
			//번호, 이름, 과목1, 과목2, 과목3
			System.out.print("번호>");
			String sid = sc.nextLine();
			System.out.print("이름>");
			String name = sc.nextLine();
			
			//과목점수의 범위를 0~100으로 제한
			int sub1;
			while(true) {
				System.out.print("과목1>");
				sub1 = sc.nextInt();
				sc.nextLine();
				if (sub1 >= 0 && sub1 <= 100) break;
				System.out.println("과목점수 범위가 아닙니다.");
			}
			
			//과목점수의 범위를 0~100으로 제한
			int sub2;
			while(true) {
				System.out.print("과목2>");
				sub2 = sc.nextInt();
				sc.nextLine();
				if (sub2 >= 0 && sub2 <= 100) break;
				System.out.println("과목점수 범위가 아닙니다.");
			}

			//과목점수의 범위를 0~100으로 제한
			int sub3;
			while(true) {
				System.out.print("과목3>");
				sub3 = sc.nextInt();
				sc.nextLine();
				if (sub3 >= 0 && sub3 <= 100) break;
				System.out.println("과목점수 범위가 아닙니다.");
			}
			
			//입력 확인 메시지
			System.out.print("성적정보를 입력할까요(0/1)?");
	        int m_ = sc.nextInt();
	        sc.nextLine();
	    
	        if(m_ == 1){
	    		//Model 객체 준비
	    		//->Score 객체
	    		//->매개변수 생성자 호출
	    		Score s = new Score(sid, name, sub1, sub2, sub3);
	    		//ScoreDAO 객체의 add() 메소드 호출
	    		this.dao.add(s);
				
	    		//메시지 출력
	            System.out.println("성적정보가 입력되었습니다.");
	        } else {
	    		//메시지 출력
	            System.out.println("성적정보 입력이 취소되었습니다.");
	        }
		}
		
	}
	
	//2.성적출력 메소드
	public void menu2(Scanner sc) {
		System.out.println("2.성적 정보 출력");
		System.out.println("-------------------------------------");
		System.out.println("번호/이름/과목1/과목2/과목3/총점/평균/석차");
		//list() 메소드 테스트
		Score[] list = this.dao.list();
		//배열 탐색을 위한 전용 for문
		//->향상된 for문
		int count = 0;
		for (Score s : list) {
			//주의) 변수 m에 null 값이 있는 경우 오류 발생
			if (s != null) {
				++count;
				System.out.printf("%s / %s / %d / %d / %d / %d / %.1f / %d%n"
						, s.getSid(),s.getName()
						, s.getSub1(), s.getSub2(), s.getSub3()
						, s.getTotal(), s.getAvg_(), s.getRank_());
			}
		}
		System.out.printf("총%d건%n", count);
	}
	
	//3.성적검색 메소드
	//->서브메뉴
	public void menu3(Scanner sc) {
		while (true) {

			System.out.println();
			System.out.println("3.성적정보검색");
			System.out.println("1.번호기준  2.이름기준");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0)
				break;

			switch (m) {
			case 1:	this.menu3_1(sc); break;
			case 2: this.menu3_2(sc); break;
			}

		}
	}
	
	//3.성적검색/1.번호기준 메소드
	public void menu3_1(Scanner sc) {
		String key = "sid";
		String value = null;
		
		//검색 단어를 외부 입력 받는다.
		//->value 변수에 저장
		System.out.print("검색>");
		value = sc.nextLine();
		
		//검색 요청 -> list(key, value)
		Score[] list = this.dao.list(key, value);
		
		//검색 결과 출력
		this.print(list);
		
	}
	
	//3.성적검색/2.이름기준 메소드
	public void menu3_2(Scanner sc) {
		String key = "name";
		String value = null;

		//검색 단어를 외부 입력 받는다.
		//->value 변수에 저장
		System.out.print("검색>");
		value = sc.nextLine();
		
		//검색 요청 -> list(key, value)
		Score[] list = this.dao.list(key, value);
		
		//검색 결과 출력
		this.print(list);
		
	}
	
	//출력 전용 메소드
	private void print(Score[] list) {
		System.out.println("---------------------");
		System.out.println("번호/이름/과목1/과목2/과목3/총점/평균/석차");
		int count = 0;
		//사본 배열의 전체 자료 출력
		for (Score s : list) {
			//배열 요소가 null인 경우는 continue
			if (s == null) continue;
			//성적 정보 출력
			System.out.printf("%s / %s / %d / %d / %d / %d / %.1f / %d%n", 
				      s.getSid(),
				      s.getName(),
				      s.getSub1(),
				      s.getSub2(),
				      s.getSub3(),
				      s.getTotal(),
				      s.getAvg_(),
				      s.getRank_());
			++count;
		}
		//출력 건수가 없는 경우 전용 메시지
		if (count == 0) System.out.println("검색 결과가 없습니다");
		//출력 건수 출력
		System.out.printf("총%d건%n", count);		
	}
	
}
