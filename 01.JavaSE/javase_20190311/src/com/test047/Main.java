package com.test047;

public class Main {

	public static void main(String[] args) {

		//부모 객체 초기화 테스트
		
		//부모가 가진 private 멤버변수 a를 자식 객체에서 통제
		Sub s = new Sub(10);
		s.method(); 
		//멤버변수 a의 값은 10입니다.
		//현재 메소드는 Sub 클래스의 메소드입니다.
			
	}

}
