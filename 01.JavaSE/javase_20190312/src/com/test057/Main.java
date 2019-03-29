package com.test057;

public class Main {

	public static void main(String[] args) {
		
		//다형성
		//자손 타입의 객체(instance)를 조상 타입의 참조변수에 할당 가능
		//예를 들어, A자료형에 A객체 저장이 기본. A자료형에 B객체 저장 가능. 단, A와 B는 IS-A 관계.

		//객체의 자료형과 변수의 자료형이 일치
		Sample1 s1 = new Sample1();
		
		
		//인터페이스를 이용한 다형성
		//인터페이스 자료형 변수에 인터페이스 구현 클래스의 객체 저장 가능
		
		//객체의 자료형과 변수의 자료형이 불일치
		//-> Sample1 클래스는 Super 인터페이스의 구현 클래스
		Super s2 = new Sample1();
		Super s3 = new Sample2();
		
		//s2, s3 변수는 Super 자료형
		//가지고 있는 값은 Sample1 객체, Sample2 객체
		//->다형성
		
		//공통 특성을 활용한 메소드 호출
		//->메소드 이름은 같다, 결과는 다르다.
		s2.method();
		s3.method();
		
		
	}

}
