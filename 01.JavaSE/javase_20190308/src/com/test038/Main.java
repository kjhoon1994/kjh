package com.test038;

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
		
		//Sample 클래스의 멤버 중에서 private 멤버는 상속 제외
		//s.privateMethod();
		
		//Sample 클래스의 멤버 중에서 protected 멤버는 상속 가능
		//protected 멤버는 외부(타 패키지) 접근 불가
		s.protectedMethd();
		
	}

}
