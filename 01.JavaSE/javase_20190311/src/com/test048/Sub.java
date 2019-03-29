package com.test048;

//상속 관계(IS-A)
//자식 역할 클래스 
public class Sub extends Sample {

	//부모 멤버 일부를 오버라이딩 선언
	//부모 메소드 시그니처는 그대로 유지
	@Override
	public void method1() {
		System.out.println("부모 역할 클래스 메소드에 대한 오버라이딩!");
	}
	
	//부모의 final 메소드를 자식 위치에서 사용 가능
	//->오버라이딩 제한
	//->method2()
	
}
