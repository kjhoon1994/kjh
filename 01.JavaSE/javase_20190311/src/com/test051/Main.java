package com.test051;

public class Main {

	public static void main(String[] args) {
		
		//Object 클래스의 멤버(toString, equals) 확인
		//오버라이딩 전 상태
		//->원본 기능 그대로 구현된다
		Member m1 = new Member();
		Member m2 = new Member();
		
		//객체의 상태 정보 출력
		//패키지명.클래스명@해쉬코드
		System.out.println(m1.toString());
		System.out.println(m2.toString());

		//두 객체 간의 참조주소 비교
		System.out.println(m1.equals(m2));
		
	}

}
