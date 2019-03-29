package com.test044;

//상속 관계(IS-A)
//자식 역할 클래스 
public class Sub extends Sample {

	//Sample 클래스의 멤버를 상속 받은 상태이다
	//->Object 클래스의 멤버 + method()

	//오버라이딩(Overriding)
	//부모의 멤버를 자식에서 재정의해서 사용하는 것
	//오버라이딩 전에는 부모의 멤버가 가진 기능 그대로 사용
	//오버라이딩 후에는 자식이 재정의한 기능 사용
	
	//부모 멤버 일부를 오버라이딩 선언
	//부모 메소드 시그니처는 그대로 유지
	@Override
	public void method() {
		//메소드 내용은 재정의
		System.out.println("부모 역할 클래스 메소드에 대한 오버라이딩!");
	}	
	
}
