package com.test045;

//부모 역할 클래스
//Object 클래스를 자동 상속 받고 있다
public class Sample {

	//Object 클래스의 멤버(toString)에 대한 오버라이딩
	//부모 메소드 시그니처는 그대로 유지
	//이클립스 Override Method 메뉴 활용
	@Override
	public String toString() {
		return String.format("부모 역할 클래스 toString() 오버라이딩 메소드!");
	}

}
