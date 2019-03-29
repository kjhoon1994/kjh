package com.test052;

public class Main {

	public static void main(String[] args) {
		
		//Object 클래스의 멤버(toString, equals) 확인
		//오버라이딩 후 상태
		//->재정의된 기능 구현된다
		Member m1 = new Member("hong", "1234");
		Member m2 = new Member("park", "4567");
		
		//객체의 자료 정보 출력
		//이름/ 전화번호
		System.out.println(m1.toString());
		System.out.println(m2.toString());

		//두 객체 간의 자료 비교
		System.out.println(m1.equals(m2));
		
	}

}
