package com.test059;

//자식 역할 클래스
public class Sample extends Super {

	//의무적인 오버라이딩
	//부모의 멤버가 추상 멤버인 경우 반드시 오버라이딩
	@Override
	public void method1() {
		System.out.println("자식 역할 클래스에서 오버라이딩!");
	}

	//선택적인 오버라이딩
	@Override
	public void method2() {
		//super 키워드를 이용해서
		//부모의 멤버 접근 가능
		super.method2();
	}
	
}
