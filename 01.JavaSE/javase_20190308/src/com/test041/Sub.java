package com.test041;

//명시적인 상속 구현은 extends 키워드 사용
//자식 역할 클래스
public class Sub  extends Sample {

	//Sample 클래스의 멤버를 상속 받은 상태이다
	//->private 멤버는 상속 제외
	//->protected 멤버는 상속 가능
	
	//생성자
	public Sub() {
		//부모 클래스(Sample)의 생성자 호출 부분 
		System.out.println("자식 클래스의 생성자");
	}

	public void method2() {
		System.out.println("자식 역할");
	}

}
