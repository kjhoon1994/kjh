package com.score;

import java.util.Scanner;

public class ScoreService {

	//HAS-A 관계 (강한 결합)
	private ScoreDAO dao;
	public ScoreService() {
		this.dao = new ScoreDAO();
	}
	
	//주메뉴당 메뉴별 액션
	
	//1.성적입력 메소드
	public void menu1(Scanner sc) {
		
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
		
	}	
	
	//3.성적검색/1.번호기준 메소드
	public void menu3_1(Scanner sc) {
		
	}
	
	//3.성적검색/2.이름기준 메소드
	public void menu3_2(Scanner sc) {
		
	}
	
	//출력 포맷 private 메소드
	private void print(Score[] list) {
		
	}
	
}
