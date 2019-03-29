package com.test047;

//상속 관계(IS-A)
//자식 역할 클래스 
public class Sub extends Sample {
	
	//생성자 오버로딩(Overloading)
	public Sub() {
		//자동 호출 가능
		super();
	}
	public Sub(int a) {
		//부모의 매개변수 있는 생성자 호출
		//외부에서 전달받은 a의 값을 가지고
		//부모 객체의 a를 초기화
		//자동 호출 불가 -> 명시적 호출 필요
		super(a);
	}


	//Sample 클래스의 멤버에 대한 오버라이딩
	@Override
	public void method() {
		
		//부모 클래스의 원본 메소드 호출 -> super 키워드
		super.method();
		
		System.out.println("현재 메소드는 Sub 클래스의 메소드입니다.");
	}	
	
}
