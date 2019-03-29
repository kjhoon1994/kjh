package com.test026;

public class Sample {
	
	//초기화
	//객체(instance) 생성시
	//멤버변수(프로퍼티)의 값을 특정 값으로 할당하는 상태
	//멤버변수는 자동 초기화 지원 대상
	//정수형 멤버는 0, 실수형 멤버는 0.0
	//참조형 멤버는 null
	
	//자동 초기화 지원 대상
	private int a;
	private double b;
	//명시적 초기화
	private String c = "Hello, World!";
	
	//생성자에 의한 초기화
	//기본 생성자 -> 사용자 정의 초기화
	//코드를 사용한 복잡한 초기화 가능
	public Sample() {
		this.a = 10;
		this.b = 12.34;
		//this.c = "Hello, World!";
	}
	

	public int getA() {
		return this.a;
	}
	public double getB() {
		return this.b;
	}
	public String getC() {
		return this.c;
	}
	
	
}
