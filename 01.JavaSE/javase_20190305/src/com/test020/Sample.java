package com.test020;

public class Sample {

	//메소드 오버로딩(Method Overloading)
	//- 프로그램의 분할된 영역
	//- 액션 단위마다 메소드 구성
	//- 메소드 오버로딩은 메소드 이름은 같고, 시그니처는 다른 여러개 메소드 선언 방식
	//- 시그니처는 매개변수 구성 상태를 말한다
	//- 유사한 기능을 가진 메소드들을 동일한 이름으로 지정 가능
	
	public void method() {
		System.out.println("Hello, World!");
	}
	
	public void method(int a) {
		System.out.printf("Data:%d%n", a);
	}

	public void method(double a) {
		System.out.printf("Data:%f%n", a);
	}

	public void method(int a, int b) {
		System.out.printf("Data:%d, %d%n", a, b);
	}

}
