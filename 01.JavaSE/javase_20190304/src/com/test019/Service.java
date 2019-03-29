package com.test019;

import java.util.Scanner;

//메뉴 액션용 클래스
public class Service {
	
	
	//여러명의 성적을 저장하고, 출력하는 코드 작성
	//성적 정보 -> Score 클래스 -> 학번, 과목1, 과목2, 과목3
	//Score 클래스 자료형의 배열 저장소 준비
	
	//전체 인원수
	int count = 10;
	//배열 인덱스 운영용 변수
	int idx = 0;
	//배열 저장소
	Score[] scores = new Score[count];
	

	//메뉴메소드 호출시 전달 받은 Scanner 객체를 이용해서
	//외부 입력 액션 처리 가능
	public void menu01(Scanner sc) {
		//성적 입력 액션 코드 작성
		if (count <= idx) {
			System.out.println("저장소가 찼습니다.");
		} else {
			System.out.print("학번>");
			String sid = sc.nextLine();
			System.out.print("과목1>");
			int sub1 = sc.nextInt();
			sc.nextLine();
			System.out.print("과목2>");
			int sub2 = sc.nextInt();
			sc.nextLine();
			System.out.print("과목3>");
			int sub3 = sc.nextInt();
			sc.nextLine();
			
			System.out.print("성적을 입력할까요(0/1)?");
            int m_ = sc.nextInt();
            sc.nextLine();
        
            if(m_ == 1){
				Score s = new Score();
				s.setSid(sid);
				s.setSub1(sub1);
				s.setSub2(sub2);
				s.setSub3(sub3);

				scores[idx] = s;
				++idx;
				
                System.out.println("성적이 입력되었습니다.");
            } else {
                System.out.println("성적 입력이 취소되었습니다.");
            }

		}
	}

	public void menu02(Scanner sc) {
		//성적 출력 액션 코드 작성
		System.out.println("-------------------------------------");
		System.out.println("학번/과목1/과목2/과목3/총점");
		for (int b = 0; b < idx; ++b) {
			Score s_ = scores[b];
			System.out.printf("%s / %d / %d / %d / %d%n", s_.getSid(), s_.getSub1(),
					s_.getSub2(), s_.getSub3(), (s_.getSub1() + s_.getSub2() + s_.getSub3()));
		}
	}

}
