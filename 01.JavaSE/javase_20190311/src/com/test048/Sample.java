package com.test048;

//부모 역할 클래스
public class Sample {
	
	//오버라이딩(재정의) 대상 포함
	public void method1() {
		System.out.println("부모 역할 클래스 일반 메소드!");
	}
	
	//오버라이딩(재정의) 대상 제외 -> final 키워드
	public final void method2() {
		System.out.println("부모 역할 클래스 final 메소드!");
	}
	
}
