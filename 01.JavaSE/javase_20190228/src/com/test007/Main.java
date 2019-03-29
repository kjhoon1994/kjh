package com.test007;

//같은 패키지의 클래스 접근시 import 구문 생략 가능

public class Main {

	public static void main(String[] args) {
		
		//프로퍼티 확인
		//특정 클래스를 인스턴스(instance)화 하면 프로퍼티 확인 가능
		Sample s = new Sample();
		
		//멤버변수 a를 접근해서 값 출력 -> 권장하지 않는다.
		System.out.println(s.a);
		
		//멤버변수의 값 변경 -> 권장하지 않는다.
		s.a = 20;
		System.out.println(s.a);
		
		
		//지역 변수 선언 및 출력
		int a = 10;
		System.out.println(a);
		
		//지역변수의 값 변경
		a = 20;
		System.out.println(a);
		

	}

}
