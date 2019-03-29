package com.test058;

public class Sample3 {
	
	//HAS-A 관계
	//강한 결합 vs 약한 결합
	//인터페이스를 이용한 약한 결합 상태를 권장한다
	
	//강한 결합
	
	//특정 자료형을 가진 객체 변수 선언
	private Sample1 sample;
	
	//특정 자료형의 객체를 외부에서 공급 받는다.
	public Sample3(Sample1 sample) {
		this.sample = sample;
	}
	
	//Sample3의 메소드 호출
	public void method() {
		//내부적으로 Sample1의 메소드 호출
		this.sample.method();
	}

}
