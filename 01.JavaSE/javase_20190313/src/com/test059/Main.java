package com.test059;

public class Main {

	public static void main(String[] args) {
		
		//추상 클래스에 대한 객체 생성 테스트
		//추상 클래스는 직접적인 객체 생성 불가
		//추상 클래스의 일반 멤버에 대한 직접적인 접근 불가
		//Super s1 = new Super();
		
		//자식 객체를 이용한 추상 클래스의 멤버 접근 테스트
		Sample s2 = new Sample();
		s2.method1();
		s2.method2();

	}

}
