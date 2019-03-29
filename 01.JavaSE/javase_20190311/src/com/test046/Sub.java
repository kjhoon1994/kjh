package com.test046;

//상속 관계(IS-A)
//자식 역할 클래스 
public class Sub extends Sample {


	//Sample 클래스의 멤버에 대한 오버라이딩
	@Override
	public void method() {
		
		//부모 클래스의 원본 메소드 호출 -> super 키워드
		super.method();
		
		System.out.println("현재 메소드는 Sub 클래스의 메소드입니다.");
	}	
	
}
