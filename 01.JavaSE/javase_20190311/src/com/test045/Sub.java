package com.test045;

//상속 관계(IS-A)
//자식 역할 클래스 
public class Sub extends Sample {

	//Sample 클래스의 멤버(toString)에 대한 오버라이딩
	//부모 메소드 시그니처는 그대로 유지
	//이클립스 Override Method 메뉴 활용
	@Override
	public String toString() {
		return String.format("자식 역할 클래스 toString() 오버라이딩 메소드!");
	}
	
}
