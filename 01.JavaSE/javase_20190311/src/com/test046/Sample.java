package com.test046;

//부모 역할 클래스
public class Sample {
	
	//상속 대상 제외
	private int a;
	
	//상속 대상 포함
	public void method() {
		System.out.printf("멤버변수 a의 값은 %d입니다.%n"
				, this.a);
	}

	
}
