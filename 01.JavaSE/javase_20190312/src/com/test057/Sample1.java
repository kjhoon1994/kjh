package com.test057;

public class Sample1 implements Super {

	//Sample1, Sample2 클래스의 공통 특성
	//->메소드 시그니처가 같다
	@Override
	public void method() {
		//메소드 구현은 독립적이다
		System.out.println("Sample1에서의 오버라이딩!");
	}

}
