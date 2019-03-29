package com.test028;

public class Sample {
	
	//생성자 오버로딩(Constructor Overloading)
	//생성자 두 개 이상 존재하는 상태
	//주의) 생성자 오버로딩은 다양한 경우의 수를 만드는데 한계가 있다.

	//자동 초기화 지원 대상
	private int a;
	
	//매개변수 없는 생성자
	public Sample() {
	}
	
	//매개변수 있는 생성자
	//외부에서 전달받은 자료를 가지고 객체 초기화
	//매개변수 있는 생성자 선언시 기본 생성자는 자동 생성되지 않는다
	//기본 생성자를 명시적 선언해줘야 한다
	public Sample(int a) {
		this.a = a;
	}

	public int getA() {
		return this.a;
	}

	
}
