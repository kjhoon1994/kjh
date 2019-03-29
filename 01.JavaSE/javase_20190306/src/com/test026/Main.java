package com.test026;

public class Main {

	public static void main(String[] args) {

		//초기화 테스트
		//객체(instance) 생성시 생성자 호출 가능
		Sample s = new Sample();
		
		//정수형 멤버
		System.out.println(s.getA()); //10
		
		//실수형 멤버
		System.out.println(s.getB()); //12.34
		
		//참조형 멤버
		System.out.println(s.getC()); //Hello, World!
		
		//문자열 변수에 문자열 할당이 된 상태이므로
		//.toString() 메소드 사용 가능
		System.out.println(s.getC().toString()); //Hello, World!
		

	}

}
