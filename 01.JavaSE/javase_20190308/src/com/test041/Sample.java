package com.test041;

//Java에서 생성되는 모든 클래스는
//명시적 상속 구문이 없는 경우
//Object 클래스를 자동 상속 받는다
//부모 역할 클래스
public class Sample {
	
	//상속 제외
	private int a;
	
	//생성자
	public Sample() {
		
		//부모 클래스(Object)의 생성자 호출 부분 
		
		//instance 멤버에 대한 초기화
		this.a = 10;
		System.out.println("부모 클래스의 생성자");
	}
	
	//상속 가능
	public int getA() {
		return this.a;
	}

}
