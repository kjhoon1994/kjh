package com.test047;

//부모 역할 클래스
public class Sample {
	
	//상속 대상 제외
	//자동 초기화
	private int a;
	
	
	//상속 대상 제외
	//생성자 오버로딩(Overloading)
	public Sample() {
		
	}
	public Sample(int a) {
		//생성자에 의한 초기화
		this.a = a;
	}
	
	//상속 대상 포함
	public void method() {
		System.out.printf("멤버변수 a의 값은 %d입니다.%n"
				, this.a);
	}

	
}
