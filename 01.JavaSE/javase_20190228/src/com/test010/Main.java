package com.test010;

public class Main {

	public static void main(String[] args) {
		
		//Score 클래스에 대한 객체(instance) 생성
		Score s1 = new Score();
		s1.setSid("S001");
		s1.setSub1(100);
		s1.setSub2(100);
		s1.setSub3(100);
		
		//Score 클래스에 대한 객체(instance) 생성
		Score s2 = new Score();
		s2.setSid("S002");
		s2.setSub1(80);
		s2.setSub2(90);
		s2.setSub3(70);
		
		//자료 저장 상태 확인
		System.out.println("--------------------------------");
		System.out.println("학번/이름/과목1/과목2/과목3/총점");
		System.out.printf("%s / %d / %d / %d / %d%n"
				, s1.getSid(), s1.getSub1()
				, s1.getSub2(), s1.getSub3()
				, (s1.getSub1() + s1.getSub2() + s1.getSub3()));
		System.out.printf("%s / %d / %d / %d / %d%n"
				, s2.getSid(), s2.getSub1()
				, s2.getSub2(), s2.getSub3()
				, (s2.getSub1() + s2.getSub2() + s2.getSub3()));
		

	}

}
