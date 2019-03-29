package com.test055;

//자식 역할 인터페이스
//부모 역할 인터페이스(들)을 상속 지정 -> 다중 상속 지원
public interface Super2 extends Super1 {
	
	//부모가 가진 모든 특성을 하나의 인터페이스에 통합 가능

	//부모 인터페이스의 멤버를 자식이 사용 가능
	//public abstract void method1();
	
	//자기만의 고유 멤버 추가 가능
	public abstract void method2();
	
}
