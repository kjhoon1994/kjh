package com.test008;

public class Sample {
	
	//프로퍼티
	//객체(instance)의 상태값 저장용 변수 선언
	//접근제한자 private 권장
	//프로퍼티는 자동 초기화 지원
	//형식)
	/*
	접근제한자 자료형 변수명 = 초기값;
	*/
	
	//프로퍼티는 주로 사용자 정의 형식 작성시 사용한다.
	//자바에서 제공하는 자료형은 크게 두 가지
	//- 기본형(int, double, boolean, char, ...), 참조형(클래스, 배열, ...)
	//- 사용자 정의 자료형(클래스)
	
	
	//사용자 정의 자료형(클래스)에서 멤버 구성은 프로퍼티로 한다.
	//- 자료형, 갯수에 제한을 받지 않는다.
	//단, 외부에서 직접 접근하는 것을 권장하지 않는다. private 접근제한자.
	
	private String name = "hong", phone = "010-1234-1234", email = "hog@test.com";
	private int age = 20;
	
	//private 멤버를 외부에서 접근할 수 있도록 설정한 전용 메소드
	//getter
	public String getName() {
		//this 키워드는 내부 멤버 접근 전용 키워드
		//->생략 가능
		return this.name;
	}
	public String getPhone() {
		return this.phone;
	}
	
}

