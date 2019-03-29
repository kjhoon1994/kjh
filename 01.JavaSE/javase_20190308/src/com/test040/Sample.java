package com.test040;

//Java에서 생성되는 모든 클래스는
//명시적 상속 구문이 없는 경우
//Object 클래스를 자동 상속 받는다
//부모 역할 클래스 -> 상속 차단 -> final -> 파생 불가
public final class Sample {
	
	//Object 클래스의 멤버(toString(), equals(), ...)를 상속 받은 상태이다.
	
	public void method1() {
		System.out.println("final 클래스");
	}

}
