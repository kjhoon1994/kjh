package com.test028;

public class Main {

	public static void main(String[] args) {

		//생성자 오버로딩 테스트
		
		//기본 생성자 호출
		Sample s1 = new Sample();
		System.out.println(s1.getA()); //0
		
		//매개변수 있는 생성자 호출
		Sample s2 = new Sample(10);
		System.out.println(s2.getA()); //10

	}

}
