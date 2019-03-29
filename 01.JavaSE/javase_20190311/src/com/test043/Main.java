package com.test043;

public class Main {

	public static void main(String[] args) {

		//오버라이딩 전 상태 확인
		
		//부모의 멤버가 가진 기능 그대로 사용
		Sub s = new Sub();
		
		//Sub 클래스의 멤버처럼 사용하지만
		//원래는 Sample 클래스의 멤버이다
		//->상속 관계
		s.method(); //부모 역할 클래스 메소드!
		
	}

}
