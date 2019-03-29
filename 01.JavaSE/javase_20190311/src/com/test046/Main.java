package com.test046;

public class Main {

	public static void main(String[] args) {

		//Sample 클래스의 멤버에 대한 오버라이딩 상태 확인
		
		Sub s = new Sub();
		s.method(); 
		//멤버변수 a의 값은 0입니다.
		//현재 메소드는 Sub 클래스의 메소드입니다.
			
	}

}
