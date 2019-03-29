package com.test037;

//명시적인 상속 구현은 extends 키워드 사용
//자식 역할 클래스
public class Sub extends Sample{
	
	//Sample 클래스의 멤버를 상속 받은 상태이다
	//->Object 클래스의 멤버 + method1()
	
	public void method2() {
		System.out.println("자식 역할");
	}

}
