package com.test011;

import com.test010.Score;

public class Main {

	public static void main(String[] args) {
		
		//여러명의 성적을 저장하고, 출력하는 코드 작성
		//성적 정보 -> Score 클래스 -> 학번, 과목1, 과목2, 과목3
		//Score 클래스 자료형의 배열 저장소 준비
		
		//전체 인원수
		int count = 10;
		//배열 인덱스 운영용 변수
		int idx = 0;
		//배열 저장소
		Score[] scores = new Score[count];
		
		//'홍길동' 성적 자료
		Score s1 = new Score();
		s1.setSid("S001");
		s1.setSub1(100);
		s1.setSub2(100);
		s1.setSub3(100);
		
		//Score 객체의 참조주소를 배열에 저장
		scores[idx] = s1;
		++idx;
		
		//'박길동' 성적 자료
		Score s2 = new Score();
		s2.setSid("S002");
		s2.setSub1(80);
		s2.setSub2(90);
		s2.setSub3(70);
		
		//Score 객체의 참조주소를 배열에 저장
		scores[idx] = s2;
		++idx;
		
		
		System.out.println("--------------------------------");
		System.out.println("학번/이름/과목1/과목2/과목3/총점");
		for(int a = 0; a < idx; ++a) {
			//배열에 저장된 Score 객체들을 순차적으로 접근
			Score s_ = scores[a];
			System.out.printf("%s / %d / %d / %d / %d%n"
					, s_.getSid(), s_.getSub1()
					, s_.getSub2(), s_.getSub3()
					, (s_.getSub1() + s_.getSub2() + s_.getSub3()));
		}
		
		
	}

}
