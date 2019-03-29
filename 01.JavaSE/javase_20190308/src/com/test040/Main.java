package com.test040;

public class Main {

	public static void main(String[] args) {
		
		//상속 확인
		Sub s = new Sub();
		
		//Object 클래스의 멤버를 상속 받은 상태
		System.out.println(s.toString());
		
		//Sample 클래스 -> final 클래스
		//s.method1();
		
		//자기 자신의 고유 멤버
		s.method2();
		
		//final 클래스 자신에 대한 객체 생성
		Sample sample = new Sample();
		sample.method1();
		
	}

}
