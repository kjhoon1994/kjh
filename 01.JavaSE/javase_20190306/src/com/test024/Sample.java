package com.test024;

public class Sample {
	
	//생성자
	//객체(instance)의 초기화를 담당하는 특수 메소드
	//형식
	/*
	접근제한자 클래스이름(매개변수 리스트) {
	}
	*/
	//접근제한자는 주로 public 사용
	//메소드이름은 클래스이름만 사용
	//매개변수 리스트가 없는 경우 기본생성자
	//기본생성자는 명시적 언급이 없으면 자동 생성
	//객체(instance) 생성시 반드시 호출되는 메소드
	

	//기본 생성자 선언
	public Sample() {
		System.out.println("생성자 호출!");
	}
	
	//일반 메소드 선언
	public void sample() {
		System.out.println("일반 메소드 호출!");
	}
	
}
