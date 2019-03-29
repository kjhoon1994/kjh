package com.test050;

public final class Sample {
	
	//final 키워드
	//1. class 차원의 final : 상속 금지
	//2. method 차원의 final : 오버라이딩 금지
	//3. instance 변수의 final : 초기화 이후 변경 금지
	//4. static 변수의 final : 상수(내부 초기화만 지원). 대문자표기. public 키워드 사용. getter, setter 없음.
	
	private final int a;
	public static final int B = 10;
	
	public Sample() {
		//내부에서 매개변수 있는 생성자를 호출하는 명령
		this(0);
	}
	public Sample(int a) {
		this.a = a;
	}
	
	public final void method() {
		
	}

	//final 멤버는 getter 가능
	public int getA() {
		return this.a;
	}
	//final 멤버는 setter 불가
	
	

}
