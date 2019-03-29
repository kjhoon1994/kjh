package com.test037;

public class Main {

	public static void main(String[] args) {
		
		//상속 확인
		Sub s = new Sub();
		
		//Object 클래스의 멤버를 상속 받은 상태
		System.out.println(s.toString());
		
		//Sample 클래스의 멤버를 상속 받은 상태
		s.method1();
		
		//자기 자신의 고유 멤버
		s.method2();
		
		
	}

}
