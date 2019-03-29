package com.test020;

public class Main {

	public static void main(String[] args) {
		
		//대표적인 메소드 오버로딩 상태
		//println() 메소드는 여러가지 버전이 있다
		//->외부에서 공급받는 자료가 다양한 자료형을 지원한다
		System.out.println();
		System.out.println("Hello, World");  //String
		System.out.println(123); //int
		System.out.println(123.45);  //double
		
		//Sample 클래스의 method() 메소드 오버로딩 확인
		Sample s = new Sample();
		s.method();
		s.method(10); //int 
		s.method(12.34); //double
		s.method(10, 20); //int, int

	}

}
