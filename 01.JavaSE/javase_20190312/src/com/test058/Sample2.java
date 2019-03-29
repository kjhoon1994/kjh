package com.test058;

public class Sample2 implements Super {

	//Sample1, Sample2 클래스의 공통 특성
	//->메소드 시그니처가 같다
	@Override
	public void method() {
		//메소드 구현은 독립적이다
		System.out.println("Sample2에서의 오버라이딩!");
	}

}
