package com.test055;

public class Sample implements Super2 {

	//부모로 선택한 인터페이스의 
	//모든 추상 메소드를 오버라이딩해야 한다.
	
	@Override
	public void method1() {
		System.out.println("Super1 method1()에 대한 오버라이딩!");
	}

	@Override
	public void method2() {
		System.out.println("Super2 method2()에 대한 오버라이딩!");
	}

}
