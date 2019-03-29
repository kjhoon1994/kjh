package com.test040;

//명시적인 상속 구현은 extends 키워드 사용
//자식 역할 클래스
//final 클래스는 부모 지정 불가
public class Sub /* extends Sample */{

	//Object 클래스의 멤버(toString(), equals(), ...)를 상속 받은 상태이다.

	public void method2() {
		System.out.println("자식 역할");
	}

}
