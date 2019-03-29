package com.test045;

public class Main {

	public static void main(String[] args) {

		//Object 클래스의 멤버(toString)에 대한 오버라이딩 상태 확인
		
		Sample s1 = new Sample();
		System.out.println(s1.toString()); //부모 역할 클래스 toString() 오버라이딩 메소드!
		
		Sub s2 = new Sub();
		System.out.println(s2.toString()); //자식 역할 클래스 toString() 오버라이딩 메소드!
		
			
	}

}
