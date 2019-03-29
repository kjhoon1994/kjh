package com.test036;

public class Main {

	public static void main(String[] args) {
		
		//instance vs static 테스트

		//instance 멤버 접근
		Sample s1 = new Sample();
		s1.method1();
		
		//instance 멤버 접근
		Sample s2 = new Sample();
		s2.method1();

		//static 멤버 접근
		//클래스명으로 접근한다
		Sample.method2();
		
	}

}
