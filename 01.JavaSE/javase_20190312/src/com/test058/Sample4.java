package com.test058;

public class Sample4 {

	//HAS-A 관계
	//강한 결합 vs 약한 결합
	//인터페이스를 이용한 약한 결합 상태를 권장한다
	
	//인터페이스를 이용한 약한 결합
	
	//범용 자료형(인터페이스)을 가진 객체 변수 선언
	private Super sample;
	
	//범용 자료형(인터페이스)의 객체(Sample1 or Sample2)를 외부에서 공급 받는다.
	public Sample4(Super sample) {
		this.sample = sample;
	}
	
	//Sample3의 메소드 호출
	public void method() {
		//내부적으로 Sample1(or Sample2)의 메소드 호출
		this.sample.method();
	}
	
}
