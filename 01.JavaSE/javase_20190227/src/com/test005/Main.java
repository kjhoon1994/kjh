package com.test005;

public class Main {

	public static void main(String[] args) {
		
		//빈 클래스의 구성 요소 확인
		
		//Sample 클래스의 인스턴스 생성
		Sample s = new Sample();
		
		//toString()은 모든 클래스가 가지는 기본 요소이다
		System.out.println(s.toString());
		
		//toString()은 유일하게 생략 가능한 메소드
		System.out.println(s);

	}

}
