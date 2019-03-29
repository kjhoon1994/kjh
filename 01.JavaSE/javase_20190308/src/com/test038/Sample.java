package com.test038;

//Java에서 생성되는 모든 클래스는
//명시적 상속 구문이 없는 경우
//Object 클래스를 자동 상속 받는다
//부모 역할 클래스
public class Sample {
	
	//Object 클래스의 멤버(toString(), equals(), ...)를 상속 받은 상태이다.
	
	public void method1() {
		System.out.println("부모 역할");
	}
	
	//private 멤버는 상속 제외
	private void privateMethod() {
		System.out.println("private 메소드");
	}
	
	//protected 멤버는 상속 가능
	//단, 외부(타 패키지) 접근 불가
	protected void protectedMethd() {
		System.out.println("protected 메소드");
	}

}
