package com.test054;

//클래스에 대한 상속 지정 -> extends
//인터페이스에 대한 상속 지정 -> implements
public class Sample implements Super {


	//추상 멤버를 상속받는 경우
	//해당 클래스는 반드시 추상 멤버에 대한 메소드 구현 필요
	//->오버라이딩
	
	@Override
	public void method() {
		System.out.println("추상 멤버에 대한 오버라이딩!");
	}
	
	
}
